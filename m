Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XmFvkkbx"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD8FD4A;
	Thu, 23 Nov 2023 07:26:55 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E17240006;
	Thu, 23 Nov 2023 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwMGUZspLb3scKoCxR0kEqf6HvwmvWkmRHeYsxLYvU8=;
	b=XmFvkkbxbgrkDydlHmr4XJiBqyJc/Ls7wexVp90rJUDjbPvSrd0GPYtDvqocImDFC1XFAw
	LprUJiKqJ9aGmBKu2YCQnMMaT6aiLfjLpVtNo5IM3JK/79IovoIx/Z0yf0fk3FTDCpLDxm
	JmTWtumZtgWfjSuBSz730oppUObI4YP1fNjBFqXShxqbHFSfqBgIgkH7erOCD3U2chgXyY
	aHwb66AXyWVG4M6xkwB0SiZ+NmnI8lfPBE2qksB0O+ISH2cMvivkPwy/edbRZY87W+6qnR
	dEFOr9sHjedaE0s+rINFhNKNKa5xvzj1yjwbLDkQr+gJr4srSUv3moFBgs21NA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 03/21] MIPS: spaces: Define a couple of handy macros
Date: Thu, 23 Nov 2023 16:26:20 +0100
Message-ID: <20231123152639.561231-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123152639.561231-1-gregory.clement@bootlin.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

KSEGX_SIZE is defined to size of each KSEG segment.

TO_CAC and TO_UNCAC are brought to 32bit builds as well,
TO_PHYS remains to be 64bit only as we want people to
use __pa to avoid mixup compat address space.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/addrspace.h           | 5 +++++
 arch/mips/include/asm/mach-generic/spaces.h | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c60a065c..03a5e2c8b5dc9 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -47,6 +47,11 @@
  */
 #define KSEGX(a)		((_ACAST32_(a)) & _ACAST32_(0xe0000000))
 
+/*
+ * Gives the size of each kernel segment
+ */
+#define KSEGX_SIZE		0x20000000
+
 /*
  * Returns the physical address of a CKSEGx / XKPHYS address
  */
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index b247575c5e699..05db19521e817 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -79,11 +79,12 @@
 #endif
 
 #define TO_PHYS(x)		(	      ((x) & TO_PHYS_MASK))
-#define TO_CAC(x)		(CAC_BASE   | ((x) & TO_PHYS_MASK))
-#define TO_UNCAC(x)		(UNCAC_BASE | ((x) & TO_PHYS_MASK))
 
 #endif /* CONFIG_64BIT */
 
+#define TO_CAC(x)		(CAC_BASE   | ((x) & TO_PHYS_MASK))
+#define TO_UNCAC(x)		(UNCAC_BASE | ((x) & TO_PHYS_MASK))
+
 /*
  * This handles the memory map.
  */
-- 
2.42.0

