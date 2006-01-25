Received: from fmr22.intel.com ([143.183.121.14]:64408 "EHLO
	scsfmr002.sc.intel.com") by ftp.linux-mips.org with ESMTP
	id S8133382AbWAYRHE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 25 Jan 2006 17:07:04 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH 5/6] fix warning on test_ti_thread_flag()
Date: Wed, 25 Jan 2006 09:08:15 -0800
Message-ID: <B05667366EE6204181EABE9C1B1C0EB509780224@scsmsx401.amr.corp.intel.com>
From: "Chen, Kenneth W" <kenneth.w.chen@intel.com>
Return-Path: <kenneth.w.chen@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Akinobu Mita <mita@miraclelinux.com>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Russell King <rmk@arm.linux.org.uk>, Ian Molton <spyro@f2s.com>, dev-etrax@axis.com, David Howells <dhowells@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linus Torvalds <torvalds@osdl.org>, linux-ia64@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Linux/MIPS Development <linux-mips@linux-mips.org>, parisc-linux@parisc-linux.org, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux390@de.ibm.com, linuxsh-dev@lists.sourceforge.net, linuxsh-shmedia-dev@lists.sourceforge.net, sparclinux@vger.kernel.org, ultralinux@vger.kernel.org, Miles Bader <uclinux-v850@lsi.nec.co.jp>, Andi Kleen <ak@suse.de>, Chris Zankel <chris@zankel.net>
Message-ID: <20060125170815.YwHdMMCA_jIw5e_yJuH9SaBsn_vrlxSLTR0EpIoet18@z>

Geert Uytterhoeven wrote on Wednesday, January 25, 2006 4:29 AM
> On Wed, 25 Jan 2006, Akinobu Mita wrote:
> > If the arechitecture is
> > - BITS_PER_LONG == 64
> > - struct thread_info.flag 32 is bits
> > - second argument of test_bit() was void *
> > 
> > Then compiler print error message on test_ti_thread_flags()
> > in include/linux/thread_info.h
> > 
> > Signed-off-by: Akinobu Mita <mita@miraclelinux.com>
> > ---
> >  thread_info.h |    2 +-
> >  1 files changed, 1 insertion(+), 1 deletion(-)
> > 
> > Index: 2.6-git/include/linux/thread_info.h
> > ===================================================================
> > --- 2.6-git.orig/include/linux/thread_info.h	2006-01-25
19:07:12.000000000 +0900
> > +++ 2.6-git/include/linux/thread_info.h	2006-01-25
19:14:26.000000000 +0900
> > @@ -49,7 +49,7 @@
> >  
> >  static inline int test_ti_thread_flag(struct thread_info *ti, int
flag)
> >  {
> > -	return test_bit(flag,&ti->flags);
> > +	return test_bit(flag, (void *)&ti->flags);
> >  }
> 
> This is not safe. The bitops are defined to work on unsigned long
only, so
> flags should be changed to unsigned long instead, or you should use a
> temporary.
> 
> Affected platforms:
>   - alpha: flags is unsigned int
>   - ia64, sh, x86_64: flags is __u32
> 
> The only affected 64-platforms are little endian, so it will silently
work
> after your change, though...

I thought test_bit can operate on array beyond unsigned long.
It's perfectly legitimate to do: test_bit(999, bit_array) as
long as bit_array is indeed big enough to hold 999 bits.  It
is the responsibility of the caller to make sure that the
underlying array is big enough for the bit that is being tested.

I don't think you need to change the flags size.

- Ken
