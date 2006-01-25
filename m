Received: from mail.ocs.com.au ([202.147.117.210]:61892 "EHLO mail.ocs.com.au")
	by ftp.linux-mips.org with ESMTP id S8133488AbWAYLuY (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 25 Jan 2006 11:50:24 +0000
From: Keith Owens <kaos@sgi.com>
Subject: Re: [PATCH 3/6] C-language equivalents of include/asm-*/bitops.h 
In-reply-to: Your message of "Wed, 25 Jan 2006 20:32:06 +0900."
             <20060125113206.GD18584@miraclelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Jan 2006 22:54:43 +1100
Message-ID: <24086.1138190083@ocs3.ocs.com.au>
Return-Path: <kaos@sgi.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Akinobu Mita <mita@miraclelinux.com>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Russell King <rmk@arm.linux.org.uk>, Ian Molton <spyro@f2s.com>, dev-etrax@axis.com, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linus Torvalds <torvalds@osdl.org>, linux-ia64@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-mips@linux-mips.org, parisc-linux@parisc-linux.org, linuxppc-dev@ozlabs.org, linux390@de.ibm.com, linuxsh-dev@lists.sourceforge.net, linuxsh-shmedia-dev@lists.sourceforge.net, sparclinux@vger.kernel.org, ultralinux@vger.kernel.org, Miles Bader <uclinux-v850@lsi.nec.co.jp>, Andi Kleen <ak@suse.de>, Chris Zankel <chris@zankel.net>
Message-ID: <20060125115443.N7loHf77W_PsKz_ceLrNuLJzn8OkWZvkS2k1NAk5pYs@z>

Akinobu Mita (on Wed, 25 Jan 2006 20:32:06 +0900) wrote:
>o generic {,test_and_}{set,clear,change}_bit() (atomic bitops)
...
>+static __inline__ void set_bit(int nr, volatile unsigned long *addr)
>+{
>+	unsigned long mask = BITOP_MASK(nr);
>+	unsigned long *p = ((unsigned long *)addr) + BITOP_WORD(nr);
>+	unsigned long flags;
>+
>+	_atomic_spin_lock_irqsave(p, flags);
>+	*p  |= mask;
>+	_atomic_spin_unlock_irqrestore(p, flags);
>+}

Be very, very careful about using these generic *_bit() routines if the
architecture supports non-maskable interrupts.

NMI events can occur at any time, including when interrupts have been
disabled by *_irqsave().  So you can get NMI events occurring while a
*_bit fucntion is holding a spin lock.  If the NMI handler also wants
to do bit manipulation (and they do) then you can get a deadlock
between the original caller of *_bit() and the NMI handler.

Doing any work that requires spinlocks in an NMI handler is just asking
for deadlock problems.  The generic *_bit() routines add a hidden
spinlock behind what was previously a safe operation.  I would even say
that any arch that supports any type of NMI event _must_ define its own
bit routines that do not rely on your _atomic_spin_lock_irqsave() and
its hash of spinlocks.
