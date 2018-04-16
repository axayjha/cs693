//
//  createSharedVars.c
//  OSAssignments
//
//  Created by Arnab Sen on 24/03/18.
//  Copyright © 2018 Arnab Sen. All rights reserved.
//

#include <stdio.h>
#include <sys/shm.h>

int  main(int argc, const char * argv[]){
    
    printf("Initilaser program\n");
    //Selecting keys for MUTEX, EMPTY and FULL
    int mutex_id = shmget((key_t)123,sizeof(int), IPC_CREAT| 0777); //MUTEX
    int full_id = shmget((key_t)345, sizeof(int), IPC_CREAT| 0777); //FULL
    int empty_id = shmget((key_t)357, sizeof(int), IPC_CREAT| 0777); //EMPTY
    int buffer_id = shmget((key_t)443, sizeof(int), IPC_CREAT| 0777); //BUFFER
    
    
    //Retriving values
    int* mutex = (int *)shmat(mutex_id, NULL, 0);
    int* full = (int *)shmat(full_id, NULL, 0);
    int* empty = (int *)shmat(empty_id, NULL, 0);
    int* buffer = (int *)shmat(buffer_id, NULL, 0);
    
    
    //Initialling values
    *mutex = 1;
    *empty = 2;
    *full = 0;
    *buffer = 0;
    //Process remains on so as to save variables
    while(1);
    
    
}
