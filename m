Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650778;
	b=GZDnrpGPv2HqJWlvJLp+CqScRB2AEaGyPI6nQfUx5bvJKclbha/xcpK7ad/LwcGyeI+K
	 KS7vZ8zzbx1WbigCGfSZvUokEc5X0KP0+nYr/xnLRyKQbQLZDalH8becDjQDR3qkQ5OwK
	 DxqshcL2YgCLarSuaPA/mFCo3sEsLgkUy10MX8kEEoknQbMyIXn7kClJUk+0KOq3fdpdm
	 ts4WWa4yQvspbCcKC/qxvjaDq8RHVyQcyEPdu8J+UMQU3ewIaY6Qw7acjduhwO/zHF6KI
	 AQaR0J+zf+pSWXecpf6aJFPUCBRLy6NfcJCJXtE1nAXyaEl5Hamv3UtNYG0eNBKS7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650778;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AtxH1rtvVGcCbrpssWyswzGEtKmY8FkdO8ogP+lp3+I=;
	b=1GuRqqExC7C8R6KyCSm8pFRFZc2l0WP5n2et24xSKpakR5BedRng8UgCAtLiZ+SMF4n9
	 HwSEUUDXR4IAmPVT+Um2Y/oqSkqyAcqfHrz0BcmBdpE/mwwO7hGFMSXkXyTXBJFjGazoW
	 XAPZpRaZKLeEtddF2ssGn26XTV070De+1kk3u+JG/BH09Lm3bXirpe+QjX0+nm6mRYm3C
	 t3vWf9QhRUFIT7YuuEIQzE0LhGF+bnSZZNtQHi90buq7+aHjU3yaMEXA1s8f+nsgLtyD/
	 hFelmj0CDk+1HL11Je+I6RiXl8sm1ovRJjH4lQoDJzblToHc+1Gn25TbpwexP/ga1Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=vzax+X44;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8BFFE60A260F;
	Sat, 14 Nov 2026 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFFE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=vzax+X44
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 3706CFA25F;
	Sat, 14 Nov 2026 11:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtxH1rtvVGcCbrpssWyswzGEtKmY8FkdO8ogP+lp3+I=;
	b=vzax+X44GgR+mYPvEMksybA3egCmVsE8nnGqhKJHD4rJ633YS8nOf8mKJpsOzm3z1ceCtr
	fiATtfwlmP/NJvaUJ57LmODHfjZp0pEK/rMXcXI3lb2P3vDaGbgjLM4mFURY+FEaQeg98v
	+YuUjbeiY8BLxRXGr116OEkxkgieVBKSij4wTFaLsJbHMNwPyomY6adoZmal5jooUEZN5i
	RJYP0hYIlXeHJ1RBdoAs2XJs6R2S16386i2GK4JC2kYn2QcD/oyqf3P1a+asikjG4SghMX
	lMK3/DS5ghdjNmZx/ZWbVhy534yHQNPQoU66a0suwNs8AVrArVBeu9R612VDvg==
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
Subject: [PATCH 5/5] mips: lantiq: danube: rename NOR node on EASY50712 reference board
Date: Sat, 14 Nov 2026 11:06:07 +0100
Message-ID: <20261114100608.3432120-6-sw@simonwunderlich.de>
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

This fixes the following warning with the new lantiq,nor binding:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: nor-boot@0 (lantiq,nor): $nodename:0: 'nor-boot@0' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/lantiq,nor.yaml

The MTD device name comes from the driver and not from the node name,
and the board uses a built-in DTB, so only the name of the platform
device changes.

Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 arch/mips/boot/dts/lantiq/danube_easy50712.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
index c9f7886f57b8..456d5d090c7f 100644
--- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
+++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
@@ -25,7 +25,7 @@ localbus@0 {
 				1 0 0x4000000 0x4000010>; /* addsel1 */
 			compatible = "lantiq,localbus", "simple-bus";
 
-			nor-boot@0 {
+			flash@0 {
 				compatible = "lantiq,nor";
 				bank-width = <2>;
 				reg = <0 0x0 0x2000000>;
-- 
2.47.3

