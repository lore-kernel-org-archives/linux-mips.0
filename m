content-class: urn:content-classes:message
Subject: GCC 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Fri, 22 Jun 2001 14:46:15 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B05CB03@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010622214615.N6FWmSg3RKxUtyz6aCBM5I06dqBs1kKxO5Ic-VNLM_g@z>

Hi, All:

I want to get your help on GCC for Linux on Mips.

Here is some related information:
Host: i686
 Red Hat linux 7.0  
Binutil- 2.8.1-1. 
gcc - 1.1.2-2. 
linux kernel 2.2.12.
Malta Board.
CPU R3000.
Big Endian.

When I compiled the kernel with -mcpu=r3000 -mips1, it gave me the
following error.

mips-linux-gcc -D__KERNEL__ -DCONFIG_CPU_AURORA
-I/home/wenbo/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -mmemcpy -fno-strict-aliasing -mno-split-addresses
-G 0 -mno-abicalls -fno-pic -mcpu=r3000 -mips1 -pipe  -c -o init/main.o
init/main.c
/home/wenbo/linux/include/asm/atomic.h: In function `atomic_add':
In file included from /home/wenbo/linux/include/linux/fs.h:22,
                 from /home/wenbo/linux/include/linux/capability.h:13,
                 from /home/wenbo/linux/include/linux/binfmts.h:5,
                 from /home/wenbo/linux/include/linux/sched.h:8,
                 from /home/wenbo/linux/include/linux/mm.h:4,
                 from /home/wenbo/linux/include/linux/slab.h:14,
                 from /home/wenbo/linux/include/linux/malloc.h:4,
                 from /home/wenbo/linux/include/linux/proc_fs.h:5,
                 from init/main.c:23:
/home/wenbo/linux/include/asm/atomic.h:47: invalid operands to binary +
/home/wenbo/linux/include/asm/atomic.h: In function `atomic_sub':
/home/wenbo/linux/include/asm/atomic.h:57: invalid operands to binary -
/home/wenbo/linux/include/asm/atomic.h: In function `atomic_add_return':
/home/wenbo/linux/include/asm/atomic.h:67: incompatible types in
assignment
/home/wenbo/linux/include/asm/atomic.h:69: incompatible types in
assignment
/home/wenbo/linux/include/asm/atomic.h: In function `atomic_sub_return':
/home/wenbo/linux/include/asm/atomic.h:81: incompatible types in
assignment
/home/wenbo/linux/include/asm/atomic.h:83: incompatible types in
assignment
/home/wenbo/linux/include/asm/timex.h: In function `get_cycles':
In file included from /home/wenbo/linux/include/linux/timex.h:138,
                 from /home/wenbo/linux/include/linux/sched.h:14,
                 from /home/wenbo/linux/include/linux/mm.h:4,
                 from /home/wenbo/linux/include/linux/slab.h:14,
                 from /home/wenbo/linux/include/linux/malloc.h:4,
                 from /home/wenbo/linux/include/linux/proc_fs.h:5,
                 from init/main.c:23:
/home/wenbo/linux/include/asm/timex.h:41: warning: implicit declaration
of function `read_32bit_cp0_register'
/home/wenbo/linux/include/asm/timex.h:41: `CP0_COUNT' undeclared (first
use in this function)
/home/wenbo/linux/include/asm/timex.h:41: (Each undeclared identifier is
reported only once
/home/wenbo/linux/include/asm/timex.h:41: for each function it appears
in.)
make: *** [init/main.o] Error 1

Nicu met the same problem but I do not know how the problem was solved.
Thank you.

Steven Liu
