Message-ID: <00f301bf8c6d$35db4670$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: FP emulation patch available
Date: Sun, 12 Mar 2000 22:52:00 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>
Cc: linux-mips@vger.rutgers.edu, Linux/MIPS fnet <linux-mips@fnet.fr>, Linux SGI <linux@cthulhu.engr.sgi.com>
Message-ID: <20000312215200.cjtxhdVgpF4qANzQ0-9txnI9ma_SDjauYGTiGNfG0to@z>

>After some minor patches it works fine on an R3000A (tested on a DECstation
>5000/133 with 2.3.47) but my Mobilon (R3912) still bombs out horribly.
>Unfortunately there is no fully functional serial driver for the R3912 yet so
>all I am able to tell is that this box crashes so badly that even the CPU
>internal LCD controller is going wild.
>
>Either there are more differences between an R3000 and an R3900 core as
>I am aware of (quite likely), or this may have something to do with the fact
that
>the R3912 definately has no FPU.

The R3900 is quite different in a number of details from the R3900A.
It has a different ISA (MIPS II+ instead of MIPS I), a different pipeline
and a different CP0 implementation.  And the R3912 has its rather
peculiar set of on-chip peripherals with, if memory serves, a somewhat
obnoxious memory map. Do you have a set of documentation for the
R3912?  I do, but I don't know when I will have time to check it against
the R3000 Linux code.

>Kevin, please forgive me this question, but has the Linux integration of
>the FPU emulation code been tested on MIPS CPUs without FPU?

Yes.  Of course.  What kind of amateur fire-and-forget hacker do you take
me for?!! ;-)   Specifically, we've run it on the MIPS 4Kc core.  Both big and
little endian.  We also ran it on R4400 Indys and R5260 Algorithmics platforms
with the FPUs disabled in software.  I'm not saying that it's perfect - I know
it cannot be - but the emulator does not get invoked until very late in the
boot process, just before init fires up, so if you're dieing early on, whatever
it is, it ain't the emulator, and it isn't the lack of FP.  Even without an
emulator, the 2.2.12 kernel will get as far as trying to run init on an FPU-less
machine.

            Regards,

            Kevin K.
