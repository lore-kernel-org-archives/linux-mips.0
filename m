Received: from mailapp01.imgtec.com ([195.59.15.196]:28957 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992476AbcHZOS6wlOzn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 26 Aug 2016 16:18:58 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 01/19] MIPS: SEAD3: Split obj-y entries across lines
Date: Fri, 26 Aug 2016 15:17:33 +0100
Message-ID: <20160826141751.13121-2-paul.burton@imgtec.com>
In-Reply-To: <20160826141751.13121-1-paul.burton@imgtec.com>
References: <20160826141751.13121-1-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-kernel@vger.kernel.org
Message-ID: <20160826141733.JXgywi6yqA0LZTOUNR9R83uyuDFmYxWXQqWQyUskMbw@z>

Split the obj-y entries for SEAD3 onto a line each, so that they're more
independent & can be modified more clearly by later commits.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/mti-sead3/Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mti-sead3/Makefile b/arch/mips/mti-sead3/Makefile
index 7a584e0..8b03cfb 100644
--- a/arch/mips/mti-sead3/Makefile
+++ b/arch/mips/mti-sead3/Makefile
@@ -8,8 +8,13 @@
 # Copyright (C) 2012 MIPS Technoligies, Inc.  All rights reserved.
 # Steven J. Hill <sjhill@mips.com>
 #
-obj-y				:= sead3-lcd.o sead3-display.o sead3-init.o \
-				   sead3-int.o sead3-platform.o sead3-reset.o \
-				   sead3-setup.o sead3-time.o
+obj-y := sead3-lcd.o
+obj-y += sead3-display.o
+obj-y += sead3-init.o
+obj-y += sead3-int.o
+obj-y += sead3-platform.o
+obj-y += sead3-reset.o
+obj-y += sead3-setup.o
+obj-y += sead3-time.o
 
 obj-$(CONFIG_EARLY_PRINTK)	+= sead3-console.o
-- 
2.9.3
