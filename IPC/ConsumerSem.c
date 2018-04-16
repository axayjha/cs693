//
//  ConsumerSem.c
//  OSAssignments
//
//  Created by Arnab Sen on 25/03/18.
//  Copyright © 2018 Arnab Sen. All rights reserved.
//
#include <stdio.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/time.h>
#include <sys/ipc.h>
#include <time.h>
#define SHM_M 0

union semun {
int val;
struct semid_ds *buf;
unsigned short int *array;
struct seminfo *__buf;
};

//Atomic operations on Semaphores
void Wait(int mtx_id, int n){
    int mtx;
    printf("Consumer %d is in waiting\n",n);
    do {
         mtx = semctl(mtx_id, 0, GETVAL);
    } while (mtx<=0);
    union semun arg;
    arg.val = mtx - 1;
    semctl(mtx_id, 0, SETVAL, arg);
    
}
int Signal(int s){
    s = s + 1;
    return s;
}
int main(int argc, const char * argv[]){
    
    union semun arg;
    
        time_t t1 = time(NULL);
        int n = 1;
        //Fetching semaphore
        int mutex_id = semget((key_t)1234432, 1, SHM_R|SHM_W|SHM_M); //For mutex
        int full_id = semget((key_t)123455, 1, SHM_R|SHM_W|SHM_M); //For full
        int empty_id = semget((key_t)123495, 1, SHM_R|SHM_W|SHM_M); //For empty
        int buffer_id = shmget((key_t)1223, sizeof(int), SHM_R|SHM_W|SHM_M); //Shared variable bufffer
        
        //Attaching Shared variable to the system
        int *buffer = (int *)shmat(buffer_id, 0, SHM_R|SHM_W);
    
        //sscanf(argv[1], "%d", &n);
        printf("Consumer %d is starting\n",n);
        
        while(1){
           
            Wait(full_id,n);
            Wait(mutex_id, n);
            
            
            printf("Consumer %d is in critical section at time [%s]\n",n, ctime(&t1));
            
            printf("Value of buffer before critical section: %d\n", *buffer);
            *buffer = *buffer - 1;
            printf("Value of buffer after critical section: %d\n", *buffer);
            
            
            int mutex = semctl(mutex_id, 0, GETVAL);
            arg.val = Signal(mutex);
            semctl(mutex_id, 0, SETVAL, arg);
            
            int empty = semctl(empty_id, 0, GETVAL);
            arg.val = Signal(empty);
            semctl(empty_id, 0, SETVAL, arg);
            
            
        }
        
    
}

