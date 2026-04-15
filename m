Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C202A327204
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239620; cv=none; b=aXDmO+x8ZPtaL6aLNtZGPdAmMcZ8cZdKTv14uFqr+xt0ryLoD1ULsvAKLVw/nM56Iwqt64fE5irVV7A2umjBUTCVPRsJU97UEm6jGvtl8T3j2MNot1H/Wwaa6XrJ2k4pqNdF6x/OOk704ltTi6hKQADYTUDII5Lpq5Y2rZqBhJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239620; c=relaxed/simple;
	bh=q2C056FqlmUIJ6BLHjTfgmNWFBMiQJOXab4Qj9bsRzI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Eh7yf8lAzbqHxxJUF2hAOFEe4c4qyegIJsgE/fTc4oiPTMJMKb0u5Ws17CHBZI4Qa008VVtMfLABbq9QJoZlNlcHMXbo9GyW1CHHcaMe5zDfB7qWW9XzXXVuHFllRZcCs5yqf+0b7uQVlYeX4TEUu7J/kQnW39OgV+l0FRtdnSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZVeboF4t; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZVeboF4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776239609; x=1776498809;
	bh=NCDohSHfn8iMBL+0+u6mW/d3rjXnide8IngmBnYNVPE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ZVeboF4tqe54g7xJ2If8k0l6kjW59HfVbTOQk22TU/JRil53eTFylQG6Eus9P+PZq
	 CxMn2Wvi3Ti+LgVM2xp0fZu76dX8/xbHggk/+uOarB9UtdqjuWItaIDlqmz4h9iuG2
	 3RUcPy9vLGTOJydeGtRQNUtGJbcRDWX/abOnYZ6ric/be9EDevp77cvHbT5zmLlzGF
	 yOiqbLrWbCpYR8XQjpBNdi0aBtQJQtD9yuDYPZmiw+KUpe1Zy3PF2nx1JhJ2rZbeiJ
	 wAVHTjT2Fvr2LnYZYbZb7gGmsXqPNwRe/PefaOW8RmHOzf8dXa4Mr+RkS3A6u+aXfH
	 dGnpZjVIdgELw==
Date: Wed, 15 Apr 2026 07:53:24 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>
From: kpursoty@proton.me
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "cjd@cjdns.fr" <cjd@cjdns.fr>, "naseefkm@gmail.com" <naseefkm@gmail.com>
Subject: [PATCH v3 2/2] clocksource: timer-econet-en751221: fix IRQ ack storm on interrupt handler
Message-ID: <bshyYDAvwv9SWN7CjLfkE_DUQGLMssyTLFOlDYgGNi-nZGbqFC8sMbm8fP3I2q3Zwxb_5FFlCKqbt0kvs7x8Q3DqjDI675GUFYQF08-CoeQ=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: 3f70e11d36930ac9a8b6293ae0ee26a2dbcdbacb
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
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
---
v3: Add Tested-by from Caleb James DeLisle (tested on EN755221 hardware).
    No code changes since v2.

 drivers/clocksource/timer-econet-en751221.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksou=
rce/timer-econet-en751221.c
--- a/drivers/clocksource/timer-econet-en751221.c
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -68,6 +68,10 @@ static irqreturn_t cevt_interrupt(int irq, void *dev_id)
 =09if (!cevt_is_pending(cpu))
 =09=09return IRQ_NONE;

-=09iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+=09/*
+=09 * Ack: write a future value so count < compare, clearing the pending
+=09 * condition. set_next_event() will program the real deadline.
+=09 */
+=09iowrite32(U32_MAX, reg_compare(cpu));
 =09dev->event_handler(dev);
 =09return IRQ_HANDLED;
 }

