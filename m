Date: Tue, 13 Mar 2001 19:18:05 +0100 (MET)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Re: Compile error with current CVS kernel
In-reply-to: <20010313152236.B1208@bacchus.dhis.org>
Message-ID: <200103131818.TAA14585@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Adrian Bunk <bunk@fs.tum.de>, linux-mips@oss.sgi.com
Message-ID: <20010313181805.Kvaasaloi07ew4sdRT30L_1d6-rSNEvosSmUsOkr7tY@z>

Hi Ralf,

Ralf wrote:
> 
> That's scary - these sections are explicitly mentioned in the linker
> script and yet ld places them near address zero.  Oh pleassure, oh
> garbage.
> 
> This can probably be fixed by changing the ldscript; can experiment what
> it takes to get your ld to place all sections with a LOAD attribute placed
> next to each other?  My ld behaves fine.

Can you point me to a binutils version and/or patches that should
behave OK for native compiles?

-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------
