Received: from mailapp01.imgtec.com ([195.59.15.196]:57879 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993076AbcLMAT5dfHSz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Dec 2016 01:19:57 +0100
Message-ID: <584F3E9D.9030501@imgtec.com>
Date: Mon, 12 Dec 2016 16:19:41 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [RFC] MIPS: Add cacheinfo support
References: <20161208011626.20885-1-justinpopo6@gmail.com> <5849EC43.2070802@imgtec.com> <CAJx26kW0e-HC0VUTObZ5Or+XjFvE9KmtOToKbFvKYvhE--Vw5A@mail.gmail.com> <584A0281.3040505@imgtec.com> <3004fca6-3688-65bb-7c86-248603482088@gmail.com> <584F0C71.5010004@imgtec.com> <6981ff1e-685e-2df7-4b6e-c67c3aa735e7@gmail.com>
In-Reply-To: <6981ff1e-685e-2df7-4b6e-c67c3aa735e7@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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
To: Florian Fainelli <f.fainelli@gmail.com>, Justin Chen <justinpopo6@gmail.com>
Cc: linux-mips@linux-mips.org, bcm-kernel-feedback-list@broadcom.com, Justin Chen <justin.chen@broadcom.com>
Message-ID: <20161213001941.BsnmPrbmd1OXlw1gAi3RVcuAlshlz6OEQHve0cktUy4@z>

On 12/12/2016 01:57 PM, Florian Fainelli wrote:
> OK, how would you want that to be represented? Should we try to "link"
> with the leaf we are coherent with? For instance, if the L1D cache is
> coherent with the L2, we have something like this:
>
> # Assuming this is L1D cache:
> /sys/devices/system/cpu/cpu0/cache/index0
> ls -1
> coherency_line_size
> level
> number_of_sets
> physical_line_partition
> power/
> shared_cpu_list
> shared_cpu_map
> size
> type
> uevent
> ways_of_associativity
>
> We add a new symbolic link, e.g:
>
> coherent_with -> ../index1
>
> that indicates that this cache is coherent with the cache pointed at by
> directory index1.
>
> Thanks!
Well, I prefer the collection of 3 flags:

flush_required        - or flush to next level is required to force 
coherency between this level and next after update of this level
invalidate_required   - or invalidate is required to force coherency 
between this level and next after update of next level
coherent_to_level     - object is coherent with this level (only one 
domain of coherency on this level is assumed)

So, the standard MIPS L1D could be "flush_required", 
"invalidate_required" and "coherent_to_level", L1I could be 
"invalidate_required" and a fully coherent MIPS I6400 L1D could be just 
"coherent_to_level" (no flush/invalidate required).

The reason why I don't like symlink here because it is more precise 
information and it immediately pulls the question "do we need to have 
horizontal links like CPU0 L1D is coherent with CPU1 L1D?" or "do we 
need to have a horizontal link like CPU0 L1D is coherent with CPU1 L1I?" 
or "do we have a MEMORY object?" or "what if coherency is not 
bidirectional (L1D snoops L2 but not vise versa). And you should 
maintain that links in case of CPU goes on/offline. And pulling info 
from that link net is nontrivial in user level, especially if "lshw" 
works in parallel with CPUx going offline.

But what you need is actually the answer on that 3 questions (see flags 
above). At least I don't see a reason for more complicated cache level 
relationship. Even the case BIG-LITTLE still is covered by flags.

- Leonid.
