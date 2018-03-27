Received: from 9pmail.ess.barracuda.com ([64.235.150.224]:38818 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992916AbeC0LIDfbIbW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 Mar 2018 13:08:03 +0200
Date: Tue, 27 Mar 2018 12:07:44 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Make the default for PHYSICAL_START always
 64-bit
In-Reply-To: <20180327092438.GA17660@saruman>
Message-ID: <alpine.DEB.2.00.1803271146110.2163@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1803240129140.2163@tp.orcam.me.uk> <20180327092438.GA17660@saruman>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Maxim Uvarov <muvarov@gmail.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20180327110744.omUSIRGNhZakCC8vRLq3JObaml5H5_5i-6NX2nSJS7k@z>

On Tue, 27 Mar 2018, James Hogan wrote:

> > Make the default for PHYSICAL_START always 64-bit, ensuring that a 
> > correct sign-extended value is used if a 32-bit image is loaded by a 
> > 64-bit system, and matching how the load address is set in platform 
> > Makefile fragments (arch/mips/*/Platform) in the absence of the 
> > PHYSICAL_START configuration option.
> 
> This looks correct given the defaults in the Makefile fragments. However
> I presume a 32BIT kernel will produce a 32-bit ELF, in which case the
> result will be indistinguishable? For other kernel image formats which
> always use 64-bit pointers perhaps it matters more (if they can be
> loaded by kexec-tools). uImage is 32-bit ISTR, and our ITB stuff seems
> to only use 32bit addresses for CONFIG_32BIT. I don't now about other
> formats.

 For ELF it does not matter, but as you say $VMLINUX_LOAD_ADDRESS and 
$VMLINUX_ENTRY_ADDRESS is needed for software which does not interpret ELF 
files.  However my interpretation is based solely on source examination 
and the commit description and not actual use of these features.  I assume 
platform Makefile fragments do use 64-bit representation for a reason 
though.

> So unless I hear otherwise I'll probably drop the stable tag and apply
> for 4.17.

 I won't insist on backporting.  After all it's the default only and the 
value can be entered manually if the default does not work.

  Maciej
