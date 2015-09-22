Received: from mailapp01.imgtec.com ([195.59.15.196]:57500 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009133AbbIVS5UdOuzP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:57:20 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 1/3] MIPS: malta: split obj-y entries across lines
Date: Tue, 22 Sep 2015 11:56:36 -0700
Message-ID: <1442948198-14507-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442948198-14507-1-git-send-email-paul.burton@imgtec.com>
References: <1442948198-14507-1-git-send-email-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org
Message-ID: <20150922185636.wgSBE1wUmmpiiMQ_zU0wkIVVdAd-2bgEFtPgZA0XppM@z>

Split the obj-y entries to their own lines such that it's easier to see
what's going on when adding or removing entries.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/mti-malta/Makefile | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/mips/mti-malta/Makefile b/arch/mips/mti-malta/Makefile
index ea35587..87c85a5 100644
--- a/arch/mips/mti-malta/Makefile
+++ b/arch/mips/mti-malta/Makefile
@@ -5,9 +5,15 @@
 # Copyright (C) 2008 Wind River Systems, Inc.
 #   written by Ralf Baechle <ralf@linux-mips.org>
 #
-obj-y				:= malta-display.o malta-dt.o malta-init.o \
-				   malta-int.o malta-memory.o malta-platform.o \
-				   malta-reset.o malta-setup.o malta-time.o
+obj-y				+= malta-display.o
+obj-y				+= malta-dt.o
+obj-y				+= malta-init.o
+obj-y				+= malta-int.o
+obj-y				+= malta-memory.o
+obj-y				+= malta-platform.o
+obj-y				+= malta-reset.o
+obj-y				+= malta-setup.o
+obj-y				+= malta-time.o
 
 obj-$(CONFIG_MIPS_CMP)		+= malta-amon.o
 obj-$(CONFIG_MIPS_MALTA_PM)	+= malta-pm.o
-- 
2.5.3
