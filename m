Message-ID: <007201c1d1ee$83bb33f0$9d00a8c0@sathya>
From: "Sathya.N" <n.sathya@gdatech.co.in>
Subject: Bug in Assertion failure in macro_build_lui ....tc-mips.c
Date: Sat, 23 Mar 2002 03:41:25 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: gcc <gcc-bugs@gcc.gnu.org>, linux-mips@oss.sgi.com
Cc: egcs-bugs@cygnus.com
Message-ID: <20020322221125.0TqvUQM3lsJN4N70Odnjh336nDBvpyzsBX5RyyLYN3A@z>


 Hi,

  I am building the qla2x00.c driver (Fibre channel driver from Qlogic) as
loadable module for our IP under Red Hat Linux 7.2(kernel version is 2.4.x)
We are  using the Broadcom's BCM12500 Processor (MIPS Core).When I compiled
the code , I am getting the output as given below. After the warnings ,you
could see {standard input} Assembler messages: etc.,

 Could you please help me in  sorting out this bug?

Here Qlogic is my Fibre Channel source code directory.


 [root@localhost Qlogic]# make SMP=1

/usr/local/sbtools/x86-linux-rh7.1/mips-linux-2.1.1/bin/mips-linux-gcc -D__K
ERNEL__ -DMODULE -Wall -O2 -DISP2200 -DMODVERSIONS -include

/home/sathya/linux/src/linux/include/linux/modsetver.h -I/home/sathya/linux/
src/linux/include -I/home/sathya/linux/src/linux/include/../drivers/scsi -Wa
ll -Wstrict-prototypes -fomit-frame-pointer -fno-strength-reduce -pipe -fno-
strict-aliasing -mcpu=sb1 -mips2 -mgp32 -mlong32 -mips16 -EB -D__SMP__  -CON
FIG_SMP     -c -o qla2x00.o qla2x00.c
 In file included from qla2x00.c:384:
/home/sathya/linux/src/linux/include/linux/malloc.h:4:2: warning:
 #warning linux/malloc.h is deprecated, use linux/slab.h instead.
 qla2x00.c: In function `qla2100_proc_info':
 qla2x00.c:1146: warning: long int format, int arg (arg 4)
 qla2x00.c:1146: warning: unsigned int format, long int arg (arg 5)
 qla2x00.c:1146: warning: unsigned int format, pointer arg (arg 8)
 {standard input}: Assembler messages:
  {standard input}:119338: Internal error!
 Assertion failure in macro_build_lui at
/home/cgd/proj/sb/systemsw-2.1.1/lin.x/systemsw/tools/src/binutils/gas/confi
g/tc-mips.c line 3101.
 Please report this bug.
 make:  [qla2x00.o] Error 2*

 Regards & Thanks,
 N.Sathyanarayana
 Member Technical Staff
 GDA Technologies Ltd.,
 Chennai
 India

 www.gdatech.com
 catch me at : n.sathya@gdatech.co.in
