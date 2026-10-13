Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3AB5208A7;
	Tue, 13 Oct 2026 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897535; cv=none; b=PhZh652DOl1jXnZG7bNs/rJV3F6MGKHyRoXF6eS+ND2+INGhhOs58ymHnaeR/iWruYXY98ozSaJ6gbOEuA8eBnpP3VPNHXlnkRYPD2w+xXVOMDCR4gX7Nkf5PKig0xeIBOIOQ7SU/rm0XZWPyQWth9rVDHyUM2WywncwxtWIP94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897535; c=relaxed/simple;
	bh=gnsSvX1EeAz0cJAg3U0Xq2xIlljRp9MEAQ0NlvSbDTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6fIHyPUynQT9asZ4yn7zYHye2OUeKzPIR3cQLkgSAJvdqL3W7YzuE30wyB5bm6Z4GfsrjzCwPCanhZTs/aaDYcmYU/yZS4l/tWCbIdwfBo4133PYdh+aZndysWCc60O+usdP0IDXsznFYIk2nhnrD83E9tNIAfbY3GaSBAcjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=df66R1Sa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="df66R1Sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A741F00893;
	Tue, 13 Oct 2026 13:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897534;
	bh=pJsWC0F37cxtb7/zl+Abz85n9FUulOcJmZTgcgFP3MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=df66R1SavOsbzI9fFtZaa6zg3JwDCkYvwZ774IWe5Q29qMCy4FwonjYXISJv67bNN
	 +hQH0uHR4FcJVtdBf/2d/+4xUdUNfsKb8ilq2JSl154wAZXoA1d3ZJSwfaWVeERwiz
	 VGet+tP1HgwYb1KjS6xaYLpanEO+Vh2yPlwloLZz/dYqYhBHWYqxjMCOhQ7khYtoVP
	 vR7WiFiX6/VVSshn2fd8nNWw9hz6oQ1uixtvX6GgK2yvDKlIE6hQbJx0gVjcItnZ9z
	 0ekm3xh7v0ZTylE0CqAmB50RwYLh4u5hof9MhYbFiqnYnxkk+x+hd1gmmId9uGvNkY
	 x+ouUAD7GDeiQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 12/53] MIPS: SGI-IP27: choose the node address layout at runtime
Date: Tue, 13 Oct 2026 15:16:32 +0200
Message-ID: <1e1fece5f99e35fa13de2b4a241e66b807171e3f.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Bedrock node owns twice the address space a Hub node does, putting
the nasid one bit higher. Take the shift and the node size from the
generation detected at boot; head.S runs before that and keeps Hub's
values.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/addrs.h     | 12 +++++++++++-
 arch/mips/include/asm/sn/sn0/addrs.h |  8 ++++----
 arch/mips/include/asm/sn/sn1/addrs.h | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/sn1/addrs.h

diff --git a/arch/mips/include/asm/sn/addrs.h b/arch/mips/include/asm/sn/addrs.h
index 51161fd5130b..499615abd501 100644
--- a/arch/mips/include/asm/sn/addrs.h
+++ b/arch/mips/include/asm/sn/addrs.h
@@ -20,7 +20,6 @@
 
 #if defined(CONFIG_SGI_IP27)
 #include <asm/sn/sn0/addrs.h>
-#elif defined(CONFIG_SGI_IP35)
 #include <asm/sn/sn1/addrs.h>
 #endif
 
@@ -39,6 +38,17 @@
 
 extern bool system_is_ip35;
 
+#define NASID_SHFT		(system_is_ip35 ? SN1_NASID_SHFT :	\
+				 SN0_NASID_SHFT)
+#define NODE_SIZE_BITS		(system_is_ip35 ? SN1_NODE_SIZE_BITS :	\
+				 SN0_NODE_SIZE_BITS)
+
+#else /* __ASSEMBLER__ */
+
+/* The entry paths run before prom_init() reads the hub's part number. */
+#define NASID_SHFT		SN0_NASID_SHFT
+#define NODE_SIZE_BITS		SN0_NODE_SIZE_BITS
+
 #endif /* __ASSEMBLER__ */
 
 
diff --git a/arch/mips/include/asm/sn/sn0/addrs.h b/arch/mips/include/asm/sn/sn0/addrs.h
index a28158a91ecf..f1a161913ae4 100644
--- a/arch/mips/include/asm/sn/sn0/addrs.h
+++ b/arch/mips/include/asm/sn/sn0/addrs.h
@@ -50,12 +50,12 @@
 
 #ifdef CONFIG_SGI_SN_N_MODE
 
-#define NODE_SIZE_BITS		31
+#define SN0_NODE_SIZE_BITS	31
 #define BWIN_SIZE_BITS		28
 
 #define NASID_BITS		9
 #define NASID_BITMASK		(0x1ffLL)
-#define NASID_SHFT		31
+#define SN0_NASID_SHFT		31
 #define NASID_META_BITS		5
 #define NASID_LOCAL_BITS	4
 
@@ -64,12 +64,12 @@
 
 #else /* !defined(CONFIG_SGI_SN_N_MODE), assume that M-mode is desired */
 
-#define NODE_SIZE_BITS		32
+#define SN0_NODE_SIZE_BITS	32
 #define BWIN_SIZE_BITS		29
 
 #define NASID_BITMASK		(0xffLL)
 #define NASID_BITS		8
-#define NASID_SHFT		32
+#define SN0_NASID_SHFT		32
 #define NASID_META_BITS		4
 #define NASID_LOCAL_BITS	4
 
diff --git a/arch/mips/include/asm/sn/sn1/addrs.h b/arch/mips/include/asm/sn/sn1/addrs.h
new file mode 100644
index 000000000000..58878a5b4710
--- /dev/null
+++ b/arch/mips/include/asm/sn/sn1/addrs.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SN1 (Bedrock) address space layout.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+#ifndef _ASM_SN_SN1_ADDRS_H
+#define _ASM_SN_SN1_ADDRS_H
+
+#ifdef CONFIG_SGI_SN_N_MODE
+
+#define SN1_NODE_SIZE_BITS	32
+#define SN1_NASID_SHFT		32
+
+#else /* !defined(CONFIG_SGI_SN_N_MODE), assume that M-mode is desired */
+
+#define SN1_NODE_SIZE_BITS	33
+#define SN1_NASID_SHFT		33
+
+#endif /* !defined(CONFIG_SGI_SN_N_MODE) */
+
+#endif /* _ASM_SN_SN1_ADDRS_H */
-- 
2.47.3

