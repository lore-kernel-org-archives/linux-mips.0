Received: from mailapp01.imgtec.com ([195.59.15.196]:24728 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993896AbdBPMd6BvfG4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Feb 2017 13:33:58 +0100
From: Ian Pozella <Ian.Pozella@imgtec.com>
Subject: [PATCH] MIPS: DTS: add img directory to Makefile
Date: Thu, 16 Feb 2017 12:33:30 +0000
Message-ID: <1487248410-9493-1-git-send-email-Ian.Pozella@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ian.Pozella@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, James.Hogan@imgtec.com
Cc: linux-mips@linux-mips.org, Ian Pozella <Ian.Pozella@imgtec.com>
Message-ID: <20170216123330.870cui_EcKiQ-nphA0nnic_pMGJLGjH55acJ9giLyfM@z>

An img directory exists for the Pistchio Soc but the directory
itself isn't in the dts Makefile meaning the dtbs never get built.

Signed-off-by: Ian Pozella <Ian.Pozella@imgtec.com>
---
 arch/mips/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index fc7a0a9..b9db492 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dts-dirs	+= brcm
 dts-dirs	+= cavium-octeon
+dts-dirs	+= img
 dts-dirs	+= ingenic
 dts-dirs	+= lantiq
 dts-dirs	+= mti
-- 
2.7.4
