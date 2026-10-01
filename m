Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A8A53A8A5;
	Thu,  1 Oct 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871272; cv=none; b=HCjElIK4Izn3yQcRhQgqyHAMKdgDhh+JgG7m3b9jAJRiqOXVoSGUzJorf6BHrf7LRxoKZpqLUcB0rXQbsllBj58D+qPn3GiHgHxBFSqeIukRKhIp/xSNrwIDuhppUkoai7LYdSMHQt/V0bkh18+8VtnBPV2HB1rUEsJMZ0DsbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871272; c=relaxed/simple;
	bh=9FQkuVRPScOHIjgDsfakaQ7CXUQClm4+K8KbUcc1Km8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FD9AfisVKzN3Fr2Y+RTGv3lrPFTsTtQ5/4CQjDKUJVmwMRKTSg5giTVgn1Cg+KjBvSTRE86wYf1qpn8NyW68Qr8IMrWx5kKzpICmK/Pgx5yAmat35tXsowEQFEOkZ5kY93tXUTvb7DP0qBSFXMn70aq5Y/6qQgUI1VXmSW+uqO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlX1aOVA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlX1aOVA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B574E1F00899;
	Thu,  1 Oct 2026 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871270;
	bh=yu28z5q7htKZGOUCFtmYgekCRr60RRlX9/QQOmtTmIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GlX1aOVArYBJ82ABBQKWj8pmgNlMLMts0+J/AF36Ov7zD1gkAry0D8b+SFvtAiak8
	 WoE9OvLg/Xot4Wc9/RuYX4eOV+pxR0Fya/NAc0cM4SyrctvsZxLor92FOzRpwy91K5
	 kevasgbW600sIeFL/2QzgAL3dz5Ay+OdzfFIjPc7oUMGV0UVyhPT7/wxaHSzv+adr6
	 O+J0N1RRh5rybFCh6R10YfbdV8+s0BfjP6zxu63VnJvra97Suk3RTDJ3axOEs624Qy
	 C/zEOrXE0QF91MOcqMGQ0KUKWuX+mPnU54dGF91Z5PRDZGVm4pFvOpNBpzlzjbrVed
	 wzSd4sIQUXJFA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 36/38] MIPS: SGI-IP27: register the Odyssey graphics widget
Date: Thu,  1 Oct 2026 18:12:11 +0200
Message-ID: <86cc52919404c48d6a5d4666f752c0725c38a83a.1790857966.git.kaloz@kernel.org>
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

The Odyssey (VPro) graphics widget is a direct xtalk widget with no PCI
bridge in front of it, so it needs a platform_device of its own rather
than piggybacking on bridge_platform_create(). Its register aperture is
the widget's small window, and the sgi-odyssey DRM driver binds it.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-xtalk.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 091186cb7a04..b754bbb3ca33 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -7,6 +7,7 @@
  * Generic XTALK initialization code
  */
 
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/smp.h>
 #include <linux/platform_device.h>
@@ -24,6 +25,9 @@
 #define PXBOW_WIDGET_PART_NUM	0xd100	/* PXbow */
 #define BASE_XBOW_PORT		8     /* Lowest external port */
 
+/* Odyssey's register aperture, as sized by the sgi-odyssey driver. */
+#define ODYSSEY_REG_SIZE		0x00410000
+
 enum xtalk_bridge_type {
 	XTALK_BRIDGE,
 	XTALK_XBRIDGE,
@@ -167,6 +171,27 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
 	return;
 }
 
+static void odyssey_platform_create(nasid_t nasid, int widget)
+{
+	struct platform_device *pdev;
+	struct resource res;
+
+	memset(&res, 0, sizeof(res));
+	res.name = "sgi-odyssey";
+	res.start = NODE_OFFSET(nasid) + (widget << SWIN_SIZE_BITS);
+	res.end = res.start + ODYSSEY_REG_SIZE - 1;
+	res.flags = IORESOURCE_MEM;
+
+	pr_info("xtalk:n%d/%x odyssey widget: reg=[%pa-%pa]\n",
+		nasid, widget, &res.start, &res.end);
+
+	pdev = platform_device_register_simple("sgi-odyssey",
+					       PLATFORM_DEVID_AUTO, &res, 1);
+	if (IS_ERR(pdev))
+		pr_warn("xtalk:n%d/%x odyssey platform device registration failed: %ld\n",
+			nasid, widget, PTR_ERR(pdev));
+}
+
 static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 {
 	widgetreg_t		widget_id;
@@ -190,6 +215,9 @@ static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 		bridge_platform_create(nasid, widget, masterwid,
 				       XTALK_PIC_BUS1);
 		break;
+	case WIDGET_ODYS_PART_NUM:
+		odyssey_platform_create(nasid, widget);
+		break;
 	default:
 		pr_info("xtalk:n%d/%d unknown widget (0x%x)\n",
 			nasid, widget, partnum);
-- 
2.47.3

