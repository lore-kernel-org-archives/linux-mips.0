From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200206190717.g5J7Hnc27328@copfs01.mips.com>
Subject: Re: Linux and the Sony Playstation
Date: Wed, 19 Jun 2002 09:17:49 +0200 (MEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: user alias <linux-mips@oss.sgi.com>
Message-ID: <20020619071749.WOAj7by8_Q8VW-eACHECpSw14Zb-BB4xGh-X38IA5Bs@z>

Forwarded message:
> From: "Kevin D. Kissell" <kevink@mips.com>
> To: <linux-mips@fnet.fr>, <linux-mips@oss.sgi.com>
> Subject: Linux and the Sony Playstation 2
> Date: Tue, 18 Jun 2002 15:59:57 +0200
> 
> The Sony PS2 Linux kit has been shipping for nearly
> a month now, and I'm frankly astonished at how little
> I've seen on this mailing list about it.  For better or
> for worse, this changes everything for MIPS/Linux.
> The number of MIPS/Linux users worldwide has
> just gone up by at least an order of magnitude,
> and they are on a platform running a 2.2.1-derived
> kernel and using gcc 2.95.2.
> 
> It's a perfectly usable platform out of the box, but
> Carsten has thrown "crashme" at it, and it goes down
> relatively quickly.  People trying to port kaffe and
> other programs that do double-precision float are
> blocked because there's no double precision on the
> R5900, and the Sony kernel lacks the Algorithmics
> emulator.

The few simple double-precision programs (ala hello world) I ran worked,
and the compiler substitutes integer code (softfloat) for any double
precision operation. What are the things known not to work?

> It's not clear what Sony is going to put into further
> development, and what they are going to expect the
> user community to take over from here.  There is a 
> group of people trying to take the kernel up to
> 2.2.20, but I'm not yet sure whether they know
> what they are doing, and anyway, that box needs
> to get to 2.4.x ASAP.

It would be great to get 2.4.x on PS/2, and if one doesn't run into 
glibc/kernel dependencies in the upgrade, it should be a reasonable amount
of work. The biggest benefit I see is that a 2.4.x upgrade with the emulator
would allow binary portability of userland using double prec floats.

But one thing which I really admire on the Sony release is the thoroughness
and completeness of their offering. The kernel has full support for the
additional T5900 SIMD state, all new instructions and state is supported
fully in toolchain: binutils, gdb, you name it. Everything in the kit works
(at least what I have tested).

Getting the kernel upgraded would be nice, but there is probably even
more work getting the toolchain, glibc and userland up to speed. There
are about  600 binary userland RPMs provided, which is also a ton of
work to keep updated.

One needs to be very careful that the individual "upgrade" pieces people
do doesn't break the overall nice picture of "everything works out of
the box". What is really needed is that somebody puts together a
productized PS/2 Linux kit version 2.0, which has the
kernel/glibc/toolchain/userland RPMs upgraded to recent versions. 

If somebody else volunteers for the rest, I'll do the kernel :-)
(One of us here here might do it anyway).

/Hartvig


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
