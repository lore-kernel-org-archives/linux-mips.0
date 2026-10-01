Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580865328A9;
	Thu,  1 Oct 2026 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871244; cv=none; b=TLKRaO/0YSw+vu/qE69uIX4VZJcbicyoSrlTYLE7Jawos+9m7Pru9REe5n1K/kqY2XGEGqYMlyOMFQa5y9YBAePCsD27ivszZGl0MdYZBgtk4gJyc0wYwqA4WWHk2KzuwB4NlerQJYOyA786QNrTONyv62ew+Edl4VX4OWme8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871244; c=relaxed/simple;
	bh=GEJlmDjet5Wvlg1XrscE3PhMaSO6snNiTUmWty0CtYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJboKhJS5Z933R5FdZlcWNdDfFImqy3q+1rwjJVbcLB8gVe/5tDQItBJmVNM/t+MBoofG4vP+CQV8f8PTNsLP9TIkvUJojxrvLzEtmFq582aZQjm2JWds8gmmLl4gA3+Kyv3wrF89mPq9pi51OUXEhMNqVmEliGRd1C8rbZEIZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adMbjfY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adMbjfY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D7C1F00898;
	Thu,  1 Oct 2026 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871243;
	bh=PGIJKLAd9BQoYJjzJGnQWdvjdffH0nJ8G9xyOPufKZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=adMbjfY/5ytseUCXA1p/JZqvrsGHOkzCrHlMQjGoa6vqjgyrdcr74ax12lY2wPseU
	 VNQA9qk/29CjNocydoLIKScuHs6hJo4OAllftlHSCXLZgD7fiRUc0AnDv1Cqz+4mVH
	 twzipoiJgLMIXgfEA6u1UlnRIEXu7QumT1YIV0qPZZyqUwhcq23JISSCIpobNjgJtM
	 dmUH+eseL9SMtIHMFJ3wxY8H4u8FY5tfupKmizS3IOmZQmrVywyXQIu3BQCGb3I79e
	 w2HFZ8K+g3TlufIO+OJWBrxoO3XkiLz1Jjgo04HPLZqV2mqFyx84Jx+KuRSU/eLplI
	 UbRwqGuV1FoFg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/38] MIPS: SGI-IP27: recognize the PXBow crossbar
Date: Thu,  1 Oct 2026 18:11:57 +0200
Message-ID: <d8c8e80c754760b657ca3e9955fb6468a77089ba.1790857966.git.kaloz@kernel.org>
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

