From: "Mike Klar" <mfklar@ponymail.com>
Subject: Unaligned address handling, and the cause of that login problem
Date: Sun, 16 Apr 2000 15:19:01 -0700
Message-ID: <NDBBIDGAOKMNJNDAHDDMAEGGCJAA.mfklar@ponymail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: linux@cthulhu.engr.sgi.com
Cc: linux-mips@fnet.fr
Message-ID: <20000416221901.Cf-y2oqfDUo8gEM8skQW34gsD7hgWCjNPpXWW6RQx9k@z>

While tracking down a random memory corruption bug, I stumbled across the
cause of that telnet/ssh problem in recent kernels reported about a month
ago:

The version of down_trylock() for CPUs with support LL/SC assumes that
struct semaphore is 64-bit aligned, since it accesses count and waking as a
single dualword (with lld/scd).  Nothing in struct semaphore guarantees this
alignment, and in fact, struct tty_struct has a struct semaphore that is not
64-bit aligned.  Depending on how a tty is used (I think it's a non-blocking
read that triggers the problem, in drivers/char/n_tty.c), the kernel will
attempt an unaligned lld, it will cause an address error, and the handler in
arch/mips/kernel/unaligned.c will kill current with SIGBUS (since lld/scd
cannot be properly simulated).

The quick-and-dirty workaround is to put 32 bits of padding before the
atomic_read member of struct tty_struct.  Of course, that doesn't fix the
real problem, and there may well be other non-64-bit aligned struct
semaphore's out there.  A proper fix would be to either hack up struct
semaphore to guarantee dualword alignment, or rework the was down_trylock
does its thing.

While I'm on the topic of unaligned handling, this behavior of sending
SIGBUS, SIGSEGV, or SIGILL to current on unaligned accesses seems to me like
incorrect behavior if the original fault happened in kernel mode.  The above
example of an unaligned lld sending SIGBUS is not too bad, since the fault
does happen while doing something on behalf of the current process.
Consider this example, though:  If kernel code attempts an unaligned word
read to virtual address 0x00000001 (for example), the unaligned handler will
attempt to simulate with 2 aligned reads, which will fault, and since the
unaligned handler catches those faults, it will wind up sending SIGSEGV to
current.  I would think that condition should cause an oops, since that's
what an equivalent aligned access would do, and especially since the access
may have had nothing to do with current (it may happen from an interrupt,
for example).

Comments?

Mike Klar
Wyldfier Technology
