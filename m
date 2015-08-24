Received: from mailapp01.imgtec.com ([195.59.15.196]:8305 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011154AbbHXNCmFiUOr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 24 Aug 2015 15:02:42 +0200
Message-ID: <55DB15EB.3090109@imgtec.com>
Date: Mon, 24 Aug 2015 14:02:35 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] irqchip: irq-mips-gic: export gic_send_ipi
References: <1440419959-14315-1-git-send-email-qais.yousef@imgtec.com> <1440419959-14315-2-git-send-email-qais.yousef@imgtec.com> <alpine.DEB.2.11.1508241447100.3873@nanos>
In-Reply-To: <alpine.DEB.2.11.1508241447100.3873@nanos>
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
Cc: alsa-devel@alsa-project.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150824130235.UxDbsMPoyMp5WKvkLXOeW1fPi2G74zHA9ohZnW-s0Ms@z>

On 08/24/2015 01:49 PM, Thomas Gleixner wrote:
> On Mon, 24 Aug 2015, Qais Yousef wrote:
>
>> Some drivers might require to send ipi to other cores. So export it.
> Which IPIs do you need to send from a driver which are not exposed by
> the SMP functions already?

It's not an SMP IPI. We use GIC to exchange interrupts between AXD and 
the host system since AXD is another MIPS core in the cluster.

>> This will be used later by AXD driver.
> That smells fishy and it wants a proper explanation WHY and not just a
> sloppy statement that it will be used later. I can figure that out
> myself as exporting a function without using it does not make any sense.

Sorry for the terse explanation. As pointed above AXD uses GIC to send 
and receive interrupts to the host core. Without this change I can't 
compile the driver as a driver module because the symbol is not exported.

Does this make things clearer?

Thanks,
Qais

>
> Thanks,
>
> 	tglx
