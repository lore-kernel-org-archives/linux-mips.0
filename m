Message-ID: <000f01c16271$8013eae0$001e690a@huawei.com>
From: "machael" <dony.he@huawei.com>
Subject: KSEG0 and KSEG2 ...
Date: Thu, 1 Nov 2001 09:06:55 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: Ralf Baechle <ralf@oss.sgi.com>
Message-ID: <20011101010655.3Xv1gZ690sZr7dWS5JCNwrM0xuLNwAmdzcKXGco0LIY@z>


 Hello,ralf:
    I use linux-2.4.5 and have some questions to need your help.
    I try to replace some kernel functions with my own implementations.I
will explain it in the following:
    Let's say:
        void (*my_func)(void)=func1;
     where "my_func" is a function pointer defined in kernel, and "func1" is
 a function(void func1(void)) implemented in kernel.And "my_func" is an
 EXPORTED SYMBOL in mips_ksyms.c.

    Now I want to replace "func1" with my own "func2" in a module
 my_module.o:
     extern void (*my_func)(void);
     my_func = func2;
     where "func2" is a function (void fun2(void)) implemented in
 "my_module.o".

     If I do "insmod my_module.o", the kernel should run OK. In fact, it is
 often met an "unhandled kernel unaligned access" or "do_page_fault"
 exception and then panics.

     We know "func1" should be in KSEG0(unmapped , cached) since it is
implemented in kernel space.So it's address should be 0x8XXXXXXX.And
 "my_func" should also pointed to this same address before inserting
 my_module.o. And "func2" should be in KSEG2(mapped, cached) since it is
 implemented in module, So it's address should be 0xCXXXXXXX.After inserting
 my_module.o, "my_func" should be changed to pointed to this new address in
 KSEG2.
     My question is :
     When "my_func" changes from KSEG0 from KSEG2, Can it cause some
 problems?

     Thank you very much.

     machael
