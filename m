Received: from mailapp01.imgtec.com ([195.59.15.196]:52677 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993612AbdC2Mfbr4I0g (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Mar 2017 14:35:31 +0200
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH] MIPS: kernel/proc: expose elf_hwcap flags through cpuinfo
Date: Wed, 29 Mar 2017 14:35:20 +0200
Message-ID: <1490790920-5629-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170329123520.5tT3a7B66fkXPsSEysMtwItgVSPFAx4U9-Gm2r5UeJY@z>

According to the kernel man pages for getauxval, all flags that are
exposed through AT_HWCAP should also be presented in human-readable form
in /proc/cpuinfo. MIPS currently lacks that feature.

At the moment only 2 flags (r6, msa) are available which somewhat
duplicates information already exposed through the 'isa' and 'ASEs'
fields of cpuinfo, but they are scattered around various fields now that
do not directly map to the AT_HWCAP flags. This field will also be
useful when more feature flags are available that do not map to features
exposed through existing interfaces.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 arch/mips/kernel/proc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 4eff2ae..593aaac 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -10,6 +10,7 @@
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
+#include <asm/elf.h>
 #include <asm/idle.h>
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
@@ -32,6 +33,12 @@ int proc_cpuinfo_notifier_call_chain(unsigned long val, void *v)
 	return raw_notifier_call_chain(&proc_cpuinfo_chain, val, v);
 }
 
+static const char *const hwcap_str[] = {
+	"r6",
+	"msa",
+	NULL
+};
+
 static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	struct proc_cpuinfo_notifier_args proc_cpuinfo_notifier_args;
@@ -122,7 +129,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	if (cpu_has_eva)	seq_printf(m, "%s", " eva");
 	if (cpu_has_htw)	seq_printf(m, "%s", " htw");
 	if (cpu_has_xpa)	seq_printf(m, "%s", " xpa");
-	seq_printf(m, "\n");
+
+	seq_puts(m, "\nfeatures\t\t: ");
+	for (i = 0; hwcap_str[i]; i++)
+		if (elf_hwcap & (1 << i))
+			seq_printf(m, "%s ", hwcap_str[i]);
+	seq_puts(m, "\n");
 
 	if (cpu_has_mmips) {
 		seq_printf(m, "micromips kernel\t: %s\n",
-- 
2.7.4
