Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793341;
	b=x5xCKOzc+NcncYFrdJ7zXi77WNKSgVXd/AD1aI/cgZdmwwH8SomTh9r9pndLges60a1p
	 xl6Q44fKIHIMykgXHnbBQYeEsDhfNmJUJuOzPetDLAuevGz6qIyNbsXY+mSsXJ1aPZpwS
	 dWh6x5UMuHJX9CMC8BTQ30amIRmn97vyMAeAnEXnj+wBvQnCl8PEG/7I2pm4iTkwb1GHh
	 lPN/Wf6KvCszbM3eHLzL7d8mEJO5t9hlY67zAC4JpKg5X3CXzDkcPLxzjxqeRSKr1YlWR
	 aoUJ2wosDbRQTACtMQ3R3jCaFr3mq0jciR+6YvT8vZecMNzFkjGPsCT8v+uENk//CPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8/gPUWQgBL4YpaUMj9IaoQs3NYT18BOp9IYonDJZev0=;
	b=dzsvVMrGlDyHo9ebW5HN5SlyixeICa3tNRu2084u5U5PQdZ7cFqhtWBF1LNx7M3TnE/p
	 H/fCqr0Ab/MPPOWmXodAU/y8H3qEvXR3UIgDwABqT9rv3KRySbM8MeNeT2BonqXSKeVfN
	 OozI9kEkl+TL/SM7hpyV3NyVrgdpXw4V7RgUNDtqUc+tszl1KQjl6RAljjRwNSRvBF1zd
	 Q/hD+o622hFgYLn0apWLG/+/UoyAJ5WozW+GmmDptCePHOZuqzDqe+jQe3wYeAdVqSvlF
	 +03wtUoJU36BRH2OKT+UlCratScShQTqTY+6woDm9+GZ71YV0mKmTcpd1IvDp6H4vjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTK6mp+t;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F22F606A31F
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 01:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F22F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTK6mp+t
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1367029f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 17:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794793340; x=1795398140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/gPUWQgBL4YpaUMj9IaoQs3NYT18BOp9IYonDJZev0=;
        b=VTK6mp+tpFSuXdi7YjleqCJglXkypHfOQ62H41qafcPNrwgmXRHtn3X8kEn4BXn5JG
         DdXpcliDlzl/yAoCy7FrFUgUyoa2ZLF71062DcuwqnmjgSIGl4mzENa1H4XyXDaQI5Sa
         oAIruFeVrW3QVZKNCCPRAm8dghAl9egUmlGrS6GDjBCBI8kk+aubNuX5zVivCgH9UFUb
         MSv7PD+BDw56sOxFNEa0aYv/vSiB9BI1/vTS0MPiweb4YyNQWjLn7Y8kGXKYTcevXHei
         tLD6donzmpZW5H5h0niCGrhWPYzpNwKwmWifj2Dki08S4eyun+w4QLzu9/zEQtxlDRze
         Btzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794793340; x=1795398140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/gPUWQgBL4YpaUMj9IaoQs3NYT18BOp9IYonDJZev0=;
        b=IpVjgIRE/HHCe/RlBQuiE5kB+vBDzv72P6le1EcWhpTr3J4a0pE0mk2NgbY1xHb/Ur
         cTXBW0vAaLOufZ9DpiXWFUy0J7JnKo1WbQ6skjCaPLdV6NckAxypri8j+FItGBjOa4eI
         zQFeCZx7yOvRBT5iKqIUQtCmY8Hlyj8LzlVK0BagU9Sc1aY3tf9KlZP/VW6cPHNsr4ql
         Vl235Kx9TvLhEtvRd8H1S3SchsNPgnvEHk7B6HIi5ovbZqUHUftdvbGoAZQbX5FMlOws
         3wbSQt+Y0jS2IhP3cm0Zdb+FaXQjv0K+RlaN2RpLkdf8vjr8RNZW/EWJ5bCg03NgCIvN
         khaw==
X-Gm-Message-State: APuU4Z+PvpXIFycGrwDKHVYe9NafMfwS/sZw37585qkLr869/kfaMxlc
	O4gxNtTmlX9JCF1xCpdzJhD95b5yBmcyYkuxt/99z1ph8hC9tBX/zU/B
X-Gm-Gg: AYBFou36kiPLV/MeV0pKgUxJxJQ6RG9klmp27CR+LMS9Ag7GlCevVence85e7IfulYO
	oGvQrVQxdMQB8BeH837nJri4SVZC62QvycYY2fjt4plldJN/jeIiwGMMaksN4kL9/mBfls2brec
	fruCqEt2cHYqUM2c9WeyeYR0+SkBO1vxNPdaUkR17arOVbKKpQ9q9uuSO53ZdQ/oKgSb5obrqRY
	ZxRqxlB5EF2KpDcrD7ppwI4d5/ZFFuNPUcKRplqc92vBezJeI0nQ5kcQqVB8q8xDpkqo3swQzAF
	sWw0qie9M0jwXvbeSHLau9uAsVNR45t50amMUg3CLNJwB7smoLUid5yZ6a52olhCulCcwpPLb2F
	OnRZ+N/BkBPVFoqJxjVaGJ3UxS8Uh/Y1ah9Jmh7ZxDpCOFgn/Af3c2oRYw+T7ses9NZyMzcgDm9
	yEJe3zuv7lQdzPUjrjYBgRmEuYGFAAAkEd8BH/RyUA8yBgmTMmVSz31Ts/89ic3HaLEmi5l3Orn
	nVcwkaiosEYrH6YawTnTxzpvy257ZS76to0g3A1cuvP3Jzgrh1ZUK1pPCU6EqqyqucXkdpvH/z1
	op/kzw5tONxxG6R5FF9sqc7D2E227wjOkLZnesr6Km0kV+KhiDKmAimsISUcpSWNGv0bXihHUDZ
	n5p4jvpoa1qWgCYQ91wCorxRavEvfYaPZK7agKU8uICX8+YIEDI+3thIteM5mr75GEAZsBOKziP
	Pi8p4q95aTjYP2e1So8XIi3nM=
X-Received: by 2002:a05:6000:46c4:b0:491:286f:8e63 with SMTP id ffacd0b85a97d-49c731648a8mr11496375f8f.14.1794793339534;
        Sun, 15 Nov 2026 17:42:19 -0800 (PST)
Received: from DESKTOP-D7IGS5L.localdomain (123.20.61.94.rev.vodafone.pt. [94.61.20.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm18342616f8f.4.2026.11.15.17.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:42:19 -0800 (PST)
From: Marco Martins <marcomartins86@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kexec: Sync the instruction cache with the copied kernel
Date: Mon, 16 Nov 2026 01:42:07 +0000
Message-ID: <20261116014207.3112156-1-marcomartins86@gmail.com>
X-Mailer: git-send-email 2.53.0
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

machine_kexec() writes back and invalidates the caches with
__flush_cache_all() and then calls kexec_reboot(), which still runs
set_cpu_online() and local_flush_icache_range() before it jumps to the
relocation code, so their lines stay valid in the instruction cache.
relocate_new_kernel() then copies the new kernel over the old one
through the data cache and jumps to it without writing the copy back
or invalidating the instruction cache, except on Octeon. Where both
kernels have code at the same address, the new kernel can run stale
instructions of the old one.

The new kernel calls set_cpu_online() in boot_cpu_init(), before it
prints anything, and hangs there when its copy sits at a different
address than the old kernel's. On an MT7620A (24KEc), a kexec from a
kernel with set_cpu_online() at 0x8002bb5c into one with it at
0x8002bb7c hung in all 5 tries; with this change in the old kernel,
the new one booted in all 4.

On R2 and later, SYNCI each copied page, which writes it back from the
data cache and drops it from the instruction cache, and jump to the new
kernel with JR.HB. Octeon keeps its own SYNCI of the whole instruction
cache.

The bug was found, and this patch and its description written, with an
AI coding assistant (Claude Code, model Claude Opus 5.5), asked to find
why images started with kexec on an MT7620A board sometimes hung. It
bisected the new kernel's boot with reset probes patched into the
image, and ran the tests on the board.

Fixes: 62cac480f33f ("MIPS: kexec: Make a framework for both jumping and halting on nonboot CPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Marco Martins <marcomartins86@gmail.com>
---
Tested on a TP-Link TL-WPA7510 v2 (MT7620A, MIPS 24KEc, single core)
with OpenWrt's 6.18.60 kernel. relocate_kernel.S and machine_kexec.c are
the same in 6.18.60 and v7.4-rc3, but OpenWrt adds a patch of its own to
both (command line arguments for the new kernel). The board runs this
change on top of that patch, in a form that assembles to the same
machine code. The 5 hangs and 4 boots above are from November 13;
without a serial console, a hang showed as the watchdog resetting the
board, as the kernel was booted with watchdog.stop_on_reboot=0. Since
then the board has run the change, and on November 15 alone kexec
started kernels laid out differently from the running one more than 30
times, all of which booted.

Built only in that 6.18.60 tree, with the board's configuration. Not
tested: SMP, where the other CPUs also jump into the new kernel, from
kexec_smp_wait; 64-bit; R6; Octeon.

 arch/mips/kernel/relocate_kernel.S | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
index de894a0..e3cae10 100644
--- a/arch/mips/kernel/relocate_kernel.S
+++ b/arch/mips/kernel/relocate_kernel.S
@@ -64,8 +64,25 @@ copy_word:
 	PTR_ADDIU	s4, s4, SZREG
 	PTR_ADDIU	s2, s2, SZREG
 	LONG_ADDIU	s6, s6, -1
-	beq		s6, zero, process_entry
+	beq		s6, zero, 2f
 	b		copy_word
+2:
+#if MIPS_ISA_REV >= 2 && !defined(CONFIG_CPU_CAVIUM_OCTEON)
+	/*
+	 * The old kernel's code may still be in the I-cache at this page's
+	 * address: write the page back from the D-cache and drop it from
+	 * the I-cache.
+	 */
+	rdhwr		t0, $1
+	beqz		t0, process_entry
+	li		t1, (1 << _PAGE_SHIFT)
+	PTR_SUBU	t1, s4, t1
+3:	synci		0(t1)
+	PTR_ADDU	t1, t1, t0
+	sltu		t2, t1, s4
+	bnez		t2, 3b
+#endif
+	b		process_entry
 
 done:
 #ifdef CONFIG_SMP
@@ -96,7 +113,11 @@ done:
 	sync
 #endif
 	/* jump to kexec_start_address */
+#if MIPS_ISA_REV >= 2
+	jr.hb		s1
+#else
 	j		s1
+#endif
 	END(relocate_new_kernel)
 
 #ifdef CONFIG_SMP

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

