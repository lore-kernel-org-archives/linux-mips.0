Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309059;
	b=mOMxfnRdLKNe9IUNfrkGqMg9vfJAYB57sbaSRLgBMQ7dmkiDfhgxM3EdGnKq98S6J3C0
	 z+PDW1onm/y9C5uuAU/fsQncY/3d32AalXlfjxJGUB7mV9evuYyrdK28L2WclJBkwpiYs
	 GdQqkVuHNahcbbOmFqj9MZmyZLEj5kN6nHoruoxQL3hJDILmwhZjlVuwmj8JAqi8067tm
	 YVy1pbBGCG8bZmRIU7BX+yv3xHFWPk+knadBs17IigWpy5lq8y+jDVisaSe+OtduovO4b
	 HZtpyr8FjLzWhdqOvXeiKBdvx+xwrhjOQf7phW8kAVL1KDIqfWyoMP1JZiUe2XLdSdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309059;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=o19RY4Yss+4j6xrcmkD0qQ/NjNacShYF5qjqOSmyA7I=;
	b=1hH2+Nt00/ngfIo0IY31Cui4qw/t9cfpbchM6mSqDD7tYjHcBEcZ9NOASN0Bghj1bbTY
	 /AGWjevxBSGAClc+D2/7DgbZdrbL/vHdYD5c7z10d91yIEUYQ62x+Gk6xVn6sJnpjb1hd
	 2WITchi5Nmu2p0u6PbpVrA3jhm6Ph6B7JmjVyYOgK7ninUcAGmHMmtLqa0scMY22cgAVK
	 LTYoVvKyt7G+xqFjiFkFZ7Jrt7eT29dZ3orCNgHoaNHEnxXCQFcj93pzCbgGmKQK9bDJe
	 3WobJvVaIrFbFwbLCV1B1Z+PUPqLrc1tEFq8NDlF/NMLedmoBmJCxxcx1btGG8xanOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e49bHtZ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF85606A31F;
	Thu, 29 Oct 2026 21:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e49bHtZ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158A11F031E4;
	Thu, 29 Oct 2026 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309058;
	bh=o19RY4Yss+4j6xrcmkD0qQ/NjNacShYF5qjqOSmyA7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e49bHtZ9xloaXHUVZW1AquKnxnHhkp0Vv/fUV0KvegOpIAxRn9rm2xJuMuPFBA3nh
	 0SiO+QWeG1wFIb7z8GR284AdZBfAHBbYHSaYI87ozHmga+FAnnYQnsbAEH+gjJ8HHw
	 n2TOH/HQPGmZu68ZOQd+DN84Vf7Apgy4Jwygljzx7kLEcAGGjYzfWiIuqEZOiUwGqj
	 DB3XUypNLst7EUQ4uUyrqy2WqoprqTRZrkQdVNl48aH+7A5hLe9V5eHk+dk+OLWQeC
	 q3GIL1Dsf3eyjdATvQm+Hrfx88uBPA0sCOOlP31FAYUYClnC9ig+eeGpEqodPG8Qbx
	 hzV5Oro1VaLEA==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rosen Penev <rosenp@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 2/4] mips: n64: Simplify framebuffer allocation
Date: Thu, 29 Oct 2026 22:23:45 +0100
Message-ID: <20261029212343.110095-8-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037; i=blum@kernel.org; h=from:subject; bh=g4Y0JNHj38R1+prB7B/074vUNRDxLGncW3ctCQo6P4g=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmPdyZpBfEtiErPniFubFf+bceaQK11/MFnHjWWPf22v 1hF8Z9lRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzk8QmGv1JFPVfu3XuukVJh xXRm9VkekcrJ5XFb9q9919GYq8S28ynDH35u139f5/w5fetBWr7PD93+KFaGuLNfTqzivC8X39B RxgAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The framebuffer size is already a multiple of 64 bytes and kzalloc()
guarantees the required alignment. Use ALIGN() to document the 64-byte
requirement, and remove the extra 63 bytes and manual address alignment.

While here, make mode automatic since platform device registration
copies the data anyway. Also explicitly include linux/align.h for
ALIGN() and linux/slab.h for kzalloc().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/mips/n64/init.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index 111d6e6c2de5..a64695454359 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -4,12 +4,14 @@
  *
  *  Copyright (C) 2021	Lauri Kasanen
  */
+#include <linux/align.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
 #include <linux/memblock.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/simplefb.h>
+#include <linux/slab.h>
 
 #include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
@@ -76,14 +78,14 @@ static const u32 ntsc_320[] __initconst = {
 
 static int __init n64_platform_init(void)
 {
-	static const struct simplefb_platform_data mode = {
+	const struct simplefb_platform_data mode = {
 		.width = W,
 		.height = H,
 		.stride = W * 2,
 		.format = "r5g5b5a1"
 	};
 	struct resource res[3];
-	void *orig;
+	void *fb;
 	unsigned long phys;
 	unsigned i;
 
@@ -98,13 +100,10 @@ static int __init n64_platform_init(void)
 	res[0] = DEFINE_RES_MEM(SI_REG_BASE, NUM_SI_REGS * 4);
 	platform_device_register_simple("n64joy", PLATFORM_DEVID_NONE, res, 1);
 
-	/* The framebuffer needs 64-byte alignment */
-	orig = kzalloc(W * H * 2 + 63, GFP_DMA | GFP_KERNEL);
-	if (!orig)
+	fb = kzalloc(ALIGN(W * H * 2, 64), GFP_DMA | GFP_KERNEL);
+	if (!fb)
 		return -ENOMEM;
-	phys = virt_to_phys(orig);
-	phys += 63;
-	phys &= ~63;
+	phys = virt_to_phys(fb);
 
 	for (i = 0; i < ARRAY_SIZE(ntsc_320); i++) {
 		if (i == 1)
