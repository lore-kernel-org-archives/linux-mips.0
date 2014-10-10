Received: from mailapp01.imgtec.com ([195.59.15.196]:43053 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010941AbaJJOkeJcm8M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Oct 2014 16:40:34 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 96C144EBA947D
        for <linux-mips@linux-mips.org>; Fri, 10 Oct 2014 15:40:24 +0100 (IST)
Message-ID: <5437EFDA.4060709@imgtec.com>
Date: Fri, 10 Oct 2014 15:40:26 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH V2] MIPS: fix build with binutils 2.24.51+
References: <1408465632-34262-1-git-send-email-manuel.lauss@gmail.com> <20140825125107.GA25892@linux-mips.org> <alpine.LFD.2.11.1408251502140.18483@eddie.linux-mips.org> <CAOLZvyG4F_PCb5hbws1_e8nCeJ+odvnC5u=yitSe9CwY3TWZdw@mail.gmail.com> <5437EFB7.2020106@imgtec.com>
In-Reply-To: <5437EFB7.2020106@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
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
To: linux-mips@linux-mips.org
Message-ID: <20141010144026.RCzbsF9FP1oUE7rHfOaSNsO6o5fiVY_BCh6okhDz_vY@z>

On 10/10/2014 03:39 PM, Markos Chandras wrote:
> On 08/25/2014 08:29 PM, Manuel Lauss wrote:
>> On Mon, Aug 25, 2014 at 4:27 PM, Maciej W. Rozycki <macro@linux-mips.org> wrote:
>>
>>> 1. Determine whether `-Wa,-msoft-float' and `.set hardfloat' are available
>>>    (a single check will do, they were added to GAS both at the same time)
>>>    and only enable them if supported by binutils being used to build the
>>>    kernel, e.g. (for the `.set' part):
>>>
>>> #ifdef GAS_HAS_SET_HARDFLOAT
>>> #define SET_HARDFLOAT .set      hardfloat
>>> #else
>>> #define SET_HARDFLOAT
>>> #endif
>>>
>>>    Otherwise we'd have to bump the binutils requirement up to 2.19; this
>>
>> Do people really update their toolchain so rarely?
>>
>>
>>> 2. Use `.set hardfloat' only around the places that really require it,
>>>    i.e.:
>>>
>>>         .set    push
>>>         SET_HARDFLOAT
>>> # Do the FP stuff.
>>>         .set    pop
>>>
>>>    (so the arch/mips/kernel/r4k_fpu.S piece is good except for maybe using
>>>    a macro, depending on the outcome of #1 above, but the other ones are
>>>    not).
>>
>> I'll update the patch.
>>
>> Thank you!
>>         Manuel
>>
> Hi Manual,
> 
> Just wanted to ping you about this patch. Do you intend to submit a new
> version including all the feedback from Ralf, Maciej and Matthew?
> 

s/Manual/Manuel/ :)

sorry about that

-- 
markos
