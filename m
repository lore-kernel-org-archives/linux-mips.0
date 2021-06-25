Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BA1C49EB9
	for <linux-mips@archiver.kernel.org>; Fri, 25 Jun 2021 11:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD6D46145C
	for <linux-mips@archiver.kernel.org>; Fri, 25 Jun 2021 11:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhFYLHD (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 25 Jun 2021 07:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhFYLG6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 07:06:58 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE65C061766;
        Fri, 25 Jun 2021 04:04:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id df12so12872682edb.2;
        Fri, 25 Jun 2021 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jh/lzrjilgGw29NtXftmryrDTFk7zx98KZT7wsFE6rU=;
        b=nZuZRSM9GXM9k84Q/kttcD7Tg+UxtsN7xD9Hf35xPEn1UAovMbuGHDMaiZGmu+xetj
         ojpuIryngXNcupE5O4xXzTLHcnS9aCU2mT7wKiNDOUXlkzBKzWErwrxa89M5DPg4A1Zn
         QEn8G1u4mODdRusLYrFwj6YoX9LFEHGahspaClekcomXBE3XYm/w6QNhzKLp3ixf4qhQ
         GeqJWtoVgScKGWBe6BZXY7sDovNPDkGYiEg/8uw7gyaCvFPXA8nAvzyTIVhxOzglGgHz
         E6aF9qdFDByia0qair9Oxo2v2FNe0zNgOzFnzoCHfDHDhKe2VR4b7KkbUsINL8ooTXfO
         CPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jh/lzrjilgGw29NtXftmryrDTFk7zx98KZT7wsFE6rU=;
        b=MdlQOewKBBcUe1hHTgvMkZ/BXIJ0oZXv+YlPh9XLYrvJK/dm+cRZ6aGtob0zD5WhhC
         MPZv3WJlq21DF7DIVdVEEXI94f1KXU2SJOP4Knz86UFsMmJvgvSqYAKLIckh69TUoQav
         x24DY/Z2ZNp7+bcof5neCigb76wkhXuZTTAvoI/qXvBwbnXxdDOLN9/eoYXVaMjMBMpV
         zI8GS/yRXUs5hrDCos+fVhbLIsURjlVIg28heukNjWtBoNOSg11UYQIV7VvOUiDRsxEB
         fsR8QS1U4HF+mNO2MXysZY9fDupIiAvMEt84VXC07QAReFSmfU2rxlLKNEDn7kSt2Jip
         iv3w==
X-Gm-Message-State: AOAM532F1eUfm9wUAzB+DFDgBmt1n2gO8UYUHtrkEF4yciLw4cZFL9NA
        OP+MzWJl7mxLKQufx1jJKFo=
X-Google-Smtp-Source: ABdhPJzgEedAK0EBV6QjwiRPaZdL+afPbiPj9t8uM8sRWXrNCAuV5BTWy0ykHkzQ6IawpQJ+Rvrx7g==
X-Received: by 2002:a50:ff02:: with SMTP id a2mr1484662edu.12.1624619075415;
        Fri, 25 Jun 2021 04:04:35 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:3852:f400:9496:6480:6c8a:4419])
        by smtp.gmail.com with ESMTPSA id v28sm2659665ejk.84.2021.06.25.04.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 04:04:35 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>,
        linux-edac@vger.kernel.org, linux-hams@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 2/3] MAINTAINERS: remove linux-mips.org references
Date:   Fri, 25 Jun 2021 13:04:18 +0200
Message-Id: <20210625110419.24503-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The domain lookup for linux-mips.org fails for quite some time now. Hence,
webpages, the patchwork instance and Ralf Baechle's email there is not
reachable anymore.

Remove all references of webpages from linux-mips.org in MAINTAINERS, and
refer to the kernel.org's linux-mips patchwork instance instead.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb9110c756f7..97fa03377adc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5152,7 +5152,6 @@ DECSTATION PLATFORM SUPPORT
 M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-W:	http://www.linux-mips.org/wiki/DECstation
 F:	arch/mips/dec/
 F:	arch/mips/include/asm/dec/
 F:	arch/mips/include/asm/mach-dec/
@@ -12384,7 +12383,6 @@ MIPS
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-W:	http://www.linux-mips.org/
 Q:	https://patchwork.kernel.org/project/linux-mips/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 F:	Documentation/devicetree/bindings/mips/
@@ -18832,10 +18830,9 @@ F:	arch/um/os-Linux/drivers/
 
 TURBOCHANNEL SUBSYSTEM
 M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
+Q:	https://patchwork.kernel.org/project/linux-mips/list/
 F:	drivers/tc/
 F:	include/linux/tc.h
 
-- 
2.17.1

