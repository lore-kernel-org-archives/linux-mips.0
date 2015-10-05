Received: from mailapp01.imgtec.com ([195.59.15.196]:36360 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009447AbbJEJw5XP7N5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Oct 2015 11:52:57 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 19381C9E38935
        for <linux-mips@linux-mips.org>; Mon,  5 Oct 2015 10:52:50 +0100 (IST)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [RFC PATCH 2/7] MIPS: tools: Build relocs tool
Date: Mon, 5 Oct 2015 10:52:26 +0100
Message-ID: <1444038751-25105-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1444038751-25105-1-git-send-email-matt.redfearn@imgtec.com>
References: <1444038751-25105-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <20151005095226.8xSA05vTxaozyapV2UrM-ma-UL0lBYcH2X8Rlt0CRaU@z>

Build the relocs tool as part of the kbuild

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index bf4606f04193..9371ea0adb88 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -12,6 +12,9 @@
 # for "archclean" cleaning up for this architecture.
 #
 
+archscripts: scripts_basic
+	$(Q)$(MAKE) $(build)=arch/mips/boot/tools relocs
+
 KBUILD_DEFCONFIG := ip22_defconfig
 
 #
-- 
2.1.4
