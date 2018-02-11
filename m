Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:60810 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990398AbeBKEeKs8uej (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 11 Feb 2018 05:34:10 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 11 Feb 2018 04:31:11 +0000
Message-ID: <lsq.1518323471.320638011@decadent.org.uk>
Subject: [PATCH 3.16 070/136] MIPS: Fix an n32 core file generation regset
 support regression
In-Reply-To: <lsq.1518323469.348919605@decadent.org.uk>
Return-Path: <ben@decadent.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Djordje Todorovic <djordje.todorovic@rt-rk.com>, "Maciej W. Rozycki" <macro@mips.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org

3.16.54-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: "Maciej W. Rozycki" <macro@mips.com>

commit 547da673173de51f73887377eb275304775064ad upstream.

Fix a commit 7aeb753b5353 ("MIPS: Implement task_user_regset_view.")
regression, then activated by commit 6a9c001b7ec3 ("MIPS: Switch ELF
core dumper to use regsets.)", that caused n32 processes to dump o32
core files by failing to set the EF_MIPS_ABI2 flag in the ELF core file
header's `e_flags' member:

$ file tls-core
tls-core: ELF 32-bit MSB executable, MIPS, N32 MIPS64 rel2 version 1 (SYSV), [...]
$ ./tls-core
Aborted (core dumped)
$ file core
core: ELF 32-bit MSB core file MIPS, MIPS-I version 1 (SYSV), SVR4-style
$

Previously the flag was set as the result of a:

statement placed in arch/mips/kernel/binfmt_elfn32.c, however in the
regset case, i.e. when CORE_DUMP_USE_REGSET is set, ELF_CORE_EFLAGS is
no longer used by `fill_note_info' in fs/binfmt_elf.c, and instead the
`->e_flags' member of the regset view chosen is.  We have the views
defined in arch/mips/kernel/ptrace.c, however only an o32 and an n64
one, and the latter is used for n32 as well.  Consequently an o32 core
file is incorrectly dumped from n32 processes (the ELF32 vs ELF64 class
is chosen elsewhere, and the 32-bit one is correctly selected for n32).

Correct the issue then by defining an n32 regset view and using it as
appropriate.  Issue discovered in GDB testing.

Fixes: 7aeb753b5353 ("MIPS: Implement task_user_regset_view.")
Signed-off-by: Maciej W. Rozycki <macro@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Djordje Todorovic <djordje.todorovic@rt-rk.com>
Cc: linux-mips@linux-mips.org
Patchwork: https://patchwork.linux-mips.org/patch/17617/
Signed-off-by: James Hogan <jhogan@kernel.org>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/mips/kernel/ptrace.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -522,6 +522,19 @@ static const struct user_regset_view use
 	.n		= ARRAY_SIZE(mips64_regsets),
 };
 
+#ifdef CONFIG_MIPS32_N32
+
+static const struct user_regset_view user_mipsn32_view = {
+	.name		= "mipsn32",
+	.e_flags	= EF_MIPS_ABI2,
+	.e_machine	= ELF_ARCH,
+	.ei_osabi	= ELF_OSABI,
+	.regsets	= mips64_regsets,
+	.n		= ARRAY_SIZE(mips64_regsets),
+};
+
+#endif /* CONFIG_MIPS32_N32 */
+
 #endif /* CONFIG_64BIT */
 
 const struct user_regset_view *task_user_regset_view(struct task_struct *task)
@@ -533,6 +546,10 @@ const struct user_regset_view *task_user
 	if (test_tsk_thread_flag(task, TIF_32BIT_REGS))
 		return &user_mips_view;
 #endif
+#ifdef CONFIG_MIPS32_N32
+	if (test_tsk_thread_flag(task, TIF_32BIT_ADDR))
+		return &user_mipsn32_view;
+#endif
 	return &user_mips64_view;
 #endif
 }
