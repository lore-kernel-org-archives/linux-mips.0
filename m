Received: from mailapp01.imgtec.com ([195.59.15.196]:15827 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992172AbcHaKpDcNr7D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 12:45:03 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 04/10] MIPS: pm-cps: Remove I6400 sync types
Date: Wed, 31 Aug 2016 11:44:33 +0100
Message-ID: <1472640279-26593-5-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1472640279-26593-1-git-send-email-matt.redfearn@imgtec.com>
References: <1472640279-26593-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Adam Buchbinder <adam.buchbinder@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160831104433.hRoyD8xlSwZ7bCj5kEVIixDuOdv1kOfzUEYGNeoc21g@z>

Commit 4e88a8621301 ("MIPS: Add cases for CPU_I6400") added a case for
I6400 to the selection of lightweight sync types, but these are not
implemented. Remove the case.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/pm-cps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 2faa227a032e..c6b9ad2256f0 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -674,7 +674,6 @@ static int __init cps_pm_init(void)
 	case CPU_PROAPTIV:
 	case CPU_M5150:
 	case CPU_P5600:
-	case CPU_I6400:
 		stype_intervention = 0x2;
 		stype_memory = 0x3;
 		stype_ordering = 0x10;
-- 
2.7.4
