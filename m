Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199711272254.OAA27112@oz.engr.sgi.com>
Subject: Re: Problems with booting SGI/Linux
Date: Thu, 27 Nov 1997 14:54:20 -0800 (PST)
In-Reply-To: <199711271811.TAA11711@anxur.fi.muni.cz> from "David Kostal" at Nov 27, 97 07:11:10 pm
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: David Kostal <kron@informatics.muni.cz>
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19971127225420.28t5XUbIL0zkgCwLiLfs87fb9ci042rC7lES5WysdlY@z>

Could someone help David on this ?
Is this a R4600 PC vs SC thing ?
A known hardware bug in R4600 PC ?

David: you may want to subscribe to the SGI/Linux mailimg
list (if your aren't yet):
	To: linux-request@engr.sgi.com
	Body: subscribe linux <your@preferred.email.address>

:
:Hallo,
:I've tried to run sgi/linux on our INDY/R4600PC 100MHz, but I was
:unable to boot the kernel. I used kernel from
:test/vmlinux-970916-efs.gz . The booting process stoped after while. 
:I use this kernel, because I wasn't able to cross-compile my own
:kernel.
:I send you the messages (handly) rewriten from the console. Can you,
:please, lat me know, where was problem? If you wil need more info or
:more tests on my Indy, I will do it.
:
:thanks a lot
:
:david kostal (kron@fi.muni.cz)
:----+
:
:
:
:PROMLIB: SGI ARCS firmware Version1 Revision 10
:PROMLIB: Total free ram 31502336 bytes (...)
:ARCH: SGI-IP22
:CPU: MIPS-R4600 FPU<MIPS-R4600FPC> ICACHE DCACHE
:Loading R4000 MNV routines
:CPU revision is: 00002020
:Primary ICACHE 16K (linesize 32 bytes)
:Primary DCACHE 16K (linesize 32 bytes)
:R4600/R5000 SCACHE size 0 Kb linesize 32 bytes
:MC: SGI memory controller Revision 3
:calculating r4koff ... 0007eedc(519900)
:GFX INIT: SHMIQ setup
:usenamedone misc device registred (minor: 151)
:umesa device registred (major 86)
:video screen size is 00004c88a18833e948
:console: 16 point font, 992 scans
:console: color NEWPORT 158x62, 1 virtual console (max 63)
:Calibrating delay loop ... ok - 103.83 BogoMIPS
:Memory: 28616/163836 available (1020k kernel code, 2352k data)
:Swansea University Computer Society NET3.035 for Linux 2.0
:NET3: Unix domain sockets 0.13 for Linux NET3.035.
:Swansea University Computer Society TCP/IP for NET3.034
:IP Protocols: IGMP, ICMP, UDP, TCP
:Checking 'wait' instruction... available.
:Linux version 2.1.55 (slaue@neor.ingenia.ca) (gcc version 2.7.2) #122 9.16. 16:30:52
:Posix counfornance testing by UNIFIX
:Starting kswapd v 1.2.3
:SGI Zilog 8530 serial driver version 1.08 tty00 at 0xbbbd9838 (irq = 21) is a Zilog 8530
:SGI Zilog 8530 serial driver version 1.08 tty01 at 0xbbbd9830 (irq = 21) is a Zilog 8530
:Got a bus error IRQ, shouldn't happen yet
:$0 :0000 0000 1000 bc01 8811 0000 0000 0000
:$4 :8813 418c 8819 9630 89ff 5cf0 0000 0001
:$8 :1000 fc03 0000 0201 0000 9fe1 8811 99d8
:$12:0000 0001 0000 0001 0000 0001 ffff fffc
:$16:0000 c000 89fe 1000 0000 0000 0000 0000
:$20:987b fc20 a874 6d10 9fc5 5664 0000 0000
:$24:1000 bc01 0000 000f 0000 0000 0000 0000
:$28:0000 0000 89ff 5c90 0000 0001 8800 b0c8
:epc: 88033258
:slots: 1000fc03
:Cause: 0000 4000
:Spinning.....
:


-- 
Peace, Ariel
