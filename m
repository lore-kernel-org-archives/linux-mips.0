Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD743E008F;
	Thu,  1 Oct 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871219; cv=none; b=g6FNWx/5oIfGakkJ0Ztkpsm6b/m6XIb3uNnSwPasVaTIjjWOfAjZLeetDLHF72e/mgARvVqKCYFHX0kNF0XoNBA73B2CwhyxdidIdkNXpZ0hTwcrliqs7IlESJUzibGez/QX4/826Ql/BNyx+Ua8ncBEYdsFMdS4+CtjyNimfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871219; c=relaxed/simple;
	bh=B2FapSIe8N1Oedi551wYlV52qptM7RcQdkXJu5nvAC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4kuhizsYHZMDnWDXUdbFapnSqcl+XHDRm/R2O16fbfYGdGms00l9RP3f9pnODfUF46Ww9vLJjkbOK0A+DeSR7QYF6gAiToNeDuX4iFXQC5SFl+gpIAEW/G1s8Ai4JQGrL4ndxWyvt1ZgYtsW3BaeEnbJy+ZjBAqXJiVUAycE0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejlaHyTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejlaHyTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4DF1F00898;
	Thu,  1 Oct 2026 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871217;
	bh=iH/8hmQyOGX0jfbxaglMdOcJozV6sth03oi/17Kmd0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ejlaHyTmFKCNe5DOmJIWFl11qy7NOOfOsUPuTRGinMIqwr60xewyaWZMbd4uGu+2g
	 PtEWPupQB/aItth+K5EmqWVon5M0YfFxUPQjsv6E3t2DeTvOqynzNQE/907H/3D7Oa
	 69aIxpcrblzLJJFEn+WsvBfBJIFyxX75uFaXXJ8Nk+Mkvc0Myuo0ukgjPAd+7V7LKD
	 YsTfK65HfXsPXRkHpa8J1fbYYiNVNbWOmp8dxTy0Kc5NP5L+1+/sfJjg+Bfi2bGewy
	 X/MJva4kqNKg/bdsLIOSj5QxF0HCneLfWssYtxo6Wbb+mWWKpCihFkpRxr33mHauPA
	 tjrayhudd4Ktw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/38] MIPS: SGI-IP27: add the Bedrock hub register windows
Date: Thu,  1 Oct 2026 18:11:43 +0200
Message-ID: <749f98c4cb920ed65340dd5c1b1d1ae20bf53eba.1790857966.git.kaloz@kernel.org>
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

