Message-ID: <038401c15e47$50331ae0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20011026173004.78642.qmail@web10802.mail.yahoo.com>
Subject: Re: MIPS 32bit and 64bit mode
Date: Fri, 26 Oct 2001 19:54:37 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: han han <piggie111000@yahoo.com>, linux-mips@oss.sgi.com
Message-ID: <20011026175437.c19b9_uKyfLWNWMcjQzpQ4jT1LxUu4p5yqUoSMeG-3A@z>

> Does Anybody help me to clear some concepts about MIPS
> 5kc?
> How to detect and set a MIPS 5kc chip working in 32bit
> or 64bit mode? or the chip can automatically enter
> proper mode when it fetchs an MIPS 32/64 instruction?
> 
> Also, does MIPS 5kc have some 64bit instructions? 

I guess somebody (probably me) need to write a
MIPS32/MIPS64 FAQ one of these days.

To answer your last question first, yes, the MIPS5Kc
has the full compliment of 64-bit integer instructions.
It does not have the integrated FPU of the 5Kf, however,
so you have neither 32-bit nor 64-bit FP instructions.

There are two kinds of "64-bit-ness" to consider:
64-bit data types and 64-bit addresses.   In kernel
mode, a MIPS64 CPU always has access to 64-bit
data types, but to have 64-bit instructions in user
mode, one needs to explicitly enable them in the
CP0.Status register.

In pre-MIPS64 64-bit MIPS CPUs such as the
R4000 and R5000, user mode access to 64-bit
data types was only possible if 64-bit addressing
was also enabled for user mode by setting the
CP0.Status.UX bit.  Kernel mode 64-bit addressing
is independently enabled by setting the CP0.Status.KX
bit.  In MIPS64 (e.g. the 5Kc), it is also possible to enable 
64-bit data types in user mode *without* 64-bit addressing
by setting the CP0.Status.PX bit (bit 23).

            Regards,

            Kevin K.
