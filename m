Received: from sj-iport-1.cisco.com ([171.71.176.70]:7782 "EHLO
	sj-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20808936AbZCEWI3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 5 Mar 2009 22:08:29 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH, RFC] MIPS: Implement the getcontext API
Date: Thu, 5 Mar 2009 17:08:18 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A289BE0EF8@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <Pine.LNX.4.64.0903052148500.12710@digraph.polyomino.org.uk>
References: <alpine.DEB.1.10.0902282326580.4064@tp.orcam.me.uk> <49AD6139.60209@caviumnetworks.com> <alpine.DEB.1.10.0903051530080.6558@tp.orcam.me.uk> <49B004AA.8050006@caviumnetworks.com> <FF038EB85946AA46B18DFEE6E6F8A289BE0DC1@xmb-rtp-218.amer.cisco.com> <20090305213653.GB12355@linux-mips.org> <Pine.LNX.4.64.0903052148500.12710@digraph.polyomino.org.uk>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Joseph Myers <joseph@codesourcery.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney@caviumnetworks.com>, "Maciej W. Rozycki" <macro@codesourcery.com>, linux-mips@linux-mips.org, libc-ports@sourceware.org, "Maciej W. Rozycki" <macro@linux-mips.org>, Richard Sandiford <rdsandiford@googlemail.com>
Message-ID: <20090305220818.4vXeCSz4hf9h_5-fOhoycyCQG8ZBMJBuhtNVDWA1MY0@z>

> -----Original Message-----
> From: Joseph Myers [mailto:joseph@codesourcery.com] 
> Sent: Thursday, March 05, 2009 1:53 PM
> To: Ralf Baechle
> Cc: David VomLehn (dvomlehn); David Daney; Maciej W. Rozycki; 
> linux-mips@linux-mips.org; libc-ports@sourceware.org; Maciej 
> W. Rozycki; Richard Sandiford
> Subject: Re: [PATCH, RFC] MIPS: Implement the getcontext API
> 
> On Thu, 5 Mar 2009, Ralf Baechle wrote:
> 
> > stillborn EABI and NUBI variants.  Add various Linux and 
> GNU specific
> > enhancements and deviations from the previously mentioned 
> documents for
> > example for TLS.  Frequently the documentation really is 
> just in the code,
> > a mailing list archive or in the back of somebody's brain ...
> 
> (Although it took a while for the documentation to catch up with the 
> implementation and changes made in the course of patch 
> review, as far as I 
> know <http://www.linux-mips.org/wiki/NPTL> is now an accurate 
> description 
> of TLS for MIPS.)
> 
> > Somebody could probably earn a medal by writing a single 
> consolidated
> > and readable piece of documentation.
> 
> Anyone seriously wishing to produce a complete and current and 
> copyright-clean description of what the MIPS ABIs now are 
> might wish to 
> note that a similar project for (32-bit) Power Architecture 
> has been going 
> on since late 2006 and we still haven't quite got to the point of 
> releasing a public review draft.  There is a lot of work involved.

I spent two years as Chair of the MIPS ABI Group Technical Committee
working on the MIPS psABI and I can attest to how much work it is.
Still, if there were enough of people involved from the kernel,
compiler/library, and appropriate utility communities willing to try to
pull things together, I could see spending time on it.
