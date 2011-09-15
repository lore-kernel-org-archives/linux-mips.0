Received: from ixqw-mail-out.ixiacom.com ([66.77.12.12]:16884 "EHLO
        ixqw-mail-out.ixiacom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491029Ab1IOMBn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 15 Sep 2011 14:01:43 +0200
From: Cosmin Ratiu <cratiu@ixiacom.com>
Subject: Re: Octeon crash in virt_to_page(&core0_stack_variable)
Date: Thu, 15 Sep 2011 15:01:30 +0300
References: <201109091623.29000.cratiu@ixiacom.com> <4E6A45D9.6090706@cavium.com>
In-Reply-To: <4E6A45D9.6090706@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201109151501.30037.cratiu@ixiacom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Daney <david.daney@cavium.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20110915120130.M228Ef8ljM0tSVnMx_o1IRZgYEAed1c5g4T3WCZPpWA@z>

On Friday 09 September 2011 19:59:05 David Daney wrote:
> 
> > [ 2040.300/0] Call Trace:
> > [ 2040.300/0] [<ffffffffc123a054>] vcrash+0x54/0x80 [vcrash]
> > [ 2040.300/0] [<ffffffffc0065f28>] run_timer_softirq+0x198/0x23c
> > [ 2040.300/0] [<ffffffffc00609e0>] __do_softirq+0xd8/0x188
> 
>                    ^^^^^^^^^ CKSEG2 addresses detected!
> 
> You are using the out-of-tree mapped kernel patch which mucks about with
> the implementation of virt_to_phys().
> 
> Can you reproduce the TCP related crash in an unpatched kernel?
> 
> If not, then it would point to problems in the out-of-tree patches you
> have applied.

You are right, we use your mapped kernel patch.
I tried running without it, but it doesn't work due to external tools' 
assumptions.

I also looked over your patch, but I am not sufficiently familiar with mips to 
fully understand what's going on. Can you please point me to where exactly in 
the patch would the CKSEG2 addresses be translated to physical?

If you need any other information, let me know.

Cosmin.
