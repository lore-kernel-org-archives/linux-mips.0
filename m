Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC27C433E8
	for <linux-mips@archiver.kernel.org>; Sun, 21 Mar 2021 19:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DF636194C
	for <linux-mips@archiver.kernel.org>; Sun, 21 Mar 2021 19:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhCUT4Q (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 21 Mar 2021 15:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhCUTzr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Mar 2021 15:55:47 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3F873C061574;
        Sun, 21 Mar 2021 12:55:47 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 919CA9200B3; Sun, 21 Mar 2021 20:55:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 8B25692009B;
        Sun, 21 Mar 2021 20:55:46 +0100 (CET)
Date:   Sun, 21 Mar 2021 20:55:46 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/2] MIPS: SiByte: Enable pata_platform with SWARM
 defconfig
In-Reply-To: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2103212043480.21463@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2103212028360.21463@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable support for the onboard PATA PIO mode3 interface, which is one of 
the boot devices supported by the CFE firmware with the Broadcom SWARM 
board.  Include disk, CD-ROM and generic storage drivers.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/configs/sb1250_swarm_defconfig |    8 ++++++++
 1 file changed, 8 insertions(+)

linux-pata-swarm-defconfig.diff
Index: linux-swarm-defconfig/arch/mips/configs/sb1250_swarm_defconfig
===================================================================
--- linux-swarm-defconfig.orig/arch/mips/configs/sb1250_swarm_defconfig
+++ linux-swarm-defconfig/arch/mips/configs/sb1250_swarm_defconfig
@@ -50,6 +50,14 @@ CONFIG_IDE=y
 CONFIG_BLK_DEV_IDECD=y
 CONFIG_BLK_DEV_IDETAPE=y
 CONFIG_RAID_ATTRS=m
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_PLATFORM=y
 CONFIG_NETDEVICES=y
 CONFIG_MACVLAN=m
 CONFIG_SB1250_MAC=y
