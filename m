Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BAD32E6BD
	for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075164; cv=none; b=KlcIhjbpC17xe/qhwVqJMHO3+OgPAexYWo4lmI/Q5J4/A9L1Fb9UmxbbPleIJE8zy1aod6VOXjnGlJNHfK1TlCUh+wNAZPVxVwHu3rhGaxsp2TKVGQyxYe6Owrx5BBjnO0X9IA6NVBEwwBhs1yYzrTjl0BvmjS0UYK722XDLwpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075164; c=relaxed/simple;
	bh=+cuKA0hW3Mhr9Lot4t7cBlgy/y1kIy6F2PjJopYAO48=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YPmj67nOnIHxqLv0YPTV6HiQGMTde91c9aDRiL/9PAhjIg2WT41ka1e0J1EegNrh7Y6sPfatZiRfoAj+FGmqmmQoB+rqv5jmJ4ZKueHStjPn5jUBGSzt/ICQyK3MmyKllVfHFVQFMarl/4Px/ZmKQCT+QHkG20OZzzIWRIiVNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d8axNX3o; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d8axNX3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=msyqnjspobbr5dyzcxovkdo544.protonmail; t=1776075153; x=1776334353;
	bh=NmrqvvGaEVThyoyN9jeCoqltlCrUYhMEwPF+binc+Zg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d8axNX3o05ZtWgjoPrRi38aikJVQBzXNqOt45RUGSzGSOi4cNM5GDWnpDkNMfn/JQ
	 sq32UPoRCthMaL99ZBw+jAqR8UK4rQF/ObY+l50Ifi4le3gsuAkiLo430KMg9QJraI
	 9ySdd7lxAyNi6LMQug5/8nvBNbFObU1PMLLEuX1k+yVDMhwY92M2xfKodzze253Qp0
	 DIkXnQ5AY7UusubBsbI7Hyy6DGT05PVF4je/pnCYgLAbh5QdLLGtEcFn94bKCJfpka
	 2snu6aFm0zrXc3Z/WF9fORIOaj/CK2Ro9JMCq4AFdurq1xx+moXALKXooz/f1V7hkq
	 VA1YfAoY9Sqhg==
Date: Mon, 13 Apr 2026 10:12:30 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>
Subject: [PATCH 2/2] clocksource: timer-econet-en751221: fix IRQ ack storm on interrupt handler
Message-ID: <kukRFNz-gOs6wE_tlx8tRrsA1OIoT3LiP8OLLgIYZxFMvnh3ncsCuX037qaysPkg1KHBXkbwrU8CqUmmuxilvpTdK6TOEXRVKokk_Fi4WUs=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: b5f899b12000dd336f91f8f0c29112aae929059e
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The interrupt handler acked by writing the current count back to compare:

  iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));

Since the interrupt fires when count >=3D compare, and the counter advances
past the written value before the MMIO write reaches the peripheral, the
condition re-asserts on the same bus cycle. This causes a tight IRQ storm
on CPU0, stalling boot at T=3D62s (measured: boot never progresses past
clockevents registration).

The EcoNet GPL kernel (arch/mips/econet/time2.c, cputmr_timer_ack()) acks
by writing the *next* deadline, which puts count < compare and clears the
pending condition. Write U32_MAX (unreachable before set_next_event()
programs the real deadline), consistent with cevt_dev_init() which also
writes U32_MAX to park the compare register at init.

Fixes: 3b4c33ac87d0 ("clocksource/drivers: Add EcoNet Timer HPT driver")
Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
---
 drivers/clocksource/timer-econet-en751221.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksou=
rce/timer-econet-en751221.c
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -68,7 +68,9 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
 =09if (!cevt_is_pending(cpu))
 =09=09return IRQ_NONE;

-=09iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+=09/* Ack: write a future value so count < compare, clearing the pending
+=09 * condition. set_next_event() will program the real deadline. */
+=09iowrite32(U32_MAX, reg_compare(cpu));
 =09dev->event_handler(dev);
 =09return IRQ_HANDLED;
 }

