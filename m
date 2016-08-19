Received: from mailapp01.imgtec.com ([195.59.15.196]:4177 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992500AbcHSRTm7JMhr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Aug 2016 19:19:42 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 3/3] MIPS: clear execution hazard after changing FTLB enable
Date: Fri, 19 Aug 2016 18:18:28 +0100
Message-ID: <20160819171828.29109-4-paul.burton@imgtec.com>
In-Reply-To: <20160819171828.29109-1-paul.burton@imgtec.com>
References: <20160819171828.29109-1-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160819171828.UO8PhSAb266Wzl1DP0Z09haOqE_0KYIb8NwLw94gB3M@z>

On current P-series cores from Imagination the FTLB can be enabled or
disabled via a bit in the Config6 register, and an execution hazard is
created by changing the value of bit. The ftlb_disable function already
cleared that hazard but that does no good for other callers. Clear the
hazard in the set_ftlb_enable function that creates it, and only for the
cores where it applies.

This has the effect of reverting c982c6d6c48b ("MIPS: cpu-probe: Remove
cp0 hazard barrier when enabling the FTLB") which was incorrect.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Fixes: c982c6d6c48b ("MIPS: cpu-probe: Remove cp0 hazard barrier when enabling the FTLB")
---
 arch/mips/kernel/cpu-probe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 5069b5b1..dd31754 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -376,8 +376,6 @@ static int __init ftlb_disable(char *s)
 		return 1;
 	}
 
-	back_to_back_c0_hazard();
-
 	config4 = read_c0_config4();
 
 	/* Check that FTLB has been disabled */
@@ -560,6 +558,7 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
 		}
 
 		write_c0_config6(config);
+		back_to_back_c0_hazard();
 		break;
 	case CPU_I6400:
 		/* There's no way to disable the FTLB */
-- 
2.9.3
