From: "Guangxing Zhang" <guangxing@ict.ac.cn>
Subject: Re: Re: Question about the tq_timer or sleep_on() !
Mime-Version: 1.0
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: 8BIT
Date: Tue, 16 Sep 2003 11:50:51 +0800
Message-ID: <20030916035031Z8225210-1272+5473@linux-mips.org>
Return-Path: <guangxing@ict.ac.cn>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Fuxin Zhang <fxzhang@ict.ac.cn>
Cc: linux-mips@linux-mips.orglinux-mips@linux-mips.org
Message-ID: <20030916035051.mLZuSXQZ-SOvtuj40_r5hLIydky9y-hzWpSk3gno4tU@z>

Hi, Fuxin Zhang

======= 2003-09-16 11:22:00 WROTE��=======

>I am not sure why you send a generic kernel problem to linux/mips list.   
    Oh~~~Sorry ,Sorry ,I have to say sorry sorry agian and again!
    My purpose is to port my kernel module to mips-linux and I have the
crosse-compile environment.So generally, if it (kernle module) can be ok
in my linux(nor mips),it also do not have any troubles when I port it to 
the mips-linux.I have test it before.(Of course ,only with  some simple
kernle modules) . 
>As to your problem, probably it is caused by some incompatible changes
>between different kernel versions. Many kernel related codes are highly
>version depended. Check the datastructs, add -Wall to compile and check
    "-Wall" exsits before and following is part of my original Makefile:
    -------------------------------------------------------------- 
    WARN    := -W -Wall -Wstrict-prototypes -Wmissing-prototypes
    INCLUDE := -isystem /lib/modules/`uname -r`/build/include
    CFLAGS  := -O2 -DMODULE -D__KERNEL__ ${WARN} ${INCLUDE}
    CC      := gcc
    OBJS    := ${patsubst %.c, %.o, ${wildcard *.c}}
    all: ${OBJS} 
    --------------------------------------------------------------
>for any warnings. BTW, I don't the method you used to cleanup is safe,
>there maybe a task queued but not executed at the time you 
>'rmmod',doesn't it?
Yes ,in http://www.faqs.org/docs/kernel/x1145.html#AEN1201 , it mentions the 
situation as you said.And just to overcoming it ,it use the sleep_on().But as you 
see, now it can not "rmmod" correctly and my linux will broke.

As a newbie to kernel module ,I am not sure why and not know how to scheduale a 
function to be called on every timer interrupt or every seconds in kernle module.
Eagering your help!
>>interrupt
>
>鴻佛 wrote:
>
>>Hi,everyone!
>>	
>>    I have written a simple kernel module following the example in "Chapter 11. 
>>Scheduling Tasks" of <<The Linux Kernel Module Programming Guide>> 
>>(http://www.faqs.org/docs/kernel/x1145.html#AEN1201).
>>    Because I only want to scheduale a function to be called on every timer 
>>interrupt,I have simplified the example in the following as you can see.
>>    It can be compiled ok, and it can be "insmod" correctly.But when I try
>> to "rmmod" ,sometimes my LINUX freeze and somtimes it will reboot automatically.
>>    My linux version is 2.4.18-3.
>>    And I have read the  "Chapter 11.Scheduling Tasks" of <<The Linux Kernel Module
>> Programming Guide>> ,I think it the combination of tq_timer and sleep_on() arose the
>> fatal error. But I do not know why and how to conquer it.
>>    
>>    Anyone can tell why? And are there any good others methods to implement schedualing
>> a function to be called on every timer interrupt or on every second?
>>    
>>     Eagering your help and thank you in advance!
>>	
>>
>>
>> /*  sched.c - scheduale a function to be called on every timer interrupt.
>> *
>> *  Copyright (C) 2001 by Peter Jay Salzman
>> */
>>
>>/* The necessary header files */
>>
>>/* Standard in kernel modules */
>>#include <linux/kernel.h>                   /* We're doing kernel work */
>>#include <linux/module.h>                   /* Specifically, a module */
>>
>>/* Deal with CONFIG_MODVERSIONS */
>>/*
>>#if CONFIG_MODVERSIONS==1
>>#define MODVERSIONS
>>#include <linux/modversions.h>
>>#endif        
>>*/
>>/* Necessary because we use the proc fs */
>>#include <linux/proc_fs.h>
>>#include <linux/interrupt.h>
>>
>>/* We scheduale tasks here */
>>#include <linux/tqueue.h>
>>
>>/* We also need the ability to put ourselves to sleep and wake up later */
>>#include <linux/sched.h>
>>
>>/* In 2.2.3 /usr/include/linux/version.h includes a macro for this, but
>> * 2.0.35 doesn't - so I add it here if necessary.
>> */
>>#ifndef KERNEL_VERSION
>>#define KERNEL_VERSION(a,b,c) (((a)<<16)+((b)<<8)+(c))
>>#endif
>>
>>/*Basic Info. of this module
>>*/
>>MODULE_LICENSE("GPL");           // Get rid of taint message by declaring code as GPL
>>MODULE_DESCRIPTION("Just to test!"); // What does this module do?
>>
>>/* The number of times the timer interrupt has been called so far */
>>static int TimerIntrpt = 0;
>>
>>/* This is used by cleanup, to prevent the module from being unloaded while
>> * intrpt_routine is still in the task queue
>> */
>>static struct wait_queue *WaitQ = NULL;
>>
>>static void intrpt_routine(void *);
>>
>>/* The task queue structure for this task, from tqueue.h */
>>static struct tq_struct Task = {
>>   {NULL,NULL},   /* Next item in list - queue_task will do this for us */
>>   0,             /* A flag meaning we haven't been inserted into a task
>>                   * queue yet 
>>                   */
>>   intrpt_routine, /* The function to run */
>>   NULL,           /* The void* parameter for that function */
>>};
>>
>>/* This function will be called on every timer interrupt. Notice the void*
>> * pointer - task functions can be used for more than one purpose, each time 
>> * getting a different parameter.
>> */
>>static void intrpt_routine(void *irrelevant)
>>{
>>   	/* Increment the counter */
>>   	TimerIntrpt++;
>>   	//printk("<1>Ok,It is the time to do something!\n");
>>   	if (WaitQ != NULL){
>>   		wake_up(&WaitQ);
>>   		return;
>>   	}
>>   	else {	
>>      		if ((TimerIntrpt1000)==0){
>>			printk("<1>It is the time to do something!\n");
>>       		}
>>      		queue_task(&Task, &tq_timer);
>>       	}
>> 
>>}
>>
>>
>>
>>/* Initialize the module - register the proc file */
>>int init_module()
>>{
>>   /* Put the task in the tq_timer task queue, so it will be executed at
>>    * next timer interrupt
>>    */
>> 	queue_task(&Task, &tq_timer);
>>  	printk("<1>Insert It Ok\n");
>>   	return 0;
>>  
>>}
>>
>>/* Cleanup */
>>void cleanup_module()
>>{
>>   printk("<1>Say 886\n");
>>   sleep_on(&WaitQ);
>>}  
>>
>>　
>>
>>
>>
>>  廝
>>宗慎 噪酔
>> 				
>>
>>　　　　　　　　鴻佛
>>　　　　　　　　guangxing@ict.ac.cn
>>　　　　　　　　　　2003-09-16
>>
>>
>>
>>
>>
>>
>>  
>>

= = = = = = = = = = = = = = = = = = = =
			
 
				 
　　　　　　　　Guangxing Zhang
　　　　　　　　guangxing@ict.ac.cn
　　　　　　　　　　2003-09-16
