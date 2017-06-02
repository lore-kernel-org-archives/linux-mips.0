Received: from mailapp01.imgtec.com ([195.59.15.196]:22632 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993929AbdFBVuMYQXdF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 23:50:12 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/7] MIPS: CM: WARN on attempt to lock invalid VP, not BUG
Date: Fri, 2 Jun 2017 14:48:51 -0700
Message-ID: <20170602214856.4545-4-paul.burton@imgtec.com>
In-Reply-To: <20170602214856.4545-1-paul.burton@imgtec.com>
References: <20170602214856.4545-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602214851.9J5hH79lo1lCsVgzbYuQehGQc3F2nvuVPRiNSn_q8Rg@z>

Rather than using BUG_ON in the case of an invalid attempt to lock
access to a non-zero VP on a pre-CM3 system, use WARN_ON so that we have
even the slightest chance of recovery.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 arch/mips/kernel/mips-cm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 99bb74dd12ce..cb0c57f860d4 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -282,7 +282,7 @@ void mips_cm_lock_other(unsigned int core, unsigned int vp)
 		spin_lock_irqsave(this_cpu_ptr(&cm_core_lock),
 				  *this_cpu_ptr(&cm_core_lock_flags));
 	} else {
-		BUG_ON(vp != 0);
+		WARN_ON(vp != 0);
 
 		/*
 		 * We only have a GCR_CL_OTHER per core in systems with
-- 
2.13.0
