Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2015FC433E0
	for <linux-mips@archiver.kernel.org>; Thu, 25 Feb 2021 16:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D660E64EDB
	for <linux-mips@archiver.kernel.org>; Thu, 25 Feb 2021 16:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhBYQ5Z (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:57:25 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:56103 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbhBYQ45 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Feb 2021 11:56:57 -0500
Received: from buildfff.adridolf.com ([178.26.242.49]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MYNeM-1lJ7Fy0K0Y-00VNeJ; Thu, 25 Feb 2021 17:54:24 +0100
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: octeon: add explicit interface setup on E200
Date:   Thu, 25 Feb 2021 17:52:58 +0100
Message-Id: <20210225165258.43995-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bq0NhoEmY4IF9mQbFZdBTY2JQr1e0sRIwTsPSglfhisrKh62pME
 30wOtsyhzrmZ1a+zOrOPIa77DJIqC+7dBdflMOi9xsdmKdpq0FPTS/KKo/Q5oVTAacBwpce
 EbSnkiU8Hpnz0s1o+mvC9JuIEFOOHmzUAup2dMdxkFChQ6TyR/Sjno6coLP3D2ZwKE1dVq6
 IiqJvynyvIx9Oa8s1w23A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bzp0z3NFj3M=:36xXva32cM5BJPv4XWKhFf
 DlSs/FgP+EkCLbr5XsiXpgkencXwSqCV+GdYPiHmDBNL9B89mA3tipggMlDw71ntJZCVpuX59
 rH34X7nEwmWbcZgbl6/k3dJ8eukTH+ZTqm4ijmFf0EEhI3PdQEsEbZeSOlVCHKv34tSz+6Xap
 lT9AakYh2jIrsnFJSOvFyw4hehP/IPTe3i/SREndygp3dbd9QUiD665TKYeF69QREjXUjoswv
 aT/mcZ92uFuw1bQsd2oYVCFJCmt6RXssGvHQQxvOtajBHoBPCD7efmNbztmK581R6/qcp/vYk
 rKdIx29GeuJqqKmLkj/ZS3UAYVibmIc7LZ/rw+6M/Lc//CaiirTcJa4Cz7ogDBgKEu0515p+4
 nrFKrF6ClGUW17wuQOJsCKf2nsaaQyGtMi3JYjStlHalij7UZciIMttGwSWLOWxomw3FZO7pt
 yOyseV2eKg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Define the device explicitly instead of having it fall into the
"unknown board" default.

The board is already present in cvmx-bootinfo.h.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-board.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
index abd11b7af22f..ce9d2553537e 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-board.c
@@ -174,6 +174,8 @@ int cvmx_helper_board_get_mii_address(int ipd_port)
 			return 7 - ipd_port;
 		else
 			return -1;
+	case CVMX_BOARD_TYPE_UBNT_E200:
+		return -1;
 	case CVMX_BOARD_TYPE_KONTRON_S1901:
 		if (ipd_port == CVMX_HELPER_BOARD_MGMT_IPD_PORT)
 			return 1;
-- 
2.20.1

