Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309065;
	b=mhIJw7a2ZZ+INyHORlNTnNaOuP3ZGCgFofkzhIfnYP9dhYn9uduZQ+2AStlu1wrag/Dj
	 sEF+NMm2AlZJCStbebJ1oj20PH0tKMf/qeXU0BG+7prdRZBcDIQAFkAVBmaELnbcymXMo
	 eg80s3DmucgbZ4pwQCPlbBrX5nskKwWzgH0bKESaK6jjKxRcduJeWFEINNInbq/BQs2sT
	 r+o6xvC6999AA/6Ai5Kh2yEvdiMeXcVo/fHaZyQhLL9s1JuBmjoiEFH3D6Y+b0xLjoq9d
	 v54qQewrVMjix1kWvcw8ZT7FSmAzgvy2ATlKrQFbwCkt1MVxP2hB7geMpMiglr4lS0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309065;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=zCgZG7cKfmou9sg/VCIX1yXJblBV+w1RXKms4gzfDbE=;
	b=i8s1uGXPdDcaPHRuGe3bWEKFwzdAgJ823IyTCJAfBXHsCP6Jhs6lE97xo+BH9Sl36tV9
	 FcyeBy9Df/ZxpsL4eiZLq2RZ6gkvePYUb+FZlE8nvGcmSz/fyPrCw4S9P4RPDdqWQ9Qdh
	 CLnEXpkwpAbegqAVwqTL7PwLfYaaDoeLz7HTBpAzGc6RfcxAM09pH8ZjyXWru1GmWU4fl
	 7fRTouR0rT44YIpwBHqb2rgL7vbusLjisCXjxNQC1DmNY4PCC1eiu8N9e8ZrwfrI591Xi
	 NbkRXjUXZTl6tfdhAeHzjKvZXKzhgUfgNSL0VrviVxFIKbu9cmaZQTG7yPbBEbnkcSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BnndeZDj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA9606A31C;
	Thu, 29 Oct 2026 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BnndeZDj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0F61F01825;
	Thu, 29 Oct 2026 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309064;
	bh=zCgZG7cKfmou9sg/VCIX1yXJblBV+w1RXKms4gzfDbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BnndeZDjAoRcoWY4UhnOenUmBubeQlylSxCWaOks3K+lDpMPkwBuyol7YUGIpqClg
	 E23QVelULZBJiAsUfbrK0BAohT8fPOI4yvxrAQZxChro3k3oH/L2BwQuacI0J6inQw
	 EbDD8gFzJYCguariJIxi0tuh01xjdaQ/tVnRWRXeR2dvHWN+7Z/UO0MxAdP6JoKK3n
	 RdEwilJZBrcFiD/JufAqpwkWKnM13w6SNuM/pogNsGxV69rW2PjTu8fxGKruOjYKWd
	 azMXpmjdMgxq/dLSbp+Hd56cUjSzBU5IFkGGfQglP/xBqCqCw7Yd1mAhpGDhI0ZA5L
	 a4LJyL9ILfg9A==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rosen Penev <rosenp@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 3/4] mips: n64: Rename the video interface register helper
Date: Thu, 29 Oct 2026 22:23:46 +0100
Message-ID: <20261029212343.110095-9-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=blum@kernel.org; h=from:subject; bh=yD/elTzbvACuQ0t8kuNzaeFLbIOOSbV59RcMZWFgzxk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmPd6Y0if7+qfn+0pt/nyYalryvT9u3sWvjjy7Xi/aTd 3hPl3dX7ChlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJrOdjZFiw+spNpX/GceVh B7e57dn06YFK0k3llV7K9ncmXHuZzS/NyPC86HhJ/t2clL0ia36dSp+4VEXhWYL8CddlQhvVeBU /HGcFAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The helper writes VI (video interface) registers, but its name refers to
the RDP (Reality Display Processor). Rename it to n64_vi_write_reg().

Also rename REG_BASE to VI_REG_BASE and remove the unnecessary #undefs.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/mips/n64/init.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index a64695454359..995556e4afd9 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -51,15 +51,13 @@ void __init prom_init(void)
 
 #define W 320
 #define H 240
-#define REG_BASE ((u32 __iomem *) CKSEG1ADDR(0x4400000))
+#define VI_REG_BASE ((u32 __iomem *)CKSEG1ADDR(0x4400000))
 
-static void __init n64rdp_write_reg(const u8 reg, const u32 value)
+static void __init n64_vi_write_reg(const u8 reg, const u32 value)
 {
-	__raw_writel(value, REG_BASE + reg);
+	__raw_writel(value, VI_REG_BASE + reg);
 }
 
-#undef REG_BASE
-
 static const u32 ntsc_320[] __initconst = {
 	0x00013212, 0x00000000, 0x00000140, 0x00000200,
 	0x00000000, 0x03e52239, 0x0000020d, 0x00000c15,
@@ -107,9 +105,9 @@ static int __init n64_platform_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(ntsc_320); i++) {
 		if (i == 1)
-			n64rdp_write_reg(i, phys);
+			n64_vi_write_reg(i, phys);
 		else
-			n64rdp_write_reg(i, ntsc_320[i]);
+			n64_vi_write_reg(i, ntsc_320[i]);
 	}
 
 	res[0] = DEFINE_RES_MEM_NAMED(phys, W * H * 2, "FB");
@@ -119,9 +117,6 @@ static int __init n64_platform_init(void)
 	return 0;
 }
 
-#undef W
-#undef H
-
 arch_initcall(n64_platform_init);
 
 void __init plat_mem_setup(void)
