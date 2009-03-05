Received: from sj-iport-1.cisco.com ([171.71.176.70]:64519 "EHLO
	sj-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21366256AbZCESXp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2009 18:23:45 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH, RFC] MIPS: Implement the getcontext API
Date: Thu, 5 Mar 2009 13:23:31 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A289BE0DC1@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <49B004AA.8050006@caviumnetworks.com>
References: <alpine.DEB.1.10.0902282326580.4064@tp.orcam.me.uk> <49AD6139.60209@caviumnetworks.com> <alpine.DEB.1.10.0903051530080.6558@tp.orcam.me.uk> <49B004AA.8050006@caviumnetworks.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>, "Maciej W. Rozycki" <macro@codesourcery.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, libc-ports@sourceware.org, "Maciej W. Rozycki" <macro@linux-mips.org>, Richard Sandiford <rdsandiford@googlemail.com>
Message-ID: <20090305182331.INumtiGSkvz8g9HBVneWEPRkyFkvJerrTnMg0eQjl_0@z>

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of David Daney
> Sent: Thursday, March 05, 2009 8:58 AM
> To: Maciej W. Rozycki
> Cc: Ralf Baechle; linux-mips@linux-mips.org; 
> libc-ports@sourceware.org; Maciej W. Rozycki; Richard Sandiford
> Subject: Re: [PATCH, RFC] MIPS: Implement the getcontext API
> 
> Adding Richard S. as he may be interested...
> 
> Maciej W. Rozycki wrote:
> > On Tue, 3 Mar 2009, David Daney wrote:
> > 
> >> Note the libgcc currently makes the assumption that the 
> layout of the stack
> >> for signal handlers is fixed.  The DWARF2 unwinder needs 
> this information to
> >> be able to unwind through signal frames (see 
> gcc/config/mips/linux-unwind.h),
> >> so it is already a de facto part of the ABI.
> > 
> >  I do hope it was agreed upon at some point.
> 
> As with many things, there was no formal agreement.

To the best of my knowledge, there is no formal ABI for MIPS Linux,
period. The closest we have is the MIPS psABI, which documented the o32
ABI as it stood ten years ago. What we have now does not conform to that
document in some subtle, but non-trivial, ways. If I'm wrong, I'd love
to know where I could find documentation.

David VomLehn
