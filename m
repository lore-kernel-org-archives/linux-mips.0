Reply-To: <ratin@koperasw.com>
From: "Ratin Kumar" <ratin@koperasw.com>
Subject: RE: pthread uClibc
Date: Thu, 5 Aug 2004 23:30:22 -0700
Message-ID: <00bc01c47b7e$de436130$6401a8c0@ratwin1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <006101c47b6b$abbd6610$5d0d790a@asingh2d01>
Return-Path: <ratin@koperasw.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'akshay' <akshay.singh@analog.com>, linux-mips@linux-mips.org
Message-ID: <20040806063022.HtIz7nP1toJ89v_jVKqJdenoLvCeGHvkkoNQSfQ5jt8@z>

It might make a bit more sense if you talk a bit about your setup/toolchain
(cross??) and version of libraries used....

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of akshay
Sent: Thursday, August 05, 2004 9:13 PM
To: linux-mips@linux-mips.org
Subject: pthread uClibc


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
