Message-ID: <000601bfa83f$347bd540$1953d3d4@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Unaligned address handling, and the cause of that login problem
Date: Mon, 17 Apr 2000 09:32:04 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Mike Klar <mfklar@ponymail.com>, linux@cthulhu.engr.sgi.com
Cc: linux-mips@fnet.fr
Message-ID: <20000417073204.dg2a5QAPd5WRTXyBi-6J8B8fqnPPLQsQU6vLkDyqBB4@z>

Note that, as part of what we had to do to support
the newer generations of MIPS32 chips that support
LL/SC, but only for 32-bit quantities, I did a complete
rework of the semaphore support primatives to
eliminate this dependency on 64-bit LL/SC.
See the source tar and patch file on the MIPS
FTP server ftp://ftp.mips.com/pub/linux/mips/kernel
or even the slightly earlier patches webbed on the
www.paralogos.com/mipslinux pages.

It *was* a rewrite from first principles, based
on study of the documentation and the x86
and PPC code, and while I can guarantee it
won't have the unaligned  doubleword problem,
I'd be interested in anyone elses critique of the
implementation.

            Regards,

            Kevin K.

-----Original Message-----
From: Mike Klar <mfklar@ponymail.com>
To: linux@cthulhu.engr.sgi.com <linux@cthulhu.engr.sgi.com>
Cc: linux-mips@fnet.fr <linux-mips@fnet.fr>
Date: Monday, April 17, 2000 12:36 AM
Subject: Unaligned address handling, and the cause of that login problem


>While tracking down a random memory corruption bug, I stumbled across the
>cause of that telnet/ssh problem in recent kernels reported about a month
>ago:
>
>The version of down_trylock() for CPUs with support LL/SC assumes that
>struct semaphore is 64-bit aligned, since it accesses count and waking as a
>single dualword (with lld/scd).  Nothing in struct semaphore guarantees
this
>alignment, and in fact, struct tty_struct has a struct semaphore that is
not
>64-bit aligned.  Depending on how a tty is used (I think it's a
non-blocking
>read that triggers the problem, in drivers/char/n_tty.c), the kernel will
>attempt an unaligned lld, it will cause an address error, and the handler
in
>arch/mips/kernel/unaligned.c will kill current with SIGBUS (since lld/scd
>cannot be properly simulated).
>
>The quick-and-dirty workaround is to put 32 bits of padding before the
>atomic_read member of struct tty_struct.  Of course, that doesn't fix the
>real problem, and there may well be other non-64-bit aligned struct
>semaphore's out there.  A proper fix would be to either hack up struct
>semaphore to guarantee dualword alignment, or rework the was down_trylock
>does its thing.
>
>While I'm on the topic of unaligned handling, this behavior of sending
>SIGBUS, SIGSEGV, or SIGILL to current on unaligned accesses seems to me
like
>incorrect behavior if the original fault happened in kernel mode.  The
above
>example of an unaligned lld sending SIGBUS is not too bad, since the fault
>does happen while doing something on behalf of the current process.
>Consider this example, though:  If kernel code attempts an unaligned word
>read to virtual address 0x00000001 (for example), the unaligned handler
will
>attempt to simulate with 2 aligned reads, which will fault, and since the
>unaligned handler catches those faults, it will wind up sending SIGSEGV to
>current.  I would think that condition should cause an oops, since that's
>what an equivalent aligned access would do, and especially since the access
>may have had nothing to do with current (it may happen from an interrupt,
>for example).
>
>Comments?
>
>Mike Klar
>Wyldfier Technology
>
