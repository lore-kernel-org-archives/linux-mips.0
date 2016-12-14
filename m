Received: from mailapp01.imgtec.com ([195.59.15.196]:7724 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992255AbcLNPJ5uwMw4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Dec 2016 16:09:57 +0100
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/2] MIPS: Set defconfig target to a generic system for 32r2el
Date: Wed, 14 Dec 2016 15:09:43 +0000
Message-ID: <1481728183-16776-2-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1481728183-16776-1-git-send-email-matt.redfearn@imgtec.com>
References: <1481728183-16776-1-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20161214150943.EyrWcg5v_2o79D16rIl7Vq4U4SuQsRjzg6qLcPxH0NI@z>

The default system type should be a MIPS generic kernel. In order to
include some level of board support, select a 32r2el generic defconfig
by default. The alternative would be to use "generic_defconfig" but
rather unintuitvely that is a bare bones configuration with no platform
support so is not usable in practice.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 1a6bac7b076f..51b0e7479f99 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -15,7 +15,7 @@
 archscripts: scripts_basic
 	$(Q)$(MAKE) $(build)=arch/mips/boot/tools relocs
 
-KBUILD_DEFCONFIG := ip22_defconfig
+KBUILD_DEFCONFIG := 32r2el_defconfig
 
 #
 # Select the object file format to substitute into the linker script.
-- 
2.7.4
