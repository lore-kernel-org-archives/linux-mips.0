Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199708051848.OAA06002@neon.ingenia.ca>
Subject: indyIRQ.S
Date: Tue, 5 Aug 1997 14:48:32 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Linux/SGI list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970805184832.j4z_o371OS2YUgjyhA-drUZZFoc1FXk_bF1G3y8UtMI@z>

Up-to-the-minute copy of the kernel, Ralf's Intel binutils, etc.

mips-linux-gcc -D__KERNEL__ -I/export/sgi-linux/kernel/linux/include -D__GOGOGO__ -c indyIRQ.S -o indyIRQ.o
indyIRQ.S: Assembler messages:
indyIRQ.S:72: Warning: No .cprestore pseudo-op used in PIC code
indyIRQ.S:83: Warning: No .cprestore pseudo-op used in PIC code
indyIRQ.S:95: Warning: No .cprestore pseudo-op used in PIC code
indyIRQ.S:107: Warning: No .cprestore pseudo-op used in PIC code
indyIRQ.S:124: Warning: No .cprestore pseudo-op used in PIC code
indyIRQ.S:75: Error: Can not represent relocation in this object file format
indyIRQ.S:86: Error: Can not represent relocation in this object file format
indyIRQ.S:98: Error: Can not represent relocation in this object file format
indyIRQ.S:110: Error: Can not represent relocation in this object file format
indyIRQ.S:127: Error: Can not represent relocation in this object file format
make[1]: *** [indyIRQ.o] Error 1
make[1]: *** Waiting for unfinished jobs....

Any ideas?

I'm also seeing a problem with asm/atomic.h and the like; stuff about
invalid operands for binary +, etc.  I expect it's a CFLAGS or GCC
spec file thing, but those should both be standard.

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>              Linux: because every cycle counts.
#>
#> "I don't know what you do for a living[...]" -- perry@piermont.com
#>        "I change the world." -- davem@caip.rutgers.edu
