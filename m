content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: 8BIT
Subject: Problem with CVS kernel compiling
Date: Fri, 4 Apr 2003 14:18:37 +0200
Message-ID: <6D2F48AA9477864682B4078EFF1BEAF19B0FD5@radiomobil.cz>
From: "Uher Marek" <Marek.Uher@t-mobile.cz>
Return-Path: <Marek.Uher@t-mobile.cz>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030404121837.pq9k-9OoLH98MUgjgcj24xfsMi9Km8F-JHScwo-0e5Q@z>


	Hello,

I downloaded the kernel sources from CVS. I used config from my current Debian
GNU/Linux kernel 2.4.19 (which is working OK for me) with MIPS patch. Then I
ran "make menuconfig". When I give the command "make vmlinux" I have got these
errors:

gcc -Wp,-MD,arch/mips/kernel/.entry.o.d -D__ASSEMBLY__ -D__KERNEL__ -Iinclude
 -I /usr/src/linux-2.5.47/include/asm/gcc -G 0 -mno-abicalls -fno-pic -pipe
 -mcpu=r4600 -mips2 -Wa,--trap -nostdinc -iwithprefix include -D__KERNEL__
 -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
 -fno-strict-aliasing -fno-common -I /usr/src/linux-2.5.47/include/asm/gcc
 -G 0 -mno-abicalls -fno-pic -pipe -mcpu=r4600 -mips2 -Wa,--trap  -c
 -o arch/mips/kernel/entry.o arch/mips/kernel/entry.S
In file included from include/asm/processor.h:15,
                 from include/asm/stackframe.h:15,
                 from arch/mips/kernel/entry.S:22:
include/linux/cache.h:7: warning: `ALIGN' redefined
include/linux/linkage.h:24: warning: this is the location of the previous definition
arch/mips/kernel/entry.S: Assembler messages:
arch/mips/kernel/entry.S:79: Error: unrecognized opcode `align'
arch/mips/kernel/entry.S:84: Error: illegal operands `beqz restore_all'
arch/mips/kernel/entry.S:93: Error: expression too complex
arch/mips/kernel/entry.S:94: Error: unrecognized opcode `addl $8,irq_stat+local_irq_count'
arch/mips/kernel/entry.S:102: Error: unrecognized opcode `movl $8,0($28)'
make[1]: *** [arch/mips/kernel/entry.o] Error 1
make: *** [arch/mips/kernel] Error 2

I try to compile the kernel on a SGI Indigo2 SolidImpact box. Can anyone help
me?

Regards

Marek Uher
 --
Ing. Marek Uher
Web Administration Team
Linux System Engineer
T-Mobile Czech Republic a.s.
Evropska 178
160 67 Praha 6
Czech Republic
Mobile:	(+420) 603 400 728
Office:	(+420) 603 607 128
Fax:		(+420) 603 600 796
E-mail:	marek.uher@t-mobile.cz
Web:		http://www.t-mobile.cz/
 
