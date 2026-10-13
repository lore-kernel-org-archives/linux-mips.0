Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C59522EF3;
	Tue, 13 Oct 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897566; cv=none; b=Gm9op5Lgp6mURschcO/nmwUjk2wOJYTVu3XU/FRYS8ZLyEG1084OvIYLQhz/LtfqfgvBVqYBN+I+0hVMQK0pI3asOCdnZu3leYzCwnP4YpFV6lxPsfRu5ceegD/p4F8HXWW1jJQpca+Y64d1csIPGPxSHvLmS83Tf9jr+sM93mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897566; c=relaxed/simple;
	bh=GEJlmDjet5Wvlg1XrscE3PhMaSO6snNiTUmWty0CtYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkG9dfb0hRqfVFnrMwwACE4X6c8vL2TcrSFTc7OKxW7e2wyqIq+HO5B9SwhGqBwTcxtqJhWorzKZpbN1g18ZSUhY+yBDVS6nyrn01sfnhC6+4J1whP1u3NfBAmmeja9XeXYNxedJMJQUBEgbajSdtkTsP1Nhv31Q/dP1CJ6WjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQeWaq97; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQeWaq97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129651F00898;
	Tue, 13 Oct 2026 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897565;
	bh=PGIJKLAd9BQoYJjzJGnQWdvjdffH0nJ8G9xyOPufKZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MQeWaq97zb1J1HUUCWIduYNXs98Zm2LK/WTQhQlB8bBzlp3nhJh5GbaLtycoqoeyQ
	 OR7vLs4fKkqcn60adrFNf0jd0zT7HD0VH+80N9Jh9OOfo523mNoG0lLTyEdufohdBj
	 DUflUwdfDsf/8AkhcEhbV+2QnT2p5Ab3UnUYEfpXFLeABbxwR7l50Co01rXFc4Y5zs
	 DzN/QbMm1NbgkYJc2JuqqjrmFTuUAFetRbsQa1Pxr7ROu5rxOGAjS4vGJRgDivoQeO
	 9uo4JzWvn0jieda8TUtW5p8Eh+d64PVVh+y8ND/G8q4pxcv2e0Dd96wBs1ahSHZGoM
	 K5CSlXR0/wtfA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 27/53] MIPS: SGI-IP27: recognize the PXBow crossbar
Date: Tue, 13 Oct 2026 15:16:47 +0200
Message-ID: <cc609ef8f5219f19093b5818702d5fd427dc99f2.1791890466.git.kaloz@kernel.org>
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

A Tezro's crossbar is a PXBow, widget part number 0xd100. Without
recognizing it, xtalk_probe_node() logs the widget as unknown and never
calls xbow_probe(), leaving every IO widget behind it unenumerated.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/xtalk/xwidget.h | 7 +++++++
 arch/mips/sgi-ip27/ip27-xtalk.c       | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/mips/include/asm/xtalk/xwidget.h b/arch/mips/include/asm/xtalk/xwidget.h
index 978877e8a090..6a98e87b4711 100644
--- a/arch/mips/include/asm/xtalk/xwidget.h
+++ b/arch/mips/include/asm/xtalk/xwidget.h
@@ -109,6 +109,7 @@
 #define WIDGET_BDRCK_PART_NUM	0xc110
 #define WIDGET_TPU_PART_NUM	0xc202
 #define WIDGET_XXBOW_PART_NUM	0xd000
+#define WIDGET_PXBOW_PART_NUM	0xd100
 #define WIDGET_XBRDG_PART_NUM	0xd002
 #define WIDGET_NULL_PART_NUM	-1
 
@@ -183,6 +184,12 @@ static const struct widget_ident widget_idents[] __initconst __maybe_unused = {
 		"xxbow",
 		{NULL, "1.0", "2.0", NULL},
 	},
+	{
+		WIDGET_XXBOW_MFGR_NUM,
+		WIDGET_PXBOW_PART_NUM,
+		"pxbow",
+		{NULL, "1.0", NULL},
+	},
 	{
 		WIDGET_XBRDG_MFGR_NUM,
 		WIDGET_XBRDG_PART_NUM,
diff --git a/arch/mips/sgi-ip27/ip27-xtalk.c b/arch/mips/sgi-ip27/ip27-xtalk.c
index bd2ac24452f5..105977316391 100644
--- a/arch/mips/sgi-ip27/ip27-xtalk.c
+++ b/arch/mips/sgi-ip27/ip27-xtalk.c
@@ -21,6 +21,7 @@
 
 #define XBOW_WIDGET_PART_NUM	0x0
 #define XXBOW_WIDGET_PART_NUM	0xd000	/* Xbow in Xbridge */
+#define PXBOW_WIDGET_PART_NUM	0xd100	/* PXbow */
 #define BASE_XBOW_PORT		8     /* Lowest external port */
 
 enum xtalk_bridge_type {
@@ -241,6 +242,7 @@ static void xtalk_probe_node(nasid_t nasid)
 		break;
 	case XBOW_WIDGET_PART_NUM:
 	case XXBOW_WIDGET_PART_NUM:
+	case PXBOW_WIDGET_PART_NUM:
 		pr_info("xtalk:n%d/0 xbow widget\n", nasid);
 		xbow_probe(nasid);
 		break;
-- 
2.47.3

