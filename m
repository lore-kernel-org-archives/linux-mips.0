Received: from mailapp01.imgtec.com ([195.59.15.196]:65318 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991894AbcIMR3IosxwG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Sep 2016 19:29:08 +0200
Subject: Re: [PATCH] MIPS: Remove compact branch policy Kconfig entries
References: <20160912095806.4411-1-paul.burton@imgtec.com>
 <20160913124314.GA20655@linux-mips.org>
From: Paul Burton <paul.burton@imgtec.com>
Message-ID: <f65c041e-2a9a-804b-db6d-fd9b9cc27494@imgtec.com>
Date: Tue, 13 Sep 2016 18:27:10 +0100
MIME-Version: 1.0
In-Reply-To: <20160913124314.GA20655@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, "stable # v4 . 4+" <stable@vger.kernel.org>
Message-ID: <20160913172710.wKxLxFkKPpVv2PCHhUVQ1rM7mSonvIY_uEPuz6p06aw@z>

On 13/09/16 13:43, Ralf Baechle wrote:
> On Mon, Sep 12, 2016 at 10:58:06AM +0100, Paul Burton wrote:
> 
>> Fixing this by hiding the Kconfig entry behind another seems to be more
>> hassle than it's worth, as MIPSr6 & compact branches have been around
>> for a while now and if policy does need to be set for debug it can be
>> done easily enough with KCFLAGS. Therefore remove the compact branch
>> policy Kconfig entries & their handling in the Makefile.
> 
> I've applied your patch - and given where we are wrt. to R6 I think this
> simply and bulletproof solution is certainly the right thing.
> 
> But, have you considered probing for the option and only using it where
> it actually is available with something like:
> 
> cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_NEVER)   += $(call cc-option,-mcompact-branches=never)
> cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_OPTIMAL) += $(call cc-option,-mcompact-branches=optimal)
> cflags-$(CONFIG_MIPS_COMPACT_BRANCHES_ALWAYS)  += $(call cc-option,-mcompact-branches=always)
> 
> ?

Hi Ralf,

I believe that suggestion came up in discussion about an older patch,
but I think that might violate the principle of least surprise. ie. it
would mean you could set the policy to never in Kconfig, build a kernel
& it could contain compact branches.

> I'm also wondering how much we gain from -mcompact-branches?
> 
>   Ralf

Well, the default policy is "optimal" so we shouldn't gain much if
anything from tweaking it via Kconfig. Different CPUs/pipelines have
different gains, and the compiler should do something sensible for the
target CPU when the default optimal policy is set. This was always about
debugging, and KCFLAGS seems good enough for that especially since there
shouldn't be much to debug anymore.

Thanks,
    Paul
