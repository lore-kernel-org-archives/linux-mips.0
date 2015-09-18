Received: from mailapp01.imgtec.com ([195.59.15.196]:57126 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008679AbbIRVF6ctAtD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Sep 2015 23:05:58 +0200
Date: Fri, 18 Sep 2015 14:05:49 -0700
From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Message-ID: <20150918210549.GD16992@NP-P-BURTON>
References: <20150803150401.GD2843@linux-mips.org>
 <55FA7BA0.4080706@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <55FA7BA0.4080706@samsung.com>
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
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Markos Chandras <markos.chandras@imgtec.com>, linux-leds@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150918210549.KDJ9zBQtf47OPZOLrzR87N7jp59z24YHuOR238hYkWk@z>

On Thu, Sep 17, 2015 at 10:36:48AM +0200, Jacek Anaszewski wrote:
> Hi Ralf,
> 
> This patch got stuck somewhere in my mailbox and just
> recently showed up to my eyes again, so I applied it to v4.3-rc1, but when
> tried to compile-test it, I got following errors:
> 
> arch/mips/kernel/signal.c: In function 'sc_to_extcontext':
> arch/mips/kernel/signal.c:143:12: error: 'struct ucontext' has no member
> named 'uc_extcontext'
>   return &uc->uc_extcontext;
>             ^

<snip...>

> Compilation succeeds with v4.2-rc8.
> Is it a known issue?

Hi Jacek,

The patches adding the MSA extended context added a MIPS-specific
ucontext.h, where we were previously were using the generic one. Kbuild
doesn't automatically remove the old generated header that includes the
generic version, so could you try either cleaning your working tree or
removing arch/mips/include/generated and trying again?

Thanks,
    Paul
