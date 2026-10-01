Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142D421237;
	Thu,  1 Oct 2026 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871210; cv=none; b=W1hCf/wzh8TfPmybRuNR88ALwSaQmBklAlAI47MbelFFMqUXv5onB1p2R0scrKbS/J/IKPchBOUzM/16Sh/E9nmVH+8IAbol18iYYCXAsf4AQYuibXDRK2s9mk1IW8tGMH4k4tLE1rt7t+wC3iJEbb6gC01OGNdSMZMHbU0bkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871210; c=relaxed/simple;
	bh=WqwlH9QBd8ai+Ft2VtMqsJMZ85HIwRRf09XrZlgdHsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhskgijGEpYb//hKBATJ+mIAV/U8PA0PjhrRcST5Tw/RW6JI1g4kYb9Fx1r77Xq/xE8V99QJZHepdx2tyIQq8yD1jQ3FMJ3StzxHTjgXUgPtfFEPAET6IhYo0iehBPjZX4MDCT/LeXkiKNB35SrHM8gpoTBRXJZuwVm8uwiWQD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH8gncHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH8gncHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A651F000FF;
	Thu,  1 Oct 2026 16:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871208;
	bh=pHDQc2j6qj5LPopQ+H7d+cJyPrODCNBvmWAFRf5GgxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aH8gncHNyFUu7AtdLfFkjVSghsumSvHIkZqlDUWINpvJ49ooLdP7YWl5s1o0dxFv/
	 5fT+EqTquAIqmPDvcWIWuS3uCleG3aUk0eKi6d1+j0+SGiDJ7/3vPEEhqEwMunRgoX
	 Ac2IKVNoJtfB1XtAG8oHuE4apxYGKj8/KAplPC/igy0CS0dARNXLYrVoGV6M28vIRF
	 6rLAo6BP48EwVEzcqO7L0Ibk3v4LgnJKbyP9CpQPVNThyaEukCEvmh8NnqTf08zWOY
	 EyYdMwBa/0RPjo4G988RDeoDKPziru4dnm7/ayabpxhUzDqXHuxPuEErz6MLRnrnka
	 rEAdUU3GZp5kg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/38] MIPS: SGI-IP27: add REMOTE_HUB_PI_S()/REMOTE_HUB_PI_L()
Date: Thu,  1 Oct 2026 18:11:38 +0200
Message-ID: <5b13c77052cc8bb84217affb32f5a9bf984afffc.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hub generations split each hub's PI registers across two
subnode blocks instead of one, so a remote access needs a subnode
selector on top of REMOTE_HUB_ADDR()'s node selector. Passing
subnode 0 reduces the new form to plain REMOTE_HUB_L()/REMOTE_HUB_S().

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/addrs.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/include/asm/sn/addrs.h b/arch/mips/include/asm/sn/addrs.h
index 7c675fecbf9a..d5c7cfea7761 100644
--- a/arch/mips/include/asm/sn/addrs.h
+++ b/arch/mips/include/asm/sn/addrs.h
@@ -267,6 +267,27 @@
 
 #endif /* !__ASSEMBLER__ */
 
+/*
+ * Some hub generations split each hub's PI registers across two subnode
+ * blocks HUBPI_OFFSET apart; REMOTE_HUB_ADDR() always targets subnode 0.
+ */
+#define HUBPI_OFFSET		0x00200000
+
+#define REMOTE_HUB_PI_ADDR(_n, _sn, _x) \
+	(REMOTE_HUB_ADDR((_n), (_x)) + ((_sn) ? HUBPI_OFFSET : 0))
+
+#ifndef __ASSEMBLER__
+
+#define REMOTE_HUB_PI_PTR(_n, _sn, _x)	\
+	((u64 *)REMOTE_HUB_PI_ADDR((_n), (_sn), (_x)))
+
+#define REMOTE_HUB_PI_L(_n, _sn, _r)		\
+	__raw_readq(REMOTE_HUB_PI_PTR((_n), (_sn), (_r)))
+#define REMOTE_HUB_PI_S(_n, _sn, _r, _d)	\
+	__raw_writeq((_d), REMOTE_HUB_PI_PTR((_n), (_sn), (_r)))
+
+#endif /* !__ASSEMBLER__ */
+
 /*
  * Software structure locations -- permanently fixed
  *    See diagram in kldir.h
-- 
2.47.3

