Received: from mail-bl2on0069.outbound.protection.outlook.com ([65.55.169.69]:7824
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010960AbbHDUs3Zy0Xi (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 4 Aug 2015 22:48:29 +0200
Message-ID: <55C1250B.2090508@caviumnetworks.com>
Date: Tue, 4 Aug 2015 13:48:11 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: MIPS: Make set_pte() SMP safe.
References: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com> <55C10F4B.2050003@imgtec.com> <55C11A37.5070509@caviumnetworks.com> <55C1214F.8050208@imgtec.com>
In-Reply-To: <55C1214F.8050208@imgtec.com>
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
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20150804204811.iIwTFUKguOyEdxUt8m4DOGFMtBKH_r9PW-l-6H4g1t0@z>

On 08/04/2015 01:32 PM, Leonid Yegoshin wrote:
> David,
>
> It is interesting, I still don't understand the effect

I think the best way to think about it is to ignore vmap, and consider 
the semantics of set_pte().

When a thread calls set_pte() it must ensure that no other thread will 
crash using VA region covered by the PTE.  That is the contract of 
set_pte().

The MIPS set_pte() does something different.  In addition to setting the 
specified PTE, it has the side effect of clobbering another PTE (called 
the buddy).  There is nothing in the kernel that prevents a another 
thread from using the buddy-PTE, and when that happens in the race 
window, the page tables are corrupted, and the system crashes.

The fix is to not clobber the buddy-PTE.

You can go around in circles all you want trying to indirectly avoid 
using the buddy-PTE from another thread, but I think it is best to make 
set_pte() have easily understood semantics (and semantics that match 
those of other architectures) and not clobber things in unexpected ways.

David Daney.


> - if guard page
> is used then two different VMAP allocations can't use two buddy PTEs.
>
> Yes, only one of buddy PTEs in that case can be allocated and attached
> to VMA but caller doesn't know about additional page and two cases are
> possible. Even map_vm_area has no any info about guard page.
>
> (assume VMA1 has low address range and VMA2 has higher address range):
>
> a.  VMA1 (after adjustment) ends at even PTE ==> caller doesn't use that
> PTE and there is no collision with last pair of buddy PTEs, even if VMA2
> uses odd PTE from that pair.
> b.  VMA1 (after adjustment) ends at odd PTE ==> again, this buddy pair
> is used only VMA1. Next VMA2 start from next pair.
>
> What is wrong here?
>
> Is it possible that access gone bad and touches a page beyond a
> requested size?
> Is it possible that it is not vmap() but some different interface was used?
>
> - Leonid.
>
