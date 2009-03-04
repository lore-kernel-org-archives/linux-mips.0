Received: from sj-iport-3.cisco.com ([171.71.176.72]:41373 "EHLO
	sj-iport-3.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21365695AbZCDWZo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 4 Mar 2009 22:25:44 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH, RFC] MIPS: Implement the getcontext API
Date: Wed, 4 Mar 2009 17:25:35 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A289BE0B68@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <20090304154418.GA13464@linux-mips.org>
References: <alpine.DEB.1.10.0902282326580.4064@tp.orcam.me.uk> <49AD6139.60209@caviumnetworks.com> <200903040919.29294.brian.foster@innova-card.com> <20090304154418.GA13464@linux-mips.org>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Brian Foster <brian.foster@innova-card.com>
Cc: David Daney <ddaney@caviumnetworks.com>, "Maciej W. Rozycki" <macro@codesourcery.com>, linux-mips@linux-mips.org, libc-ports@sourceware.org, "Maciej W. Rozycki" <macro@linux-mips.org>
Message-ID: <20090304222535.A1PRZAoLncHAo5OfasE_UI17kX7xhTQRDsVm1ve0xOc@z>

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Ralf Baechle
> Sent: Wednesday, March 04, 2009 7:44 AM
> To: Brian Foster
> Cc: David Daney; Maciej W. Rozycki; 
> linux-mips@linux-mips.org; libc-ports@sourceware.org; Maciej 
> W. Rozycki
> Subject: Re: [PATCH, RFC] MIPS: Implement the getcontext API
> 
> On Wed, Mar 04, 2009 at 09:19:28AM +0100, Brian Foster wrote:
> 
> > On Tuesday 03 March 2009 17:56:25 David Daney wrote:
> > >[ ... ]
> > > When (and if) we move the sigreturn trampoline to a vdso 
> we should be
> > > able to maintain the ABI.
> > 
> >  it's more a matter of "when" rather than "if".
> >  there is still an intention here to use XI (we
> >  have SmartMIPS), which requires not using the
> >  signal (or FP) trampoline on the stack.
> > 
> >  moving the signal trampoline to a vdso (which
> >  is(? was?) called, maybe misleadingly, 'vsyscall',
> >  on other architectures) is the obvious solution to
> >  that part of the puzzle.  and yes, it is possible
> >  to maintain the ABI; the signal trampoline is still
> >  also put on the stack, and modulo XI, would work if
> >  used - the trampoline-on-stack is simply not used
> >  if there is a vdso with the signal trampoline.
> 
> We generally want to get rid of stack trampolines.  
> Trampolines require
> cacheflushing which especially on SMP systems can be a rather 
> expensive
> operation.

If I understand this correctly, using a vdso would allow a stack without
execute permission on those processors that differentiate between read
and execute permission. This defeats attaches that use buffer overrun to
write code to be executed onto the stack, a nice thing for more secure
systems.
