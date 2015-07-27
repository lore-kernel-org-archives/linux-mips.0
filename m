Received: from mailapp01.imgtec.com ([195.59.15.196]:43413 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011478AbbG0UChRlHqX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Jul 2015 22:02:37 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 13/16] MIPS: advertise MIPSr6 via HWCAP when appropriate
Date: Mon, 27 Jul 2015 12:58:24 -0700
Message-ID: <1438027107-24420-14-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
References: <1438027107-24420-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Matthew Fortune <matthew.fortune@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150727195824.Lv0xgAULb2Y7kc7M6-0cfZO_LexiSxptF0XHzwAanEc@z>

When running on a CPU implementing the release 6 of the MIPS32 or MIPS64
ISA, advertise that to userland via the appropriate HWCAP bit.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/kernel/cpu-probe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e184921..168a5d3 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1489,6 +1489,9 @@ void cpu_probe(void)
 	else
 		c->srsets = 1;
 
+	if (cpu_has_mips_r6)
+		elf_hwcap |= HWCAP_MIPS_R6;
+
 	if (cpu_has_msa) {
 		c->msa_id = cpu_get_msa_id();
 		WARN(c->msa_id & MSA_IR_WRPF,
-- 
2.4.6
