Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D64DC7EE23
	for <linux-mips@archiver.kernel.org>; Mon,  5 Jun 2023 15:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbjFEPBl (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 5 Jun 2023 11:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbjFEPBf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Jun 2023 11:01:35 -0400
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA5C7A7;
        Mon,  5 Jun 2023 08:01:32 -0700 (PDT)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
        by smtp.dudau.co.uk (Postfix) with SMTP id B97EE41D13A6;
        Mon,  5 Jun 2023 16:01:30 +0100 (BST)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation); Mon, 05 Jun 2023 16:01:30 +0100
From:   Liviu Dudau <liviu@dudau.co.uk>
To:     =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Liviu Dudau <liviu@dudau.co.uk>
Subject: [PATCH v3 0/2] mips: dts: ralink: Add support for TP-Link HC220 G5 v1 board
Date:   Mon,  5 Jun 2023 16:01:12 +0100
Message-Id: <20230605150114.601102-1-liviu@dudau.co.uk>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add device tree and bindings for the TP-Link HC220 G5 v1 wireless AP,
a consumer product from TP-Link based on MT7621.

Changes since v2:
 - Remove WIP nodes for NAND flash that accidentally got included in v2
 - Fix commit message with the actual 5GHz WiFi chip name
 - Remove gmac and mdio nodes from device tree as defaults are sufficient
 - Added sub-nodes under pcie for each of the WiFi chip with appropriate
   compatible string.
 - Collect Acks received for the device tree bindings patch

Changes since v1:
 - Changed compatible for the board to "tplink,hc220-g5-v1"
 - Updated the DSA switch nodes to better reflect actual usage.
 - Disabled the fixed-link in gmac1
 - Added device tree bindings in Documentation/

v2: https://lore.kernel.org/linux-mips/20230529150833.526084-1-liviu@dudau.co.uk/
v1: https://lore.kernel.org/linux-mips/20230509200125.309026-1-liviu@dudau.co.uk/

Liviu Dudau (2):
  mips: dts: ralink: Add support for TP-Link HC220 G5 v1 board
  dt-bindings: mips: Add bindings for TP-Link HC220 G5 v1 board

 .../devicetree/bindings/mips/ralink.yaml      |  1 +
 arch/mips/boot/dts/ralink/Makefile            |  3 +-
 .../dts/ralink/mt7621-tplink-hc220-g5-v1.dts  | 92 +++++++++++++++++++
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dts

-- 
2.40.1

