Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD85208C0;
	Tue, 13 Oct 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897537; cv=none; b=JvRgiTH1DP1reVz1Zj44zlWc+Bvk5RUX62LQtWh7igDO2lviRnukGsvKOdivGEexPZs5fsXIUiF47pxpFc9YAogN/bXi8sV/d3zqCu/oJK7gIcLJbTggcwDJhMJnnsidAGBsqBJCFnUF2vB0QoEjm0Dw/b89ZZ00L/8efJi6ij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897537; c=relaxed/simple;
	bh=B2FapSIe8N1Oedi551wYlV52qptM7RcQdkXJu5nvAC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1tbAUAMgHSlg/v5Hijlvo+2EFblWt3zYuNxaw8L5dbnIQp3wnEZLefPuy3QNj5eTFREmBb5R/SDrVLKr4CDT0JlnRLRXF/T3mkD66SzFqa0WXS4hGYz/zK5TZwmh2l1CdXL1LZnk50ttNFKRHtSZzDqVrIoE9gLM+W8WC9BulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoMvdHXM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoMvdHXM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98791F000FF;
	Tue, 13 Oct 2026 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897536;
	bh=iH/8hmQyOGX0jfbxaglMdOcJozV6sth03oi/17Kmd0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AoMvdHXMvYQetK5Y57bKdAJv94RT+ojI1nNgXVR+Rung34leRPxALVdb9hKgMkBdr
	 ukznLVqzmEpDSumpmHMgbWusNiSMbXIE1JZOXKD/CwlLYdT8fI+PjdXx26cwfhY2iE
	 l2Kmbg0yXBGgSnG4pmogdYiazdPNbIHFilB66YUu6Xa7pIZ6gQK9fn2A9A5WLKzz7o
	 NZrrtobd/l8YsliBLwfgmouTWGpR9gXY5my0GwqxI6qyJBSv1Tzeh+fbBPqKNcimxF
	 kkKkRrVyEhgIH56ba0sPmJweEB2hB9NsHDgKlo1+eK5Ak+gAstQGY7EaK4875QhCTq
	 HQ6jUvzPql5Wg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 13/53] MIPS: SGI-IP27: add the Bedrock hub register windows
Date: Tue, 13 Oct 2026 15:16:33 +0200
Message-ID: <b7cfc6e2171c2fdbda2b37fb2b9d3816c297b42c.1791890466.git.kaloz@kernel.org>
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

Bedrock places its hub register blocks at different offsets than Hub
does. Add a header for them and include it next to the Hub one, since
one kernel has to reach either generation's blocks.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/agent.h   |  3 +--
 arch/mips/include/asm/sn/sn1/hub.h | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/sn1/hub.h

diff --git a/arch/mips/include/asm/sn/agent.h b/arch/mips/include/asm/sn/agent.h
index 7e9b3271737a..8873eb34e31b 100644
--- a/arch/mips/include/asm/sn/agent.h
+++ b/arch/mips/include/asm/sn/agent.h
@@ -16,9 +16,8 @@
 
 #if defined(CONFIG_SGI_IP27)
 #include <asm/sn/sn0/hub.h>
-#elif defined(CONFIG_SGI_IP35)
 #include <asm/sn/sn1/hub.h>
-#endif	/* !CONFIG_SGI_IP27 && !CONFIG_SGI_IP35 */
+#endif /* CONFIG_SGI_IP27 */
 
 /*
  * NIC register macros
diff --git a/arch/mips/include/asm/sn/sn1/hub.h b/arch/mips/include/asm/sn/sn1/hub.h
new file mode 100644
index 000000000000..db41bcb3d34a
--- /dev/null
+++ b/arch/mips/include/asm/sn/sn1/hub.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SN1 (Bedrock) hub register windows.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+#ifndef _ASM_SN_SN1_HUB_H
+#define _ASM_SN_SN1_HUB_H
+
+#define HUBLBBASE_IP35		0x00600000
+#define HUBNIBASE_IP35		0x00680000
+#define HUBXBBASE_IP35		0x00700000
+#define HUBMDBASE_IP35		0x00780000
+
+#endif /* _ASM_SN_SN1_HUB_H */
-- 
2.47.3

