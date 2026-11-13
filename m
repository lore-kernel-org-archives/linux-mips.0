Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528917;
	b=HB7SRZocFqjnBYGF42MGjxJumm1H+F8htTEPmkNbkA8iG+m2q6vczGd2BgkT6sg4KBYT
	 feZuYVz0fYkly0TC9frcFVj3WB+GA/Q4uJcn38nTTf4h6MEik60k/Tn1IVbrjS0Nza5HB
	 mnmGw0SRUA/xEDXjSU6PRA930e6sGOkSAZ0Xl+USjaNvNSc+gSAlkpur+HA7EOVcj5eOW
	 K/k4m88OhVc6mnftiwkQdR2ck9C2nRZn5yITa82uLK3C95g9OySqr40w+bOuDgDLBudsg
	 gX3U3wa2PvC4dKSS8cGR1l+b9EBwgddjOp+QkC3EyIOdOlVPbB+lqa0X32ivFNtZKMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iB8Ek5PC625AhLa3IVdNzUKQeK5NZ2fH8Nko59u0dJQ=;
	b=cjynWWIpqCJTs3Yth4AjpP8VLNGa+hgYoQYh7EW17hcf4R4pmDQVrC8vXBo5Yf6zweb/
	 SRN3nBv6ibV1uXIdGzhd/Tzgi4HiQ1/H6bNZznUUBT5uuIbzUkXYBDmqsv3MwxsMTWt/e
	 OovoYMTNXjNRep5NqhuqAAVpaEpT4jRuhyAtw82ONhUHf5EdqXaiH3XkHKeWV3vFslqje
	 ACvDJuILnkHOyyELatwZ1lqBlQd1l0EO/wDp8Xd6VY1u643VHQZDTwgbQ1xXEiEQDwZeR
	 Wz4uNCfx+y2JgPWQZCKUsA43+95jf8LfJ6MC8S3A8GVnWTwtMUerRwxcoY5UAZFy2bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiDG+56S;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F13606A336
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 00:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F13606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiDG+56S
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1479be604so415082e87.1
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 16:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528915; x=1795133715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iB8Ek5PC625AhLa3IVdNzUKQeK5NZ2fH8Nko59u0dJQ=;
        b=tiDG+56SXTQWkW064KYpfKje598//RZWxyF7j9QK8tkzuIM8ZuLJ+V1ykfuB0bl2My
         v71VWx8EzqpK9WEpiQzinjCuW53515KyVtM/+eqGl8yXNULw66D3WNKo7GmxVMrQvtnb
         M95Ejnry4sp+4MC4js1Fe7FgTrAj0D3JnqaA+Xp/X2raqUHqjkbEXp4sqvS2+pKdhJ8p
         W+jnfpewTDplSpzLmsD32xrMgQp4g8xs8RDY1CGmCa/O2+wHaIsNfnKDEAJwbL6xr9f/
         Bs1mUxtPJE/7CsSqoPYcqheRhFRFifFfc6ZjgKEdhqZAupP67VwNRm3p7Fu7wt6IoqaO
         o8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528915; x=1795133715;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iB8Ek5PC625AhLa3IVdNzUKQeK5NZ2fH8Nko59u0dJQ=;
        b=Y9PoTK1BsjWDYqb94yRSwKOksxuBIQPL0k77meVGKLXEgLDHAFo3BC0+4joaK9u5XC
         PHJLwEx5ZKrbLHHCOLPxOXDFAbi2FywtS8S0rHqlaYbIsxU1mmol3juzhNwpV/Lsqabv
         sF1fMNqGD7UV3cTXfjrK2O8jhWBLeUgNcZqbV5lSDJ+YRXevwHCaTUd0jZSMBEwvJND4
         4MIos1ScEMHriHbofLazIRu4df7F8nomXQxRAbu+pqLLFgk1bAiBbuKgZJ3riiQ7z0Pe
         MbPDqsKBN2t8+Va1gkCIqs7u1TJM4W8/rt8YD7C0Id8l980UuOdjBNnnZdu9L4GEHJ87
         Ibsw==
X-Forwarded-Encrypted: i=1; AL+hErHUnzwpNmvqdJnszdIxwTHPO70vGGHA6jq3jelQq6n7cYVg8bgEds9bh92wkqxw0bm91Wsoo7svVp1f@vger.kernel.org
X-Gm-Message-State: APuU4Z//nlcBBJ25gqPXva9sAy+HU6a1aktr1X7bZxm5tZzub5FXydTm
	IAUNW71MxjRgCsuCad9mW/qaQuW6+Msm4bbTR6+lDBnj4OJvC13NtP6b
X-Gm-Gg: AYBFou3gwKG2Ac7ZM+Pia2m5tIzjUVGIsq68DGynm6x2up6tfiHuEOioOPjXYdcqztM
	DqJTYwQJ6OlTeGDatbaVKJTDxWEWZw5jgykLXV+tcLPeuHCivk/edoCG0W+o9xPLsODcfXsdovV
	TLU/IziS1zxh9KTr8OykeNGnWYKnidjFz+jOo8GySfG+AUrBdWvOTdtAeMY6h+hxbQvcGAuAePg
	qZ5RQSTSo5x/gVo5YVhgs3UrE84uUnNnNNvbrwQ53N9r8asA+vX0KpyNLYgQAklRlxbsfr32r1/
	OzCsvW6c2rdvt54WI4Zt7Jtz58V/iChCybXxXvZi3tyk1eDwGgAaLtjHSn1ZIrnYzSKRRZ/YXvx
	5Ls35VDVYXFd+45atAfZe8aifE9o8SHRUmtU3bLKfmg4Xw+R6kYUBeFCdcBcGqeQv/aezqSf39a
	q+d4ktTQBHa2jIOs3O9njKian9cErM9EO8PLUWVDFxnvW0hM8P61yCT8DXnw7gMQmbDiFRUsQuq
	Hs4vE6j3op27b/zR2MeC1tFt01BExr1SvfBRHaErXWVwFUtYAnd4+kz4HzTjpoRupXBx0nDkZ+3
	sLrBMhj3xCOD2sHFOTF4QTWSQZiAFhIngVej9DngS+vawoQ3FvD8xgeGXdK2pJPaNmzVBJe8ivY
	gA66bdYj+/Q==
X-Received: by 2002:a05:6512:1394:b0:5bb:7b64:340d with SMTP id 2adb3069b0e04-5c170795308mr372572e87.28.1794528914766;
        Thu, 12 Nov 2026 16:15:14 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:13 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 04/10] MIPS: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:10 +0400
Message-ID: <20261113001432.128201-5-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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

