Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080950;
	b=PGdreGpK6vAgeDB0MulN0aFejuYpgjy0LsjiMsr6RKbWXz8BpAtHmjBWkE59rWjqjvB+
	 26eh9+5QziK/vPB3fhYlFez2NPMia2N+YsgKti2Gb02RGi6qRG21sAWYhuTTsqUSAe2t3
	 gCrA37atyJfR1GGEFjSGSTqgUrnWb6HZt0tmxa9JjuEzMtr2/5ui3U5m99KVWmI+tcDRq
	 zgj8yGvqcn+KOgYxmOHg+aNFcuFeCbMsc3A0fPNvcWJzsUneEuFexM1VDV+MmS8fkwyhf
	 J7cckc2PRNVRbyh2ObrXuHEp6nPdUFa7MNvDfrpbb55phHJIH39tew8t/T/zXJDIynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ej1HgTe/KHrLI49Kdk60bqEOZh+J6lt5Sf/YAb1bqN0=;
	b=rWmmLhutaFi5nUX8aMdRZX72c5Yt3s4Oa6ZgZ4RMiOZbX6GPWgLtlFMHLXHhfiStViKH
	 Y5Qokgs2oR8k261c1xBVWzoYo77CrI21gt7RNCBQ/lRcolz4WZNpp1z73mD/tEK3vZmNu
	 kQ6DZlTumyirDaRpRnQVawr7Wvfq3LaU/F9CAV5f9ulPQys7r9zTjTuTP2xCA3Rez1bD1
	 kHT03CZMmAq2sGQwbP3MZpCehTfe7HDZ1W/6UMiKalxOcYwpa8/oHnNM1IrViDFSuR1sn
	 9hGcA5fFiZrxIfugt5iiD22SnDsT6lJKAFOey72KgEpM1saCjOMdvuXn5ad2FAvhEwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W8y3TrE3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF2606A31B
	for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 06:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FF2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W8y3TrE3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32778925e9.1
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080949; x=1793685749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ej1HgTe/KHrLI49Kdk60bqEOZh+J6lt5Sf/YAb1bqN0=;
        b=W8y3TrE31cqe2qsF8kCxCq0+Jbdq2zr66wZCiOcKow35sZtPu/4uKjnkfQ2NkYkl8j
         3/zR6rpa9epY1pWY1xhl5CBYJsTe4TXvPheEwrXoaM1B9os/1eYBFt/On1lnzGtLrdRl
         KrD6aJq0WmcHAouPYZtl0+6Q77AJ6Wt2MSIHqvpiXGn1ug16gtU4lqTB6ijt6hVEFoY3
         P0Fp8plI6IuMjhswIOL6VjwsgvPR3dcobioA9KBZPXQhnpfs6wmt9F8J7P34WbBHgqFB
         5XE5dVV3cXPUrJ+m8a1F1kutjkR+tjY1v0KPu1ADg7PWfRGgypDUeJ8fmH095U5b0LrL
         EiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080949; x=1793685749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ej1HgTe/KHrLI49Kdk60bqEOZh+J6lt5Sf/YAb1bqN0=;
        b=AaHweH7fHnAZAQ4E3XNS17hctRcWiGJtP+gjDwD6nTjUE5zXUpD7qfc9jPjbOWotce
         Bx1lveVpgQFUacctCCtHLsFRMIz8gNsA8KgKggFDo5q/8WM/Z2oBHTyVt/4ARwYXIRcx
         71uusD9bsM60CApcfl44xzJej5LYEsc2OlCtzyeL/xywDQiU5FxP7KZi9ji8efcEe2w9
         YiDq8dygetE/bki5shFFs6BuGln2BP9CQeqn8G7rKqPhAdNb6E7mMGyyzxZnQ5+9Fjdw
         wWMrkZ+fYqKqTT/aB1hld7oR50ZG0pXNlh6xI94OW1OHQrheoKUizaSggJbURiWH8PLi
         L2fg==
X-Gm-Message-State: AFq9FYK7dilghMA3gmcgYAwRviMJd/WqQWAw4kb+YD4/4FuWWanyRSxp
	gzJK0YRXVZ+Hjm71s2tQ16S8U3TAIxKwZFeUnWSjWsSTy8yjC679BPiOXf0wVsQC
X-Gm-Gg: AYBFou2whZbboVPSN8cbARlKSAaKO17bWX0Ucin9mY53h8Kx8qmWfTgms93hWYISaar
	w4liwjBF1WEd+mQ0VtdlQyAEVMYhW88b/pCWWDcSOBWoqObmmRtj8ZI7qFwFE7F+bmlfIEsxjsT
	UF+NHGWe3cxcmKVyEdX95Wo0t95sNJJYVwCfEwMuiFKhnz2G4eyBRt7oLwkXOGjmglAzB/I90/s
	LkJtDyN96e/7WDslsjWBKQ4jEgeSKoDBEZORTto3dmMvvgf4u3XqtiEp7amXzYFmMJYOaLPauIf
	7xM099xPt+VDTcuIJZqz1qgyMPaCiCroze7RCHi+xY2jgkdL1TMn+tTIv/YS/6xEqdsBU4WtUp3
	RTL7CMq47qSsq8wLadd+WWj6YzMBNStQsdwJUZ3M/Wkrm6E52UGtvrOcK93/Qyc1aNU0zs+hx8A
	jHGr0EH1e5d2Qq7Adx50gScH5oyqbYvzlOz557LxKns0s+weQNfy+oldjb0NnM9ZNdf0q5kebmm
	k8c43uNDU21Hzq7DXqVjSm4gL2MvOEiKrKNf/7LtFg1wOyfuqABXB2PoGJSfA7nNRQTHaUrtvXB
	wpE5K1JvSpyLmBAHs0BpJ6JWqalNWtonOHG8VfLCXSWHow/5LuzV8yVG0nEAIunma5ZemIatbIC
	fN6x5/HbixZR+pISupBM=
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr148820065e9.23.1793080948450;
        Mon, 26 Oct 2026 23:02:28 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm19124482f8f.22.2026.10.26.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:02:28 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: use the free memory below the kernel
Date: Tue, 27 Oct 2026 06:02:27 +0000
Message-ID: <20261027060227.2687979-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

plat_mem_setup() asks bootmem only for memory above _end. The kernel
is loaded at 0x1100000, so whatever bootmem has free below _text is
never added to memblock. On a CN6335 board with the Cavium bootloader
that is 14MB, 0x200000-0xffffff:

  before: node 0: [mem 0x0000000001100000-0x0000000001cc6fff]
  after:  node 0: [mem 0x0000000000200000-0x0000000000ffffff]
          node 0: [mem 0x0000000001100000-0x0000000001cc6fff]

Claim it before the main loop, in 1MB pieces since the holes there are
small and unaligned. It counts towards max_memory like the rest, and a
piece inside the crash kernel range, which is added on its own, is
skipped as the main loop does. bootmem never hands out what the
bootloader reserved (the exception vectors, its named blocks, the
kernel image itself), so only free memory is claimed.

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Tested on mips-next with cavium_octeon_defconfig (KEXEC=y, CRASH_DUMP=n)
on a CN6335 board, 4GB, Cavium U-Boot 1.1.1: "Memory:" goes from
4023588K/4169492K to 4037924K/4183828K available. Built with KEXEC=n
and CRASH_DUMP=y as well.

 arch/mips/cavium-octeon/setup.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..2b1bc8fafac5 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1022,6 +1022,27 @@ void __init plat_mem_setup(void)
 	 * which is handled by memblock
 	 */
 	cvmx_bootmem_lock();
+	/*
+	 * The loop below only takes memory above the kernel. Claim what
+	 * bootmem has free below it as well, 1MB at a time: the holes the
+	 * bootloader leaves there are small and not aligned to
+	 * mem_alloc_size.
+	 */
+	while (total < max_memory) {
+		memory = cvmx_bootmem_phy_alloc(0x100000, 0,
+						__pa_symbol(&_text),
+						0x100000,
+						CVMX_BOOTMEM_FLAG_NO_LOCKING);
+		if (memory < 0)
+			break;
+#ifdef CONFIG_KEXEC
+		/* The crash kernel range is already added */
+		if (memory < crashk_end && memory + 0x100000 > crashk_base)
+			continue;
+#endif
+		memblock_add(memory, 0x100000);
+		total += 0x100000;
+	}
 	while (total < max_memory) {
 		memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
 						__pa_symbol(&_end), -1,
-- 
2.53.0

