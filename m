Message-ID: <013301c165cc$5d030fa0$4a1c690a@huawei.com>
From: "machael" <dony.he@huawei.com>
Subject: vmalloc bugs in 2.4.5???
Date: Mon, 5 Nov 2001 15:34:44 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20011105073444.R8zEWdikwg0T8th7_sRskrcEuJuPZudy1CCjlTAR450@z>

hello:
    I use linux-2.4.5 and I think VMALLOC may have some bugs which i don't
know how to fixup.
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

     We know "func1" should be in KSEG0(unmapped , cached) ,So it's address
should be 0x8XXXXXXX.And "my_func" should also pointed to this same address
before inserting
 my_module.o.  "func2" should be in KSEG2(mapped, cached) since it is
 implemented in module, So it's address should be 0xCXXXXXXX.After inserting
 my_module.o, "my_func" should be changed to pointed to this new address in
 KSEG2. But kernel panics......
    If I change "module_map()" in include/asm/module.h from vmalloc to
kmalloc, kernel runs ok after inserting my module. So I think vmalloc may
have some bugs.

    Anyone knows how to fixup it?

    machael
