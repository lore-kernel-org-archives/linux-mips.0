Received: from mailapp01.imgtec.com ([195.59.15.196]:24521 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992213AbcHaKpE06P0D (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 31 Aug 2016 12:45:04 +0200
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 05/10] MIPS: pm-cps: Add P6600 implementation lightweight sync types
Date: Wed, 31 Aug 2016 11:44:34 +0100
Message-ID: <1472640279-26593-6-git-send-email-matt.redfearn@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@imgtec.com>, Adam Buchbinder <adam.buchbinder@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160831104434.fI3XIqzPT4U7izkw7jFpqmFWjlLX3_gZQVWYfwbS39Y@z>

P6600 implements the same lightweight sync types as previous CPUs.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
Reviewed-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/kernel/pm-cps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index c6b9ad2256f0..f8c8edd0a451 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -674,6 +674,7 @@ static int __init cps_pm_init(void)
 	case CPU_PROAPTIV:
 	case CPU_M5150:
 	case CPU_P5600:
+	case CPU_P6600:
 		stype_intervention = 0x2;
 		stype_memory = 0x3;
 		stype_ordering = 0x10;
-- 
2.7.4
