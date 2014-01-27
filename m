Received: from multi.imgtec.com ([194.200.65.239]:44781 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827341AbaA0U0D1zIUR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 27 Jan 2014 21:26:03 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 45/58] MIPS: kernel: cpu-probe: Enable EVA option on supported cores
Date: Mon, 27 Jan 2014 20:19:32 +0000
Message-ID: <1390853985-14246-46-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
References: <1390853985-14246-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140127201932.DG_TCb6GiChvsopitZU294F5Z28Ve0sOLRDGEH_BEno@z>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 530f832..c42731c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -367,6 +367,9 @@ static inline unsigned int decode_config5(struct cpuinfo_mips *c)
 	config5 &= ~MIPS_CONF5_UFR;
 	write_c0_config5(config5);
 
+	if (config5 & MIPS_CONF5_EVA)
+		c->options |= MIPS_CPU_EVA;
+
 	return config5 & MIPS_CONF_M;
 }
 
-- 
1.8.5.3
