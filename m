Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650776;
	b=Oql0COrb9V3MKcJmBfJqbJkduXPq63jSyLEOWe9niTyu50iTXr804+9RMX/fkQxrnLcv
	 jSvVd4tE0vMg/DM3mre+mn1sGUeco+wWCrbrK9PNFzd9IoV1Tkz3Wy1XniWuvQ1FvI8p4
	 RFGFVoyMOEIrzlbbWXtjHweYFTlVcw7DTTiuxO7UuFTbBiUf4tlNzRIVEt907WtdHVLeS
	 LhfUuwtgOtEbUbpKVuSl7rHvjRf0NpJhhWuJp5ba0D2thqarxfOP8beycJ8Kvmw9zNRQZ
	 DKqep/kfC/f8N0NsIdwZoIjCdJpijN6Q+eQt8Xpkw8i/m5yluDNOtHRLA53DGY46DOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650776;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N9LE3DiSe3KJ/dXtWyDO7BFnMiaTY4mvSwQvRj0h7Vs=;
	b=Q7JS48osfvlMzNXxgp+JBYFFnBojCDuCN7ZUloJWd4SOBtc1CDNz/ZTxDs2DyhPG1TbP
	 IT9q1GVI06+EjrOG3fr8vZLIOyMyS90m4gqBa9jHf73eKVh8Nx+htVgYpHEShcvX/55Mo
	 HQuTgi3dWerUNnuI23v/ywdRwh1SUm4Jl05NJhDc90eZ/3fS6zYdKvvrBlVb1Mep+jUcJ
	 YTHh1OGfqVzsbQlNNNApJfTgoycCep9yNsoLLFin7Mo8gKG36g6XdddUemXuwH6+ssM74
	 brs1Yd62BwcAocsA/yq/lXaYFJCedOh61ANt/TqAxcAZ8GIRZTOKr/rL3rWxHVX/tWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=1MR1zANa;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 54B71606A8B2;
	Sat, 14 Nov 2026 10:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B71606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=1MR1zANa
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 65DE8FA1B6;
	Sat, 14 Nov 2026 11:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9LE3DiSe3KJ/dXtWyDO7BFnMiaTY4mvSwQvRj0h7Vs=;
	b=1MR1zANaa6k6hzWq0h9tT0/d1NSk6dM6PcVi/aqbkX3OzQsUZzN0qb2p2b+WAskWPgSf3O
	wkXE7YGSmVIjLlsUBkogt66DlUUm/DaW8cQjIpk4QIF6o9azHE6EmBEg4gvTtnIMwES9eE
	nCkCKXXxrTEqnL5J0B5zJQpwzPQWmwGi21sJRlbDxdFb4rNU8HjAZxz02ZMKglwprJm6Er
	SutC8ZvXbf7hJIb/5ha7gmsC9b2nElEHRwNqT+2jrF/6ZmOJCFMmG+VtxFntMy6ZVd0Asq
	rkAeJ5zhP2Dasx3cEGpimrvPqd19fb/wzXXFXrt2cdBB6HbqRorwr1PeE7/34A==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 4/5] mtd: maps: lantiq-flash: honour the EBU's own endianness swap
Date: Sat, 14 Nov 2026 11:06:06 +0100
Message-ID: <20261114100608.3432120-5-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
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

The driver swaps address bit 1 while probing the chip and afterwards
swizzles the CFI unlock addresses, to compensate for the EBU/PCI
endianness swapping that boot loaders enable on Lantiq boards.

Boot loaders that instead enable the EBU's own endianness swapping for
the flash chip select (EBU_BUSCON0 bit 30) present the chip at its
unswapped addresses. With the driver's software swap on top, the CFI
query returns garbage and probing fails, leaving the board without MTD.
The bintec elmeg RS123 and RS353 (BOSS bootmonitor) are such boards.

Measured on the RS123, CFI ident at 0x10/0x11/0x12 with bit 30 set:

  unswapped: 0051 0052 0059   ("QRY")
  swapped:   8f5b 0000 3c11   (garbage)

Clearing bit 30 before probing is not an option either: probing then
succeeds, but all data comes back halfword-swapped relative to what the
boot loader wrote and reads (the firmware header shows up as
"LDTE CATseloyedE"), so neither the MAC address in the boot partition
nor a kernel image written from Linux would be usable.

Skip the software swap when the boot loader enabled the hardware swap.
The bit only works on VR9 (xRX200) from revision 1.2 and on AR10
(xRX300), so it is only read when the flash node carries
"lantiq,ebu-swap-check", as requested in the review of the 2017
submission of this fix. Falcon has no EBU of this kind, so the access
is compiled in only for XWAY SoCs.

Based on that patch by Sebastien Decourriere.

Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071749.html
Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818.html
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 drivers/mtd/maps/lantiq-flash.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 5c2ace302b50..7ee447227425 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -29,8 +29,17 @@
  * map. The workaround involves swapping all addresses whilst probing the chip.
  * Once probing is complete we stop swapping the addresses but swizzle the
  * unlock addresses to ensure that access to the NOR device works correctly.
+ *
+ * Some boot loaders instead enable the EBU's own endianness swapping for the
+ * flash chip select (EBU_BUSCON0 bit 30). The chip then answers at its
+ * unswapped addresses and none of the above is needed. The bit only works on
+ * VR9 from revision 1.2 and on AR10, so boards ask the driver to honour it
+ * with the "lantiq,ebu-swap-check" property. Falcon has no EBU of this kind,
+ * so the register is only read on XWAY SoCs.
  */
 
+#define EBU_ENDIAN_SWAP		BIT(30)
+
 enum {
 	LTQ_NOR_PROBING,
 	LTQ_NOR_NORMAL
@@ -105,11 +114,21 @@ ltq_copy_to(struct map_info *map, unsigned long to,
 	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
+static bool ltq_mtd_ebu_swap(struct platform_device *pdev)
+{
+#ifdef CONFIG_SOC_TYPE_XWAY
+	if (of_property_read_bool(pdev->dev.of_node, "lantiq,ebu-swap-check"))
+		return ltq_ebu_r32(LTQ_EBU_BUSCON0) & EBU_ENDIAN_SWAP;
+#endif
+	return false;
+}
+
 static int
 ltq_mtd_probe(struct platform_device *pdev)
 {
 	struct ltq_mtd *ltq_mtd;
 	struct cfi_private *cfi;
+	bool hw_swap;
 	int err;
 
 	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);
@@ -137,7 +156,9 @@ ltq_mtd_probe(struct platform_device *pdev)
 	ltq_mtd->map->copy_from = ltq_copy_from;
 	ltq_mtd->map->copy_to = ltq_copy_to;
 
-	ltq_mtd->map->map_priv_1 = LTQ_NOR_PROBING;
+	hw_swap = ltq_mtd_ebu_swap(pdev);
+
+	ltq_mtd->map->map_priv_1 = hw_swap ? LTQ_NOR_NORMAL : LTQ_NOR_PROBING;
 	ltq_mtd->mtd = do_map_probe("cfi_probe", ltq_mtd->map);
 	ltq_mtd->map->map_priv_1 = LTQ_NOR_NORMAL;
 
@@ -149,9 +170,11 @@ ltq_mtd_probe(struct platform_device *pdev)
 	ltq_mtd->mtd->dev.parent = &pdev->dev;
 	mtd_set_of_node(ltq_mtd->mtd, pdev->dev.of_node);
 
-	cfi = ltq_mtd->map->fldrv_priv;
-	cfi->addr_unlock1 ^= 1;
-	cfi->addr_unlock2 ^= 1;
+	if (!hw_swap) {
+		cfi = ltq_mtd->map->fldrv_priv;
+		cfi->addr_unlock1 ^= 1;
+		cfi->addr_unlock2 ^= 1;
+	}
 
 	err = mtd_device_register(ltq_mtd->mtd, NULL, 0);
 	if (err) {
-- 
2.47.3

