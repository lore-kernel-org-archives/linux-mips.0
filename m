Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E14CD8C91
	for <linux-mips@archiver.kernel.org>; Tue, 10 Oct 2023 14:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjJJOeP (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 10 Oct 2023 10:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjJJOeO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Oct 2023 10:34:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E525191;
        Tue, 10 Oct 2023 07:34:13 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328AEC433C8;
        Tue, 10 Oct 2023 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696948453;
        bh=mV1qFUf0lIWJGX2g2NwvmQ8hZ3DTZnvKUJ7iGVngQcA=;
        h=From:To:Cc:Subject:Date:From;
        b=cQg8EfIs/d17vE2/qX9Eg5Gib/VSV0sqmRUwA3eCa/LzWroCK+H5otsqXqN5oF++n
         Fs6QXgXpDbdsyCafThWVSo9KCimGDlb8jQHUjO70XXfz4+afFfktnbmkntkKrAaIyb
         EzCEMkSNpGnp3inoMkbstbBx1OqdF774ZW9Y7/hqdCGH1aaDpM7eB420jE4CDQ+lYy
         +zs6US4sgwEdwF6kcvxuts6Mg0X44EzmCoy31UeAbGirDn9n3ZJMaZHkp1zx1X+do8
         JfH1KLqlDrEF5z79Pgn2nbFvZKzZVi6HG1DcAmeT1Ak36CLo4BfTBbZkNwQukBpxld
         XEqhnpmCth8Dw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/2] MIPS: lantic: Fix "no prototype" warning
Date:   Tue, 10 Oct 2023 09:34:04 -0500
Message-Id: <20231010143406.974591-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Fix a "no prototype" warning found by the kernel test robot.

Bjorn Helgaas (2):
  MIPS: lantic: Fix pcibios_plat_dev_init() "no previous prototype"
    warning
  MIPS: lantic: Remove unnecessary include of <linux/of_irq.h>

 arch/mips/pci/fixup-lantiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

