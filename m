Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4A5172EA;
	Tue, 13 Oct 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897598; cv=none; b=l7PYcXKp09EVOqvYZT1BuNO8PBfe0YwvasqI+baRjVvr//Alu51b9HDNbfpzywFkfWax+Ngevd8r6B+uuwx5uBt/YX8wj4hbYTMXLx9kdRNDwZJIhCH8lqGeMfROHJsD3Ivkk6sJ+U2V2eRO95OtuirE3zlXf6zbcAldhcuFTLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897598; c=relaxed/simple;
	bh=QhJ5+eaRfcB6wbhoRyCx16YfAS7qNa5zyoqoQnncbXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJY9L79bGrZwks5l/Foets48gaLn+vnRlVBwLZgQz6CPX1cK3OTNEycvioOA/mzRIWydNtBxMoVstnwc1cPrEI69lTHsFsGjNcFW7fCwUcLCYxh2h9/mWRvKktGJjFdZcZ8Jukvn+82EXCHyzgZq4fvvpaZ0l2PSpVPpzUt1+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0145Uqr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0145Uqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9DA1F000FF;
	Tue, 13 Oct 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897597;
	bh=NvP/VjVpmiE5AbNgBRdIdcviFuM7yakYB1BMGN2ENt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b0145UqroQjFzK836QRqz/wbciW12jiu3Z7boZCtReW72+tEgvFRCtfnwbO6wwb1M
	 jWqEKVMg1i6Ar7+66qkKkL9BAA69IbGnSUIuRorWsSDU3rnLOt44c+Zez2fHetxtpK
	 tuhe4mtQk3BWQ7+T2IUUCuVsxFzIvY31DJ8HVCNnqhxhv79GVwvHzbfXpPhxiwZF94
	 oioqSY13cUE66eNrFm+yNn2q9IZB4/fSqHL8gyHIVwNASfI/Ru2OtDM0z93cVEVQh4
	 4QTia9oJsh/mw6NCd91qUKTdlab/uwyVhXt+Sisn0bseQTxyA8hdfNOjmXAZpTl+IL
	 Ud5P2Sh3PrZpQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 42/53] MIPS: SGI-IP27: register the Odyssey graphics widget
Date: Tue, 13 Oct 2026 15:17:02 +0200
Message-ID: <c07197a87a2ebac4231b02d97e1942b689687b73.1791890466.git.kaloz@kernel.org>
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

The Odyssey (VPro) graphics widget is a direct xtalk widget with no PCI
bridge in front of it, so it needs a platform_device of its own rather
than piggybacking on bridge_platform_create(). Its register aperture is
the widget's small window, and the sgi-odyssey DRM driver binds it.
The driver programs the board with the widget id of its master hub,
passed as the u32 property "sgi,master-widget".

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-xtalk.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index 091186cb7a04..b56e70db20cf 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -7,9 +7,11 @@
  * Generic XTALK initialization code
  */
 
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/smp.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/platform_data/sgi-w1.h>
 #include <linux/platform_data/xtalk-bridge.h>
 #include <asm/sn/addrs.h>
@@ -24,6 +26,9 @@
 #define PXBOW_WIDGET_PART_NUM	0xd100	/* PXbow */
 #define BASE_XBOW_PORT		8     /* Lowest external port */
 
+/* Odyssey's register aperture, as sized by the sgi-odyssey driver. */
+#define ODYSSEY_REG_SIZE		0x00410000
+
 enum xtalk_bridge_type {
 	XTALK_BRIDGE,
 	XTALK_XBRIDGE,
@@ -167,6 +172,37 @@ static void bridge_platform_create(nasid_t nasid, int widget, int masterwid,
 	return;
 }
 
+static void odyssey_platform_create(nasid_t nasid, int widget, int masterwid)
+{
+	const struct property_entry props[] = {
+		PROPERTY_ENTRY_U32("sgi,master-widget", masterwid),
+		{ }
+	};
+	struct resource res;
+	struct platform_device_info info = {
+		.name = "sgi-odyssey",
+		.id = PLATFORM_DEVID_AUTO,
+		.res = &res,
+		.num_res = 1,
+		.properties = props,
+	};
+	struct platform_device *pdev;
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
+	pdev = platform_device_register_full(&info);
+	if (IS_ERR(pdev))
+		pr_warn("xtalk:n%d/%x odyssey platform device registration failed: %ld\n",
+			nasid, widget, PTR_ERR(pdev));
+}
+
 static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 {
 	widgetreg_t		widget_id;
@@ -190,6 +226,9 @@ static int probe_one_port(nasid_t nasid, int widget, int masterwid)
 		bridge_platform_create(nasid, widget, masterwid,
 				       XTALK_PIC_BUS1);
 		break;
+	case WIDGET_ODYS_PART_NUM:
+		odyssey_platform_create(nasid, widget, masterwid);
+		break;
 	default:
 		pr_info("xtalk:n%d/%d unknown widget (0x%x)\n",
 			nasid, widget, partnum);
-- 
2.47.3

