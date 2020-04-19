Return-Path: <SRS0=MiQc=6D=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026D4C38A30
	for <linux-mips@archiver.kernel.org>; Sun, 19 Apr 2020 19:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7C3621927
	for <linux-mips@archiver.kernel.org>; Sun, 19 Apr 2020 19:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgDSTan (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 19 Apr 2020 15:30:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42108 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgDSTan (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 15:30:43 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B56BA2A0319;
        Sun, 19 Apr 2020 20:30:41 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/4] mtd: rawnand: au1550nd: Convert the driver to exec_op()
Date:   Sun, 19 Apr 2020 21:30:33 +0200
Message-Id: <20200419193037.1544035-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

An attempt at converting the au1550nd to exec_op(). The patchset it only
compile-tested, so that'd be great to have someone with a db1550 to test
it. If there's no one owning such a board, maybe we should consider
removing it, as such ancient drivers make the NAND subsystem maintenance
harder.

Regards,

Boris

Boris Brezillon (4):
  mtd: rawnand: au1550nd: Stop using IO_ADDR_{R,W} in
    au_{read,write}_buf[16]()
  mtd: rawnand: au1550nd: Implement exec_op()
  mtd: rawnand: au1550nd: Get rid of the legacy interface implementation
  mtd: rawnand: au1550nd: Patch the read/write buf helper prototypes

 drivers/mtd/nand/raw/au1550nd.c | 410 +++++++++++---------------------
 1 file changed, 135 insertions(+), 275 deletions(-)

-- 
2.25.2

