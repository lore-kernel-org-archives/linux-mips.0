Received: from nwd2mhb1.analog.com (nwd2mhb1.analog.com [137.71.5.12])
	by nwd2mail2.analog.com (8.12.10/8.12.10) with ESMTP id i7641GfT001707
	for <linux-mips@linux-mips.org>; Fri, 6 Aug 2004 00:01:16 -0400
Received: from jasmine.cpgindia.analog.com ([10.121.13.30])
	by nwd2mhb1.analog.com (8.9.3 (PHNE_28810+JAGae91741)/8.9.3) with ESMTP id AAA09577
	for <linux-mips@linux-mips.org>; Fri, 6 Aug 2004 00:01:07 -0400 (EDT)
Received: from asingh2d01 ([10.121.13.93])
	by jasmine.cpgindia.analog.com (8.9.1/8.9.1) with SMTP id JAA04143
	for <linux-mips@linux-mips.org>; Fri, 6 Aug 2004 09:31:04 +0530 (IST)
From: "akshay" <akshay.singh@analog.com>
Subject: pthread uClibc
Date: Fri, 6 Aug 2004 09:43:03 +0530
Message-ID: <006101c47b6b$abbd6610$5d0d790a@asingh2d01>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <akshay.singh@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040806041303.uoWi6p0DAO2t0-BSFz1sigQOTE1iGDwCoViiFVSxcz0@z>


Hi,

I am trying to use pthread on mips based platform.

I have simple program to just create pthreads and when I run my program, it
goes in infinite loop and never comes back.
Though when I hit enter on console, I see following message on console.

pt: assertion failed in manager.c:154.

pt: assertion failed in manager.c:193.

Can someone plz help me here .



Here is the code for my program.
==============================================================
#include <stdio.h>
#include <pthread.h>

void print_message_function( void *ptr );

     pthread_t thread1;
     char *message1 = "Thread 1";

main()
{
     int  iret1, iret2;

    /* Create independant threads each of which will execute function */

     iret1 = pthread_create( &thread1, NULL, (void*)&print_message_function,
(v
oid*) message1);

printf("threads created ....\n");
     /* Wait till threads are complete before main continues. Unless we  */
     /* wait we run the risk of executing an exit which will terminate   */
     /* the process and all threads before the threads have completed.   */

     pthread_join( thread1, NULL);

     printf("Thread 1 returns: %d\n",iret1);
     exit(0);
}

void print_message_function( void *ptr )
{
     char *message;
     message = (char *) ptr;
     printf("%s \n", message);
}





Thanks,
Akshay
