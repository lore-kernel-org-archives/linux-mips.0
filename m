Message-ID: <007f01c2907a$58064150$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <NFBBLKAGHEEGPLCBPPCLOEHADEAA.umesh.suryawanshi@tatainfotech.com>
Subject: Re: IDT79S334A MIPS evaluation board 
Date: Wed, 20 Nov 2002 10:50:49 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Umesh Suryawanshi <umesh.suryawanshi@tatainfotech.com>, linux-mips@linux-mips.org
Message-ID: <20021120095049.sqsjNhgHEVPiHBslUymtG3eaQcR92JTfpGj03ZLy7Hc@z>

> Anybody has succsessfully booted IDT79S334 MIPS board with Linux? 
> I trying to boot it using TFTP.
> Please can you forward me that linux image ? 

While not strictly speaking MIPS32-compatible processors,
the RC32334 will probably run a kernel configured with the
"MIPS32" processor option.  The trick is drivers for the board,
and in particular, support for the integrated PCI controller.
30 seconds searching the IDT web site (which you should 
really have done yourself before asking the question here a 
second time) turns up the following:

http://www.idt.com/news/Jun02/06_17_02_1.html

which announces Linux support for the 79S334 from
MontaVista.  I'm sure one of the MontaVista guys
will correct me if I'm wrong, but my understanding
is that the MontaVista Linux Professional Edition
is only available under a paid subscription program,
though after some period of time, a lot of their work
does find its way into the linux-mips.org repository.

So you can wait, you can pay, or you can roll up
your sleeves and start hacking driver code.  ;-)

            Kevin K.
