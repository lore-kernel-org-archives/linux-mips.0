Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C17C433B4
	for <linux-mips@archiver.kernel.org>; Wed, 14 Apr 2021 23:06:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4191E61090
	for <linux-mips@archiver.kernel.org>; Wed, 14 Apr 2021 23:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbhDNXHN (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 14 Apr 2021 19:07:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:55746 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233083AbhDNXHN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 19:07:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CDB3DAFF1;
        Wed, 14 Apr 2021 23:06:49 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v3 net-next 00/10] net: Korina improvements
Date:   Thu, 15 Apr 2021 01:06:37 +0200
Message-Id: <20210414230648.76129-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While converting Mikrotik RB532 support to use device tree I stumbled
over the korina ethernet driver, which used way too many MIPS specific
hacks. This series cleans this all up and adds support for device tree.

Changes in v3:
  - fixed usage of of_get_mac_address for net-next
  - use readl_poll_timeout_atomic in mdio_wait
  - return -ETIMEDOUT, if mdio_wait fails
  - added DT binding and changed compatible name to idt,3243x-emac

Changes in v2:
  - added device tree support to get rid of idt_cpu_freq
  - fixed compile test on 64bit archs
  - fixed descriptor current address handling by storing/using mapped
    dma addresses (dma controller modifies current address)

Thomas Bogendoerfer (10):
  net: korina: Fix MDIO functions
  net: korina: Use devres functions
  net: korina: Remove not needed cache flushes
  net: korina: Remove nested helpers
  net: korina: Use DMA API
  net: korina: Only pass mac address via platform data
  net: korina: Add support for device tree
  net: korina: Get mdio input clock via common clock framework
  net: korina: Make driver COMPILE_TESTable
  dt-bindings: net: korina: Add DT bindings for IDT 79RC3243x SoCs

 .../bindings/net/idt,3243x-emac.yaml          |  82 +++
 arch/mips/rb532/devices.c                     |   5 +-
 drivers/net/ethernet/Kconfig                  |   3 +-
 drivers/net/ethernet/korina.c                 | 601 +++++++++++++-----
 4 files changed, 519 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/idt,3243x-emac.yaml

-- 
2.29.2

