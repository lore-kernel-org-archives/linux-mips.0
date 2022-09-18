Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B206BC32771
	for <linux-mips@archiver.kernel.org>; Sun, 18 Sep 2022 13:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiIRNnh (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 18 Sep 2022 09:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiIRNm7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Sep 2022 09:42:59 -0400
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C121BEA4;
        Sun, 18 Sep 2022 06:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663508532; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Y8lz5OSHnvWNMv/9SNeKDxokC1miZ+UMFh1opkM1PlIdL7lOhCC0W2K/oWL1XByaXkz8JNx5huM0jxiA8sfgVAETv3+Rg7h3mbo1Du015zZnVhJaVshzFuF8lsRKaHWnTCsre4B4L/X3E3XQ2N7trORfsy9HA4SY0wQJ3cYnNcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1663508532; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=O2yms1NUcTx1ATzzwCxouyoVgYhixhkktLfolcgVszw=; 
        b=ApOOLLKL68rq1GfsTE7LsTjYM2y37Yj9GDUR/7/jGuXEZ/AkLmv2cJ9RYUetiJ0IUCeRp54RJbo7u2b6tJQcSQJ8gBf/xCEVakXc1DvMr7eWKfg52WVoBGA1QQhzCHsoryEiyZgu9LOCBVm9Fr36Bouxz+OvNzxCWn6baamWizg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663508532;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=O2yms1NUcTx1ATzzwCxouyoVgYhixhkktLfolcgVszw=;
        b=Gk8SSgQNrZq9Gd3JYdK6s8MMpM9KeJFYeciVvf9QtXeUMcw7kEGuwHfgJtNWNYZO
        /Itv2ge+6i7BunFYEbW2SKlExa7IhjNTZTInJVY9zc9Rqv0Q2//ZE4e8tqncaBxYluv
        kd1+ASXwwDm/UtNf+3iRwhnop4eabHfxewXbCOcw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
        with SMTPS id 1663508530679320.3713107847668; Sun, 18 Sep 2022 06:42:10 -0700 (PDT)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        erkin.bozoglu@xeront.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v3 net-next 07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
Date:   Sun, 18 Sep 2022 16:41:15 +0300
Message-Id: <20220918134118.554813-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Change phy-mode of gmac1 to rgmii on mt7621.dtsi. Same code path is
followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index c0529e939a31..3d4a8e4bd4f8 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -333,7 +333,7 @@ gmac1: mac@1 {
 			compatible = "mediatek,eth-mac";
 			reg = <1>;
 			status = "disabled";
-			phy-mode = "rgmii-rxid";
+			phy-mode = "rgmii";
 		};
 
 		mdio: mdio-bus {
-- 
2.34.1

