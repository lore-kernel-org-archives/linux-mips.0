Received: from mailapp01.imgtec.com ([195.59.15.196]:62931 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006779AbcC2Iz5FRZik (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 29 Mar 2016 10:55:57 +0200
Date: Tue, 29 Mar 2016 09:55:49 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH 2/4] MIPS: Flush highmem pages in __flush_dcache_page
Message-ID: <20160329085549.GA17987@NP-P-BURTON>
References: <1456799879-14711-1-git-send-email-paul.burton@imgtec.com>
 <1456799879-14711-3-git-send-email-paul.burton@imgtec.com>
 <20160329083543.GD11282@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20160329083543.GD11282@linux-mips.org>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Lars Persson <lars.persson@axis.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160329085549.UahcBZNyZaR_KaGwuuPhtei2QcRmHYvDl7qZbA7bH7g@z>

On Tue, Mar 29, 2016 at 10:35:43AM +0200, Ralf Baechle wrote:
> On Tue, Mar 01, 2016 at 02:37:57AM +0000, Paul Burton wrote:
> 
> > When flush_dcache_page is called on an executable page, that page is
> > about to be provided to userland & we can presume that the icache
> > contains no valid entries for its address range. However if the icache
> > does not fill from the dcache then we cannot presume that the pages
> > content has been written back as far as the memories that the dcache
> > will fill from (ie. L2 or further out).
> > 
> > This was being done for lowmem pages, but not for highmem which can lead
> > to icache corruption. Fix this by mapping highmem pages & flushing their
> > content from the dcache in __flush_dcache_page before providing the page
> > to userland, just as is done for lowmem pages.
> > 
> > Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> > Cc: Lars Persson <lars.persson@axis.com>
> > ---
> > 
> >  arch/mips/mm/cache.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
> > index 3f159ca..5a67d8c 100644
> > --- a/arch/mips/mm/cache.c
> > +++ b/arch/mips/mm/cache.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/mm.h>
> >  
> >  #include <asm/cacheflush.h>
> > +#include <asm/highmem.h>
> >  #include <asm/processor.h>
> >  #include <asm/cpu.h>
> >  #include <asm/cpu-features.h>
> > @@ -83,8 +84,6 @@ void __flush_dcache_page(struct page *page)
> >  	struct address_space *mapping = page_mapping(page);
> >  	unsigned long addr;
> >  
> > -	if (PageHighMem(page))
> > -		return;
> >  	if (mapping && !mapping_mapped(mapping)) {
> >  		SetPageDcacheDirty(page);
> >  		return;
> > @@ -95,8 +94,15 @@ void __flush_dcache_page(struct page *page)
> >  	 * case is for exec env/arg pages and those are %99 certainly going to
> >  	 * get faulted into the tlb (and thus flushed) anyways.
> >  	 */
> > -	addr = (unsigned long) page_address(page);
> > +	if (PageHighMem(page))
> > +		addr = (unsigned long)kmap_atomic(page);
> > +	else
> > +		addr = (unsigned long)page_address(page);
> > +
> >  	flush_data_cache_page(addr);
> > +
> > +	if (PageHighMem(page))
> > +		__kunmap_atomic((void *)addr);
> >  }
> >  
> >  EXPORT_SYMBOL(__flush_dcache_page);
> 
> I don't see how this should work with cache aliases.  If the page is unmapped
> kmap_atomic will pick a deterministic address only under some circumstances,
> kmap won't.  As the result the wrong cache way will be flushed out, I think.
> 
>   Ralf

Hi Ralf,

None of the systems I tested this on have cache aliases, and highmem on
systems with cache aliases is currently unsupported to the extent that
we BUG_ON such cases in flush_kernel_dcache_page.

So hopefully you won't require that this code making highmem without
aliases also fix the currently-unsupported highmem with aliases case?

Thanks,
    Paul
