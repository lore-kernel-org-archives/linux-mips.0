Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794281678;
	b=vLIPVMxmh9jnYMWjv/Hj6E8Y+pz1Cvg/mQ6evwgkTZcAMeNOdaYT1dRQsXnLXEa6Rlzk
	 PB9kawKwCGJa6Oteq44VuiWrKqZVD7NTASjDBTutYoW5xyDdJb0pTj2Geiv7hoG8nYg4f
	 ri4JscNGGKdohixdUDhq69N0qJvwxZKcUMa3a3qCcCdYvMElzm/dXPtjBjjf+yu9iCZqZ
	 qcFK6+Sg362SUOzAlj4RrP0Vep0x1WgdP/jCMqzRTR3ZUysZ7gzLqgbXFoedr4Rp3qZp1
	 BIDp7Sg9rtl0roOnD2n+AnpIBcw7GYB5Mp1I6qXZ06gT7Kzb9W8sMH8WC2PsJHti1BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281678;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LYv1CKERbEw7fNGLNxxo+sfXFH7+XHhvC5vGsHyg3zg=;
	b=gK5hhqHzpK+O1jipXl7K03CkiSmCtW91QVSvhF3RkU0aKVcOFZbYdIpiXludfxu4y7dR
	 XGhQqmIQ0HI7DkuLeThaq6hjJ4lnBLpJ3WDQ969F9F3qzXZp/2p6Zw0kUzpNdk2n5b6Wo
	 IVKNK2NsCVF0gZORpGZgyjMHDU6nfjhl5AHwwAr+mQkW/u40bBbIC9XWqzlV7NpdvZcc7
	 L6FsMDLpFtmVtkLSsjPrFEBB3gC7mr1FL6XIRfjlLLZli3Id5jluiKeRZ1Q3ELp8MZXIW
	 KBSrRsej6/Tmg94buhHuPL2SA3SR3V9wmrUpSayeeZV4Pm6qI6YWlCyFitGMVjsf4/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="crLP1/cm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD4606A321;
	Tue, 10 Nov 2026 03:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crLP1/cm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794281677;
	b=eG+DDFy+0gSCUIlag1hIu5rWrxdwGWKFtviOvkT2JGhWz5j8f1Jty5WFprNvnFiOMYXq
	 NJZe0Dh4hxPB/ckRJ14E/ZVaa7ykzfLTmhmIh0OXONoFx4LOzqxfTkg++ppJclffC5cTA
	 e5cTxfjcJnJ8CA3YGWE9NsiUDU9vEUneJ7GjXkT7WTOT+ISp6S4Ch22IlE7y16MqC0UhH
	 D17zbTpxdvZKJU8T6nSMZerifzeo4X3SclvTMYkvHsrxTu9j3ZtJc2dueuCOAftFCiLNa
	 ZZn6ef/nZFt7yI439qeupUCZ64iQW9O3wmVQlF6JaOtwy6aUzYfLZC1WVQurYWfo7bA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794281677;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=LYv1CKERbEw7fNGLNxxo+sfXFH7+XHhvC5vGsHyg3zg=;
	b=G7Hbq520XNHWvv1R8I2vTp2VedEQHjhpLZ7Zi+vGhEs+U83cBtXWzVM9ApHQH0tnVXr/
	 oNBTquzaoOyN4audQK1HB4PTNkgNNntnkDOu1goJfH9Wp1cv14Q3Py0GBFmEtEW0Wualo
	 TjZq01Wgo9gKDSsOxRE+3tbtZTm6bBYpwBNUo1yJD4frunwxdzNfy/cz69pwgog2omn+Z
	 xpM6lnVL9cvGS9Ei8FKGkhwIXKP2sDAcjdngP2Iw/KzUE7N9tpVtXX6oU9XqWdjTyJFF1
	 OTulMWq3a18PAQcWp8czUWJnfixlXaccXv91PqE3AqvnG1jK7JJyY6vKClLTsU1l+Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA7ED1F0089F;
	Tue, 10 Nov 2026 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794281677;
	bh=LYv1CKERbEw7fNGLNxxo+sfXFH7+XHhvC5vGsHyg3zg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=crLP1/cmI7h/w+xlSTDwBrqM7XmVZgDtXFh7hu+o328fsj3+22u0067DpDjhLwSP3
	 dMXBMnuCza5SKbe6Pgncn1GWjJmKnTuFsANzAvhu5XZ5QvgVqwyNY96+EKebXi7n1P
	 qs7wdit5ZK3xpjVA/vt9q5SZpSud++87J3GYJRRveI2YQTGE4uV7Et/gAZeJiiWPe6
	 oElFijmwWB2OKOBj5UhOb9zBm++f4dr0uDpH0qr2Qrz/0W1JRn3zCRtrnQ4eCcAGGO
	 4qqyiWYMw/Ist4eeBPQWofP6IWJ4XLWYE1781PfAS6Te7FUisX8IruuyEdfBZSv24t
	 a9SAV853pUcdQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 76903487B9;
	Tue, 10 Nov 2026 03:34:36 +0000 (UTC)
From: Hunter Laux via B4 Relay <devnull+hunterlaux.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 20:34:30 -0700
Subject: [PATCH] MIPS: Support TLBINV operating on the whole MMU
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-mips-tlbinvf-v1-1-a6d2eb7c8ffd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMaQ8moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNL3dzMgmLdkpykzLyyNF0zU6OkVAtTM7MkwxQloJaCotS0zAqwcdG
 xtbUAnE1S914AAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hunter Laux <hunterlaux@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794281676; l=4874;
 i=hunterlaux@gmail.com; s=20261109; h=from:subject:message-id;
 bh=7zG0ouhkFmv8BZte32qjH+t8nLTySmqybuLXdxnz7fc=;
 b=6oQNAzVgVlwd0Yng2MSx+UBDZZXMlr/u7w2YcO/KufQ+iPNHDCZovoXMOq54NIKclnen+Te7M
 WY2nxJSjCudDMnV30Wxb78kXDU6h7v7xJfMWThbiy6cf2RxBO7LPtd2
X-Developer-Key: i=hunterlaux@gmail.com; a=ed25519;
 pk=Z5VTsE4CAwditt0CNeG+rpPk7xDUVh+oHWDZlNNm8FI=
X-Endpoint-Received: by B4 Relay for hunterlaux@gmail.com/20261109 with
 auth_id=1476
X-Original-From: Hunter Laux <hunterlaux@gmail.com>
Reply-To: hunterlaux@gmail.com
Content-Transfer-Encoding: 7bit

From: Hunter Laux <hunterlaux@gmail.com>

Config4.IE = 3 means the TLBINV and TLBINVF instructions walk the whole
MMU in hardware: a single TLBINVF invalidates every non-wired entry, in
the VTLB and every FTLB set. Only IE = 2, where software must issue one
per FTLB set, is recognised, so such CPUs are treated as having no
TLBINV.

The Ingenic X2600 reports IE = 3 and has an FTLB. Without TLBINV,
r4k_tlb_uniquify() runs and, assuming FTLB parts have EHINV, writes
VPNs into FTLB entries of the wrong set; the boot hangs there.

Recognise IE = 3, and flush the whole TLB with a single TLBINVF on such
CPUs.

Tested on an Ingenic X2600 (Flashforge Adventurer 5X).

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
---
Recognise Config4.IE = 3; fixes a boot hang on the Ingenic X2600.
---
 arch/mips/include/asm/cpu-features.h |  3 +++
 arch/mips/include/asm/cpu.h          |  1 +
 arch/mips/include/asm/mipsregs.h     |  1 +
 arch/mips/kernel/cpu-probe.c         |  8 +++++++-
 arch/mips/mm/tlb-r4k.c               | 22 ++++++++++++----------
 5 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 3f11e5218e..33e8588781 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -80,6 +80,9 @@
 #ifndef cpu_has_tlbinv
 #define cpu_has_tlbinv		__opt(MIPS_CPU_TLBINV)
 #endif
+#ifndef cpu_has_tlbinv_mmu
+#define cpu_has_tlbinv_mmu	__opt(MIPS_CPU_TLBINV_MMU)
+#endif
 #ifndef cpu_has_segments
 #define cpu_has_segments	__opt(MIPS_CPU_SEGMENTS)
 #endif
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd2..26b2563c78 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -360,6 +360,7 @@ enum cpu_type_enum {
 #define MIPS_CPU_4KEX		BIT_ULL( 1)	/* "R4K" exception model */
 #define MIPS_CPU_3K_CACHE	BIT_ULL( 2)	/* R3000-style caches */
 #define MIPS_CPU_4K_CACHE	BIT_ULL( 3)	/* R4000-style caches */
+#define MIPS_CPU_TLBINV_MMU	BIT_ULL(4)	/* TLBINV[F] act on the whole MMU */
 #define MIPS_CPU_FPU		BIT_ULL( 5)	/* CPU has FPU */
 #define MIPS_CPU_32FPR		BIT_ULL( 6)	/* 32 dbl. prec. FP registers */
 #define MIPS_CPU_COUNTER	BIT_ULL( 7)	/* Cycle count/compare */
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 12a095dbf9..ba2ff442eb 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -809,6 +809,7 @@
 #define MIPS_CONF4_AE		(_ULCAST_(1) << 28)
 #define MIPS_CONF4_IE		(_ULCAST_(3) << 29)
 #define MIPS_CONF4_TLBINV	(_ULCAST_(2) << 29)
+#define MIPS_CONF4_TLBINV_MMU	(_ULCAST_(3) << 29)
 
 #define MIPS_CONF5_NF		(_ULCAST_(1) << 0)
 #define MIPS_CONF5_UFR		(_ULCAST_(1) << 2)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d..59d2b452ad 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -569,8 +569,14 @@ static inline unsigned int decode_config4(struct cpuinfo_mips *c)
 	config4 = read_c0_config4();
 
 	if (cpu_has_tlb) {
-		if (((config4 & MIPS_CONF4_IE) >> 29) == 2)
+		switch (config4 & MIPS_CONF4_IE) {
+		case MIPS_CONF4_TLBINV_MMU:
+			c->options |= MIPS_CPU_TLBINV_MMU;
+			fallthrough;
+		case MIPS_CONF4_TLBINV:
 			c->options |= MIPS_CPU_TLBINV;
+			break;
+		}
 
 		/*
 		 * R6 has dropped the MMUExtDef field from config4.
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 78bafa317f..2154819c63 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -75,19 +75,21 @@ void local_flush_tlb_all(void)
 	 * If there are any wired entries, fall back to iterating
 	 */
 	if (cpu_has_tlbinv && !entry) {
-		if (current_cpu_data.tlbsizevtlb) {
+		if (current_cpu_data.tlbsizevtlb || cpu_has_tlbinv_mmu) {
 			write_c0_index(0);
 			mtc0_tlbw_hazard();
-			tlbinvf();  /* invalidate VTLB */
+			tlbinvf();  /* invalidate VTLB (or the whole MMU) */
 		}
-		ftlbhighset = current_cpu_data.tlbsizevtlb +
-			current_cpu_data.tlbsizeftlbsets;
-		for (entry = current_cpu_data.tlbsizevtlb;
-		     entry < ftlbhighset;
-		     entry++) {
-			write_c0_index(entry);
-			mtc0_tlbw_hazard();
-			tlbinvf();  /* invalidate one FTLB set */
+		if (!cpu_has_tlbinv_mmu) {
+			ftlbhighset = current_cpu_data.tlbsizevtlb +
+				current_cpu_data.tlbsizeftlbsets;
+			for (entry = current_cpu_data.tlbsizevtlb;
+			     entry < ftlbhighset;
+			     entry++) {
+				write_c0_index(entry);
+				mtc0_tlbw_hazard();
+				tlbinvf();  /* invalidate one FTLB set */
+			}
 		}
 	} else {
 		while (entry < current_cpu_data.tlbsize) {

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261109-mips-tlbinvf-652be8566b1d

Best regards,
-- 
Hunter Laux <hunterlaux@gmail.com>


