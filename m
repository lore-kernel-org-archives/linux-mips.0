Received: from mailapp01.imgtec.com ([195.59.15.196]:24932 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992110AbcHaKpCobg5D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 12:45:02 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 03/10] MIPS: pm-cps: Change FSB workaround to CPU blacklist
Date: Wed, 31 Aug 2016 11:44:32 +0100
Message-ID: <1472640279-26593-4-git-send-email-matt.redfearn@imgtec.com>
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
Message-ID: <20160831104432.TxSSphb9OnB3FoHKDK9AZ6JuVyKn2MjnQlLsXkDvVac@z>

The check for whether a CPU required the FSB flush workaround
previously required every CPU not requiring it to be whitelisted. That
approach does not scale well as new CPUs are introduced so change the
default from a WARN and returning an error to just returning 0. Any CPUs
requiring the workaround can then be added to the blacklist.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/pm-cps.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 5b31a9405ebc..2faa227a032e 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -272,14 +272,9 @@ static int __init cps_gen_flush_fsb(u32 **pp, struct uasm_label **pl,
 		/* On older ones it's unavailable */
 		return -1;
 
-	/* CPUs which do not require the workaround */
-	case CPU_P5600:
-	case CPU_I6400:
-		return 0;
-
 	default:
-		WARN_ONCE(1, "pm-cps: FSB flush unsupported for this CPU\n");
-		return -1;
+		/* Assume that the CPU does not need this workaround */
+		return 0;
 	}
 
 	/*
-- 
2.7.4
