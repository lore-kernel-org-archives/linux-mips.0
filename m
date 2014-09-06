Received: from mailapp01.imgtec.com ([195.59.15.196]:58980 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006940AbaIFC1sHrxkG (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 6 Sep 2014 04:27:48 +0200
Subject: [PATCH] MIPS: Remove a temporary hack for debugging cache flushes in
        SMTC configuration
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Fri, 5 Sep 2014 19:27:38 -0700
Message-ID: <20140906022738.6957.53838.stgit@linux-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, aaro.koskinen@iki.fi, david.daney@cavium.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, markos.chandras@imgtec.com, dengcheng.zhu@imgtec.com, chenhc@lemote.com, akpm@linux-foundation.org
Message-ID: <20140906022738.B4djU1p0yOdFlz9VzM5Z2TvO5T1jqy7MZf0n43lMRbU@z>

This patch removes a temporary hack for debugging SMTC configuration from

	commit 41c594ab65fc89573af296d192aa5235d09717ab
	Author: Ralf Baechle <ralf@linux-mips.org>
	Date:   Wed Apr 5 09:45:45 2006 +0100

which is dropped now. Some performance degradation for multi-VPE systems
is removed.

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/include/asm/r4kcache.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/mips/include/asm/r4kcache.h b/arch/mips/include/asm/r4kcache.h
index 4520adc..b2ae1b1 100644
--- a/arch/mips/include/asm/r4kcache.h
+++ b/arch/mips/include/asm/r4kcache.h
@@ -50,7 +50,6 @@ extern void (*r4k_blast_icache)(void);
 /*
  * Optionally force single-threaded execution during I-cache flushes.
  */
-#define PROTECT_CACHE_FLUSHES 1
 
 #ifdef PROTECT_CACHE_FLUSHES
 
