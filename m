Message-ID: <005a01bf8d42$c656d2c0$ec44e8c3@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: FP emulation patch available
Date: Tue, 14 Mar 2000 00:20:36 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Harald Koerfgen <Harald.Koerfgen@home.ivm.de>
Cc: Linux SGI <linux@cthulhu.engr.sgi.com>, Linux/MIPS fnet <linux-mips@fnet.fr>, linux-mips@vger.rutgers.edu
Message-ID: <20000313232036.ROw_AvC9RRvixujTkcOe89-m91dzFN8JNva4dsRCGvU@z>

Herald Koerfgen writes:
>Personally, I don't have any idea why the emulator works perfectly on an
R3000
>but not on an R3912.

Nor I, but in the absence of data, I'm happy to speculate.  ;-)
...
>Oh I see, I should have made myself more clear. I have a root filesystem on
a
>CF card based on declinuxroot (a cut down RedHat 5.1) and my Mobilon boots
all
>the way through to the login prompt if I delete the fsck from the
initscripts.
>
>Booting into single user mode I can easily verify that tools like df or
e2fsck
>are bombing out with floating point exeptions. My "tests" with the emulator
>have been so far: Does df survive? What does fsck do? and things like that.
>Well, with the emulator all these tools make the Mobilon crash. Hard. So
hard
>that even the reset button doesn't work.


There are two ways in which the FPU emulator is close enough
to the hardware to be this sensitive to implementation.  One
is the way the emulator provokes an address error exception to
execute a delay slot instruction following a simulated branch, but
I don't think df or fsck do any branch-on-floating-conditions.  The
other is, of course, that it counts on getting sensible and recoverable
coprocessor unusable exceptions.  If the R3912 does something
funky to the processor state on a CP1 unusable fault - an event
that it doesn't have to deal with in its principal mission
as a Windows CE platform - the results would be much
what you are seeing.

There are people at Toshiba who read this mailing
list, so we can hope that they too are on the case and
can maybe lend a clue...

            Regards,

            Kevin K.
