Message-ID: <000d01c02782$32d31560$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <39CF9DFC.F30B302B@mvista.com> <200009252116.WAA01137@gladsmuir.algor.co.uk> <39CFC567.DD66BC56@mvista.com>
Subject: Re: load_unaligned() and "uld" instruction
Date: Tue, 26 Sep 2000 08:22:36 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Jun Sun <jsun@mvista.com>, Dominic Sweetman <dom@algor.co.uk>
Cc: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20000926062236.MNmrtRBIoKKKkWT6bDajFFzs5d8_7r47vgBASNBOicM@z>

> Dominic,
> 
> Thanks for the clarification.

I'll second that - he beat me to it!

> I looked at my problem again, and it turns out that it was caused by
> "-mips2" compiler option.  If I use "-mips3", the complain goes away,
> which seems to make sense - assuming "uld" and "usw" are 
> introduced in mips III.

The "load word left/right" and "store word left/right" instructions are 
part of the original MIPS I ISA.  On the other hand, "uld" represents
a load of an unalgined quad or "doubleword" of 64-bits, and uses
64-bit load double right/left instructions that are part of the 64-bit
MIPS III ISA.  

> This actually brings another question (which I thought I have posted
> before).  Take a look of arch/mips/Makefile, you will find most CPUS
> uses -mips2 compiler option.  While -mips2 is safe, it cannot take
> advantages of "uld" etc.  Is there any reason that we don't want to use
> -mips3, at least for some of the later CPUs?
> 
> If we have to use "-mips2" option, is there a clean way which allows us
> to "uld/usw" instructions (instead of manually twicking the compilation
> for each file that uses them)?

This is a general problem that I've had to fight with the 
"main line" MIPS/Linux distribution.  Most of the work
being done is being done on SGI platforms, and all
SGI systems since the Crimson have had 64-bit CPUs.
Older DECStations use R3000s, and more importantly,
many of the new embedded MIPS designs use "MIPS32"
processors that have R4000-like system coprocessors,
but only 32-bit data paths.  I had to do a fairly complete
redesign of the 2.2 semaphore support code, for example,
in order to get it to rely only on the 32-bit forms of load
locked and store conditional.  It's clear that I'll have to do
something similar with the unaligned accesses in the USB 
support code before it will run on the MIPS 4Kc and 
similar CPUs.

> Another question is that in the same file most CPUs will take another
> compiler option such as "-mcpu=r8000", in which case the cpu model
> usually does NOT correspond to the actual CPU.  Why is that?

The -mcpu tells the compiler and assembler for what kind
of pipeline it should optimise, which is independent of the
ISA level.  "-mcpu=r8000", for example, tells the tools that
the CPU is superscalar. Thus one sees that option selected 
for the R5000 platforms, even though the R5000 and R8000
pipelines are otherwise very dissimilar.

            Regards,

            Kevin K.
