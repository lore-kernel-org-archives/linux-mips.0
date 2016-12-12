Received: from mailapp01.imgtec.com ([195.59.15.196]:6864 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993006AbcLLUpqj0JLS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 12 Dec 2016 21:45:46 +0100
Message-ID: <584F0C71.5010004@imgtec.com>
Date: Mon, 12 Dec 2016 12:45:37 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [RFC] MIPS: Add cacheinfo support
References: <20161208011626.20885-1-justinpopo6@gmail.com> <5849EC43.2070802@imgtec.com> <CAJx26kW0e-HC0VUTObZ5Or+XjFvE9KmtOToKbFvKYvhE--Vw5A@mail.gmail.com> <584A0281.3040505@imgtec.com> <3004fca6-3688-65bb-7c86-248603482088@gmail.com>
In-Reply-To: <3004fca6-3688-65bb-7c86-248603482088@gmail.com>
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
Message-ID: <20161212204537.E0qPEYB-HbSbwFYvVGDdSzOrRjCYhChn9mVnR20Mn4o@z>

On 12/12/2016 10:24 AM, Florian Fainelli wrote:
>
> What Justin's patch is about is not so much about providing hints to
> user-space to bypass the kernel's own management of caches, (even though
> that has been used as an argument by the original introduction of
> cacheinfo), but more to provide some information to user-space about the
> cache topology and hierarchy.

I missed that, if it is for information purpose only, then it is OK.

>
> Even though this is limited information this is still helpful to
> applications like lshw and others out there.
>
> What would be needed from your perspective to get cacheinfo added to
> MIPS, shall we go back and address your initial comment about all the
> little details about coherency, snooping and re-filling strategy?

It depends. Initially, I thought Justin wants to replace 
arch/mips/mm/c-XXX.c with some universal approach and listed the missed 
stuff for that (I actually missed some more points in that list).

But for information purpose I don't have any more addition to Justin's 
patch... may be the coherency status, it has impact on performance: 
coherency of L1D->L2, L2->memory and L1I->L1D/L2.


- Leonid
