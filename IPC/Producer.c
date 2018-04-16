//
//  Producer.c
//  OSAssignments
//
//  Created by Arnab Sen on 24/03/18.
//  Copyright © 2018 Arnab Sen. All rights reserved.
//

#include <stdio.h>
#include <sys/shm.h>
#include<unistd.h>
//Functions to control semaphores
void Wait(int* s, int n){
    printf("Producer %d is waiting.....\n",n);
    while (*s<=0);
   
    *s = *s - 1;
    
}
void Signal(int* s){
    *s = *s + 1;
}
int main(int argc, const char * argv[]) {
    
    //Getting shared memory address
    int mutex_id = shmget((key_t)123,sizeof(int),  0777); //MUTEX
    int full_id = shmget((key_t)345, sizeof(int),  0777); //FULL
    int empty_id = shmget((key_t)357, sizeof(int), 0777); //EMPTY
    int buffer_id = shmget((key_t)443, sizeof(int),0777); //BUFFER
    
    //Attaching values
    int* mutex = (int *)shmat(mutex_id, NULL, IPC_W | IPC_R);
    int* full = (int *)shmat(full_id, NULL, IPC_W | IPC_R);
    int* empty = (int *)shmat(empty_id, NULL, IPC_W | IPC_R);
    int* buffer = (int *)shmat(buffer_id, NULL, IPC_W | IPC_R);
    
    int n=1;
    //sscanf(argv[1], "%d", &n);
    printf("Producer %d is starting\n",n);
    while(1){
        
        Wait(empty,n);
        Wait(mutex,n);
        //Writing to buffer
        printf("Producer %d is in critical Section\n",n);
        printf("Value of buffer before critical section: %d\n", *buffer);
        *buffer = *buffer + 1;
        
        printf("Value of buffer after critical section: %d\n", *buffer);
        Signal(mutex);
        Signal(full);
    }
}
