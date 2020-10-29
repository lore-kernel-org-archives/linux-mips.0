Return-Path: <SRS0=hvK6=EE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E82DC55179
	for <linux-mips@archiver.kernel.org>; Thu, 29 Oct 2020 15:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1676220838
	for <linux-mips@archiver.kernel.org>; Thu, 29 Oct 2020 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603986268;
	bh=H+xEBaO0CT0OnM0Gp9IPj8uidP4ntKSlexcFdKnRMpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BhUEf6on1jRtIjo1JARezE8m5wBuVWvkTAH1ZLhpa+bA63Akwck/WV5COfnjUj1w+
	 PHKlaEjxRZlqkKHHCGXsh62DlAnPKMWFWgUymD0Vw1JacliBupcOq/L3yYVDESQG4O
	 a8Of5aPsuY25Vz7HmMLZg/v8OU4tOPEoE56tk4eU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgJ2PoZ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 29 Oct 2020 11:44:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:52860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728415AbgJ2PoY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 11:44:24 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E09A2087E;
        Thu, 29 Oct 2020 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603986263;
        bh=H+xEBaO0CT0OnM0Gp9IPj8uidP4ntKSlexcFdKnRMpc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SwBAzvRWVNakVgcxniyGTLOA0UGRpjMw/mzul4V25zqRGNU8T0UhPqPJD/ZMhy5iX
         iJESmRyf61NVs1kAX6D3maKH0QWOGISwqDOOnIntO0/W18vaVOYZ4dglI5dQQi18Nr
         x4kzlbsb5ZR1gTRz7A3y/un77mNibExtqN7IcNUc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH v2 2/2] MAINTAINERS: Add linux-mips mailing list to JZ47xx entries
Date:   Thu, 29 Oct 2020 16:44:14 +0100
Message-Id: <20201029154414.25852-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201029154414.25852-1-krzk@kernel.org>
References: <20201029154414.25852-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The entries for JZ47xx SoCs and its drivers lacked MIPS mailing list.
Only MTD NAND driver pointed linux-mtd.  Add linux-mips so the relevant
patches will get attention of MIPS developers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Paul Cercueil <paul@crapouillou.net>

---

Changes since v1:
1. Do not update DMA driver entry
2. Add ack
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cbab64364ab3..7455ef1f7bb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8668,11 +8668,13 @@ F:	samples/bpf/ibumad_user.c
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	drivers/mtd/nand/raw/ingenic/
 
 INGENIC JZ47xx SoCs
 M:	Paul Cercueil <paul@crapouillou.net>
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
 F:	arch/mips/generic/board-ingenic.c
-- 
2.25.1

