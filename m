Received: from mailapp01.imgtec.com ([195.59.15.196]:9840 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991960AbdA3J6ojbccP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Jan 2017 10:58:44 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH] MIPS: Fix distclean with Makefile.postlink
Date: Mon, 30 Jan 2017 09:58:34 +0000
Message-ID: <1485770314-29891-1-git-send-email-matt.redfearn@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20170130095834.LVenPP6vBIKBKbkGp4uww-Y6fNhoat-9nxYJCO4Jgwk@z>

The postlink Makefile must include include/config/auto.conf to get the
kernel configuration variables. But in a clean kernel directory this
file does not exist, causing make to bail with the error:

arch/mips/Makefile.postlink:10:
include/config/auto.conf: No such file or directory
make[1]: *** No rule to make target
'include/config/auto.conf'.  Stop.
Makefile:1290: recipe for target 'vmlinuxclean' failed

Fix this by using "-include" to not cause a Make error when the file
does not exist.

Fixes: 44079d3509ae ("MIPS: Use Makefile.postlink to insert relocations into vmlinux")
Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/Makefile.postlink | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
index b0ddf0701a31..4b7f5a648c79 100644
--- a/arch/mips/Makefile.postlink
+++ b/arch/mips/Makefile.postlink
@@ -7,7 +7,7 @@
 PHONY := __archpost
 __archpost:
 
-include include/config/auto.conf
+-include include/config/auto.conf
 include scripts/Kbuild.include
 
 CMD_RELOCS = arch/mips/boot/tools/relocs
-- 
2.7.4
