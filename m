Received: from dns0.mips.com ([12.201.5.70]:46684 "EHLO dns0.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1901163Ab2EVHGH (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 22 May 2012 09:06:07 +0200
Message-ID: <4FBB3AD2.1040802@mips.com>
Date: Tue, 22 May 2012 15:05:54 +0800
From: Deng-Cheng Zhu <dczhu@mips.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] MIPS: fix/enrich 34K APRP (APSP) functionalities
References: <1337244680-29968-1-git-send-email-dczhu@mips.com> <1337244680-29968-2-git-send-email-dczhu@mips.com> <4FB4EF81.10005@phrozen.org> <4FB60403.3080700@mips.com> <4FB68FA2.1030404@phrozen.org> <alpine.LFD.2.00.1205202231400.3701@eddie.linux-mips.org> <4FB9B52F.908@mips.com> <alpine.LFD.2.00.1205212350070.3701@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.00.1205212350070.3701@eddie.linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: John Crispin <john@phrozen.org>, linux-mips@linux-mips.org, kevink@paralogos.com
Message-ID: <20120522070554.rIqtXxZyt6PFNf8Z4Pj45sQESF-uxBUd-sHwa04PHn0@z>

On 05/22/2012 07:17 AM, Maciej W. Rozycki wrote:
> On Mon, 21 May 2012, Deng-Cheng Zhu wrote:
>
>>>    What's so Malta-specific in the VPE loader anyway?  It's a CPU feature,
>>> not a board-specific one.
>>
>> Well, first off, for VPE loader itself, when it comes to CPS we have
>> vpe_run() that derives from amon_cpu_start() in arch/mips/mti-malta/malta-
>> amon.c. There is no implementation of amon_cpu_start() on other platforms.
>
>   Hmm, there's nothing platform-specific there, the file is pretty generic,
> it could be moved to arch/mips/kernel/ or thereabouts.  That applies to
> <asm/mips-boards/launch.h>  too, before you ask

Yeah, agree with you. I didn't do it simply because I'm not sure :)

> (you may want to use alloc_bootmem or suchlike instead of hardcoding the
> trampoline page, though it's probably pretty safe to assume the end of
> the exception handler page is available everywhere).

I'm not quite clear about this. Do you mean to bypass the arbitrary monitor
in vpe_run() (in other words, to directly bring up the vpe in vpe_run())?
Why do we need to worry about writing to the cpulaunch data?

>> Secondly, I suppose VPE loader works uniquely for APRP, and part of APRP
>> (such as IRQ related stuff) depends on platform code. So it makes sense
>> (IMO) to impose the dependency of APRP on the root (VPE loader).
>
>   Hmm, does it really?  It sounds wrong to me, it shouldn't use any
> hardware interrupts, and software interrupts again are available
> everywhere, at least on the MT processors now in existence.
>
>   There's nothing platform-specific referred to from arch/mips/kernel/vpe.c
> AFAICT (and I trust in Beth having got this piece right).  I reckon it
> used to work with CONFIG_MIPS_SIM too, though I could imagine the
> configuration got neglected a bit as it is somewhat unusual.

Oh, When I said IRQ related stuff I meant the interrupt specific changes in
rtlx.c (not vpe.c) which correspond to those in malta-int.c. They are
there to resolve some issues (Please refer to the code changes and added
comments in these 2 files in PATCH #1 and #2.).


Thanks for your review,

Deng-Cheng
