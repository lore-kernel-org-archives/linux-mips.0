Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080938;
	b=gR2Fqh216WF/kD/YFY1oyUMDTbCHzm8HZEKaTF9kcgZh0cM6YpD7HHuPmwxnHeLOPAoX
	 ulbi0mErmBa4+42mMD4Kj5YDKPRbEq7AyuRsb0hOCsMoKg6EWbq3h7lYS69A31xfGwodI
	 TWjA5+gGlIwBKJYtNz0IJ4BRNj9yFm7HJWhrxT/bEJCoLnVLznCNBXcTcW+iDOnJy0UL4
	 cEzjT9QId26StB4kedDSxjRZxpl5b/ZGSHWtbRi/rLqjDmDN0isCfSVIln3Yu7aFZJuIy
	 MaKF/azo5bc54JKvDaIq7zcOg4+p75QKY/2TZRCUpXnd9sTaN3D8XzUlY9BKZaWFh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cmvdR59+nEKktsLxK5NEcA3MaAWcKhNimY3ZNWbqo1c=;
	b=R7Cy/MxQ8jomN1U7HhS4FPYQMSTdJGcoYIShh/nTNYmQ60L1fsQ0TSUTNVFU1GlnzpAS
	 9wvsMEsX10uqQulQO9LX/I7WBxwxJaWTlUC9sl1dPEkYXC688zHRvgsIDKsaJ+ojyF0Lm
	 D0eRHEyHXU4+I2uj6BeekFIYsDtRxvirYzIKS/MVxAQ3ggi7ZsYbbgIptY6n6/1ghPCoc
	 ZkTevQX6YbvanKMXcwp4/baAvc2X6YmqUiRSfY11RwOZTVmd3PZUhJOpBRmgU/Hax7THe
	 rZ5UT6hC1KEt5HzQdoJSoT81MblZOXK38tP9cRQ38tZ4YCIXHH6GPSE939rWaQCtAPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8QPHrnU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2299B606A31A
	for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 06:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2299B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8QPHrnU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so13489145e9.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080936; x=1793685736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmvdR59+nEKktsLxK5NEcA3MaAWcKhNimY3ZNWbqo1c=;
        b=f8QPHrnUzVxcHRBOiZeU8GkPxLp2d2ZoCipuEHRYwIz+xBSd9IMQ8jg0oS6x+ROqgr
         ccGNogDHcWKCUQ13AVYw8IKb90NpuI3lwiPwt/21wfM5VAWOR6BZnQ27Li4EgJe8gNeJ
         fJVvgO8a32ShtG4VPYv0k+JLLqyE+IGgjl8drm48gQVyHcbQiN3QBHuFQHLzK63XZXHh
         PALfkBicozvdnKMhnH2upZ9k476D2aGoMOxySx1g3C/mD6h63UUCPLFTLVxyvklkn0vw
         DAxMNZg1/7x1Jzt9geNce0VcCdNrrIZEfKv8nCWrUbcrJdmrYXbRMK7m3PfSWQioSvLe
         wJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080936; x=1793685736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmvdR59+nEKktsLxK5NEcA3MaAWcKhNimY3ZNWbqo1c=;
        b=VjNAZYa917v7aMtlmfbUsflTyOowsGcIsGb3Zl5iLDGOXb7Wlw4nkg4Hy0m5RjvrOK
         8v3vK3oMoBAhN7OrR3K000ldxrXGzugrY9OQEUdr9Hv68AZfpElyV66a7/QYURPUmTmS
         3Ty8ef8JJcG/f+vUDre/cbn8ieHJ+Vqel6EUjWxJprXayycT19VV0yetHOeUkOoAM+e8
         euSQH1MPfmwqGU6jwGs6PLTtVhN8114SbYnLSZYDpnyCPTMP0d68Owo4lYdGDwSEh+bv
         hHUVpFhlkvo2vd73C2P8+tsVqu6leyc42yk4k0HKSgZTt49nkXdYbX7ZBLI1dsJOQaAx
         Ijmw==
X-Gm-Message-State: AFq9FYLB+vrc9B8wMJw7yg6Y1RcrwhSYvTObkmXxGBGNFQp5Cr4chW+1
	PeM2ERIPgPO+kHDaTiLQf7FPeaZW7ziTATtEHN9LkNvQlBKX6w8L32ql
X-Gm-Gg: AYBFou38gA3IfYnMNQFVnOn8ijDehqE0KfROwVEC16Y0PaWg52hYUBZXp5s7aj8Org2
	AHyfKnNOJBB0OJ1KrxXF8fjmxZbDnYofTuGfj7R3GQ6K96ywZDaLwDuXed+G0IrmcbFyT2Y+DtB
	bD2bcrOWH77HXWp6dv7Z7gEG0VtjsRDkXnEUCegcOFz8KElGCorAVE9qxVOdcEjI1jBta4m2VtK
	PsVsXIHquhxjjXUgK1aE0CXhLAd24xcxKT0+YiYk8LnVeDEpUXivsmFKPdcYgbMaeESK7NnZfV9
	le3Zh0MXUwn6WDp5Hf1De1yG9F/p2y3iv/pKJsMXqWkAix1G2p5y3ldOaJCBEWNn2fT2LSxdxYb
	ETfp0Z/6d3CnGgtjwSxyoIAGTvxKVNOKDqiOJV9QhyaSXPBTVyYj0yzN0JU0utsZMbCxu97Q4bv
	V5p6QkIWA1lb98TpmXG70AYaWd51n1m3p4kl6nUTlthjQO6rspU5jHXQMHQq8w5q8PfzP8ezQFi
	YtDrtTfoCLX5eH7n0RlFwLVQMnBpRzipwCHGKBDfa+bFF7DFhMedlSdjOq8f6hhr9etDM7HOje9
	FZDUM5l761eeOSTm3MGNgqnxFmkVoD+qyz5p2A8dgmnjTecoRzHc5Ji2PlN4WA7lJsswJMK/6kI
	=
X-Received: by 2002:a05:600c:6219:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4a35ac80a9emr155815235e9.6.1793080936226;
        Mon, 26 Oct 2026 23:02:16 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm251833655e9.4.2026.10.26.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:02:15 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ardb@kernel.org
Subject: [PATCH] MIPS: OCTEON: compute the FDT CRC in device_tree_init()
Date: Tue, 27 Oct 2026 06:02:14 +0000
Message-ID: <20261027060214.2687878-1-orgads@gmail.com>
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

device_tree_init() assigns initial_boot_params directly and never calls
early_init_dt_verify(), so of_fdt_crc32 stays 0 and every boot logs

  OF: fdt: not creating '/sys/firmware/fdt': CRC check failed

whether the blob was passed by the bootloader, appended or built in.
Call early_init_dt_verify() once the prune and the MAC address fill-in
are done with the blob, so the CRC matches what of_fdt_raw_init() reads
back. x86 had the same omission, fixed by commit 628df9dc5ad8
("x86/devicetree: Initialize device tree before using it").

Fixes: 08d53aa58cb1 ("of/fdt: export fdt blob as /sys/firmware/fdt")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Tested on a CN6335 board (internal device tree, Cavium U-Boot 1.1.1),
in a 7.3-based tree: the warning is gone and /sys/firmware/fdt holds the
11551-byte blob. mips-next with cavium_octeon_defconfig prints the
warning on the same board without this patch.

 arch/mips/cavium-octeon/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..fa8273799b94 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1213,6 +1213,8 @@ void __init device_tree_init(void)
 	}
 	if (fill_mac)
 		octeon_fill_mac_addresses();
+	/* After the edits above, so the CRC covers the final blob */
+	early_init_dt_verify(initial_boot_params, __pa(initial_boot_params));
 	unflatten_and_copy_device_tree();
 	init_octeon_system_type();
 }
-- 
2.53.0

