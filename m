Received: from mailapp01.imgtec.com ([195.59.15.196]:54146 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007712AbcCDBm5nNjUU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 4 Mar 2016 02:42:57 +0100
Date: Fri, 4 Mar 2016 01:42:49 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 1/2] traps: Fix SIGFPE information leak from `do_ov' and
 `do_trap_or_bp'
In-Reply-To: <alpine.DEB.2.00.1603031303500.9427@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1603031322410.9427@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1603031303500.9427@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: Pedro Alves <palves@redhat.com>, Luis Machado <lgustavo@codesourcery.com>, linux-mips@linux-mips.org
Message-ID: <20160304014249.ao2xpKqoQY_2rwXPm67drtvuwpiyiXrdobuZA5Bz1co@z>

Avoid sending a partially initialised `siginfo_t' structure along SIGFPE
signals issued from `do_ov' and `do_trap_or_bp', leading to information
leaking from the kernel stack.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
Cc: stable@vger.kernel.org
---
linux-mips-sig-info-leak.diff
Index: linux-sfr-test/arch/mips/kernel/traps.c
===================================================================
--- linux-sfr-test.orig/arch/mips/kernel/traps.c	2016-03-03 13:34:47.454048000 +0000
+++ linux-sfr-test/arch/mips/kernel/traps.c	2016-03-04 00:56:37.858781000 +0000
@@ -690,15 +690,15 @@ static int simulate_sync(struct pt_regs 
 asmlinkage void do_ov(struct pt_regs *regs)
 {
 	enum ctx_state prev_state;
-	siginfo_t info;
+	siginfo_t info = {
+		.si_signo = SIGFPE,
+		.si_code = FPE_INTOVF,
+		.si_addr = (void __user *)regs->cp0_epc,
+	};
 
 	prev_state = exception_enter();
 	die_if_kernel("Integer overflow", regs);
 
-	info.si_code = FPE_INTOVF;
-	info.si_signo = SIGFPE;
-	info.si_errno = 0;
-	info.si_addr = (void __user *) regs->cp0_epc;
 	force_sig_info(SIGFPE, &info, current);
 	exception_exit(prev_state);
 }
@@ -874,7 +874,7 @@ asmlinkage void do_fpe(struct pt_regs *r
 void do_trap_or_bp(struct pt_regs *regs, unsigned int code,
 	const char *str)
 {
-	siginfo_t info;
+	siginfo_t info = { 0 };
 	char b[40];
 
 #ifdef CONFIG_KGDB_LOW_LEVEL_TRAP
@@ -903,7 +903,6 @@ void do_trap_or_bp(struct pt_regs *regs,
 		else
 			info.si_code = FPE_INTOVF;
 		info.si_signo = SIGFPE;
-		info.si_errno = 0;
 		info.si_addr = (void __user *) regs->cp0_epc;
 		force_sig_info(SIGFPE, &info, current);
 		break;
