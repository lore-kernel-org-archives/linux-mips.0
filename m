Message-ID: <001001c3f98e$2270dcc0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Law10-F39hgbi1Kigvf000046ac@hotmail.com> <1077477186.3636.34.camel@dzur.sfbay.redhat.com>
Subject: Re: r3000 instruction set
Date: Sun, 22 Feb 2004 22:52:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Eric Christopher <echristo@redhat.com>, Mark and Janice Juszczec <juszczec@hotmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20040222215213.g_SwR4f8AGRrPdO6LFwaeWnuccd0OK-Uagcv5OjojKE@z>

> Other than the responses you've already gotten, likely you'll need to
> compile with -march=r3900(or -mcpu=r3900 if it's an old toolchain) since
> the 3900 is missing a couple of r3000 instructions iirc.

The 3900 family should run MIPS I code compiled for the R3000.

> If it's the 3912 I remember it also doesn't have an fpu, but I could be
> wrong there. If it is, then you need -msoft-float as well.

The 3912 has no FPU, but if you're running on any contemporary
MIPS/Linux kernel and library system, you neither need nor want
soft-float.  The kernel does FP instruction emulation.  Running soft-float
would make for faster, if larger, code, but requires that the whole
system, particularly glibc, be built for soft-float, which is rarely done
(and the last time I tried it, didin't quite work with the standard
glibc sources out-of-the-box). 
