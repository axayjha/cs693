//
//  SharedProcess.c
//  OSAssignments
//
//  Created by Arnab Sen on 23/03/18.
//  Copyright © 2018 Arnab Sen. All rights reserved.
//

#include <stdio.h>
#include <sys/sem.h>
#include <sys/stat.h>
#include <sys/shm.h>
int main(){
    int mutex_id = semget((key_t)1234566, 2, IPC_CREAT |SEM_A | SEM_R);
    int ch = semctl(mutex_id, 1, GETVAL);
    
    
    
    ch = semctl(mutex_id, 1, IPC_RMID);
    
}
