Received: from mailapp01.imgtec.com ([195.59.15.196]:32227 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013925AbbKQKa4TSEo- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Nov 2015 11:30:56 +0100
Subject: Re: [PATCH 10/14] irqchip/mips-gic: Add a IPI hierarchy domain
References: <1446549181-31788-1-git-send-email-qais.yousef@imgtec.com>
 <1446549181-31788-11-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1511071323471.4032@nanos> <56407F3C.4060404@imgtec.com>
 <alpine.DEB.2.11.1511161610070.3761@nanos> <564AFC9A.9080505@imgtec.com>
 <alpine.DEB.2.11.1511171108500.3761@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <564B01D8.2090000@imgtec.com>
Date: Tue, 17 Nov 2015 10:30:48 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1511171108500.3761@nanos>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20151117103048.FnyfeAptsFfx8CQs2Ri-dKskmpI3Lf5wsDuXQ_3Bqoo@z>

On 11/17/2015 10:11 AM, Thomas Gleixner wrote:
> Right, I was assuming a consecutive available space and your hardware
> folks should really avoid to break that assumption.
>
> Now you still need some DT support to describe the space which is
> available for IPIs and that should be part of that series.


It's a simple change that shouldn't be a problem adding it to this 
series. I just wanted to avoid having to take more acks from more 
maintainers for this series to go in. But if it's needed, then it is 
what it is.

Maybe I'm better off sending this change separately actually as it's 
independent from other changes and could be merged in first.

> Thanks for being patient and persistant on that!

Thanks a lot for your help and patience too!

Qais
