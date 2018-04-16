//
//  Consumer.c
//  OSAssignments
//
//  Created by Arnab Sen on 24/03/18.
//  Copyright © 2018 Arnab Sen. All rights reserved.
//

#include <stdio.h>
#include <sys/shm.h>
#include<unistd.h>
//#include <sys/SHM.h>
//Functions to control semaphores
void Wait(int* s, int n){
    printf("Consumer %d is waiting.....\n",n);
    while (*s<=0);
    *s = *s - 1;
    
}
void Signal(int* s){
    *s = *s + 1;
}
int main(int argc, const char * argv[]) {
    
    
    //Getting shared memory address
    int mutex_id = shmget(348, sizeof(int), SHM_R | SHM_W); //MUTEX
    int full_id = shmget(349, sizeof(int), SHM_R | SHM_W); //FULL
    int empty_id = shmget(357, sizeof(int), SHM_R | SHM_W); //EMPTY
    int buffer_id = shmget(443, sizeof(int), SHM_R | SHM_W); //BUFFER
    
    //Attaching values
    int* mutex = (int *)shmat(mutex_id, NULL, SHM_R | SHM_W);
    int* full = (int *)shmat(full_id, NULL, SHM_R | SHM_W);
    int* empty = (int *)shmat(empty_id, NULL, SHM_R | SHM_W);
    int* buffer = (int *)shmat(buffer_id, NULL, SHM_W | SHM_R);
    
    
    int n;
    sscanf(argv[1], "%d", &n);
    printf("Consumer %d is starting\n",n);
    
    
    while(1){
        Wait(full,n);
        Wait(mutex,n);
        
        //Writing to buffer
        printf("Consumer %d is in critical Section\n",n);
        printf("Value of buffer before critical section: %d\n", *buffer);
        
        *buffer = *buffer - 1;
        
        printf("Value of buffer after critical section: %d\n", *buffer);
        
        Signal(mutex);
        Signal(empty);
    }
}

