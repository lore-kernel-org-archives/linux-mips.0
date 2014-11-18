Received: from mailapp01.imgtec.com ([195.59.15.196]:39543 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012173AbaKRTR6PTL-u (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Nov 2014 20:17:58 +0100
Message-ID: <546B9B5D.6090406@imgtec.com>
Date: Tue, 18 Nov 2014 11:17:49 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: MIPS: c-r4k.c: Fix the 74K D-cache alias erratum workaround
References: <546A56C9.4060608@imgtec.com> <alpine.DEB.1.10.1411172321110.2881@tp.orcam.me.uk> <546A8EB3.3040504@imgtec.com> <alpine.DEB.1.10.1411180039100.2881@tp.orcam.me.uk> <546AC366.1070304@imgtec.com> <alpine.DEB.1.10.1411180400480.2881@tp.orcam.me.uk>
In-Reply-To: <alpine.DEB.1.10.1411180400480.2881@tp.orcam.me.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: "Maciej W. Rozycki" <macro@codesourcery.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20141118191749.Pwb4PUzubqnNDaW76I41U7l6cMWK9i_ATGzyPbtVmLU@z>

On 11/17/2014 08:56 PM, Maciej W. Rozycki wrote:
> On Tue, 18 Nov 2014, Leonid Yegoshin wrote:
>
>>>    That doesn't appear to have anything to do with ptrace(2) and
>>> cache-coherency issues seen around software breakpoints, and the buggy
>>> 74K is the only system of all that we have that shows that problem.  And
>>> the problem goes away with my fix.  So perhaps MIPS_CACHE_ALIASES is
>>> actually needed here, or maybe a more lightweight alternative fix, but
>>> an item that addresses HIGHMEM support is clearly irrelevant.
>> Again, the 74K errata has deal only if there is two mappings and one of that
>> mappings switches to the same physaddr. In other words - TLB change is needed
>> (some another conditions are also needed). It has nothing with generic cache
>> aliasing. Switching ON cache aliasing support just masks the issue behind
>> massive cache flushes.
>   For the erratum to trigger do the two mappings absolutely have to go
> through the TLB or can one of them be via the TLB and the other one via
> a fixed mapping by the means of KSEG0?
One of mapping can be KSEG0 fixed.

>    This will be the case here.
It was considered as not - KSEG0 mapping is not changed and user mapping 
actually is stable and is not changed during ptrace(2).
But change of one TLB is required (with accesses via both and with race 
condition with other mapping).
It is a very specific case and there are only two places which may have 
impact - CoW and page clearing before it is submitted to user.

>
>   And I understand what the consequence of setting MIPS_CACHE_ALIASES is,
> but I also insist that correctness is more important than performance,
> so we need to make sure that the kernel performs reliably even if that
> comes at a cost.  And the cost may be higher than necessary at the
> beginning, but that will be the right starting point for further
> improvements.

I suspect you may have a problem with something else but not 74K errata 
and switching on cache aliasing flushes just hides a problem. Why you 
see it on 74K only - because it is out-of-order CPU. Did you test on 
proAptiv or newest P5600, it has a similar out-of-order design?

>> If you have problem with ptrace(2) then it points to incorrect result of
>> copy_to_user_page(), and most probably - with kmap() work. That HIGHMEM patch
>> there takes care about address aliasings, so I assumed I took that case into
>> account too but something may changes. I think it has sense to put the check
>> of cpu_has_vtag_dcache in copy_to_user_page() - it definitely will enforce
>> cache flashing after ptrace() write aka __access_remote_vm(..., true) and it
>> doesn't harm the rest of system. And retest.
>>
>> But it is needed to do after http://patchwork.linux-mips.org/patch/8459/ fix,
>> without it it is futile.
>   I think burying fixes for ordinary accesses among HIGHMEM pieces does
> not really help, would you be able to split off pieces relevant for
> non-HIGHMEM configurations, such as those for the 74K workaround, from
> your big change?  I think it would make it easier to get this part
> accepted, and the remaining pieces would then shrink too, also making
> them easier to review and accept.

It is related with HIGHMEM because (at least 3 years ago) the HIGHMEM 
had a high possibility to hit it.
However, it was a series of some stuff which was sequentially ported 
from 2.6.32.15 to 2.6.32.9 and so on but never passes upstream and 
because of that it suffers a serious change in time.

- Leonid.
