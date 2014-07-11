Received: from mailapp01.imgtec.com ([195.59.15.196]:65148 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860086AbaGKPqYKq8aP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Jul 2014 17:46:24 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 3A68ACFDD26C3
        for <linux-mips@linux-mips.org>; Fri, 11 Jul 2014 16:46:14 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 08/13] MIPS: ensure MSA gets disabled during boot
Date: Fri, 11 Jul 2014 16:44:34 +0100
Message-ID: <1405093479-5123-9-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
References: <1405093479-5123-1-git-send-email-paul.burton@imgtec.com>
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
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140711154434.frDPKeJY1Mpms2I7X7ke667EzFa1IGtOz5qxUzqHDZo@z>

The kernel relies upon MSA being disabled when a task begins running,
so that it can initialise or restore context in response to the
resulting MSA disabled exception. Previously the state of MSA following
boot was left as it was before the kernel ran, where MSA could
potentially have been enabled. Explicitly disable it during boot to
prevent any problems.

As a nice side effect the code reads a little better too.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/cpu-probe.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e818547..1b345f0 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -130,14 +130,13 @@ static inline int __cpu_has_fpu(void)
 
 static inline unsigned long cpu_get_msa_id(void)
 {
-	unsigned long status, conf5, msa_id;
+	unsigned long status, msa_id;
 
 	status = read_c0_status();
 	__enable_fpu(FPU_64BIT);
-	conf5 = read_c0_config5();
 	enable_msa();
 	msa_id = read_msa_ir();
-	write_c0_config5(conf5);
+	disable_msa();
 	write_c0_status(status);
 	return msa_id;
 }
-- 
2.0.1
