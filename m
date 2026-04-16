Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EE5CDF1;
	Thu, 16 Apr 2026 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324005; cv=none; b=VjOTh8UhfmBjP1B9jzd7kmjPsXVdmRyofqAsV7SZxxCw/z1xPkrsi/EVT1dBAlOaGZMeNSb7KPp8oEFqJg8h4mw2H8kYiaYUMKNJu6S8l3fViugTfVOpY0/E3k7nVL3gTD3j5X82ynKrhVTMUtRSmwU4CFdqqpueLFsiHR3qqqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324005; c=relaxed/simple;
	bh=4RMoQb+nvPE8+a9GKMn9FL3ygNpRPlnnihjdG7lKj68=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ockekU/qkSmmBY23J+ugbM8Gu9ORk+Q5/dCKksxx9sK+c3fKilG/wXnDZXDOStpziUPK+DAeue2dW1nsKqS7d1pzCXqbwb1IjmTIrI9Hg5F9SukvzOjHcL0YW0mgmb+cGQAeJ12OOOCAexQ9QImSV5f/FOzVoQK6HYxYSHzXYEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=jJ1S5QkD; arc=none smtp.client-ip=79.135.106.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="jJ1S5QkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gh6ztbdmqnaxpd5jbe3hd57r3q.protonmail; t=1776323993; x=1776583193;
	bh=/Sf7eVX+homeFYGQbr8CU8dy2SpQQwFS6pXmduHoPD4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jJ1S5QkD68x4fju6AsMqJCscGIG+/sKInzH7vipLJGHB+zI/VwkHR0OxdwuSu+3mq
	 BsuQ5nwfLw2m4BtERxJm9AwvgmGuna6xr2WywSMCBx7/6dKt9f8GuRrkpb1UsYL9Xu
	 Cq36xei6WIrLvr8nEQjQpYKxg6HtA94FJoi3R4QrkdYCi8IBC3uPo5fCOUjXldcpXM
	 94X8ioDS6NGQZdFS66/eIUUuoH33rROrfpB9hmd9397b3pcVNlR520Qox4NJ26pm5m
	 7hmxbDsCcai6mHkMWGyMzGGEUg1FF2S49Mfhdp6atJzUbmMMceYXnB/LyvDBqBvVsx
	 qPPgbABq4e20Q==
Date: Thu, 16 Apr 2026 07:19:50 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>, "naseefkm@gmail.com" <naseefkm@gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource: timer-econet-en751221: fix IRQ ack storm on interrupt handler
Message-ID: <Ws8LqFgc1zMofsKAK9_Zn_EHeLpLjhdGqjHj7v4tshaQmNA9vlhdjWS5gQ-MbC0VNVYAwrlIbYhWPDoTt7_7jayaL3GOOYCahsMp4mdI94c=@proton.me>
In-Reply-To: <bshyYDAvwv9SWN7CjLfkE_DUQGLMssyTLFOlDYgGNi-nZGbqFC8sMbm8fP3I2q3Zwxb_5FFlCKqbt0kvs7x8Q3DqjDI675GUFYQF08-CoeQ=@proton.me>
References: <bshyYDAvwv9SWN7CjLfkE_DUQGLMssyTLFOlDYgGNi-nZGbqFC8sMbm8fP3I2q3Zwxb_5FFlCKqbt0kvs7x8Q3DqjDI675GUFYQF08-CoeQ=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: 04c423007bd8e7b0383fe33f07e05fc8a1d56b6d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for your notes. Patch withdrawn.

On Wednesday, 15 April 2026 at 08:53, kpursoty@proton.me <kpursoty@proton.m=
e> wrote:

> The interrupt handler acked by writing the current count back to compare:
>
>   iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
>
> Since the interrupt fires when count >=3D compare, and the counter advanc=
es
> past the written value before the MMIO write reaches the peripheral, the
> condition re-asserts on the same bus cycle. This causes a tight IRQ storm
> on CPU0, stalling boot at T=3D62s (measured: boot never progresses past
> clockevents registration).
>
> The EcoNet GPL kernel (arch/mips/econet/time2.c, cputmr_timer_ack()) acks
> by writing the *next* deadline, which puts count < compare and clears the
> pending condition. Write U32_MAX (unreachable before set_next_event()
> programs the real deadline), consistent with cevt_dev_init() which also
> writes U32_MAX to park the compare register at init.
>
> Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
> Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
> Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> v3: Add Tested-by from Caleb James DeLisle (tested on EN755221 hardware).
>     No code changes since v2.
>
>  drivers/clocksource/timer-econet-en751221.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocks=
ource/timer-econet-en751221.c
> --- a/drivers/clocksource/timer-econet-en751221.c
> +++ b/drivers/clocksource/timer-econet-en751221.c
> @@ -68,6 +68,10 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_i=
d)
>  =09if (!cevt_is_pending(cpu))
>  =09=09return IRQ_NONE;
>
> -=09iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
> +=09/*
> +=09 * Ack: write a future value so count < compare, clearing the pending
> +=09 * condition. set_next_event() will program the real deadline.
> +=09 */
> +=09iowrite32(U32_MAX, reg_compare(cpu));
>  =09dev->event_handler(dev);
>  =09return IRQ_HANDLED;
>  }
>
