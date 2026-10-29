Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309054;
	b=dhUczn4TUpYXugPwf8Sf3RKX7tvZRWgXlrg8bzqsze9N5/pF91VMFHSEZmFDESxn54oU
	 XAJtG+qdaf5l5RjlJY1k0xzaNnWdG78R30AbyDrgaZMpIMk4Tc0IY8cyR1WUDUXicNMnX
	 xjJ28W6zKDMS6VT7PNsv1cAdtK4B7Q6a94ZZimnRW2KP2NIcvNIfkCJuWpsBBQ3o7ACBb
	 YrG3qKoN6nejKdtoHVIUAvvT/jrS2ztnRTkd2p3e4/hcH4SuMj2atTpoS03wu65dBz0Bl
	 xY5Uoqu/rYstUVvPiPfOfB4J2PDD8zUxD7Pq66Tk5HCSqDsvyvRWqdAKJEzz/EboJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309054;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=OMkPEle95Bj85UOUbQ84ekgu6UCJlOOjnCit/KEbD5w=;
	b=GVFDITdh/hdIAj0lXz7hExHAXRJmzjT5DIp1wNdZkTkLbwNk1iEhOvegjrWpqoXowU01
	 VbJuvFjiMKTFUwXyM0AstCqiTmzMmycsgAY9gSWPyYN4mBgoMnaFDpay3OC05mreYzDjU
	 F0dz04h1WfBLPhmdyLoxvNJlAoNv4xOe0yHQqhEDe3CA07ctAqkdOV/JIGqcheOLjBU9i
	 IhxhISsS8ShE0Vh1VEbG14qrT4Sf1x4sxePmi/7RLjpOZYeFNx1/vDOk4h5JZWm8LQNBx
	 opY9WCkz+VtL+nJ65WEacnU6NJANWehCsAo5QOBsGe8KQOzI0HFMqNEtqoiuA0fRUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n35LLw/5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF44606A31A;
	Thu, 29 Oct 2026 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n35LLw/5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6171F031E0;
	Thu, 29 Oct 2026 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309053;
	bh=OMkPEle95Bj85UOUbQ84ekgu6UCJlOOjnCit/KEbD5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n35LLw/5tykzNn1tB6jM/s0by9xvHUywzC3W6tXjB5zwKwuHbRW2w5anGKu7YZ9gM
	 J3USELiAh229Hx5riagqsP/runwNdXY5XIYHNUAE+8b+kvcRWn6hrLGb6Y5kKVLOxI
	 Elhk4xoAtOtugNajyArIoLRlnzRnCnodkLAgF4ZaO/ZYGJmzpL83xcfgCqDE8FxfkP
	 RbFaEuuH2wXv+wgQLvTElfzcVd2hO4EdZ+qCsrvQrSS5fSdRWnX7FyjroRoK6gaDFn
	 vKVV5XqDBL6LMCa+b1pkP7P5DCJAh0vsvMtzqQ65CF/lBPX7XD1Q3XwErXtatsUHwB
	 9JoavU6Q6Ovfw==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rosen Penev <rosenp@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 1/4] mips: n64: Use DEFINE_RES_*() helpers
Date: Thu, 29 Oct 2026 22:23:44 +0100
Message-ID: <20261029212343.110095-7-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125; i=blum@kernel.org; h=from:subject; bh=z5Jielq828aO/QQgrxQcLau7xhlejASxegQfXosuBwE=; b=kA0DAAoWXqtxINjMdS4ByyZiAGrjuWGiEJ0ulYPMzMupZYcfLWDaqXZ56vWL2UhHiZkkzCTts 4h1BAAWCgAdFiEE4Jr4mE11fHmyNFi5XqtxINjMdS4FAmrjuWEACgkQXqtxINjMdS6ZrgEAxNSs TYNJHRRXXD5gXlzbHefyy3Y3rYxTmw1vi8Oy+ccBAI/CDfqhUNNuxMMXN9SUI6i1quZur5FCtUb E0/VW0dgG
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use DEFINE_RES_MEM(), DEFINE_RES_IRQ(), and DEFINE_RES_MEM_NAMED() to
simplify resource initialization. Drop the now-unused linux/string.h
include.

Also use PLATFORM_DEVID_NONE instead of -1 for devices without an
instance ID.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/mips/n64/init.c | 44 +++++++++-----------------------------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index ddbd7d1224d3..111d6e6c2de5 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -10,7 +10,6 @@
 #include <linux/memblock.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/simplefb.h>
-#include <linux/string.h>
 
 #include <asm/bootinfo.h>
 #include <asm/fw/fw.h>
@@ -77,7 +76,6 @@ static const u32 ntsc_320[] __initconst = {
 
 static int __init n64_platform_init(void)
 {
-	static const char simplefb_resname[] = "FB";
 	static const struct simplefb_platform_data mode = {
 		.width = W,
 		.height = H,
@@ -89,34 +87,16 @@ static int __init n64_platform_init(void)
 	unsigned long phys;
 	unsigned i;
 
-	memset(res, 0, sizeof(struct resource) * 3);
-	res[0].flags = IORESOURCE_MEM;
-	res[0].start = MI_REG_BASE;
-	res[0].end = MI_REG_BASE + NUM_MI_REGS * 4 - 1;
+	res[0] = DEFINE_RES_MEM(MI_REG_BASE, NUM_MI_REGS * 4);
+	res[1] = DEFINE_RES_MEM(AI_REG_BASE, NUM_AI_REGS * 4);
+	res[2] = DEFINE_RES_IRQ(RCP_IRQ);
+	platform_device_register_simple("n64audio", PLATFORM_DEVID_NONE, res, 3);
 
-	res[1].flags = IORESOURCE_MEM;
-	res[1].start = AI_REG_BASE;
-	res[1].end = AI_REG_BASE + NUM_AI_REGS * 4 - 1;
+	res[0] = DEFINE_RES_MEM(PI_REG_BASE, NUM_PI_REGS * 4);
+	platform_device_register_simple("n64cart", PLATFORM_DEVID_NONE, res, 1);
 
-	res[2].flags = IORESOURCE_IRQ;
-	res[2].start = RCP_IRQ;
-	res[2].end = RCP_IRQ;
-
-	platform_device_register_simple("n64audio", -1, res, 3);
-
-	memset(&res[0], 0, sizeof(res[0]));
-	res[0].flags = IORESOURCE_MEM;
-	res[0].start = PI_REG_BASE;
-	res[0].end = PI_REG_BASE + NUM_PI_REGS * 4 - 1;
-
-	platform_device_register_simple("n64cart", -1, res, 1);
-
-	memset(&res[0], 0, sizeof(res[0]));
-	res[0].flags = IORESOURCE_MEM;
-	res[0].start = SI_REG_BASE;
-	res[0].end = SI_REG_BASE + NUM_SI_REGS * 4 - 1;
-
-	platform_device_register_simple("n64joy", -1, res, 1);
+	res[0] = DEFINE_RES_MEM(SI_REG_BASE, NUM_SI_REGS * 4);
+	platform_device_register_simple("n64joy", PLATFORM_DEVID_NONE, res, 1);
 
 	/* The framebuffer needs 64-byte alignment */
 	orig = kzalloc(W * H * 2 + 63, GFP_DMA | GFP_KERNEL);
@@ -133,13 +113,7 @@ static int __init n64_platform_init(void)
 			n64rdp_write_reg(i, ntsc_320[i]);
 	}
 
-	/* setup IORESOURCE_MEM as framebuffer memory */
-	memset(&res[0], 0, sizeof(res[0]));
-	res[0].flags = IORESOURCE_MEM;
-	res[0].name = simplefb_resname;
-	res[0].start = phys;
-	res[0].end = phys + W * H * 2 - 1;
-
+	res[0] = DEFINE_RES_MEM_NAMED(phys, W * H * 2, "FB");
 	platform_device_register_resndata(NULL, "simple-framebuffer", 0,
 					  &res[0], 1, &mode, sizeof(mode));
 
