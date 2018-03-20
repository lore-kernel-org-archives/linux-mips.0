Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:45977 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990520AbeCTVnN5T1Kr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Mar 2018 22:43:13 +0100
Date: Tue, 20 Mar 2018 21:41:47 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH v2] MIPS: Set ISA bit in entry-y for microMIPS kernels
In-Reply-To: <20180308222206.GB24558@saruman>
Message-ID: <alpine.DEB.2.00.1803202136390.2163@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1708212102200.17596@tp.orcam.me.uk> <20180308222206.GB24558@saruman>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org
Message-ID: <20180320214147.nFj8MibkxNyO4yAXGa0YZ82nOURk8w71jnbDM9rC7X4@z>

Hi James,

> > +# Sign-extend the entry point to 64 bits if retrieved as a 32-bit number.
> > +entry-y		= $(shell $(OBJDUMP) -f vmlinux 2>/dev/null \
> > +			| sed -n '/^start address / { \
> > +				s/^.*0x\([0-7].......\)$$/0x00000000\1/; \
> > +				s/^.*0x\(........\)$$/0xffffffff\1/; p }')
> 
> This leaves the "start address " on the beginning if the address is
> already 64 bits wide, e.g.:
> 
> VMLINUX_LOAD_ADDRESS=0xffffffff80100000 VMLINUX_ENTRY_ADDRESS=start address 0xffffffff80832720 ...

 Right, sorry about it.

> The following seems to work, to drop the "start address " first then
> work purely on the hex value (i.e. no need for .* at the front of the
> sign extension regexes any more):
> 
> +entry-y		= $(shell $(OBJDUMP) -f vmlinux 2>/dev/null \
> +			| sed -n '/^start address / { \
> +				s/^.* //; \
> +				s/^0x\([0-7].......\)$$/0x00000000\1/; \
> +				s/^0x\(........\)$$/0xffffffff\1/; p }')
> 
> Look reasonable? Is there a cleaner way?

 Then there's no need to match the beginning again with `^' either.  
Otherwise I think it's reasonable enough.  I'll post v3.

 Thanks for your input!

  Maciej
