Received: from mail.windriver.com ([147.11.1.11]:39697 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1903657Ab2CFTUq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Mar 2012 20:20:46 +0100
Message-ID: <4F566384.5050501@windriver.com>
Date: Tue, 6 Mar 2012 14:20:36 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] MIPS: module.h usage cleanup.
References: <1330457088-14587-1-git-send-email-paul.gortmaker@windriver.com> <20120306190826.GJ4519@linux-mips.org>
In-Reply-To: <20120306190826.GJ4519@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20120306192036.yAkEXh3XYX7lC3e5YcbSYXOEeQOhlTtYtaiKB9mZTeo@z>

On 12-03-06 02:08 PM, Ralf Baechle wrote:
> On Tue, Feb 28, 2012 at 02:24:43PM -0500, Paul Gortmaker wrote:
> 
>> Hi Ralf,
>>
>> Not a lot to see here, really.  MIPS had usages of module.h tucked
>> away in a couple asm files, and that was masking some of the other
>> implicit users, plus preventing MIPS from getting the full benefit
>> of not having to feed module.h to cpp 35,000 times.
>>
>> I've left the two drivers/serial commits separate, in case there
>> is a desire to have them go in via Greg's trees, but they are a
>> required dependency for the arch/mips fixes, so I think it makes
>> sense they stay together with the other changes here.
>>
>> I will have some arch independent module.h cleanups (in fs and lib)
>> that will require me to create a module.h tree for 3.4, so I can
>> carry this there if required.  But this lot is all self-contained
>> to MIPS and so I'd be fine with (and actually prefer) this going in
>> via the MIPS tree.  No strong preference - either way, let me know.
> 
> Haven't received any comment and the patches are trivial so I'm going
> to queue them hopeing that Alan Cox (not on cc ...) doesn't mind ...

I stuck them in linux-next for additional sanity testing above the
defconfig builds that I did and nothing caught fire.  I'll back
them out from my for-next branch now that I know you've got them queued
via the mips for-next.

Thanks!
Paul.

> 
>   Ralf
