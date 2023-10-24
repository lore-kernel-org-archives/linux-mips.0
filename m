Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66853C07545
	for <linux-mips@archiver.kernel.org>; Tue, 24 Oct 2023 05:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbjJXFo1 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 24 Oct 2023 01:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjJXFo1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Oct 2023 01:44:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB8E12B;
        Mon, 23 Oct 2023 22:44:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA9BC433C7;
        Tue, 24 Oct 2023 05:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698126265;
        bh=lh938T6yCQ4ZPDXKRZqad08EWqimTHs7JUOYjADgyVY=;
        h=From:To:Cc:Subject:Date:From;
        b=gwCQoDHrhzJjAeTzMNDwrY+sVH9aiuYRCUF9+YHPPWdv2PiVo2IBrtYol6jR9As2M
         mNPZxMAhoRqGfF6XOGSN58qW7baCN7hie951i067bm1LgmZTCN7TrHatVN6HvBom+X
         E5D1+dtWWDxdLLPPxvTD/W4Fbp3rzVIx0yaaXTiQSoRQCyLbfNvqpoxFe3pSHes6nH
         qmpV+dMk1McrrXA4yBL/BUQTDi1dktyB8DuQ5UZu8YghH44Z/DtOt/jVeJsuTJWF1S
         XTzWMDIfu4w6HoMtB6PgwFPjKT/dN3bZ7p7H14QinLbd4OPHb935oohrlUGDDJdvzN
         DhuEbuH53ozOw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Helge Deller <deller@gmx.de>,
        Khalid Aziz <khalid@gonehiking.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] vgacon: fix mips/sibyte build regression
Date:   Tue, 24 Oct 2023 07:44:02 +0200
Message-Id: <20231024054412.2291220-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The conversion to vgacon_register_screen() was missing an #include statement
for the swarm board:

arch/mips/sibyte/swarm/setup.c:146:9: error: implicit declaration of function 'vgacon_register_screen' [-Werror=implicit-function-declaration]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310240429.UqeQ2Cpr-lkp@intel.com/
Fixes: 555624c0d10b vgacon: clean up global screen_info instances
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/sibyte/swarm/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index 74e7c242b690..38c90b5e8754 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -13,6 +13,7 @@
 #include <linux/memblock.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/initrd.h>
 
-- 
2.39.2

