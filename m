Received: from mailapp01.imgtec.com ([195.59.15.196]:36303 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026862AbcDRJDK1f9Wb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Apr 2016 11:03:10 +0200
Date: Mon, 18 Apr 2016 10:03:03 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 05/12] MIPS: mm: Standardise on _PAGE_NO_READ, drop
 _PAGE_READ
Message-ID: <20160418090303.GA3741@NP-P-BURTON>
References: <1460716620-13382-1-git-send-email-paul.burton@imgtec.com>
 <1460716620-13382-6-git-send-email-paul.burton@imgtec.com>
 <20160415212200.GG7859@jhogan-linux.le.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20160415212200.GG7859@jhogan-linux.le.imgtec.org>
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Adam
 Buchbinder <adam.buchbinder@gmail.com>, David Daney <david.daney@cavium.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Markos Chandras <markos.chandras@imgtec.com>, Alex Smith <alex.smith@imgtec.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160418090303.hqN92KyQMFih_39p9lcyB06JB96lu22mufwSmD9F1fs@z>

On Fri, Apr 15, 2016 at 10:22:00PM +0100, James Hogan wrote:
> > @@ -1615,9 +1611,8 @@ build_pte_present(u32 **p, struct uasm_reloc **r,
> >  			cur = t;
> >  		}
> >  		uasm_i_andi(p, t, cur,
> > -			(_PAGE_PRESENT | _PAGE_READ) >> _PAGE_PRESENT_SHIFT);
> > -		uasm_i_xori(p, t, t,
> > -			(_PAGE_PRESENT | _PAGE_READ) >> _PAGE_PRESENT_SHIFT);
> > +			(_PAGE_PRESENT | _PAGE_NO_READ) >> _PAGE_PRESENT_SHIFT);
> > +		uasm_i_xori(p, t, t, _PAGE_PRESENT >> _PAGE_PRESENT_SHIFT);
> 
> This code makes the assumption that _PAGE_READ was always at a higher
> bit number than _PAGE_PRESENT, however this isn't true for _PAGE_NO_READ
> in the defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
> case, where the no read bit will have been shifted off the end of the
> register value.

Hi James,

Note that as of this patch the PHYS_ADDR_T_64BIT && CPU_MIPS32 case is
still the XPA case, until patch 7.

XPA support hardcodes for RIXI being present, which whilst technically
doesn't seem valid it's already in mainline & seems like a requirement
unlikely to be violated - R6 mandates RIXI, and it seems unlikely any
new R5 + XPA cores would come along at this point. That being the case,
XPA kernels where _PAGE_PRESENT_SHIFT > _PAGE_NO_READ_SHIFT would always
take the cpu_has_rixi path & not hit the problem you describe, or else
would already be hitting problems elsewhere due to the lack of RIXI.

I agree it would be good to make that clearer though, so will add a
panic or something in another patch.

> Other than that, I can't fault this patch.

Thanks for the review :)

Paul
