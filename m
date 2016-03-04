Received: from mailapp01.imgtec.com ([195.59.15.196]:22276 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007619AbcCDKhVggb2h (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Mar 2016 11:37:21 +0100
Date: Fri, 4 Mar 2016 10:37:14 +0000
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [4/4] MIPS: Sync icache & dcache in set_pte_at
Message-ID: <20160304103714.GA5576@NP-P-BURTON>
References: <1456799879-14711-5-git-send-email-paul.burton@imgtec.com>
 <56D7A987.5040602@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <56D7A987.5040602@imgtec.com>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org, Lars Persson <lars.persson@axis.com>, "stable # v4 . 1+" <stable@vger.kernel.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, David Daney <david.daney@cavium.com>, Huacai Chen <chenhc@lemote.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jerome Marchand <jmarchan@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160304103714.cNsY8wXl_Ri_hTVb_bPsAjfcMOxEk1GUAWQrkkAmxTQ@z>

Hi Leonid,

On Wed, Mar 02, 2016 at 07:03:35PM -0800, Leonid Yegoshin wrote:
> Paul Burton wrote:
> >It is, however, used in such a way by others & seems to me like the only
> >correct way to implement the lazy cache flushing. The alternative would
> >be to adjust all generic code to ensure flush_icache_page gets called
> >before set_pte_at
> 
> ... which is an exact case right now.

No, it isn't. I included call traces for 2 cases where this is not the
case right in the commit message.

> Both calls of flush_icache_page() are:
> 
> 1) do_swap_page()
> 
>         flush_icache_page(vma, page);
>         if (pte_swp_soft_dirty(orig_pte))
>                 pte = pte_mksoft_dirty(pte);
>         set_pte_at(mm, address, page_table, pte);
> ...
> 
> 2) do_set_pte()
> 
>         flush_icache_page(vma, page);
>         entry = mk_pte(page, vma->vm_page_prot);
>         if (write)
>                 entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>         if (anon) {
>                 inc_mm_counter_fast(vma->vm_mm, MM_ANONPAGES);
>                 page_add_new_anon_rmap(page, vma, address);
>         } else {
>                 inc_mm_counter_fast(vma->vm_mm, MM_FILEPAGES);
>                 page_add_file_rmap(page);
>         }
>         set_pte_at(vma->vm_mm, address, pte, entry);
> 
>         /* no need to invalidate: a not-present page won't be cached */
>         update_mmu_cache(vma, address, pte);
> ....
> 
> You should only be sure that flush_icache_page() completes a lazy D-cache
> flush.
> 
> - Leonid.

Well of course that's fine in those 2 cases. Of course both callers of
flush_icache_page call flush_icache_page - that's a meaningless
tautology. You're grepping for the wrong thing.

The problem is that there are other code paths which dirty pages (ie.
call flush_dcache_page), then get as far as set_pte_at *without* calling
flush_icache_page. Again - I included call traces from 2 paths that hit
this right in the commit message.

So:

  - flush_icache_page isn't always called before we *need* to writeback
    the page from the dcache. This is demonstrably the case (again, see
    the commit message), and causes bugs when using UBIFS on boards
    using the pistachio SoC at least.

  - flush_icache_page is indicated as something that should go away in
    Documentation/cachetlb.txt. Why do you feel we should make use of
    it?

  - Other architectures (at least arm, ia64 & powerpc which may not be
    an exhaustive list) handle this in set_pte_at too. Doing it in the
    same way can only be good for consistency.

So flush_icache_page is insufficient, apparently disliked & not the way
any other architectures solve the exact same problem (again, because it
does *not* cover all cases).

Thanks,
    Paul
