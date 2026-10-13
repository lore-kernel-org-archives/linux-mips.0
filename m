Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D151E439;
	Tue, 13 Oct 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897527; cv=none; b=SJ1lF428j2UyXmfp4W6aAy08BqCcDarsaRouZ3xRicZzNlBkmw5O0rMchpRTV7p+jlEq9lX6Yx+IVzrROrPC0t6qppCTNCRYdsH/yWosVaWc0UL+j2lTSmyGZ/PAAbx3HhErmFoTsnmWwYihJ8fTm0R7svn2jyVSgvLgSfzn7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897527; c=relaxed/simple;
	bh=WqwlH9QBd8ai+Ft2VtMqsJMZ85HIwRRf09XrZlgdHsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaXpHHpq3tSsTQja4gwCZI0SVouXM8COmU08m5t0m0OSdYWLjMUYcL0r/T7fxy5Goko5KgljOi+8avlDViphxPRuZ91ibLuwBAhIcIVrc7d4Nl2wh17Gqa9ASv7Nu+dojjDaGLzaPOR+DUKXSUTzC2oKMLHB5rojq6dqeFPsn5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWmMGozG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWmMGozG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8201F00893;
	Tue, 13 Oct 2026 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897526;
	bh=pHDQc2j6qj5LPopQ+H7d+cJyPrODCNBvmWAFRf5GgxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UWmMGozG2E4mNmeOdN/XM2ytd2WRAmYAstL01EUjZCGQbsbIP37EPbTvssL0PsAju
	 WAqRuLG7SMhxeNcOnFVxHj9pxq+QkIh5D0IryILWL2rrsS1/NE33Fr38KQA7OUIkGg
	 BNkowPlfGt6xlcKygV907ybux6Isvga9mNb/jlZNEoSvUkguh/171371qCv/hEn2zR
	 l4Hg2UdvFE1M6D/kf9czSM28be92o8Gvnorw1kqEg4bP+UF01GCVEbbKDlUxQbpD9e
	 h9wIujWag8AgaZynuZ1ob3bDk+vU/POfJeY/ZypoDDsGFEXGQIQ9/UpazViSDhBrhK
	 q0zuSjIs9RK+w==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 08/53] MIPS: SGI-IP27: add REMOTE_HUB_PI_S()/REMOTE_HUB_PI_L()
Date: Tue, 13 Oct 2026 15:16:28 +0200
Message-ID: <387a07b160b11e5f449d4d588a58efcfe96d9830.1791890466.git.kaloz@kernel.org>
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

