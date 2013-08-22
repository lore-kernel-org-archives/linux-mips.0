Received: from mms3.broadcom.com ([216.31.210.19]:1066 "EHLO mms3.broadcom.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6853184Ab3HVAn3tTQQx convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Aug 2013 02:43:29 +0200
From: "Sherman Yin" <syin@broadcom.com>
Subject: RE: [PATCH] pinctrl: Pass all configs to driver on
 pin_config_set()
Date: Thu, 22 Aug 2013 00:43:10 +0000
Message-ID: <051069C10411E24D9749790C498526FA1BDD9D27@SJEXCHMB12.corp.ad.broadcom.com>
References: <1376606573-15093-1-git-send-email-syin@broadcom.com>
 <CACRpkdaUacAbLd+i4Y=DXv=aSaUwBSz6-icPV9SVjxZkUjheww@mail.gmail.com>
In-Reply-To: <CACRpkdaUacAbLd+i4Y=DXv=aSaUwBSz6-icPV9SVjxZkUjheww@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-Path: <syin@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "matt.porter@linaro.org" <matt.porter@linaro.org>, Christian Daudt <csd@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, James Hogan <james.hogan@imgtec.com>
Message-ID: <20130822004310.NCgy_c0W63oz6vgpb1QEVBZP0pHY_P5t6LmuRO1NrN4@z>

Hi Linus,

>Right now this does not apply to my "devel" branch, so I'd like you
>to rebase on that right now. (This is what will go into v3.12).
>
>This is also late in the development cycle so I believe this is going to
>be v3.13 material unless there are more release candidates.
>
>You can also hold on until after the v3.12 merge window and then
>rebase it and we'll merge it as a first patch in the v3.13 development
>cycle.
>
>What do you say?

You mean the "devel" branch in this tree, right?  Please let me know 
if you're talking about another tree/branch.

git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git

I cherry-picked my commit on top of devel, and there was just a simple
conflict in pinctrl-sunxi.c.  It's easy enough to fix, so I'll send out v2 
that's based on "devel" instead of rc6 anyway.  I can just do another
rebase after v3.12 merge window if needed. 

Thanks!
Sherman
