Return-Path: <SRS0=K/D6=4J=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F3CC35643
	for <linux-mips@archiver.kernel.org>; Fri, 21 Feb 2020 08:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF2B0206ED
	for <linux-mips@archiver.kernel.org>; Fri, 21 Feb 2020 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582274573;
	bh=3wGW2BrunnOgr3U/ABE1pDq4qPc9Y4WepmDP45PXgNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gaRNOre/wURi7ITQM5L7cgqaHImmi2sNTDWBTPdY3RWHbv1e7DHO1hBkNtJij8gji
	 cMY5AnH1GLIf/+h/9d6fjDyXtXVUiZ313MUE3ZxzEojIaNmb1OjcsX+CPQplzBR3l2
	 41Z/eAV2v7bWjK7u6Rt5nAq5LPcToHDjIPzpO1nU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbgBUHyf (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 21 Feb 2020 02:54:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:53150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728982AbgBUHye (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 02:54:34 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B73420801;
        Fri, 21 Feb 2020 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582271673;
        bh=3wGW2BrunnOgr3U/ABE1pDq4qPc9Y4WepmDP45PXgNs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZRFA/JsEmfsAe394jOTZlqCMki/oGjoMzWvf0f6ByHptMbYbfe+TI1S5uA4iMGiuN
         I56msRjAJOZtjsxhYJx19/ru1b/FHYnqPnuTViBhdkNlY9WSx7/5PrJWiFJbQMtIl7
         eq3QIhrgh/V0OIR7sYfIQIxwG1crsjU7OOErTnZI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Stefan Roese <sr@denx.de>, Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.5 255/399] MIPS: ralink: dts: gardena_smart_gateway_mt7688: Limit UART1
Date:   Fri, 21 Feb 2020 08:39:40 +0100
Message-Id: <20200221072427.201790516@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221072402.315346745@linuxfoundation.org>
References: <20200221072402.315346745@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

[ Upstream commit e8c192011c920517e5578d51c7aff0ecadd25de3 ]

The radio module asserts CTS when its RX buffer has 10 bytes left.
Putting just 8 instead of 16 bytes into the UART1 TX buffer on the Linux
side ensures to not overflow the RX buffer on the radio module side.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>
Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index aa5caaa311047..aad9a8a8669b4 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -177,6 +177,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinmux_i2s_gpio>;		/* GPIO0..3 */
 
+	fifo-size = <8>;
+	tx-threshold = <8>;
+
 	rts-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 	cts-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 };
-- 
2.20.1



