Received: from mail-bn1on0088.outbound.protection.outlook.com ([157.56.110.88]:19088
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27011743AbcCARNhZcIn2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 1 Mar 2016 18:13:37 +0100
Message-ID: <56D5CDB3.80407@caviumnetworks.com>
Date: Tue, 1 Mar 2016 09:13:23 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] MIPS: Sync icache & dcache in set_pte_at
References: <1456799879-14711-1-git-send-email-paul.burton@imgtec.com> <1456799879-14711-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1456799879-14711-5-git-send-email-paul.burton@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Lars Persson <lars.persson@axis.com>, "stable
 # v4 . 1+" <stable@vger.kernel.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, David Daney <david.daney@cavium.com>, Huacai Chen <chenhc@lemote.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jerome Marchand <jmarchan@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160301171323.0tr4IQ7_I0IEEHhjPIJWVJ1PciZeylbDurmnjZEX_5o@z>

On 02/29/2016 06:37 PM, Paul Burton wrote:
[...]
> @@ -234,6 +237,22 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
>   }
>   #endif
>
> +static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
> +			      pte_t *ptep, pte_t pteval)
> +{
> +	extern void __update_cache(unsigned long address, pte_t pte);
> +
> +	if (!pte_present(pteval))
> +		goto cache_sync_done;
> +
> +	if (pte_present(*ptep) && (pte_pfn(*ptep) == pte_pfn(pteval)))
> +		goto cache_sync_done;
> +
> +	__update_cache(addr, pteval);
> +cache_sync_done:
> +	set_pte(ptep, pteval);
> +}
> +

This seems crazy.  I don't think any other architecture does this type 
of work in set_pte_at().

Can you look into finding a better way?

What if you ...


>   /*
>    * (pmds are folded into puds so this doesn't get actually called,
>    * but the define is needed for a generic inline function.)
> @@ -430,15 +449,12 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>
>   extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
>   	pte_t pte);
> -extern void __update_cache(struct vm_area_struct *vma, unsigned long address,
> -	pte_t pte);
>
>   static inline void update_mmu_cache(struct vm_area_struct *vma,
>   	unsigned long address, pte_t *ptep)
>   {
>   	pte_t pte = *ptep;
>   	__update_tlb(vma, address, pte);
> -	__update_cache(vma, address, pte);

... Reversed the order of these two operations?

>   }
>
>   static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
> diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
> index 8befa55..bf04c6c 100644
> --- a/arch/mips/mm/cache.c
> +++ b/arch/mips/mm/cache.c
> @@ -125,30 +125,17 @@ void __flush_anon_page(struct page *page, unsigned long vmaddr)
>
>   EXPORT_SYMBOL(__flush_anon_page);
>
> -void __flush_icache_page(struct vm_area_struct *vma, struct page *page)
> -{
> -	unsigned long addr;
> -
> -	if (PageHighMem(page))
> -		return;
> -
> -	addr = (unsigned long) page_address(page);
> -	flush_data_cache_page(addr);
> -}
> -EXPORT_SYMBOL_GPL(__flush_icache_page);
> -
> -void __update_cache(struct vm_area_struct *vma, unsigned long address,
> -	pte_t pte)
> +void __update_cache(unsigned long address, pte_t pte)
>   {
>   	struct page *page;
>   	unsigned long pfn, addr;
> -	int exec = (vma->vm_flags & VM_EXEC) && !cpu_has_ic_fills_f_dc;
> +	int exec = !pte_no_exec(pte) && !cpu_has_ic_fills_f_dc;
>
>   	pfn = pte_pfn(pte);
>   	if (unlikely(!pfn_valid(pfn)))
>   		return;
>   	page = pfn_to_page(pfn);
> -	if (page_mapping(page) && Page_dcache_dirty(page)) {
> +	if (Page_dcache_dirty(page)) {
>   		if (PageHighMem(page))
>   			addr = (unsigned long)kmap_atomic(page);
>   		else
>
