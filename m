Received: from mailapp01.imgtec.com ([195.59.15.196]:63746 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009877AbbLCKI3av0AZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 3 Dec 2015 11:08:29 +0100
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
        by Websense Email Security Gateway with ESMTPS id 0E25EF3D2651F
        for <linux-mips@linux-mips.org>; Thu,  3 Dec 2015 10:08:22 +0000 (GMT)
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/9] MIPS: tools: Build relocs tool
Date: Thu, 3 Dec 2015 10:08:10 +0000
Message-ID: <1449137297-30464-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
References: <1449137297-30464-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20151203100810.tNz7JmaS_9-9-KeRIRMc4-NERs7AlWBZSBpzze3WBnI@z>

Build the relocs tool as part of the kbuild

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---
 arch/mips/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 252e347958f3..33fbfd276671 100644
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
