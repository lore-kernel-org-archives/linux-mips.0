Received: from mail-by2on0081.outbound.protection.outlook.com ([207.46.100.81]:57519
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27013082AbcCDRoIHV49K (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 4 Mar 2016 18:44:08 +0100
Message-ID: <56D9C95A.5020106@caviumnetworks.com>
Date: Fri, 4 Mar 2016 09:43:54 -0800
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] MIPS: Sync icache & dcache in set_pte_at
References: <1456799879-14711-1-git-send-email-paul.burton@imgtec.com> <1456799879-14711-5-git-send-email-paul.burton@imgtec.com> <56D5CDB3.80407@caviumnetworks.com> <20160301171940.GA26791@NP-P-BURTON>
In-Reply-To: <20160301171940.GA26791@NP-P-BURTON>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Lars Persson <lars.persson@axis.com>, "stable # v4 . 1+" <stable@vger.kernel.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, David Daney <david.daney@cavium.com>, Huacai Chen <chenhc@lemote.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jerome Marchand <jmarchan@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Message-ID: <20160304174354.-Hdgm0_N162uv5X-X0-oeubcq7TqjV8zdcmYCODU1tQ@z>

On 03/01/2016 09:19 AM, Paul Burton wrote:
> On Tue, Mar 01, 2016 at 09:13:23AM -0800, David Daney wrote:
>> On 02/29/2016 06:37 PM, Paul Burton wrote:
>> [...]
>>> @@ -234,6 +237,22 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pt
>>>   }
>>>   #endif
>>>
>>> +static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>>> +			      pte_t *ptep, pte_t pteval)
>>> +{
>>> +	extern void __update_cache(unsigned long address, pte_t pte);
>>> +
>>> +	if (!pte_present(pteval))
>>> +		goto cache_sync_done;
>>> +
>>> +	if (pte_present(*ptep) && (pte_pfn(*ptep) == pte_pfn(pteval)))
>>> +		goto cache_sync_done;
>>> +
>>> +	__update_cache(addr, pteval);
>>> +cache_sync_done:
>>> +	set_pte(ptep, pteval);
>>> +}
>>> +
>>
>> This seems crazy.
>
> Perhaps, but also correct...
>
>> I don't think any other architecture does this type of work in set_pte_at().
>
> Yes they do. As mentioned in the commit message see arm, ia64 or powerpc
> for architectures that all do the same sort of thing in set_pte_at.
>
>> Can you look into finding a better way?
>
> Not that I can see.
>
>> What if you ...
>>
>>
>>>   /*
>>>    * (pmds are folded into puds so this doesn't get actually called,
>>>    * but the define is needed for a generic inline function.)
>>> @@ -430,15 +449,12 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>>
>>>   extern void __update_tlb(struct vm_area_struct *vma, unsigned long address,
>>>   	pte_t pte);
>>> -extern void __update_cache(struct vm_area_struct *vma, unsigned long address,
>>> -	pte_t pte);
>>>
>>>   static inline void update_mmu_cache(struct vm_area_struct *vma,
>>>   	unsigned long address, pte_t *ptep)
>>>   {
>>>   	pte_t pte = *ptep;
>>>   	__update_tlb(vma, address, pte);
>>> -	__update_cache(vma, address, pte);
>>
>> ... Reversed the order of these two operations?
>
> It would make no difference. The window for the race exists between
> flush_dcache_page & set_pte_at. update_mmu_cache isn't called until
> later than set_pte_at, so cannot possibly avoid the race. The commit
> message walks through where the race exists - I don't think you've read
> it.


I think the code that calls set_pte_at() should be fixed.

If cache maintenance is needed before modifying the page tables, that is 
explicitly done in the calling code.

In migrate.c (remove_migration_pte, similar in do_swap_page) we have:
    .
    .
    .
	flush_dcache_page(new);
	set_pte_at(mm, addr, ptep, pte);
    .
    .
    .

Similar in huge_memory.c (unfreeze_page_vma, freeze_page_vma, etc.)

The point being, the callers have the knowledge about what is changing 
and should make sure they do the right thing to keep the caches 
consistent.  The job of set_pte_at() is to manipulate the page tables, 
nothing else.
