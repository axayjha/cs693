//
//  SharedProcess1.c
//  OSAssignments
//
//  Created by Arnab Sen on 23/03/18.
//  Copyright © 2018 Arnab Sen. All rights reserved.
//

#include <stdio.h>
#include <sys/shm.h>
int main(){
    
    int sm = shmget(456, sizeof(int), IPC_R | IPC_W);
    int* sh = (int *)shmat(sm, NULL, 0);
    printf("Shared Process: %d\n",*sh);
    *sh=0;
   
}
