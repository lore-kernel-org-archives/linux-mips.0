Received: from mail1.windriver.com ([147.11.146.13]:51952 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823064Ab3FRPk5WlOGk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jun 2013 17:40:57 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] mips: delete floating ".previous" section statements
Date: Tue, 18 Jun 2013 11:40:47 -0400
Message-ID: <1371570047-32492-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Gortmaker@windriver.com>
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
Cc: linux-mips@linux-mips.org, Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20130618154047.u3DEaAZVsPdJRt2ZvNrZoUhHEHQKJG6UxezFo5rY-go@z>

Commit "mips: delete __cpuinit/__CPUINIT usage from MIPS code"
deleted the __CPUINIT instances, however there were two instances
of ".previous" that were being used in paring with the __CPUINIT
(i.e. section ".cpuinit.text").

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[Feel free to squash this into the larger commit; sorry I didn't
 notice it 15m earlier...  :(  Oh well.]

 arch/mips/kernel/bmips_vec.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/kernel/bmips_vec.S b/arch/mips/kernel/bmips_vec.S
index f739aed..596bf2f 100644
--- a/arch/mips/kernel/bmips_vec.S
+++ b/arch/mips/kernel/bmips_vec.S
@@ -186,7 +186,6 @@ bmips_reset_nmi_vec_end:
 END(bmips_reset_nmi_vec)
 
 	.set	pop
-	.previous
 
 /***********************************************************************
  * CPU1 warm restart vector (used for second and subsequent boots).
@@ -247,5 +246,3 @@ LEAF(bmips_enable_xks01)
 	jr	ra
 
 END(bmips_enable_xks01)
-
-	.previous
-- 
1.8.1.2
