Date: Tue, 13 Mar 2001 19:38:59 +0100 (MET)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Re: Compile error with current CVS kernel
In-reply-to: <20010313192711.F1208@bacchus.dhis.org>
Message-ID: <200103131838.TAA14965@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Adrian Bunk <bunk@fs.tum.de>, linux-mips@oss.sgi.com
Message-ID: <20010313183859.4yoP51TrsT1jZXdkj43wom5zlkMvQZLECYF0V9X2o6o@z>

Hi,

Ralf wrote:
> Karel wrote:
> > Can you point me to a binutils version and/or patches that should
> > behave OK for native compiles?
> 
> It's not native vs. crosscompile; this problem with binutils hits in both
> cases and only older versions (which aren't suitable for use with
> glibc 2.2 ...) are not affected.

I've just finished compiling gcc 3.0, from CVS, and am now trying
to rebuild the kernel with this compiler (same binutils, from cvs).
Keith mentioned he did succeed in building a kernel with these...

-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------
