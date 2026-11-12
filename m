Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510570;
	b=cfxxSyjX9riNntBTJtduXAhvBEkzP2JWJAn+9nf1/4nq4Xduc9YYR27Hl+rE2qDaDBsb
	 2OaLedsrixTECQckJNkmOLlMVu3fyJbgSpfQNRwTtYXwfyXbFmEcThSJdhrHrzu5L5tNN
	 ThXbVIxBT/cG+6KXL+lqzjc6IIj2IB13UxL51YZW8rEBIhnVaRbnYQQFMSIgtZygcwszv
	 eLaoQubCu0SME6f0ia0WpFuQKMW4b1GiQbpd0P5HduCm326m3T9WhIIVRWjg2FcKYd0hn
	 RoTGU65QbSeqboI8PHWpTsbbPmYAPq+nWTWMS+fEENE3jlSvWFpxBKt9Fhll9G8Z9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qKiDNdcM5kB7oFfApEbRvc3EIzPQh/Mfzhj7PLGh4G8=;
	b=XF4A1vKOX+340+a56yvhtU4GnHPb0/rCjDBdHtxNsgwDBclJUYNoOUKVShSIDeIUc8bH
	 zeTensozQzaS7fxKJGuV1SePlC0qTuX5Sl0yau38JRKPi81nv6rTlTV1rkn6Xw8vtQQty
	 2H3vABX/l/bKb2Xe8UU1oH5ff56g83/BwtKvTgew78m/5MHiLyL/55U9JVdHsJeIhGLRv
	 ZtxollMMmJsIY4P1+gO7x/BqIr0dPfWyzOgNwcp1QYnhHoO9WRDOyCJfiwHaWtEAcHDp2
	 QwSRLPR3UkDwu9oV7xrmJKPAM1YSPB3XQClxrhmTlIoWKQ9t1asIKmFR1D14/9JNydw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz7JFhqq;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440060A2634
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 19:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E440060A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz7JFhqq
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1501eec.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510569; x=1795115369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKiDNdcM5kB7oFfApEbRvc3EIzPQh/Mfzhj7PLGh4G8=;
        b=hz7JFhqq+xxhecYw17z9V5TBTrn4X4OolPiN9AOCXk+KWr4/jJtSGGE6DQ1+uICR5d
         R5P+ifk6+aGQunoN+E+Fqu+TpRMw4PyBLknE9AGtmtgrnOGpeRLUGHyUqd18j25pick3
         v0jlNLUk/zisOx0O+AujKoOSu1ztiaNkPTlZoDPLty40ZAXHxnm9GWOjv44BdtLlIHwx
         ZJquGynG6nnCoE4bjvQGvM6O5edgW2FsZWaq6wP7iiw8Sid+M3jQV5tBsk/pJSCJfVBY
         Khqnb+sIoIGIV1gDBZV//UcLBou/07dvUeXqK1HdZkw68N1gVZRO11p706UyK5wsKaHV
         ukPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510569; x=1795115369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKiDNdcM5kB7oFfApEbRvc3EIzPQh/Mfzhj7PLGh4G8=;
        b=irYZRfb9Z0xH2vp+K7UNfLGHLRDMZf3qJ4fSrjvY85dPjmPsnwFZRbFk4gxnfu1QYX
         wOVlTm6I6T2WBkgF5jTey4tI94cK7I3ZiPSjQ+u/Y+6yoNbdy1evRHNya3tSeIztMcGL
         RE7FayQl9FQkzVki2HIt+4+N6fPFBebBKIiKU3XVs0hdHlKAwpVg1BzSLSFtYYqMoN5K
         mpd8KlcG6pBtD9WJKJnDKI4qy5T2kY8bmV8fMLTTpUb1fJX/tsBDJaU8CwON4herptUK
         TOMpRsKVyMWnzmG9dyC3IM6juhQ9nqo9ju4vz92b3+wdJwfrsOpRhAj3EsSSGKbIsx2K
         o0WA==
X-Gm-Message-State: APuU4Z+faFm3gknUblkoGJQPc9rF+cQ/FW7JUMDYIhlRrzitje1ikHvP
	I1hODWp4xtPlKzBZui2COi86LVzC66DXRYJaJWhQOTqMtpizcztHBLr01a4ncA==
X-Gm-Gg: AYBFou0JfB1XoVOm4+rHUKcKO+Ag4Xy5gm37J8frORQ4aDKfNmSMT4h73sUJNEE0Mnn
	N+btcPS+Huvi7yJFmRREd+fj3sMtkOWxK0fxVpx+PrfOJjQQXRDPF9i7dB5HOwn7SL7TZu9aW2i
	IqW2OFn2KfRUWmu8ennTKrmD6ZqBpnFBXQXUTp8YXuar4z4aX4yhWNcBkzIcrjTXD7E7BIZck3s
	xh6VBtXh1a8khi/4WiLqcTZNoBxJMIRJbPNms+w24czcDmPPQzkY3KhVOE3NvXW+kA0VjK2OV9K
	BpI525Qv4fhW4s8BbNfAVzkNen/m/RLFuC0C5XqBJ27mEe284R5LYim9+UNCrGjP/cJZQBFBcPn
	FBx7JzSaRqDDsLkXIP84buOTzNYiMlxdrek7I2MngRg8tCGRChJkm38nDy9Do8h93HYz8gI5c6M
	pNg73vlEVQabDs6o3ohK3HryY94P11Fhf3M5fDs3azHsPoxeiCc7ednLwwegfXF3GyEr0NsRwjP
	VgFL/K7RNZD6SvzRSYPga6JdKjjEDYkOclSaShyRim2DFsNiUF0aLTzufH/f1RVJpcJqKDrVgPV
	Ap8tFGiNWhU+uZyB56XxISlmfiQu+w==
X-Received: by 2002:a05:693c:41c7:20b0:371:ede8:3e9b with SMTP id 5a478bee46e88-379680cf32amr73747eec.36.1794510568954;
        Thu, 12 Nov 2026 11:09:28 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm395674eec.26.2026.11.12.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:09:28 -0800 (PST)
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
Subject: [PATCH 2/3] MIPS: perf: Add SB1 userspace callchain unwinding
Date: Thu, 12 Nov 2026 11:09:15 -0800
Message-ID: <20261112190916.3725141-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112190916.3725141-1-f.fainelli@gmail.com>
References: <20261112190916.3725141-1-f.fainelli@gmail.com>
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
 arch/mips/kernel/perf_event.c | 106 ++++++++++++++++++++++++++++++++--
 1 file changed, 102 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/perf_event.c b/arch/mips/kernel/perf_event.c
index 5d7a9c03903b..811ac8f03cab 100644
--- a/arch/mips/kernel/perf_event.c
+++ b/arch/mips/kernel/perf_event.c
@@ -13,15 +13,113 @@
 
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
+
+	if (current_cpu_type() != CPU_SB1 && current_cpu_type() != CPU_SB1A)
+		return;
+	do {
+		if (perf_callchain_store(entry, frame.pc))
+			break;
+	} while (sb1_unwind_user(&frame));
+}
 
 static void save_raw_perf_callchain(struct perf_callchain_entry_ctx *entry,
 				    unsigned long reg29)
-- 
2.53.0

