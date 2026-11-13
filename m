Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532027;
	b=Zhp22J1Uc9fUBvG9Dfdy3iNMlqug5IDXmdG9iSnPlK99ZNDv3gFe2CHJmr51+9IVWKTh
	 e9GuaNBB+1Gm2IlT/UI6H6O+0efQ/+w4ObO3dXh9SD3+s7im6nxVMnmkPhgHSZIACVss7
	 wwTMY+p07YLRB7n6UFkRfwUR4NfqLtdffsr1Pp9REBxGLWONob+74VxKi6gVvc19GlLuX
	 RR5qvjjo6mM5/HxkZ6srLKkh89jGZ0zSVVZZ/9YaI4gUlirNlQ3CbD0f2EStSHRwoQXTo
	 jAanedzPdDTS3b/T0oh7wQACw/aOoAQTOS0aXjkyls56KAuwsu6KLeUjmjXbzT8n0Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Y08bElmfP7s7Zak0ZKRqN7RFefiCPsxHH1gcP5GVk4=;
	b=uI+sLKIaapQrjcoEo2LP9boqsHvkBzfdSQ7pxsbBSC1RHB87+Z0ktnozz/oiKrvzWVuX
	 AfoiZLLTa6f6gVPIFuhZ4NaXluJqk9Z7SwC+hB08I2srDynnmTWnnU08kWre0kmONxKwA
	 uJ5VhKufngyLF6EbTjc/gVweYQXl5mipC8iNexR9MyyNA3QW5REF02rfdFP9OG6778tVE
	 vZZ8HushyF1o/1oWvKzdihzt+nu6E3ATDJCgdu160OeKDtLl9IECQID+HiE8avvaZIwaM
	 MW9k9d4Wg/k0K9grySxWu4jL/GebD0VIlVsnRmbRfWGnzHU8VSq678ludh/2r81w6Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QctEo1qN;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BD606A31C
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 01:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QctEo1qN
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3acef9307c7so4323231fa.2
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 17:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532025; x=1795136825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Y08bElmfP7s7Zak0ZKRqN7RFefiCPsxHH1gcP5GVk4=;
        b=QctEo1qNWtdEAis/5lP2LmW8LMDomXVy/sC2TXghMrqOPY2WikKEIjCw+P253FP5h1
         fdL6nydJVn7SP2jpyrw0S42sRNtM+4mbjIiAe1/mEoV6Sq1KLAfxG04I9SV4IuMhfa7S
         ygVVmkJH5tpl14oIuiHeDk9aklvbQEtmw5PdSWPKFvf/WiRoC6FDpqmHTQzkYZoFIMbX
         39vjiOJms43nun69/nY5isMb2ija1+HIf986hEN8ffA8KFwCr9LALzlyERkzw0WMpUT8
         JXm+qebmRbxjgcv50b0zTAx+zkzGjhRByxFrToLMzL40BpYV5imJfOLc1G7pEBNQNCIr
         SG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532025; x=1795136825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Y08bElmfP7s7Zak0ZKRqN7RFefiCPsxHH1gcP5GVk4=;
        b=kWvOSCUg/F7Tgoi8Ap5xkzZisLS8bb9DFnf6ee4BFjEYwB+fDIvsrkmBmY31sNuVOU
         RoXQhuBDY2lvA6UJAsLQ727rAXoin19Y6/dd5DzRXEWtVm+dCd3f3s1jfiF0agf2A4tE
         v7EEkjucJUZqLy4tjf90WW8tVzksY9FwN4sGdFbteDNXgAoh8HOq2RWv9vfFZeTL8Frk
         EBZRKVGyiGXaLNgASRZ6wMhSzj1HdNgMLJmL+rujheLvaeTgAQtMnRBCtvk3w/bDu8w0
         GUVmL6wzDp/vQDHonHw5QdB8WNHUit2JMP4tmTbSep1shgO3zwNR89t/kIU19TYzxGkN
         u/Kw==
X-Forwarded-Encrypted: i=1; AL+hErHDWRxqjsfdVwbtfPd1it0CoXPzuzXqoeMdVq/MyWfV2cfxi5QSqHHP2xGoP/lv36/p6RZ97tkNBKm1@vger.kernel.org
X-Gm-Message-State: APuU4Z+QeFPWwu9LFl/P9ROQernkUnzXSKJ/0bzpimPpPrdoDWjyI8xy
	75vnG2wQxtB90oYWV9X3UF9ESEEJZUseAzSEPl+sRKD3CPDnxpN2N/XE
X-Gm-Gg: AYBFou1YWQNjxLESn4dXI683NEDRePA11e/Y7AxphtkrcxZekHcY/qE+yo0dJXCM2rV
	XqH16U8WLeJqrystJrNgSpqcRPlgn5D9CWzWFLGKSuze0yAxRBAMzxK38BW1mO4mn49RnSNpHIu
	waTVmGbJOuOkKzJDAsmgsLOX38YbcQniSPQXVabWBLzvc59y0rlOddwKPWgx8xRK4cFpyASKHhh
	lC0wLjxDd+l3KMPzdfUCi9MWCy31gN67v6gzj4KMirvJNV1QEmYs9qZw0d7N754XzrmbV0i3uxl
	twFjGcEebo+MZaxj+dBcjACcNZCxj9VtZ38vBC2pmJoMS2CghSlaEIXGhvyyexIEdwpC5AS+QXJ
	H7HNriYEjKLZcyie7BxmCDtiLOhrKdrUot+ffkvPcqS8mKXHIc/BWv0qnvaIePfFLQ7nb/A0Ysr
	K5kHrzEHP2E+Ryp0+5LiWL4xswggocBkjt1YGiST18GcHhRbI3pLgXv68PbeYErk3zY+yTz03C5
	Y88/YGlHjS3X3Mnejzr8GCza3w5QszsfDlVTIrgG2e5MEJrSUFG8sa9PGXTI/s/sk76u5OYO9U6
	6caju6+qhvi9vt5cdmxGCgRec3101YHV0zHttdcqdtppr4l2L3TQmD+78F/OQd18XMQvCEYhEP3
	HtDUvv1Um+A==
X-Received: by 2002:a2e:a881:0:b0:3ab:690f:8298 with SMTP id 38308e7fff4ca-3ae2b5379edmr3526241fa.26.1794532024936;
        Thu, 12 Nov 2026 17:07:04 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:03 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 04/10] MIPS: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:09 +0400
Message-ID: <20261113010631.139191-5-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/mips/cavium-octeon/setup.c   |  2 +-
 arch/mips/include/asm/bmips.h     |  2 +-
 arch/mips/include/asm/idle.h      |  2 +-
 arch/mips/include/asm/paccess.h   |  4 +--
 arch/mips/include/asm/ptrace.h    |  4 +--
 arch/mips/include/asm/smp.h       |  2 +-
 arch/mips/include/asm/switch_to.h |  2 +-
 arch/mips/kernel/r4k-bugs64.c     |  2 +-
 arch/mips/kernel/signal-common.h  |  8 ++---
 arch/mips/kernel/traps.c          | 50 +++++++++++++++----------------
 10 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9..c2ee7d8bc 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -296,7 +296,7 @@ static uint64_t crashk_size, crashk_base;
 
 static int octeon_uart;
 
-extern asmlinkage void handle_int(void);
+asmlinkage void handle_int(void);
 
 /**
  * octeon_is_simulation - Return non-zero if we are currently running
diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
index 0eee81be9..a0de86e0d 100644
--- a/arch/mips/include/asm/bmips.h
+++ b/arch/mips/include/asm/bmips.h
@@ -88,7 +88,7 @@ extern cpumask_t bmips_booted_mask;
 extern unsigned long bmips_tp1_irqs;
 
 extern void bmips_ebase_setup(void);
-extern asmlinkage void plat_wired_tlb_setup(void);
+asmlinkage void plat_wired_tlb_setup(void);
 extern void bmips_cpu_setup(void);
 
 static inline unsigned long bmips_read_zscm_reg(unsigned int offset)
diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
index c7d75807d..58b201eb4 100644
--- a/arch/mips/include/asm/idle.h
+++ b/arch/mips/include/asm/idle.h
@@ -6,7 +6,7 @@
 #include <linux/linkage.h>
 
 extern void (*cpu_wait)(void);
-extern asmlinkage void r4k_wait(void);
+asmlinkage void r4k_wait(void);
 extern void r4k_wait_irqoff(void);
 
 static inline int using_skipover_handler(void)
diff --git a/arch/mips/include/asm/paccess.h b/arch/mips/include/asm/paccess.h
index af81ab0da..67efa9440 100644
--- a/arch/mips/include/asm/paccess.h
+++ b/arch/mips/include/asm/paccess.h
@@ -22,8 +22,8 @@
 #define __PA_ADDR	".dword"
 #endif
 
-extern asmlinkage void handle_ibe(void);
-extern asmlinkage void handle_dbe(void);
+asmlinkage void handle_ibe(void);
+asmlinkage void handle_dbe(void);
 
 #define put_dbe(x, ptr) __put_dbe((x), (ptr), sizeof(*(ptr)))
 #define get_dbe(x, ptr) __get_dbe((x), (ptr), sizeof(*(ptr)))
diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index ef72c46b5..5673c7518 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -160,8 +160,8 @@ extern unsigned long exception_ip(struct pt_regs *regs);
 #define exception_ip(regs) exception_ip(regs)
 #define profile_pc(regs) instruction_pointer(regs)
 
-extern asmlinkage long syscall_trace_enter(struct pt_regs *regs);
-extern asmlinkage void syscall_trace_leave(struct pt_regs *regs);
+asmlinkage long syscall_trace_enter(struct pt_regs *regs);
+asmlinkage void syscall_trace_leave(struct pt_regs *regs);
 
 extern void die(const char *, struct pt_regs *) __noreturn;
 
diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index a545568f1..5e1b73a06 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -58,7 +58,7 @@ extern cpumask_t cpu_coherent_mask;
 
 extern unsigned int smp_max_threads __initdata;
 
-extern asmlinkage void smp_bootstrap(void);
+asmlinkage void smp_bootstrap(void);
 
 extern void calculate_cpu_foreign_map(void);
 
diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index d6ccd5344..a9d6616ad 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -29,7 +29,7 @@ struct task_struct;
  * This function is used whilst scheduling to save the context of prev & load
  * the context of next. Returns prev.
  */
-extern asmlinkage struct task_struct *resume(struct task_struct *prev,
+asmlinkage struct task_struct *resume(struct task_struct *prev,
 		struct task_struct *next, struct thread_info *next_ti);
 
 extern unsigned int ll_bit;
diff --git a/arch/mips/kernel/r4k-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
index 83970ac7e..31bf3146f 100644
--- a/arch/mips/kernel/r4k-bugs64.c
+++ b/arch/mips/kernel/r4k-bugs64.c
@@ -182,7 +182,7 @@ asmlinkage void __init do_daddi_ov(struct pt_regs *regs)
 
 static __init void check_daddi(void)
 {
-	extern asmlinkage void handle_daddi_ov(void);
+	asmlinkage void handle_daddi_ov(void);
 	unsigned long flags;
 	void *handler;
 	long v, tmp;
diff --git a/arch/mips/kernel/signal-common.h b/arch/mips/kernel/signal-common.h
index 136eb20ac..65e262b7f 100644
--- a/arch/mips/kernel/signal-common.h
+++ b/arch/mips/kernel/signal-common.h
@@ -32,13 +32,13 @@ extern int fpcsr_pending(unsigned int __user *fpcsr);
 #define unlock_fpu_owner()	({ pagefault_enable(); preempt_enable(); })
 
 /* Assembly functions to move context to/from the FPU */
-extern asmlinkage int
+asmlinkage int
 _save_fp_context(void __user *fpregs, void __user *csr);
-extern asmlinkage int
+asmlinkage int
 _restore_fp_context(void __user *fpregs, void __user *csr);
 
-extern asmlinkage int _save_msa_all_upper(void __user *buf);
-extern asmlinkage int _restore_msa_all_upper(void __user *buf);
+asmlinkage int _save_msa_all_upper(void __user *buf);
+asmlinkage int _restore_msa_all_upper(void __user *buf);
 
 extern int setup_sigcontext(struct pt_regs *, struct sigcontext __user *);
 extern int restore_sigcontext(struct pt_regs *, struct sigcontext __user *);
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 8ec1e185b..0d963f427 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -77,31 +77,31 @@
 #include "access-helper.h"
 
 extern void check_wait(void);
-extern asmlinkage void skipover_handle_int(void);
-extern asmlinkage void handle_int(void);
-extern asmlinkage void handle_adel(void);
-extern asmlinkage void handle_ades(void);
-extern asmlinkage void handle_ibe(void);
-extern asmlinkage void handle_dbe(void);
-extern asmlinkage void handle_sys(void);
-extern asmlinkage void handle_bp(void);
-extern asmlinkage void handle_ri(void);
-extern asmlinkage void handle_ri_rdhwr_tlbp(void);
-extern asmlinkage void handle_ri_rdhwr(void);
-extern asmlinkage void handle_cpu(void);
-extern asmlinkage void handle_ov(void);
-extern asmlinkage void handle_tr(void);
-extern asmlinkage void handle_msa_fpe(void);
-extern asmlinkage void handle_fpe(void);
-extern asmlinkage void handle_ftlb(void);
-extern asmlinkage void handle_gsexc(void);
-extern asmlinkage void handle_msa(void);
-extern asmlinkage void handle_mdmx(void);
-extern asmlinkage void handle_watch(void);
-extern asmlinkage void handle_mt(void);
-extern asmlinkage void handle_dsp(void);
-extern asmlinkage void handle_mcheck(void);
-extern asmlinkage void handle_reserved(void);
+asmlinkage void skipover_handle_int(void);
+asmlinkage void handle_int(void);
+asmlinkage void handle_adel(void);
+asmlinkage void handle_ades(void);
+asmlinkage void handle_ibe(void);
+asmlinkage void handle_dbe(void);
+asmlinkage void handle_sys(void);
+asmlinkage void handle_bp(void);
+asmlinkage void handle_ri(void);
+asmlinkage void handle_ri_rdhwr_tlbp(void);
+asmlinkage void handle_ri_rdhwr(void);
+asmlinkage void handle_cpu(void);
+asmlinkage void handle_ov(void);
+asmlinkage void handle_tr(void);
+asmlinkage void handle_msa_fpe(void);
+asmlinkage void handle_fpe(void);
+asmlinkage void handle_ftlb(void);
+asmlinkage void handle_gsexc(void);
+asmlinkage void handle_msa(void);
+asmlinkage void handle_mdmx(void);
+asmlinkage void handle_watch(void);
+asmlinkage void handle_mt(void);
+asmlinkage void handle_dsp(void);
+asmlinkage void handle_mcheck(void);
+asmlinkage void handle_reserved(void);
 extern void tlb_do_page_fault_0(void);
 
 void (*board_be_init)(void);
-- 
2.56.1

