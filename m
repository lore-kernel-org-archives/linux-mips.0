Received: from mail-bn1lp0145.outbound.protection.outlook.com ([207.46.163.145]:38003
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6837584AbaEFPwkbTzWZ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 May 2014 17:52:40 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 06/11] kvm tools, mips: Enable build of mips support
Date: Tue, 6 May 2014 17:51:26 +0200
Message-ID: <1399391491-5021-7-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20140506155126.Pcs3m_Y0YgEnbXAZ9UGtcrpQmrLHYFPU2s4l8-ViynU@z>

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/Makefile |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/kvm/Makefile b/tools/kvm/Makefile
index b872651..91286ad 100644
--- a/tools/kvm/Makefile
+++ b/tools/kvm/Makefile
@@ -105,7 +105,7 @@ OBJS	+= virtio/mmio.o
 
 # Translate uname -m into ARCH string
 ARCH ?= $(shell uname -m | sed -e s/i.86/i386/ -e s/ppc.*/powerpc/ \
-	  -e s/armv7.*/arm/ -e s/aarch64.*/arm64/)
+	  -e s/armv7.*/arm/ -e s/aarch64.*/arm64/ -e s/mips64/mips/)
 
 ifeq ($(ARCH),i386)
 	ARCH         := x86
@@ -184,6 +184,15 @@ ifeq ($(ARCH), arm64)
 	ARCH_WANT_LIBFDT := y
 endif
 
+ifeq ($(ARCH),mips)
+	DEFINES		+= -DCONFIG_MIPS
+	ARCH_INCLUDE	:= mips/include
+	CFLAGS		+= -I../../arch/mips/include/asm/mach-cavium-octeon
+	CFLAGS		+= -I../../arch/mips/include/asm/mach-generic
+	OBJS		+= mips/kvm.o
+	OBJS		+= mips/kvm-cpu.o
+	OBJS		+= mips/irq.o
+endif
 ###
 
 ifeq (,$(ARCH_INCLUDE))
-- 
1.7.9.5
