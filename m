Received: from mailapp01.imgtec.com ([195.59.15.196]:17365 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011787AbbARWnAukrpa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 18 Jan 2015 23:43:00 +0100
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 33/36] MIPS: add jz4780 Ingenic vendor ID
Date: Sun, 18 Jan 2015 14:42:47 -0800
Message-ID: <1421620967-25650-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
References: <1421620067-23933-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20150118224247.Ig01GT7Sf43NyAc8Aq7xSoQalIOu3oca4if3wHIZUOE@z>

With the jz4780, Ingenic switched to use a different vendor ID in the
coprocessor 0 PRID register (whilst keeping the product ID & revision
the same as the jz4740 & jz4770...). Add a definition for the new
vendor ID & handle it in the same way as the older one.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
---
 arch/mips/include/asm/cpu.h  | 1 +
 arch/mips/kernel/cpu-probe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 33866fc..ab00d3b 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -43,6 +43,7 @@
 #define PRID_COMP_NETLOGIC	0x0c0000
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_INGENIC	0xd00000
+#define PRID_COMP_INGENIC_4780	0xe10000
 
 /*
  * Assigned Processor ID (implementation) values for bits 15:8 of the PRId
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 5342674..ca98c4a 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1313,6 +1313,7 @@ void cpu_probe(void)
 		cpu_probe_cavium(c, cpu);
 		break;
 	case PRID_COMP_INGENIC:
+	case PRID_COMP_INGENIC_4780:
 		cpu_probe_ingenic(c, cpu);
 		break;
 	case PRID_COMP_NETLOGIC:
-- 
2.2.1
