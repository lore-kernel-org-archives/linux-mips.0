Message-ID: <001301c3f9db$2c46d720$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Law10-F39hgbi1Kigvf000046ac@hotmail.com> <1077477186.3636.34.camel@dzur.sfbay.redhat.com> <001001c3f98e$2270dcc0$10eca8c0@grendel> <40396D75.7090405@realitydiluted.com>
Subject: Re: r3000 instruction set
Date: Mon, 23 Feb 2004 08:03:36 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Steven J. Hill" <sjhill@realitydiluted.com>
Cc: Eric Christopher <echristo@redhat.com>, Mark and Janice Juszczec <juszczec@hotmail.com>, linux-mips@linux-mips.org
Message-ID: <20040223070336.gAZQ5IhGTSW8a-VH7Wnu4lPYgeBC2YAlG4yZnPTiymk@z>

> > The 3912 has no FPU, but if you're running on any contemporary
> > MIPS/Linux kernel and library system, you neither need nor want
> > soft-float.  The kernel does FP instruction emulation.  Running soft-float
> > would make for faster, if larger, code, but requires that the whole
> > system, particularly glibc, be built for soft-float, which is rarely done
> > (and the last time I tried it, didin't quite work with the standard
> > glibc sources out-of-the-box). 
> > 
> Correct. I use the FP emulator in Linux for my TX3917/PR31700 stuff. I
> have had no problems. Current glibc has assembly code that assumes hardware
> floating point which is why building for soft-float does not work out of
> the box. There are probably some patches out there to rectify that. 

It's been several years, but the last time I dealt with it, it wasn't all
that hard to fix if you knew what you were doing, but it was a couple
of days' work just the same.

> Also, I have some documents for the 3912 on my FTP site:
> 
>     ftp://ftp.realitydiluted.com/docs/Toshiba
>     ftp://ftp.realitydiluted.com/docs/Philips
> 
> It should be noted that the Toshiba TX3912 and the Philips PR31700 are
> identical cores. There was definitely some cross-licensing going on there.
> Perhaps Kevin or Dominic would know this in more detail, but it is not
> really that important.

I'm  not sure whether any NDAs which may or may not exist
would have expired by now, so I'll stick to a "no comment".  ;o)
