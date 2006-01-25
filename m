Received: from ozlabs.org ([203.10.76.45]:954 "EHLO ozlabs.org")
	by ftp.linux-mips.org with ESMTP id S8133463AbWAYWZJ (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 25 Jan 2006 22:25:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17367.64370.844350.972910@cargo.ozlabs.ibm.com>
Date: Thu, 26 Jan 2006 09:28:02 +1100
From: Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 5/6] fix warning on test_ti_thread_flag()
In-Reply-To: <20060125113446.GF18584@miraclelinux.com>
References: <20060125112625.GA18584@miraclelinux.com>
	<20060125113446.GF18584@miraclelinux.com>
Return-Path: <paulus@ozlabs.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Akinobu Mita <mita@miraclelinux.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-ia64@vger.kernel.org, Ian Molton <spyro@f2s.com>, David Howells <dhowells@redhat.com>, linuxppc-dev@ozlabs.org, Greg Ungerer <gerg@uclinux.org>, sparclinux@vger.kernel.org, Miles Bader <uclinux-v850@lsi.nec.co.jp>, Linus Torvalds <torvalds@osdl.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Hirokazu Takata <takata@linux-m32r.org>, linuxsh-shmedia-dev@lists.sourceforge.net, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, dev-etrax@axis.com, ultralinux@vger.kernel.org, Andi Kleen <ak@suse.de>, linuxsh-dev@lists.sourceforge.net, linux390@de.ibm.com, Russell King <rmk@arm.linux.org.uk>, parisc-linux@parisc-linux.org
Message-ID: <20060125222802.BDwszPPiS_Ea3xX7nJDyD3n8VfE7b2BZliwFwaCAPU4@z>

Akinobu Mita writes:

> If the arechitecture is
> - BITS_PER_LONG == 64
> - struct thread_info.flag 32 is bits
> - second argument of test_bit() was void *
> 
> Then compiler print error message on test_ti_thread_flags()
> in include/linux/thread_info.h

And correctly so.  The correct fix is to make thread_info.flag an
unsigned long.  This patch is NAKed.

Paul.
