Received: from mail-co1nam05on070b.outbound.protection.outlook.com ([IPv6:2a01:111:f400:fe50::70b]:39376
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992514AbeFYSCUFbK4e convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 25 Jun 2018 20:02:20 +0200
From: Dengcheng Zhu <dzhu@wavecomp.com>
Subject: Re: [PATCH] mips: rseq: Use new interface required to avoid SIGSEGV
 infinite recursion
Date: Mon, 25 Jun 2018 18:01:29 +0000
Message-ID: <CO2PR0801MB2151677C4D88B4EA219AC88EA24A0@CO2PR0801MB2151.namprd08.prod.outlook.com>
References: <1529949379-5363-1-git-send-email-dzhu@wavecomp.com>
In-Reply-To: <1529949379-5363-1-git-send-email-dzhu@wavecomp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <dzhu@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <pburton@wavecomp.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Will Deacon <will.deacon@arm.com>
Message-ID: <20180625180129.hg7PW3TWtRz1p0SLMMrg-D1QbcUF2ESNl9std8ZTVZ0@z>

Right after sending out this patch, I found Mathieu Desnoyers had already done it. Sorry for duplicating.


Dengcheng


From: Dengcheng Zhu
Sent: Monday, June 25, 2018 10:56 AM
To: Paul Burton; ralf@linux-mips.org
Cc: linux-mips@linux-mips.org; Dengcheng Zhu; Will Deacon
Subject: [PATCH] mips: rseq: Use new interface required to avoid SIGSEGV infinite recursion
  

The new interface was introduced in 784e0300fe (rseq: Avoid infinite
recursion when delivering SIGSEGV).

This patch makes the change for mips.

Signed-off-by: Dengcheng Zhu <dzhu@wavecomp.com>
Cc: Will Deacon <will.deacon@arm.com>
---
 arch/mips/kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 00f2535..0a9cfe7 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -801,7 +801,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
                 regs->regs[0] = 0;              /* Don't deal with this again.  */
         }
 
-       rseq_signal_deliver(regs);
+       rseq_signal_deliver(ksig, regs);
 
         if (sig_uses_siginfo(&ksig->ka, abi))
                 ret = abi->setup_rt_frame(vdso + abi->vdso->off_rt_sigreturn,
@@ -870,7 +870,7 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
         if (thread_info_flags & _TIF_NOTIFY_RESUME) {
                 clear_thread_flag(TIF_NOTIFY_RESUME);
                 tracehook_notify_resume(regs);
-               rseq_handle_notify_resume(regs);
+               rseq_handle_notify_resume(NULL, regs);
         }
 
         user_enter();
-- 
2.7.4

    
