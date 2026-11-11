Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794370147;
	b=MVlICaATS6S6yZnf8obJM/gS4fRaJMp8vVgPJBUpfrR+cDAcKKncSI2ixk/lnXEoUmTk
	 sHszT9xEEZ5mfb9naQyitjLuEJo0PPfUS0PnQnCqZ7CtANX2+e2Rn0QVYVrpamxtapaL2
	 3vvsfCmwIa11aSOygVRZ77oJnh66oXeueezjbPEvCZCv2YaXYGADCGi1L9Xh9NOf1hCLy
	 hJrdFs7hTD9e34E52vKYD+WJpGDTliC8gA+ycjfVcbmcZoUZPM5M/tk0jiiZmU+eenr5J
	 vZqX1DaZUmbrWXa+sA3mC6V+CcE3rrsu5Jz3qQb13BLzIi8l5l5SJ8CFqhGqeYSr5zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370147;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PsDgrxkXPiqjiEztk1kKnzx1+PxCAUEjUyDWrmhcWY4=;
	b=1lu43ne3llC8cXuGYCOyzHh0q2XqEMNq6YTIy0GCo/IyJ2gZ65y5+5pJTQrAMwq5OZ+k
	 ERt/Lz0L+4KbUZtYQXpW8PGN6amgc+0cvkztQ0xutvhNzS1Hmz353yrCp0JDB4KQf8PzM
	 r5RnE0VHOAfU7kciX5XzWGMMxUN748CionsC9He5w9+5Hz9bbpQ3eUJTnXDeKvMLnWzp3
	 Ab8TLNVEnFqhdjfnAPbJqSrEl2FYe4Iv1KDGw9mySyHKF5UArxznocG3byCemg25yTDTp
	 LqnS1Zlj3unuHXEyIlVxMeeITr5u5JyIKKvSBGd7GW59cTfpvLEb9tlxR+I4aKXIv4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TezoHI7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6737606A321;
	Wed, 11 Nov 2026 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TezoHI7d
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794370147;
	b=R2CnwztBjOtWpbz0ho1gf4SF1JfDtDZ+RSWT2neFLiRu+Xyo1Xlf9xBTDd/XJr+bHJ8u
	 meGHDyHG+x+kE4Vq/rf5uYQVF09l17s3IneyS7cvQT3MsU2MJphHpC83LQB7mm/qISOKT
	 Ra13XYhoUEg+MYgUefG7X8OoXmEhPqsvE6yVqfvYHZkQUU3O8Xkej4K7fq4sOGHJ4VThS
	 qUgh0tpsWuzjGy9mctRQM8i2Ts2g/e2O8wC51sCpyTm3NCBsmV4okYQKt2jEn9OUQiw9y
	 5Ujx4tcLaHaBgFwdzVak28AfXgoWbalqg7Nio8Y5JZjPnPVL2rBDYuyfvtBVQeWxBpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794370147;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=PsDgrxkXPiqjiEztk1kKnzx1+PxCAUEjUyDWrmhcWY4=;
	b=xYYxXyyo0GQrfdGpOB3HeABt2tO+BpfkCFS835+3F6mbBZepzBdnmkgKqs+Mts/yhsej
	 zw0H/+CG9OswDnLRm42FbAaY0vAG9Oq/e+5AUyCv4j/F/73+MkZtpiA7h3d4VfMphExQ0
	 4AatdFWJPDTEnTTR20Se8o0QX2lKOuuUK1yJJiNyWY7khoY/pv2K0soNOQbrTVhWuT9J2
	 wCzpsAWIn8+fMsX726mEiW2zJCBE6bylaxPkOxTno6tL3KYrBX26eiucFEnduhwfuW2J4
	 IZTx62DtmKfjy85C6xUPgbIPTH/C3Smz/OYaQF+8RWjf3A6HYV1l792rSv5YF5n++hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF2DB1F0089F;
	Wed, 11 Nov 2026 04:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794370147;
	bh=PsDgrxkXPiqjiEztk1kKnzx1+PxCAUEjUyDWrmhcWY4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TezoHI7d2j/0+w6aS2BBO5HQcektIzRx3mmH99xKSNFF/lqHTS+89OyRYGz7KSRtQ
	 /HbH5L5zDmCfskJSRiuYExrasto9rFQuySDehfiBBFfQhAOzNzT5apafCQETiNOaT6
	 fYujMS0R0WUqlwophIW8Zc3s0Q9Ct+GbUZmxJywjTnr0fcXMQSmsVDOeuIG7Y5gosM
	 inxEwwRitrgtqZZG0Ilcm4EG9nYg9CMarEL9FV+xd2+E8QWIedpXPTBkpgFsjUw1xM
	 4SQO57IQYw/aKozcgAqt7VV5ebF3UQojK2BVGh4IlieWw7Qkv2fIW8EoKiSJ9giPko
	 PtEehs3QJq1mQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0CF8548D5F;
	Wed, 11 Nov 2026 04:09:06 +0000 (UTC)
From: Hunter Laux via B4 Relay <devnull+hunterlaux.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 21:09:03 -0700
Subject: [PATCH] MIPS: ingenic: Let Config.VI tell whether the icache is
 virtual
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-mips-xburst-icache-vi-v1-1-efba689606dd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF7q82oC/x3MPQqAMAxA4atIZgONgohXEYfaRM3gD42KULy7x
 fEb3ktgElUMuiJBlFtN9y2DygLC4rdZUDkbKlc1RORw1cPwGa9oJ2rwYRG8FXkk51t2NXMDuT2
 iTPr833543w+ofuiIZwAAAA==
To: Paul Cercueil <paul@crapouillou.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lars-Peter Clausen <lars@metafoo.de>, Hunter Laux <hunterlaux@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794370145; l=2681;
 i=hunterlaux@gmail.com; s=20261109; h=from:subject:message-id;
 bh=cXFr6wRPxVPgKvzA/Ve7zSz/KJTDwuu+N1xApA/N3xY=;
 b=UKlZ8oi6sWqvZJ0m3xZeRfzwO8CcyCPNgl6B2IiUpljtQGdiBROaXejpdWeYKhZKvsPCgwTZl
 uovwasrpm1wDmmpxs++CRRWRW1mguTLQ7oPxp8YAZeAAvOUpqYo7Rvp
X-Developer-Key: i=hunterlaux@gmail.com; a=ed25519;
 pk=Z5VTsE4CAwditt0CNeG+rpPk7xDUVh+oHWDZlNNm8FI=
X-Endpoint-Received: by B4 Relay for hunterlaux@gmail.com/20261109 with
 auth_id=1476
X-Original-From: Hunter Laux <hunterlaux@gmail.com>
Reply-To: hunterlaux@gmail.com
Content-Transfer-Encoding: 8bit

From: Hunter Laux <hunterlaux@gmail.com>

The Ingenic CPU support treats every XBurst instruction cache as
virtually tagged: the feature overrides fix cpu_has_vtag_icache to 1,
and the probe sets MIPS_CACHE_VTAG. The setting came in with the JZ4740
feature overrides in commit 83ccf69d8f11 ("MIPS: JZ4740: Add base
support for Ingenic JZ4740 System-on-a-Chip") without a stated reason,
and Ingenic's own kernels treat the icache as physically tagged.

Neither XBurst1 nor XBurst II has a virtually tagged icache. Both
programming manuals describe a physically tagged one and hardwire
Config.VI to 0, which the cache probe already reads. On the X2600, code
at a virtual address remapped to another page through the TLB alone
runs the new page, while the old line is still in the icache. XBurst1
has not been tested. Treating the icache as virtually tagged is
incorrect and costs needless icache flushes.

Drop both and leave it to Config.VI.

Cc: Lars-Peter Clausen <lars@metafoo.de>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
---
Lars, the override came with your JZ4740 support in 2010. On the off
chance you remember a reason for setting cpu_has_vtag_icache to 1,
I'd like to hear it.
---
 arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h | 1 -
 arch/mips/kernel/cpu-probe.c                               | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
index 7ace50127f..71c03f1dd4 100644
--- a/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h
@@ -27,7 +27,6 @@
 #define cpu_has_mips3d 0
 #define cpu_has_smartmips 0
 #define kernel_uses_llsc	1
-#define cpu_has_vtag_icache	1
 #define cpu_has_dc_aliases	0
 #define cpu_has_ic_fills_f_dc	0
 #define cpu_has_pindexed_dcache 0
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d..bef92e6cd6 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1763,9 +1763,6 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	c->options &= ~MIPS_CPU_COUNTER;
 	BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
 
-	/* XBurst has virtually tagged icache */
-	c->icache.flags |= MIPS_CACHE_VTAG;
-
 	switch (c->processor_id & PRID_IMP_MASK) {
 
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-mips-xburst-icache-vi-db10a8d03dd6

Best regards,
-- 
Hunter Laux <hunterlaux@gmail.com>


