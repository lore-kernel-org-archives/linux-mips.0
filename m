Message-ID: <00f201c1d410$f05bd540$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: EJTAG Debug Exceptions and LL/SC
Date: Mon, 25 Mar 2002 16:19:44 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20020325151944._tTTHbhBSEwEqTvhgaqPHxTsdeY_wp7UZzU5rLfQ-O0@z>

In the course of hacking around in the 2.4.18 kernel
on a new MIPS CPU, I came across something that
urgently needs to be fixed in any repositories that
propose MIPS EJTAG support.

EJTAG exceptions do *not* affect the LL/SC
flipflop.  That means that they are non-invasive
if injected into a LL/SC sequence.  It also means
that one cannot use LL/SC within a Debug exception
handler.  The Linux mini Debug exception handler
has for some time performed printk()'s to let the
world know that something "unusual" has happened.
Somewhere between 2.4.3 and 2.4.18, someone
cleverly fixed printk() to not munge simultaneous
output lines on SMP systems, which on MIPS
means using LL/SC.  Result:  the kernel will go
into an infinite loop in Debug mode (no further 
interrupts taken, etc.)  if ever an Debug exception 
is taken after an LL sets the flop.  So those calls to
printk() need to go away, and a big narly comment
needs to go at the top of ejtag_exception_handler()
warning people not to call any function that might
involve a kernel semaphore, cause a TLB fault,
or depend on an interrupt beind delivered.

In general, code executed in the kernel in Debug
mode needs to be carefully quarantined.  Any invocation
of kernel services needs to be done either by passing
a message to be sampled at some later point by the
kernel, or by setting up a software interrupt to be taken
after the DERET from the Debug exception.

            Regards,

            Kevin K.
