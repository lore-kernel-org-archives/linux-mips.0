Received: from mailapp01.imgtec.com ([195.59.15.196]:8147 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992121AbcIGJpnnVF4S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Sep 2016 11:45:43 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH v2 03/12] MIPS: pm-cps: Change FSB workaround to CPU blacklist
Date: Wed, 7 Sep 2016 10:45:11 +0100
Message-ID: <1473241520-14917-4-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1473241520-14917-1-git-send-email-matt.redfearn@imgtec.com>
References: <1473241520-14917-1-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Adam Buchbinder <adam.buchbinder@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160907094511.jQLGKO7xEZzBiPpf0F6LfO7mEXy8jroCp6IpKjX7-Fw@z>

The check for whether a CPU required the FSB flush workaround
previously required every CPU not requiring it to be whitelisted. That
approach does not scale well as new CPUs are introduced so change the
default from a WARN and returning an error to just returning 0. Any CPUs
requiring the workaround can then be added to the blacklist.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

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
