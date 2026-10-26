Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021245;
	b=fzwVbXdxYHzvJDHHIvQTQEkUhlaSBwfSiyhMcLEWZ9C6eGyAt7dtV0oXNox86ZD67l6i
	 W+ldkADYEayzjUaVguPep3FDs6RnCSD3TpMb/Zzd5PetAzjbGpCcrEW2HAy0uRbZDvmDg
	 Dqo0dmopVBdtggsRPLTv2C3EcmF0jVZuMRtN+QLF7/Ndjt+XOBgRMkWXSo7cc54h3xPeG
	 uT/Ts40SdeRQ/0JdUMnYEs38J3Xv76A76CfDualgGvfkQgN+V90Nj4Oh3/qfmDcGgJIrL
	 6iY+AdINl8HIEVWx/FY/Hv/Sb5bSzlkbCC47m9AP47f+lanOO75Plwi9O9oVZZuVh/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021245;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xfyn5b+NEh3dD49I55GVm90g3gZkn4bLLzZob5RD6T4=;
	b=Uyc7BCBjZAVB9iuEL753N+k06t5yKNXv60cCoPltcz1fFeZyXys3siOy4ExsuoAvMTOc
	 ub+MBv9nfmkRxK/8AKMDy1Jhxz+3OD5k0FDKFySfFDWC4YS8k3rRQXwVEdSqX+Pe0UJz/
	 29KS3jPoO9uQYagm68o0l/sB0tc9WmjuoB4Qr20L0PsKdwccdIDenjGWDvajtzVbVnn9Z
	 /ZIP/ZSygVNgKVxashaboGHQAdohck/H7jgJQ/NcLmhn8qrlGVnvlaqUeMhWgmLfUThik
	 0u2lmcLUdUXqVroE4NST69Bw4BzG0zaXFszjjIW4ii7nAAtJECOHqpNvSNdDZ0NliGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AL2r741h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E03606A31A;
	Mon, 26 Oct 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AL2r741h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC091F01825;
	Mon, 26 Oct 2026 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793021244;
	bh=Xfyn5b+NEh3dD49I55GVm90g3gZkn4bLLzZob5RD6T4=;
	h=From:To:Cc:Subject:Date;
	b=AL2r741h+vlrktyZPiCF3F7unPRutLHEGgqFDyCFyfQmffwkwqgW5gMnPwWUDjVQq
	 xFOHgEJEKpSz2nwYvxvauB4jwLPHmT0u4aaKbJeIeU5O1IXojMVMmOGhrgJbkpyRAF
	 DqFsIf/WqUvmLlmI4oXcb8J4Rv9layLLA2/dSAIPlNGP4DJ6WJwESx9kK0QIT1ILJZ
	 +VgHXe1ggkyjm6u4XHZi58E2LHalAesgyfPlk/w4ZWTrYV8PemuKkJw/LeQQ6aW+A4
	 6eoekZPra4CNZsPZXexzUNUf7a9seiJo370rPpjgdDGejiusyIBUW3t+iQIfF3SAzl
	 GL5Nz2gpoKZhQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: mm: Add an R10000 family cache error handler
Date: Mon, 26 Oct 2026 14:26:12 +0100
Message-ID: <20261026132613.9875-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

cache_parity_error() does not decode the R10000 family's CacheErr
layout, and panics with ERL set on every error.

Recover I-cache errors by rewriting both ways of the set, as
invalidating leaves the bad word in the data array, and panic on
others with ERL clear. The handler is built with CONFIG_CPU_R10000.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/traps.h |   2 +
 arch/mips/mm/Makefile         |   1 +
 arch/mips/mm/c-r4k.c          |   9 +++
 arch/mips/mm/cerr-r10k.c      | 141 ++++++++++++++++++++++++++++++++++
 arch/mips/mm/cex-r10k.S       | 125 ++++++++++++++++++++++++++++++
 5 files changed, 278 insertions(+)
 create mode 100644 arch/mips/mm/cerr-r10k.c
 create mode 100644 arch/mips/mm/cex-r10k.S

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 2a8a258730c9..7a21ca64684a 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -62,6 +62,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs,
 	unsigned long write, unsigned long address);
 
 asmlinkage void cache_parity_error(void);
+asmlinkage void do_cache_error_r10k(struct pt_regs *regs, int resumable);
+extern char except_vec2_r10k[];
 asmlinkage void ejtag_exception_handler(struct pt_regs *regs);
 asmlinkage void __noreturn nmi_exception_handler(struct pt_regs *regs);
 
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 304692391519..329fa1886f01 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CPU_R3K_TLB)	+= tlb-r3k.o
 obj-$(CONFIG_CPU_R4K_CACHE_TLB) += c-r4k.o cex-gen.o tlb-r4k.o
 obj-$(CONFIG_CPU_R3000)		+= c-r3k.o
 obj-$(CONFIG_CPU_SB1)		+= c-r4k.o cerr-sb1.o cex-sb1.o tlb-r4k.o
+obj-$(CONFIG_CPU_R10000)	+= cerr-r10k.o cex-r10k.o
 obj-$(CONFIG_CPU_CAVIUM_OCTEON) += c-octeon.o cex-oct.o tlb-r4k.o
 
 obj-$(CONFIG_IP22_CPU_SCACHE)	+= sc-ip22.o
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index d8aadd3dc057..76ff27dd2075 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1690,6 +1690,15 @@ static void r4k_cache_error_setup(void)
 		set_uncached_handler(0x100, &except_vec2_sb1, 0x80);
 		break;
 
+#ifdef CONFIG_CPU_R10000
+	case CPU_R10000:
+	case CPU_R12000:
+	case CPU_R14000:
+	case CPU_R16000:
+		set_uncached_handler(0x100, except_vec2_r10k, 0x80);
+		break;
+#endif
+
 	default:
 		set_uncached_handler(0x100, &except_vec2_generic, 0x80);
 		break;
diff --git a/arch/mips/mm/cerr-r10k.c b/arch/mips/mm/cerr-r10k.c
new file mode 100644
index 000000000000..1da88c9e1b90
--- /dev/null
+++ b/arch/mips/mm/cerr-r10k.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cache error handling for the R10000, R12000, R14000 and R16000.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/hardirq.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/panic.h>
+#include <linux/percpu.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+#include <linux/sched/debug.h>
+#include <linux/smp.h>
+
+#include <asm/mipsregs.h>
+#include <asm/ptrace.h>
+#include <asm/traps.h>
+
+#define CE_UNIT		GENMASK(31, 30)
+#define CE_UNIT_I	0
+#define CE_UNIT_D	1
+#define CE_UNIT_S	2
+#define CE_UNIT_SYS	3
+#define CE_EW		BIT(29)		/* second error before one was taken */
+#define CE_EE		BIT(28)		/* D-cache, system interface */
+#define CE_D		GENMASK(27, 26)	/* data array, way 1 and way 0 */
+#define CE_TA		GENMASK(25, 24)	/* tag address array */
+#define CE_TS		GENMASK(23, 22)	/* tag state array */
+#define CE_TM		GENMASK(21, 20)	/* D-cache tag mod array */
+#define CE_SA		BIT(25)		/* system address bus */
+#define CE_SC		BIT(24)		/* system command bus */
+#define CE_SR		BIT(23)		/* system response bus */
+#define CE_IIDX		GENMASK(13, 6)
+#define CE_DIDX		GENMASK(13, 3)
+#define CE_SIDX		GENMASK(22, 6)
+
+/* A line that keeps failing would otherwise be refetched forever. */
+#define CE_STORM	10
+
+struct cerr_r10k {
+	unsigned long count;
+	unsigned long window;
+	unsigned int recent;
+	bool active;
+};
+
+static DEFINE_PER_CPU(struct cerr_r10k, cerr_r10k);
+static DEFINE_RATELIMIT_STATE(cerr_r10k_rs, 5 * HZ, 10);
+
+static void cerr_r10k_decode(char *buf, size_t len, u32 cerr)
+{
+	const char *ew = cerr & CE_EW ? ", EW" : "";
+	const char *ee = cerr & CE_EE ? ", EE" : "";
+
+	switch (FIELD_GET(CE_UNIT, cerr)) {
+	case CE_UNIT_I:
+		scnprintf(buf, len,
+			  "I-cache error %08x: data %lu tag %lu state %lu, index %#lx%s",
+			  cerr, FIELD_GET(CE_D, cerr), FIELD_GET(CE_TA, cerr),
+			  FIELD_GET(CE_TS, cerr), cerr & CE_IIDX, ew);
+		break;
+	case CE_UNIT_D:
+		scnprintf(buf, len,
+			  "D-cache error %08x: data %lu tag %lu state %lu mod %lu, index %#lx%s%s",
+			  cerr, FIELD_GET(CE_D, cerr), FIELD_GET(CE_TA, cerr),
+			  FIELD_GET(CE_TS, cerr), FIELD_GET(CE_TM, cerr),
+			  cerr & CE_DIDX, ee, ew);
+		break;
+	case CE_UNIT_S:
+		scnprintf(buf, len,
+			  "S-cache error %08x: data %lu tag %lu, index %#lx%s",
+			  cerr, FIELD_GET(CE_D, cerr), FIELD_GET(CE_TA, cerr),
+			  cerr & CE_SIDX, ew);
+		break;
+	default:
+		scnprintf(buf, len,
+			  "system interface error %08x: data %lu%s%s%s, index %#lx%s%s",
+			  cerr, FIELD_GET(CE_D, cerr),
+			  cerr & CE_SA ? ", address" : "",
+			  cerr & CE_SC ? ", command" : "",
+			  cerr & CE_SR ? ", response" : "",
+			  cerr & CE_SIDX, ee, ew);
+		break;
+	}
+}
+
+/*
+ * Only I-cache errors are recovered, by the set rewrite in the entry code;
+ * every other cache error is fatal.
+ */
+asmlinkage void do_cache_error_r10k(struct pt_regs *regs, int resumable)
+{
+	struct cerr_r10k *ce = this_cpu_ptr(&cerr_r10k);
+	unsigned long errorepc = read_c0_errorepc();
+	u32 cerr = read_c0_cacheerr();
+	const char *why = "Unrecoverable cache error";
+	char desc[112];
+
+	if (!resumable) {
+		why = "Cache error in an exception handler";
+		goto fatal;
+	}
+	if (FIELD_GET(CE_UNIT, cerr) != CE_UNIT_I || (cerr & CE_EW))
+		goto fatal;
+	if (ce->active) {
+		why = "Nested cache error";
+		goto fatal;
+	}
+	if (time_after(jiffies, ce->window + HZ)) {
+		ce->window = jiffies;
+		ce->recent = 0;
+	}
+	if (++ce->recent > CE_STORM) {
+		why = "Cache error storm";
+		goto fatal;
+	}
+
+	ce->active = true;
+	nmi_enter();
+	ce->count++;
+	if (__ratelimit(&cerr_r10k_rs)) {
+		cerr_r10k_decode(desc, sizeof(desc), cerr);
+		pr_warn("CPU%u: %s, ErrorEPC %pS: recovered, %lu so far\n",
+			smp_processor_id(), desc, (void *)errorepc, ce->count);
+	}
+	nmi_exit();
+	ce->active = false;
+	return;
+
+fatal:
+	set_c0_status(ST0_DE);
+	cerr_r10k_decode(desc, sizeof(desc), cerr);
+	pr_emerg("CPU%u: %s, ErrorEPC %pS\n", smp_processor_id(), desc,
+		 (void *)errorepc);
+	show_regs(regs);
+	panic("%s", why);
+}
diff --git a/arch/mips/mm/cex-r10k.S b/arch/mips/mm/cex-r10k.S
new file mode 100644
index 000000000000..4e5df40ef1a2
--- /dev/null
+++ b/arch/mips/mm/cex-r10k.S
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cache error entry for the R10000, R12000, R14000 and R16000.
+ *
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+#include <asm/addrspace.h>
+#include <asm/asm.h>
+#include <asm/cacheops.h>
+#include <asm/regdef.h>
+#include <asm/mipsregs.h>
+#include <asm/stackframe.h>
+
+/*
+ * Copied to the cache error vector and fetched uncached. Only k0 and k1
+ * may be used here. An XKPHYS kernel may lie outside the 256MB region a j
+ * from the vector reaches.
+ */
+	LEAF(except_vec2_r10k)
+	.set	push
+	.set	noreorder
+	.set	noat
+#if defined(CONFIG_64BIT) && VMLINUX_LOAD_ADDRESS >= XKPHYS && \
+    VMLINUX_LOAD_ADDRESS < XKSEG
+	PTR_LA	k0, cache_error_r10k
+	PTR_LI	k1, TO_PHYS_MASK
+	and	k0, k0, k1
+	PTR_LI	k1, UNCAC_BASE
+	or	k0, k0, k1
+	jr	k0
+	 nop
+#else
+	j	cache_error_r10k
+	 nop
+#endif
+	.set	pop
+	END(except_vec2_r10k)
+
+/*
+ * Entered uncached with ERL set. An I-cache error is cleared by rewriting
+ * both ways of the set with zeroed tags and data of good parity. With EXL
+ * clear the error becomes an ordinary exception at ErrorEPC, handled on
+ * the kernel stack; with EXL set the interrupted handler's k0 and k1 are
+ * lost and it is never resumed. ERL is cleared so the handler can take
+ * exceptions.
+ */
+NESTED(cache_error_r10k, PT_SIZE, sp)
+	.set	push
+	.set	noreorder
+	.set	noat
+	mfc0	k0, CP0_CACHEERR
+	srl	k1, k0, 30		/* I-cache */
+	bnez	k1, 1f
+	 andi	k0, k0, 0x3fc0		/* VA[13:6] */
+	PTR_LI	k1, CKSEG0
+	or	k0, k0, k1
+	mtc0	zero, CP0_TAGLO
+	mtc0	zero, CP0_TAGHI
+	mtc0	zero, CP0_ECC
+	cache	Index_Store_Tag_I, 0(k0)	/* VA[0] selects the way */
+	cache	Index_Store_Tag_I, 1(k0)
+3:	cache	Index_Store_Data_I, 0(k0)	/* VA[5:2] the word */
+	cache	Index_Store_Data_I, 1(k0)
+	PTR_ADDIU k0, 4
+	andi	k1, k0, 0x3c
+	bnez	k1, 3b
+	 nop
+
+1:	mfc0	k0, CP0_STATUS
+	andi	k0, k0, ST0_EXL
+	bnez	k0, 2f
+	 nop
+	MFC0	k0, CP0_ERROREPC
+	MTC0	k0, CP0_EPC
+	mfc0	k0, CP0_STATUS
+	li	k1, ~ST0_ERL
+	and	k0, k0, k1
+	ori	k0, k0, ST0_EXL
+	mtc0	k0, CP0_STATUS
+	PTR_LA	k0, cache_error_r10k_resume
+	jr	k0
+	 nop
+
+	/* Nothing may post another cache error while this one is fatal. */
+2:	mfc0	k0, CP0_STATUS
+	li	k1, ~ST0_ERL
+	and	k0, k0, k1
+	li	k1, ST0_DE
+	or	k0, k0, k1
+	mtc0	k0, CP0_STATUS
+	PTR_LA	k0, cache_error_r10k_fatal
+	jr	k0
+	 nop
+	.set	pop
+	END(cache_error_r10k)
+
+NESTED(cache_error_r10k_resume, PT_SIZE, sp)
+	.cfi_signal_frame
+	.set	push
+	.set	noat
+	SAVE_ALL
+	CLI
+	move	a0, sp
+	li	a1, 1
+	jal	do_cache_error_r10k
+	RESTORE_TEMP
+	RESTORE_STATIC
+	RESTORE_AT
+	RESTORE_SOME
+	RESTORE_SP_AND_RET
+	.set	pop
+	END(cache_error_r10k_resume)
+
+NESTED(cache_error_r10k_fatal, PT_SIZE, sp)
+	.cfi_signal_frame
+	.set	push
+	.set	noat
+	SAVE_ALL
+	CLI
+	move	a0, sp
+	li	a1, 0
+	jal	do_cache_error_r10k
+	/* do_cache_error_r10k does not return when a1 is 0 */
+	.set	pop
+	END(cache_error_r10k_fatal)

base-commit: b2f6eb84b8bfd213c3df69f9ced41a501ac4de9b
-- 
2.47.3

