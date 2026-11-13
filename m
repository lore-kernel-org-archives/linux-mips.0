Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794612852;
	b=ZqxkyCApRLwyoilUN6vaOe4GlPeWANSC6PBbcnFsU1Pn1y4JNSLcoRSR8NSWp5yKPDNM
	 xbzIYqBRs9W69WHGIPBmyiaGSJ2/mAflW7Z9mfvpvkK8xDlhCPWrtZT2xBBJhQ9m976UL
	 PEO3itEtv/4pVs19znqKgw3cj6GOGQXWmQvoFqJgFTZSF2aR5hfHfYvaeFaKm0kNSiWn1
	 0qdP1Imlnv/ifxGzgtDktRo5mWB/Z8zOi8f9hLTm8psEdNyjqxGjGI8wJ4ZfY6KAiERYd
	 MmeftSKdVrHNcyXD3VShQ9Y6cjwQsIOP0+hWgdDFzN5La7XrkAiMTWI5+1DQ2G28REQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SzqhHzIyUkPcykE/zhmvkeMuT8irPjp2F6ctpeBwX0E=;
	b=l7y6dpvu567oXDpbYMA/RDAzZ3quU5KQWEk94imPPEmicCEL0gyPDqWS/f8VCpD6QtJQ
	 I3goEp5dsDgIEKfw6I7YkNPmT/idRnl/MjDwQC+ZA6BThQIFhaCmhYC8iqkhbdpYZT/gH
	 2g74njO+1DZN4KFe24L+EtiWYOOEeEnO3Sctgc5qBHevHJy76KlBb/pzo2wNnWPTxO9Xo
	 3PLUIsZlM6v+6iDVXSX+DLF32CdK7rlqAhEbbqoCBn57++ixSoc6GG06kRmOXDfR7ILnj
	 Sv9fVLffs8a91xd9Iy2SoxmanTSkGFJ5s3vOHB3Cp3B255JCY8VcYyQr5cuaYpiF4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AgCj6PVi;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A3606A8B8
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 23:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B38A3606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AgCj6PVi
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37000e7234bso2420595eec.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 15:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794612851; x=1795217651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzqhHzIyUkPcykE/zhmvkeMuT8irPjp2F6ctpeBwX0E=;
        b=AgCj6PViOiKnu8WSAd5219tSNZofkGFppOQvuEk9DPU8P2xqGgPLnTGfXAi5zP8LO7
         60pYBMh43oKrEScROTguZkXevYvonBBpkVaPFpEku+WKts9i6HcuqWzTdDtC7F8QLJh4
         /ZFZoC4MRGz5t9qb0CXf1pqlhRyYnD5gcUMdR+yqf7DHuS5/cD0p9SZ3aHZHR22F56sb
         MKqsMcqOBi7AgpORiO8X/69R7CDmtvbKkSeL8p8wv84a6dIKbj59crpgnPf1R44ih69+
         joBBmo1R1zcXIzskbqS8BcxtO3dDl8RzTrEDPiOmw+WgtGEg7kgCkZaFBo5T5S3pj/PP
         Q9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794612851; x=1795217651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzqhHzIyUkPcykE/zhmvkeMuT8irPjp2F6ctpeBwX0E=;
        b=dq+GfOo+iyIkKmo6q31dWXeBtvnxKYo4irBi2hYRMAVnpz+DITPRKNiyCpJG8eyHPd
         kaKoTM3445xVyZPPCYgs6e5mOiJ9xuRd5F0IJ45LAp3eA55bEoedrwYcxY6eH8wLSvdM
         wd/BB2SNkQY/EAfF8O0jKCnT/XqCl9CrIWNXJZxr3ndGgI3dyxkFnuMAASSPHezLa+6w
         nbaluDUPc9VVus6SwqgqRC466UvvrxTmLow0cBk8Ll8VKha3JAXVCidFWZmfafJdgnS8
         fdpCVfZVoCa6ijQEJIsoygvK37r8DYlb356eczWRoNTvybGSjrnTw9UIY7xFny9Agn7s
         Eu2w==
X-Gm-Message-State: APuU4Z9VH+wgt+983Urszg0ZnlzNYO3bnNwhaalVrmAZr7VZ5ESg+ghz
	QfZ4S28XEEqK8+IX3pJxBWsF304Tsny3kSGkHP2zVG8d4dJKnSyz0hBKhqebXw==
X-Gm-Gg: AYBFou2J23Q0uuOq3vGdghvm3Mep2wyQn0WhdiqPwr+ymPznCR94gUpkqOnpcODBda6
	+iOmYcqV5IoTLWuar4jmOWbqueVSKFisrl5JF7rQ8Uh7tn+VZP0iY+SUp62lBaTF19DjPGjpdoi
	1/3yZICgCqsmeoYPSSMWYScpV1Tr/BGu0hVQixZqSVlq0+GL9r3pclt0NPZZdwoRbHmeLnNpY0p
	O0GFjm8FnkuBQdGvXaK4vAPkJmnBeZKnFrbapxaVmAHbGo6jszp3XIiJZudSvlqLFrDZMIfDVuj
	OhZooiSSwCXBb45uTmQIr4sQMGR1GNF3/9hmJPd6nscb+hylWdWqwEyhQaii+/oDTitOXS2uiWB
	F93h8hVpi/EOvxWOhRvn2ll5w04o8D79qCrYxzdrEVdrb/XNu38s+K99QPoqOVa1u4ctnixyF4D
	aRVPlXFoZu0yKv9kNA1wui/98nskUR1hq1NrkUW1yaV6CWbpNPlXXBQ83tzweUx1oZDBdt9THi4
	k43VgUsmRunfYrru8O3rkRlySXNUb5L5yQ7XJmaDCStPylKJcDEW6VDZstolLKuA5cg93zBNZBl
	MCUPERzmG+EwspoIiKaqmApS2y69QA==
X-Received: by 2002:a05:7300:f794:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37963376965mr3418939eec.4.1794612850586;
        Fri, 13 Nov 2026 15:34:10 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm10726041eec.9.2026.11.13.15.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:34:08 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v2 2/3] MIPS: perf: Add SB1 userspace callchain unwinding
Date: Fri, 13 Nov 2026 15:33:55 -0800
Message-ID: <20261113233358.538698-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113233358.538698-1-f.fainelli@gmail.com>
References: <20261113233358.538698-1-f.fainelli@gmail.com>
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

Restore the userspace callchain capability formerly available through
MIPS OProfile, exposing it through perf for SB1 and SB1A. Commit
5f307491f3a0 ("MIPS: oprofile: Add callgraph support") introduced an
in-kernel userspace prologue scanner, which disappeared with the removal
of MIPS OProfile support in e258958945c6 ("arch: mips: Remove CONFIG_OPROFILE
support"). The MIPS perf userspace callchain hook remained unimplemented.

Follow the former OProfile approach of examining instructions before the
sampled PC to find standard MIPS stack adjustments and saved return
addresses. Bound each scan to 128 instructions, use nofault user reads,
validate frame data and stack progress, and stop at the perf stack limit.
Handle o32, n32 and n64 address widths and the actual sw/sd return-address
slot widths, rather than relying on the kernel's unsigned long size.
Allow the sampled leaf to use the live return-address register, and permit
repeated return PCs when the stack advances so recursion is not truncated.

This complements the existing MIPS DWARF callchain mechanism, enabled by
1ddc96bd42da ("MIPS: kernel: Support extracting off-line stack traces from
user-space with perf") and b5f184fbdb03 ("perf tools: Support MIPS unwinding
and dwarf-regs"). With --call-graph dwarf, the kernel records user registers
and a stack snapshot for the perf tool to unwind using DWARF information.
The new walker instead produces PERF_SAMPLE_CALLCHAIN entries in the
kernel for ordinary perf -g/--call-graph fp sampling, without requiring
DWARF unwind information or a userspace unwinding library. It does not
change or replace the DWARF path, which can handle frames beyond the
standard prologues recognized by this best-effort scanner.

Limit enablement to SB1 and SB1A, whose standard instruction encoding is
handled here and which have neither MIPS16 nor microMIPS. Other MIPS CPU
types retain their existing userspace callchain behavior. Nonstandard
prologues, dynamic stack adjustments and signal trampolines can truncate
chains.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/kernel/perf_event.c | 110 ++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/perf_event.c b/arch/mips/kernel/perf_event.c
index 5d7a9c03903b..cb2099416ac6 100644
--- a/arch/mips/kernel/perf_event.c
+++ b/arch/mips/kernel/perf_event.c
@@ -13,15 +13,117 @@
 
 #include <linux/perf_event.h>
 #include <linux/sched/task_stack.h>
+#include <linux/uaccess.h>
 
+#include <asm/cpu-type.h>
+#include <asm/inst.h>
 #include <asm/stacktrace.h>
 
 /* Callchain handling code. */
 
-/*
- * Leave userspace callchain empty for now. When we find a way to trace
- * the user stack callchains, we will add it here.
- */
+struct sb1_user_frame {
+	unsigned long pc;
+	unsigned long sp;
+	unsigned long ra;
+};
+
+static unsigned long sb1_user_address(unsigned long addr)
+{
+	if (IS_ENABLED(CONFIG_64BIT) && test_thread_flag(TIF_32BIT_ADDR))
+		return (u32)addr;
+	return addr;
+}
+
+/* Best-effort prologue unwinding, as provided by the former MIPS OProfile. */
+static bool sb1_unwind_user(struct sb1_user_frame *frame)
+{
+	unsigned long pc = frame->pc, caller = frame->ra;
+	unsigned int frame_size = 0, ra_size = 0, ra_offset = 0, n;
+	union mips_instruction insn;
+
+	/* SB1 has neither MIPS16 nor microMIPS instructions. */
+	if ((pc & 3) || (frame->sp & 3))
+		return false;
+
+	for (n = 0; n < 128 && pc >= sizeof(insn); n++) {
+		pc -= sizeof(insn);
+		if (copy_from_user_nofault(&insn, (void __user *)pc, sizeof(insn)))
+			break;
+		if (insn.i_format.rs == 29 && insn.i_format.rt == 29 &&
+		    (insn.i_format.opcode == addiu_op ||
+		     insn.i_format.opcode == daddiu_op)) {
+			/* A positive adjustment belongs to an epilogue. */
+			if (insn.i_format.simmediate >= 0)
+				break;
+			frame_size = -insn.i_format.simmediate;
+			break;
+		}
+		if (insn.i_format.rs == 29 && insn.i_format.rt == 31 &&
+		    insn.i_format.simmediate >= 0) {
+			if (insn.i_format.opcode == sw_op)
+				ra_size = sizeof(u32);
+			else if (insn.i_format.opcode == sd_op)
+				ra_size = sizeof(u64);
+			else
+				continue;
+			ra_offset = insn.i_format.simmediate;
+		}
+		/* Do not scan into the preceding function through a return. */
+		if (insn.r_format.opcode == spec_op &&
+		    insn.r_format.func == jr_op)
+			break;
+	}
+
+	if (ra_size) {
+		u64 ra64;
+		u32 ra32;
+		void __user *slot = (void __user *)(frame->sp + ra_offset);
+
+		if (!frame_size || ra_offset + ra_size > frame_size)
+			return false;
+		if (ra_size == sizeof(ra32)) {
+			if (copy_from_user_nofault(&ra32, slot, sizeof(ra32)))
+				return false;
+			caller = ra32;
+		} else {
+			if (copy_from_user_nofault(&ra64, slot, sizeof(ra64)))
+				return false;
+			caller = ra64;
+		}
+	}
+
+	caller = sb1_user_address(caller);
+	if (!caller || (caller == frame->pc && !frame_size) || (caller & 3) ||
+	    !access_ok((void __user *)caller, sizeof(insn)) ||
+	    frame->sp + frame_size < frame->sp)
+		return false;
+	frame->sp += frame_size;
+	frame->pc = caller;
+	/* Only the sampled leaf may use the live return-address register. */
+	frame->ra = 0;
+	return true;
+}
+
+void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
+			 struct pt_regs *regs)
+{
+	struct sb1_user_frame frame = {
+		.pc = sb1_user_address(regs->cp0_epc),
+		.sp = sb1_user_address(regs->regs[29]),
+		.ra = sb1_user_address(regs->regs[31]),
+	};
+	unsigned long saved_baduaddr;
+
+	if (current_cpu_type() != CPU_SB1 && current_cpu_type() != CPU_SB1A)
+		return;
+	/* Nofault reads must not clobber an interrupted usercopy's fault address. */
+	saved_baduaddr = current->thread.cp0_baduaddr;
+	do {
+		if (perf_callchain_store(entry, frame.pc))
+			break;
+	} while (sb1_unwind_user(&frame));
+	current->thread.cp0_baduaddr = saved_baduaddr;
+}
 
 static void save_raw_perf_callchain(struct perf_callchain_entry_ctx *entry,
 				    unsigned long reg29)
-- 
2.53.0

