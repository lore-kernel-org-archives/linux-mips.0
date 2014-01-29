Received: from multi.imgtec.com ([194.200.65.239]:8019 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827334AbaA2RRK2K6VN (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 29 Jan 2014 18:17:10 +0100
Message-ID: <52E93795.8000205@imgtec.com>
Date: Wed, 29 Jan 2014 17:17:09 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: mm: c-r4k: Detect instruction cache aliases
References: <1391001009-19580-1-git-send-email-markos.chandras@imgtec.com> <52E9029C.80300@cogentembedded.com> <52E90525.7010704@imgtec.com> <52E94404.8050303@cogentembedded.com>
In-Reply-To: <52E94404.8050303@cogentembedded.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Message-ID: <20140129171709.oO7HheTUhq144i8GCryy5C2G-PY5nG_ni-CF2QHAKw0@z>

On 01/29/2014 06:10 PM, Sergei Shtylyov wrote:
> Hello.
>
> On 01/29/2014 04:41 PM, Markos Chandras wrote:
>
>>>> The *Aptiv cores can use the CONF7/IAR bit to detect if the core
>>>> has hardware support to remove instruction cache aliasing.
>
>>>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>>>> ---
>>>> This patch is for the upstream-sfr/mips-for-linux-next tree
>>> [...]
>
>>>> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
>>>> index 13b549a..e790524 100644
>>>> --- a/arch/mips/mm/c-r4k.c
>>>> +++ b/arch/mips/mm/c-r4k.c
>>>> @@ -1110,7 +1110,10 @@ static void probe_pcache(void)
>>>>       case CPU_PROAPTIV:
>>>>           if (current_cpu_type() == CPU_74K)
>>>>               alias_74k_erratum(c);
>>>> -        if ((read_c0_config7() & (1 << 16))) {
>>>> +        if (!(read_c0_config7() & MIPS_CONF7_IAR))
>>>> +            if (c->icache.waysize > PAGE_SIZE)
>
>>>     Why not fold these to a single *if*?
>
>> I suppose I could do that. Thanks
>
>>>> +                c->icache.flags |= MIPS_CACHE_ALIASES;
>>>> +        if (read_c0_config7() & MIPS_CONF7_AR) {
>
>>>     You didn't document this change. Ideally, it should be in a separate
>>> patch.
>
>> Nothing has changed. Instead of using the '16' magic value, I just
>> documented
>> that bit along with the IAR one.
>
>     You should have noted that in the changelog, at least.
>
> WBR, Sergei
>
>

Ok I will submit a v2 soon. Thanks for the review.

-- 
markos
