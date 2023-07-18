Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29688EB64DC
	for <linux-mips@archiver.kernel.org>; Tue, 18 Jul 2023 14:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjGROh1 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 18 Jul 2023 10:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbjGROhY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 10:37:24 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D284A1719;
        Tue, 18 Jul 2023 07:37:23 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 3E23092009D; Tue, 18 Jul 2023 16:37:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 39C7C92009C;
        Tue, 18 Jul 2023 15:37:23 +0100 (BST)
Date:   Tue, 18 Jul 2023 15:37:23 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Jan-Benedict Glaw <jbglaw@lug-owl.de>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: Only fiddle with CHECKFLAGS if `need-compiler'
In-Reply-To: <alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2307181421010.61566@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We have originally guarded fiddling with CHECKFLAGS in our arch Makefile 
by checking for the CONFIG_MIPS variable, not set for targets such as 
`distclean', etc. that neither include `.config' nor use the compiler.  

Starting from commit 805b2e1d427a ("kbuild: include Makefile.compiler 
only when compiler is needed") we have had a generic `need-compiler' 
variable explicitly telling us if the compiler will be used and thus its 
capabilities need to be checked and expressed in the form of compilation
flags.  If this variable is not set, then `make' functions such as 
`cc-option' are undefined, causing all kinds of weirdness to happen if 
we expect specific results to be returned, most recently:

cc1: error: '-mloongson-mmi' must be used with '-mhard-float'

messages with configurations such as `fuloong2e_defconfig' and the 
`modules_install' target, which does include `.config' and yet does not 
use the compiler.

Replace the check for CONFIG_MIPS with one for `need-compiler' instead, 
so as to prevent the compiler from being ever called for CHECKFLAGS when 
not needed.

Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Closes: https://lore.kernel.org/r/85031c0c-d981-031e-8a50-bc4fad2ddcd8@collabora.com/
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")
Cc: stable@vger.kernel.org # v5.13+
---
 arch/mips/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

linux-mips-checkflags-need-compiler.diff
Index: linux-macro/arch/mips/Makefile
===================================================================
--- linux-macro.orig/arch/mips/Makefile
+++ linux-macro/arch/mips/Makefile
@@ -341,7 +341,7 @@ KBUILD_CFLAGS += -fno-asynchronous-unwin
 
 KBUILD_LDFLAGS		+= -m $(ld-emul)
 
-ifdef CONFIG_MIPS
+ifdef need-compiler
 CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
 	grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
 	sed -e "s/^\#define /-D'/" -e "s/ /'='/" -e "s/$$/'/" -e 's/\$$/&&/g')
