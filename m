Received: from mailapp01.imgtec.com ([195.59.15.196]:33633 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013082AbbESVPIOjACz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 23:15:08 +0200
Subject: [PATCH 2/2] MIPS: MSA: bugfix of keeping MSA live context through
 clone or fork
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Tue, 19 May 2015 14:13:59 -0700
Message-ID: <20150519211359.35859.24907.stgit@ubuntu-yegoshin>
In-Reply-To: <20150519211222.35859.52798.stgit@ubuntu-yegoshin>
References: <20150519211222.35859.52798.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, paul.burton@imgtec.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, ralf@linux-mips.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150519211359.7nV9ekwsqBL3zl7VB0-y8bJC7q7GnqA94JRqdF4CkpY@z>

It seems the patch 39148e94e3e1f0477ce8ed3fda00123722681f3a

    "MIPS: fork: Fix MSA/FPU/DSP context duplication race"

assumes that DSP/FPU and MSA context should be inherited in child at clone/fork
(look into patch description). It was done on Matthew Fortune request from
toolchain team, I guess.

Well, in this case it should prevent clearing TIF_MSA_CTX_LIVE in copy_thread().

Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
---
 arch/mips/kernel/process.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index f2975d4d1e44..a16e62d40210 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -163,7 +163,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 
 	clear_tsk_thread_flag(p, TIF_USEDFPU);
 	clear_tsk_thread_flag(p, TIF_USEDMSA);
-	clear_tsk_thread_flag(p, TIF_MSA_CTX_LIVE);
 
 #ifdef CONFIG_MIPS_MT_FPAFF
 	clear_tsk_thread_flag(p, TIF_FPUBOUND);
