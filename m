Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE31AC7EE23
	for <linux-mips@archiver.kernel.org>; Thu,  1 Jun 2023 12:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbjFAM41 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 1 Jun 2023 08:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbjFAM4Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jun 2023 08:56:25 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 926D1138;
        Thu,  1 Jun 2023 05:56:20 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 8C87E92009D; Thu,  1 Jun 2023 14:56:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 85DDF92009C;
        Thu,  1 Jun 2023 13:56:19 +0100 (BST)
Date:   Thu, 1 Jun 2023 13:56:19 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: Alchemy: Enable PATA_PLATFORM support
In-Reply-To: <alpine.DEB.2.21.2306011327300.59991@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2306011331530.59991@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2306011327300.59991@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We have limited demand for platform PATA support across MIPS platforms:

$ find arch/mips -type f | sort | xargs grep -l pata_platform_info
arch/mips/alchemy/devboards/db1200.c
arch/mips/alchemy/devboards/db1300.c
arch/mips/sibyte/swarm/platform.c
$ 

certainly not high enough to justify enabling support for PATA_PLATFORM 
port-wide.  SiByte platforms are handled selectively already, so just 
make a similar arrangement for Alchemy DB1XXX platforms.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/alchemy/Kconfig |    1 +
 1 file changed, 1 insertion(+)

linux-mips-alchemy-pata-platform.diff
Index: linux-macro/arch/mips/alchemy/Kconfig
===================================================================
--- linux-macro.orig/arch/mips/alchemy/Kconfig
+++ linux-macro/arch/mips/alchemy/Kconfig
@@ -14,6 +14,7 @@ config MIPS_DB1XXX
 	bool "Alchemy DB1XXX / PB1XXX boards"
 	select GPIOLIB
 	select HAVE_PCI
+	select HAVE_PATA_PLATFORM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
 	help
