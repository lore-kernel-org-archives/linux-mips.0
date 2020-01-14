Return-Path: <SRS0=x8rk=3D=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3013C3F68F
	for <linux-mips@archiver.kernel.org>; Tue, 14 Jan 2020 08:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B16E92084D
	for <linux-mips@archiver.kernel.org>; Tue, 14 Jan 2020 08:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgANIzv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 14 Jan 2020 03:55:51 -0500
Received: from mx2a.mailbox.org ([80.241.60.219]:33423 "EHLO mx2a.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbgANIzv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jan 2020 03:55:51 -0500
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id C82BCA190C;
        Tue, 14 Jan 2020 09:48:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id 3zG1dFLUe3yx; Tue, 14 Jan 2020 09:48:08 +0100 (CET)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 1/3] MIPS: ralink: dts: mt7628a.dtsi: Add WMAC DT node
Date:   Tue, 14 Jan 2020 09:48:04 +0100
Message-Id: <20200114084806.2420-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

This patch adds the WMAC controller description to the MT7628A dtsi file.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: John Crispin <john@phrozen.org>
Cc: Felix Fietkau <nbd@nbd.name>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 742bcc1dc2e0..892e8ab863c5 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -285,4 +285,14 @@ ehci@101c0000 {
 		interrupt-parent = <&intc>;
 		interrupts = <18>;
 	};
+
+	wmac: wmac@10300000 {
+		compatible = "mediatek,mt7628-wmac";
+		reg = <0x10300000 0x100000>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <6>;
+
+		status = "disabled";
+	};
 };
-- 
2.25.0

