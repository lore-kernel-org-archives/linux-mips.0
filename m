Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812A528421;
	Tue, 13 Oct 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897594; cv=none; b=t+po5sPVAVtnDQGPogMdEh+4ow9hBZ7tIYO3dHu3OucXMvgVDLRC9cfw5rfLWgM1UMtpcoU9W/Up3qF/PL7P9YVoxekFeEl4Czt8947Auv1Hn8gqPjm8mt5Su3/TjqCkCfu/t9tkBDDVZQHBYTJo98DfvF/dMptglLJeXm+RA0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897594; c=relaxed/simple;
	bh=X8QD59jgFs9z/XcuwapVUFEIKoBzmbvXnF4hMM2zff8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzmskXsOgUQGhOWFu1q9oJ/cBccNBXqzJhpmr4pZXjw8XvoBHuRm9iJaB+3qCRLXh+HGXhbhBjXYKXXLEvAUJk229xvt/R4meDeLA88QY6u6izHkW/JxPAvoWd2a5e2vazcXGBlsaQhZcIVylk5hXakL43oNM6ungj3syRVhah4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faF2vfE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faF2vfE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426C1F000FF;
	Tue, 13 Oct 2026 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897593;
	bh=x06R1VONYwFuZZyqpZFDbKhu+kIOY50B4uQJP8aJJzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=faF2vfE2/bPSERJQAXXm1DdtWbTNjozXX6cgFVYGVCRHkUU8Pnye/4cWsmzs/DmR5
	 DsCW+uyn2xODNJ88IDqposrPwax8H5dVyKbsh8NPugpvmo1jpGJ3y2e5Fg8HXxXwJN
	 PEcRO+F8trsSo94xZ3ucBhndZ9g5jxDE6AD/qd4cqRhNqeheTTK1kiZLSuRhZCPApD
	 YMp5899+vhzHqHWEMsOgc4GD8twev/1hsB/GlORpNvLgbxWYCR6K3szk+jI9Nee4yv
	 AAPkYsCbV2AmVSxgDdnzjudSESZXyTHvixjpZXMT1MXMgCsCF00a+cxvnANIzwwiU9
	 SSs7EfKimYamw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 40/53] MIPS: SGI-IP27: report a Bedrock machine as SGI IP35
Date: Tue, 13 Oct 2026 15:17:00 +0200
Message-ID: <57291c586792815514825c9547dc5377eb9aa329.1791890466.git.kaloz@kernel.org>
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

get_system_type() answers "SGI Origin" on either hub generation, but a
Fuel or Tezro is no Origin. Return "SGI IP35" on a Bedrock hub and in
the node banner.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 15811fb3cdee..c92f1bef692e 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -111,7 +111,8 @@ void __init plat_mem_setup(void)
 	 * hub_rtc init and cpu clock intr enabled for later calibrate_delay.
 	 */
 	nid = get_nasid();
-	printk("IP27: Running on node %d.\n", nid);
+	pr_info("%s: Running on node %d.\n",
+		system_is_ip35 ? "IP35" : "IP27", nid);
 
 	p = LOCAL_HUB_L(PI_CPU_PRESENT_A) & 1;
 	e = LOCAL_HUB_L(PI_CPU_ENABLE_A) & 1;
@@ -150,7 +151,7 @@ void __init plat_mem_setup(void)
 
 const char *get_system_type(void)
 {
-	return "SGI Origin";
+	return system_is_ip35 ? "SGI IP35" : "SGI Origin";
 }
 
 static inline bool hub_is_bedrock(void)
-- 
2.47.3

