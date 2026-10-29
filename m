Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309072;
	b=coTFPQLcgb/pCc6IwQ1ZcF2F60Q8/jXasdLKFHvvMSZoHdG9c9bwN+0j51lxgBvr7dT1
	 1KzH+xqDU0DuhQJpCavnprmTLFaWcieuL0fuwFitCJeKEZ0kVA6x6kTNc76cIrQ0QmNuX
	 Wzbc4rCTEnbjAz2BWqkb9NklIW44UP2J2Kh5yg0rHeAr1DsuCrxg3Oi0f9Sl4bTXTtb9t
	 /wa9IAWsj7dCOTWCPf7vE3hXQmVNbMdioGE4TAQ4FshSTx+QpL7TxEkA11FttipG60tkR
	 MtZuZDELfUOLqTYO79lxH1Zs2XRmTpmleqf+Uwyj727GO9Cf9VXP5Btu6f5r544KEfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309072;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=3m1rDkyZygtSK6pLZTUgp6y5vq0P16MEqXbF7s1ljII=;
	b=trmQKLuQ+0PIvsJsIc8RoFI/VqJwor/bl/TnXFYzfY0m3buDeqWwk3/sexhjFC+U9acG
	 +zg/Z34qmdMlevizE66XQPsa3BawulWZOvCiYPN7kShszssGHxevboO81hcTAlHtFf3Jw
	 vH8S9RddSJt8CNFC80CN+g+4rx81ub3xlFRt7EyLwksFzLyrWC5URWQdd5CsQmsw1s6th
	 J6t4hyPPeu7tl8vQaqvgi7s4afvjakV7SI6U6md4u6RF3x4MXnqvShNSRjeC4bpnE45UZ
	 BK/VH09DALKOvyOyKi+Gr0JT71HJtHR23kjQIGom5wWJhLOdpV1SHfmRfyrkMMUPrRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMmvp8d+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C025D606A31C;
	Thu, 29 Oct 2026 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IMmvp8d+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8B41F01824;
	Thu, 29 Oct 2026 21:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309071;
	bh=3m1rDkyZygtSK6pLZTUgp6y5vq0P16MEqXbF7s1ljII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IMmvp8d+2oKpba7E5gt/NRXzaIlWh29eMVAzHYBWwsLiYc2zsL3vJL0YyrHjeObU1
	 EFRIoCUX5l9kG+BcEHvDl47S1H5I333bDl8YtidmkFlX1YKzhrz3YTzhdGH7KmJ6qK
	 lLdBuQHxW+V4oToGyaQ557TamRa4hv2gny7Fv/+KRlJaIxzXU0e+U+JQItswWP7OPE
	 lU9nJRRAXTfdVYLuXZv0z/WzmJBKeAcD9otRuEVhy9KrGhdk1H6oqjC/hZQYpbERIl
	 Vvms0PN5OQvpVLJi3wBUwfL8bmFXP8GEwTMYK6Os7O2bJOfsg0Z/Hvzri7mwR/geHH
	 7dSz6IoAlELcA==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rosen Penev <rosenp@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 4/4] mips: n64: Use SZ_8M in plat_mem_setup()
Date: Thu, 29 Oct 2026 22:23:47 +0100
Message-ID: <20261029212343.110095-10-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029212343.110095-6-blum@kernel.org>
References: <20261029212343.110095-6-blum@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=blum@kernel.org; h=from:subject; bh=Ay/R53x9k34uvbB3f7j/hWhlBW3C17rO05dU5nsjQeg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmPd6a9XPj22+/fUyVnOnL/shaQEP6/pkU/97Wxw9kyw ctv2DstOkpZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAin3UYGVrnrTvmJsXpwqtg ZfD6tjfH/LSy6T7Lfxmtyl8Z8frEpg+MDK96XHp0dlo5q0w33GyRN8Pz34bX1s8P3klYkME7a/+ imYwA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the hard-coded value with SZ_8M and improve the comments in
plat_mem_setup() and plat_time_init().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/mips/n64/init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index 995556e4afd9..522b6405b644 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -11,6 +11,7 @@
 #include <linux/memblock.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/simplefb.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 
 #include <asm/bootinfo.h>
@@ -122,11 +123,13 @@ arch_initcall(n64_platform_init);
 void __init plat_mem_setup(void)
 {
 	iomem_resource_init();
-	memblock_add(0x0, 8 * 1024 * 1024); /* Bootloader blocks the 4mb config */
+
+	/* The bootloader requires an Expansion Pak (8 MiB of RAM in total). */
+	memblock_add(0x0, SZ_8M);
 }
 
 void __init plat_time_init(void)
 {
-	/* 93.75 MHz cpu, count register runs at half rate */
+	/* The count register runs at half the 93.75 MHz CPU clock rate. */
 	mips_hpt_frequency = 93750000 / 2;
 }
