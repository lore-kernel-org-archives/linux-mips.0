Message-ID: <002701bf8cc6$c2ef0200$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: FP emulation patch available
Date: Mon, 13 Mar 2000 09:33:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>
Cc: linux-mips@vger.rutgers.edu, linux-mips@fnet.fr, Linux SGI <linux@cthulhu.engr.sgi.com>
Message-ID: <20000313083302.SJCbRadcz5EXALtR_hXWH1jwVepq9u5SfcZg74EVNDE@z>

As Ralf just reminded me by email, the Algorithmics/MIPS
kernel FPU emulator is *not* SMP-safe.  It borrows an existing
(if seldom used) exception handler, and has only a single
set of emulated FPU registers.  I sort-of knew this, but
had not worried about it, since to the best of my knowledge
no one is building (or has built) SMP MIPS machines 
out of FPU-less processors.  Nevertheless, a compile-time
test, to blow up on any attempt at an SMP build of the 
emulator should always have been there, and is going in 
right away.

Does anyone out there actually need/want an SMP
version of the emulator?   It's not completely trivial,
but it would not be all that difficult to do...

            Regards,

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
