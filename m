Received: from foss.arm.com ([217.140.101.70]:53808 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23991359AbdBHORAcjEmQ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 8 Feb 2017 15:17:00 +0100
From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/1] irqchip/mips-gic: Fix local interrupts
In-Reply-To: <1485353305-23672-1-git-send-email-marcin.nowakowski@imgtec.com>
        (Marcin Nowakowski's message of "Wed, 25 Jan 2017 15:08:25 +0100")
References: <1485353305-23672-1-git-send-email-marcin.nowakowski@imgtec.com>
Date: Wed, 08 Feb 2017 14:16:45 +0000
Message-ID: <8737fo938y.fsf@on-the-bus.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <marc.zyngier@arm.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-mips@linux-mips.org
Message-ID: <20170208141645.rVZ8Yf06r7urBRzCDNvcRdylAd5QR2ZyEYlA9sLnBmM@z>

On Wed, Jan 25 2017 at  2:08:25 pm GMT, Marcin Nowakowski <marcin.nowakowski@imgtec.com> wrote:
> Some local interrupts are not initialised properly at the moment and
> cannot be used since the domain's alloc method is never called for them.
>
> This has been observed earlier and partially fixed in commit
> e875bd66dfb ("irqchip/mips-gic: Fix local interrupts"), but that change
> still relied on the interrupt to be requested by an external driver (eg.
> drivers/clocksource/mips-gic-timer.c).
>
> This does however not solve the issue for interrupts that are not
> referenced by any driver through the device tree and results in
> request_irq() calls returning -ENOSYS. It can be observed when attempting
> to use perf tool to access hardware performance counters.
>
> Fix this by explicitly calling irq_create_fwspec_mapping() for local
> interrupts.
>
> Fixes: e875bd66dfb ("irqchip/mips-gic: Fix local interrupts")
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: linux-mips@linux-mips.org

Queued, thanks.

	M.
-- 
Jazz is not dead, it just smell funny.
