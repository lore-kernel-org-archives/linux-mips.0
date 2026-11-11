Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430079;
	b=vMKro22gBVPb3DVF6zD1udnw5eqAf545rQSzoyKY817qx1EAgDw0ddH6zly7NIr1LLB4
	 4crGh5OX5ccHD4ZD8P7TOqrxuxuYgAvRRq6diX4SuFitIDLSe5Aip8iXyi5GqKQB58nIL
	 AzzCiVEzP0H/0zYZa5+G95jRgsSrDQDxoriPCyirKZZYNgR6JCtsm3tyucJpq++F5tI7U
	 yz7SJoj6pwHot2y877/qhd0Mmo5vZGnRyiOG97lkmmgnZoMNRvqSuKDUn6CY8rZ+qI/jL
	 b07XMUemyGCJLnjFos8fpng2Oupc8qFPTtAzePhC/cKDR0LlojIs5s7nZnDcXjWwUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FBve0q5RsMt0tuOsSSuYRtfgKdHBNbRkQQlqWhy08ic=;
	b=vAHVZuIpA70yoh6jDVJg+KW8Jg9ouM58wRQ23vAtv3weQR9s/sxAFEjZ2fCkhwCTsc9o
	 jdLKcWskKZNGsdBgsx4lCUVeGLWTqDYXjC+yOXoNQP4udsbI4gdmv7E85PhK+KNEx6nNF
	 bMZ3gLMN2FCR53nPB42LbFgSWbFc33JvWNBx7uFzxr0qeyIiQ66yutg3lHnqTYGASenYO
	 ZYY1c+XFeVtWQmUVX6FlXrIkmSbYzYSAmy/70Ar/Oe+PqA9smmQ2pj97OxJAVfXzvJqpn
	 LCgFZOzJ0d40Vpc1C8KUyQt+7Dydgzv3baGMnqquI03Z8XO39PA+QuLlqwbUjrqJRDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjk11Zji;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD2606A31C
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 20:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjk11Zji
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so4791573c88.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 12:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430078; x=1795034878; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FBve0q5RsMt0tuOsSSuYRtfgKdHBNbRkQQlqWhy08ic=;
        b=tjk11Zji+duBbyhWU2BAujfuUXoTJ+WMfauewxmQg7/8cJu9rYl8cLCWGY5hahEL+7
         31Q2AjrzCRGdvHkQgnBT4YCqIHHDDdoYiRil0UQFfWuoOxOkt2otPPrPiFYE3tpLxHKU
         AOijL/KVR8iKA7crrhH/rGTsW/njiAyLqC3OjY3BfoR2IwLW4CLW2NWfxrq3x3ZoTKIk
         0Cd/tYUFB/rWwPxRdriVmh6MLSnSg+iQos89j489HeYJySzW472TDqd2XgpiYyJAfzb1
         WZT1JgwEVNmxhS1QfTLp8dZFSY73Pb7skBJAbbk4hbElut9q/uGKx+wETozzoIR0GhEC
         QTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430078; x=1795034878;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FBve0q5RsMt0tuOsSSuYRtfgKdHBNbRkQQlqWhy08ic=;
        b=XhVK1HGtN/lT6jDDFLPLNLe+lp9xruEQ098Z+3uD+LC2ugU7Loyaa9KJH0jTElNZbb
         U7UPUDl5EaupU8dBE7oyEtI4UexonYS4HxzVYw8nmH65mFcsbfu7ujSxrjkLSB6c0Bd+
         UryLZt5Ah0qDKA3PLM8rzt3wjVas3+uRt/OQkEMP7NT9dyg+3nDUJt1cwmB+/GKwShEL
         3iDjFM0PyLyp3GMeQKmoBAn06fS6NKJ/i4qkjxouMQ+ABCUlC5X0xTR99ODLYG/Kmh5x
         PkRp62JsiIoXs72VI/0gu/WNGmkaa145/GGqKK9gmIyHCLZnWexdPCMPMBFyz61jMYkj
         Ndcw==
X-Gm-Message-State: APuU4Z9WZ9Rd/y6STiB8Ohb+uQOe+1bQG+uI+yu9kHv5PeGVNHIzXzD5
	DSubalxTS85+TB886NQ3oLulGVN7o2N1RTv5yNkQmGIXrcys+oTJUk36x6D/EwVMsrE=
X-Gm-Gg: AYBFou2BbtiwGvSkYiqa8vCBdN5l66ttsXzdvsbW4ecwfMPK9hrq6UTM7YdysgjlVM6
	D5LDJ9jrtmx6UWzT0jlEf5SdUBKMQHYpc/AZZ4OF+0L1RqwRp6OR5wUS8ZgCiRUdrwGH9yGEesb
	vUDoOZVU/kU+rTobSQjRU5DGy7QBlYZfVy3a4yGXGF13jHxDuY6aymrpr1DNkLRJUXB/CM43Prb
	W2Ly3BhCVth/EPAdqL3UlHEl1cyuutSjQU5iFZYVEaE+Y89EeOhKf6cJAT8TBeaJ5kAfNuDtPdm
	UHpJLhT/qtTYvucVflX6cJeW0nhKdyh5B/D1DBFehBlgKYh5W4j2eD27cRY1yrT5YaRQesySxbP
	0knfg5pAPjwAjaDChij4Y+GXsLUfA3eqLX4TCHVjgVLnjobEhZqfzJFNlhE0m8/nPoaZ1cm7BRG
	qEpEE3BMrv/WeJZEyPFGCJzF06QCfW6+gZ3LrxylPqe0qoMdzKbLaQN0CKQgCaUiAUpww1Di54G
	xGlVHnD6LUWDa9LohGSZykLAkCllHFyAhQi1rWJ49IAcc/iLZzQ6GwhTZ3nFLjitJwDtsRay7/q
	y7dHydYw86T1IwjETTc8pAp9/0nzOYjdPlPnpNBHgUxtN4VtH1g/YoZ+0UekYfnSqNc05YPazTF
	+n65+
X-Received: by 2002:a05:701b:4349:b0:144:eb46:be0 with SMTP id a92af1059eb24-1b3c033451dmr3326215c88.13.1794430078157;
        Wed, 11 Nov 2026 12:47:58 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm18469021c88.2.2026.11.11.12.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:47:57 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
Date: Wed, 11 Nov 2026 13:47:58 -0700
Subject: [PATCH] MIPS: ingenic: Work around stale L2 data after DMA on
 XBurst II
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-mips-ingenic-l2-war-v1-1-0d9dec232a7a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH3U9GoC/x2MSwqAMAwFryJZG6j1i1cRF1ajBrSWFlQovbvB2
 Q3DexECeaYAfRbB082BLytS5BnM+2Q3Ql7EQSvdFAKe7AKyBMszHhqfyeOqyJRUtWVtOpCl87T
 y+78OY0ofzheCZWUAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hunter Laux <hunterlaux@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794430077; l=3270;
 i=hunterlaux@gmail.com; s=20261109; h=from:subject:message-id;
 bh=67LE0kGufq3au4XmWv1z0ZrUAGrmejn8GG09kq5SEfg=;
 b=xCHTSsmMUgPp4K3sd0mSo/bVuFVGxFVdG0sDg/ZVkqV/qrKCBWF7JY74GxAtWojmUMciCbScf
 pGJ9gR7JcwmCHiXUdbbcPL0C+q/hBv77y+m2k6uLvu1spqbAUQP7HRc
X-Developer-Key: i=hunterlaux@gmail.com; a=ed25519;
 pk=Z5VTsE4CAwditt0CNeG+rpPk7xDUVh+oHWDZlNNm8FI=

On XBurst II, with the L2-to-DDR prefetcher enabled, invalidating the
L2 with Hit CACHE operations can leave stale data there: a buffer read
after a device has written to it returns what it held before the
transfer, although it is invalidated before and after the DMA.

The RTL8821CU USB Wi-Fi driver, rtw88, shows it in its register reads,
which go through 4-byte buffers: about one read in 500 is stale with
the driver's buffers, and one in 12 when each buffer starts its own L2
line. None are with the L2-to-DDR prefetcher turned off (CCU
MSCR.DisPFB2), or with a load from an uncached address before the L2
is invalidated, which Ingenic's kernels issue: none in 20000 reads
over 4 boots.

Add that load to mips_sc_inv() under a WAR_INGENIC_L2_HIT_CACHEOP
option, on XBurst II only.

Cc: Paul Cercueil <paul@crapouillou.net>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
---
No XBurst II SoC is in mainline yet; this came up on the X2600, whose
support I'm preparing.
---
 arch/mips/Kconfig      | 9 +++++++++
 arch/mips/mm/sc-mips.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index dac3ec5120..fd438b52fd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -131,6 +131,7 @@ config MACH_INGENIC
 	select USE_OF
 	select CPU_SUPPORTS_CPUFREQ
 	select MIPS_EXTERNAL_TIMER
+	select WAR_INGENIC_L2_HIT_CACHEOP
 
 menu "Machine selection"
 
@@ -2524,6 +2525,14 @@ config WAR_R4600_V1_HIT_CACHEOP
 config WAR_R4600_V2_HIT_CACHEOP
 	bool
 
+# Ingenic XBurst II: with the L2-to-DDR prefetcher enabled, invalidating
+# the L2 with Hit CACHE operations can leave stale data there, so that a
+# buffer read after DMA returns what it held before the transfer.  A load
+# from an uncached address before the operations avoids it.  Only XBurst II
+# CPUs run it: XBurst1 shares the platform code but not the prefetcher.
+config WAR_INGENIC_L2_HIT_CACHEOP
+	bool
+
 # From TX49/H2 manual: "If the instruction (i.e. CACHE) is issued for
 # the line which this instruction itself exists, the following
 # operation is not guaranteed."
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 06ec304ad4..41ad4905e5 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -21,6 +21,14 @@
  * MIPS32/MIPS64 L2 cache handling
  */
 
+static inline void mips_sc_hit_cacheop_war(void)
+{
+	if (IS_ENABLED(CONFIG_WAR_INGENIC_L2_HIT_CACHEOP) &&
+	    current_cpu_type() == CPU_XBURST &&
+	    (current_cpu_data.processor_id & PRID_IMP_MASK) == PRID_IMP_XBURST2)
+		__fast_iob();
+}
+
 /*
  * Writeback and invalidate the secondary cache before DMA.
  */
@@ -37,6 +45,7 @@ static void mips_sc_inv(unsigned long addr, unsigned long size)
 	unsigned long lsize = cpu_scache_line_size();
 	unsigned long almask = ~(lsize - 1);
 
+	mips_sc_hit_cacheop_war();
 	cache_op(Hit_Writeback_Inv_SD, addr & almask);
 	cache_op(Hit_Writeback_Inv_SD, (addr + size - 1) & almask);
 	blast_inv_scache_range(addr, addr + size);

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261111-mips-ingenic-l2-war-f0eb3e4735b8

Best regards,
-- 
Hunter Laux <hunterlaux@gmail.com>

