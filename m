Received: from mail-bl2lp0204.outbound.protection.outlook.com ([207.46.163.204]:24324
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6854803AbaE1WLC6BpDk (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 29 May 2014 00:11:02 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH v2 08/13] MIPS: OCTEON: Add OCTEON3 to __get_cpu_type
Date: Wed, 28 May 2014 23:52:11 +0200
Message-ID: <1401313936-11867-9-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1401313936-11867-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, James Hogan <james.hogan@imgtec.com>, kvm@vger.kernel.org
Message-ID: <20140528215211.UzsMr8py96MJbigOHlR0Z_NM9jeaXMmBqyjKI08V-XM@z>

Otherwise __builtin_unreachable might be called.

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 arch/mips/include/asm/cpu-type.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index e3308b4..b4e2bd8 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -163,6 +163,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 	case CPU_CAVIUM_OCTEON:
 	case CPU_CAVIUM_OCTEON_PLUS:
 	case CPU_CAVIUM_OCTEON2:
+	case CPU_CAVIUM_OCTEON3:
 #endif
 
 #if defined(CONFIG_SYS_HAS_CPU_BMIPS32_3300) || \
-- 
1.7.9.5
