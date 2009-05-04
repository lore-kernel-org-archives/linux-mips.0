Received: from sj-iport-6.cisco.com ([171.71.176.117]:59134 "EHLO
	sj-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org
	with ESMTP id S20022995AbZEDRXq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 4 May 2009 18:23:46 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: HIGHMEM fix for r24k
Date: Mon, 4 May 2009 13:23:24 -0400
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A28901220C27@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <1241448586.15448.249.camel@chaos.ne.broadcom.com>
References: <1240525424.15448.33.camel@chaos.ne.broadcom.com> <20090424154349.GB3614@linux-mips.org> <1240589632.15448.38.camel@chaos.ne.broadcom.com> <20090425092446.GA9845@linux-mips.org> <1241448586.15448.249.camel@chaos.ne.broadcom.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: jfraser@broadcom.com, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20090504172324.mpXNeJH-_dqryBjxd0XOJdbKhihpxpv38AlhHxTCil8@z>

I applied it against the head of tree, but it didn't work. I've been too
tied up with other things, though, so I haven't been able to dig into
it. It is entirely possible that there is nothing wrong with the patch. 

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Jon Fraser
> Sent: Monday, May 04, 2009 7:50 AM
> To: Ralf Baechle
> Cc: jfraser@broadcom.com; linux-mips@linux-mips.org
> Subject: Re: HIGHMEM fix for r24k
> 
> Hi Ralf,
> 
>        Just wanted to acknowledge your email.   I've been 
> playing catch
> up for the last week after spending a large amount of unscheduled time
> finding the root cause of this bug.  I should be able to get 
> to applying
> this patch this week.  Were these against HOT or 2.6.29?
> 
> Jon
> 
> 
> On Sat, 2009-04-25 at 02:24 -0700, Ralf Baechle wrote:
> > On Fri, Apr 24, 2009 at 12:13:52PM -0400, Jon Fraser wrote:
> > 
> > > That's why I haven't proposed a fix yet.  But there are 
> other people
> > > dealing with the same HIGHMEM issues and I wanted them to 
> know about the
> > > problem.
> > 
> > Can you test below fix?  Thanks,
> > 
> >   Ralf
> > 
> > Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> > 
> >  arch/mips/include/asm/fixmap.h  |    3 +++
> >  arch/mips/include/asm/highmem.h |    6 ++++--
> >  arch/mips/mm/highmem.c          |   25 +++++++++++++++++++------
> >  arch/mips/mm/init.c             |   26 --------------------------
> >  4 files changed, 26 insertions(+), 34 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/fixmap.h 
> b/arch/mips/include/asm/fixmap.h
> > index 9cc8522..0f5caa1 100644
> > --- a/arch/mips/include/asm/fixmap.h
> > +++ b/arch/mips/include/asm/fixmap.h
> > @@ -108,6 +108,9 @@ static inline unsigned long 
> virt_to_fix(const unsigned long vaddr)
> >  	return __virt_to_fix(vaddr);
> >  }
> >  
> > +#define kmap_get_fixmap_pte(vaddr)				
> 	\
> > +	
> pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(vaddr), 
> (vaddr)), (vaddr)), (vaddr))
> > +
> >  /*
> >   * Called from pgtable_init()
> >   */
> > diff --git a/arch/mips/include/asm/highmem.h 
> b/arch/mips/include/asm/highmem.h
> > index 4374ab2..25adfb0 100644
> > --- a/arch/mips/include/asm/highmem.h
> > +++ b/arch/mips/include/asm/highmem.h
> > @@ -30,8 +30,6 @@
> >  /* declarations for highmem.c */
> >  extern unsigned long highstart_pfn, highend_pfn;
> >  
> > -extern pte_t *kmap_pte;
> > -extern pgprot_t kmap_prot;
> >  extern pte_t *pkmap_page_table;
> >  
> >  /*
> > @@ -62,6 +60,10 @@ extern struct page 
> *__kmap_atomic_to_page(void *ptr);
> >  
> >  #define flush_cache_kmaps()	flush_cache_all()
> >  
> > +extern void kmap_init(void);
> > +
> > +#define kmap_prot PAGE_KERNEL
> > +
> >  #endif /* __KERNEL__ */
> >  
> >  #endif /* _ASM_HIGHMEM_H */
> > diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
> > index 4481656..2b1309b 100644
> > --- a/arch/mips/mm/highmem.c
> > +++ b/arch/mips/mm/highmem.c
> > @@ -1,7 +1,12 @@
> >  #include <linux/module.h>
> >  #include <linux/highmem.h>
> > +#include <asm/fixmap.h>
> >  #include <asm/tlbflush.h>
> >  
> > +static pte_t *kmap_pte;
> > +
> > +unsigned long highstart_pfn, highend_pfn;
> > +
> >  void *__kmap(struct page *page)
> >  {
> >  	void *addr;
> > @@ -14,6 +19,7 @@ void *__kmap(struct page *page)
> >  
> >  	return addr;
> >  }
> > +EXPORT_SYMBOL(__kmap);
> >  
> >  void __kunmap(struct page *page)
> >  {
> > @@ -22,6 +28,7 @@ void __kunmap(struct page *page)
> >  		return;
> >  	kunmap_high(page);
> >  }
> > +EXPORT_SYMBOL(__kunmap);
> >  
> >  /*
> >   * kmap_atomic/kunmap_atomic is significantly faster than 
> kmap/kunmap because
> > @@ -48,11 +55,12 @@ void *__kmap_atomic(struct page *page, 
> enum km_type type)
> >  #ifdef CONFIG_DEBUG_HIGHMEM
> >  	BUG_ON(!pte_none(*(kmap_pte - idx)));
> >  #endif
> > -	set_pte(kmap_pte-idx, mk_pte(page, kmap_prot));
> > +	set_pte(kmap_pte-idx, mk_pte(page, PAGE_KERNEL));
> >  	local_flush_tlb_one((unsigned long)vaddr);
> >  
> >  	return (void*) vaddr;
> >  }
> > +EXPORT_SYMBOL(__kmap_atomic);
> >  
> >  void __kunmap_atomic(void *kvaddr, enum km_type type)
> >  {
> > @@ -77,6 +85,7 @@ void __kunmap_atomic(void *kvaddr, enum 
> km_type type)
> >  
> >  	pagefault_enable();
> >  }
> > +EXPORT_SYMBOL(__kunmap_atomic);
> >  
> >  /*
> >   * This is the same as kmap_atomic() but can map memory 
> that doesn't
> > @@ -92,7 +101,7 @@ void *kmap_atomic_pfn(unsigned long pfn, 
> enum km_type type)
> >  	debug_kmap_atomic(type);
> >  	idx = type + KM_TYPE_NR*smp_processor_id();
> >  	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
> > -	set_pte(kmap_pte-idx, pfn_pte(pfn, kmap_prot));
> > +	set_pte(kmap_pte-idx, pfn_pte(pfn, PAGE_KERNEL));
> >  	flush_tlb_one(vaddr);
> >  
> >  	return (void*) vaddr;
> > @@ -111,7 +120,11 @@ struct page *__kmap_atomic_to_page(void *ptr)
> >  	return pte_page(*pte);
> >  }
> >  
> > -EXPORT_SYMBOL(__kmap);
> > -EXPORT_SYMBOL(__kunmap);
> > -EXPORT_SYMBOL(__kmap_atomic);
> > -EXPORT_SYMBOL(__kunmap_atomic);
> > +void __init kmap_init(void)
> > +{
> > +	unsigned long kmap_vstart;
> > +
> > +	/* cache the first kmap pte */
> > +	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
> > +	kmap_pte = kmap_get_fixmap_pte(kmap_vstart);
> > +}
> > diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> > index d934894..c551129 100644
> > --- a/arch/mips/mm/init.c
> > +++ b/arch/mips/mm/init.c
> > @@ -104,14 +104,6 @@ unsigned long setup_zero_pages(void)
> >  	return 1UL << order;
> >  }
> >  
> > -/*
> > - * These are almost like kmap_atomic / kunmap_atmic except 
> they take an
> > - * additional address argument as the hint.
> > - */
> > -
> > -#define kmap_get_fixmap_pte(vaddr)				
> 	\
> > -	
> pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(vaddr), 
> (vaddr)), (vaddr)), (vaddr))
> > -
> >  #ifdef CONFIG_MIPS_MT_SMTC
> >  static pte_t *kmap_coherent_pte;
> >  static void __init kmap_coherent_init(void)
> > @@ -264,24 +256,6 @@ void copy_from_user_page(struct 
> vm_area_struct *vma,
> >  	}
> >  }
> >  
> > -#ifdef CONFIG_HIGHMEM
> > -unsigned long highstart_pfn, highend_pfn;
> > -
> > -pte_t *kmap_pte;
> > -pgprot_t kmap_prot;
> > -
> > -static void __init kmap_init(void)
> > -{
> > -	unsigned long kmap_vstart;
> > -
> > -	/* cache the first kmap pte */
> > -	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
> > -	kmap_pte = kmap_get_fixmap_pte(kmap_vstart);
> > -
> > -	kmap_prot = PAGE_KERNEL;
> > -}
> > -#endif /* CONFIG_HIGHMEM */
> > -
> >  void __init fixrange_init(unsigned long start, unsigned long end,
> >  	pgd_t *pgd_base)
> >  {
> > 
> 
> 
> 
> 
