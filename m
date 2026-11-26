Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683556;
	b=yTPUbzBQj/vEOTi5j8cG+XF4R2rmU3F6cF4PHf57dZ79gfsg3cYoeYyNTkeeR7kAY4Rd
	 aAJRwW/Ky46b2WbrFipqnR6iOk7Bcu/ybYmrBevWA3OxBndMeaFak/xF0Xb6TNUUP9dWZ
	 lFo+lwUv28556f8uqENLkxbpbALH08tWxLFuNUD8rgbAe1jMw4Lm1UKqB3/ZoaIM53I0R
	 peX8UZUQvDS7zw+Ny+WeR/slnHYc3+FrNHPAJEdFB8Veyux/yfp3MwFDkkHF15kCKq/TR
	 oFswIvatLgb/enOEglCBQ1ku3IO6ZLk8xB7FWqWLZm7sY5RQQdqoUt2hvhZlBV9cq4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GPy4SQygtFEl73+yPefIfenUgwMOUWGTN4uUgLHCsrY=;
	b=hiWJNTGVEyYvQmQa32QibSogYY9x6ay1amQYyCf2WYhT2aKyDVC93bRxku2MBh7bKWxx
	 UayvSwr9GD6xNPCKKiPKQmYvMIr/JGIPzpVdSVE82Wi2x1Wp0uyQMgVgUr7Q6VRSeBMBv
	 2HP1vusbtb3KFcprmdVjyIC0LcRJkxBFcwL0Rj5wgyjrXXOffnEYskXzPUylZpa6nKFXt
	 MLatDC9onr5u+VHEwhaFPlnz9U5Sw1XC2ZH3rE2mcH2LQm2TZ3KUU+IXoiYyYTQa0ogit
	 4SLVV3AOn2lNJ0BcAZjMsJP70QVk5g9QEqmu8aPdzyPTwrfYk5f2jxtoLVIgSNaiQLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n37bb49i;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D8B606A33C
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D8B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n37bb49i
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4719667f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683555; x=1796288355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPy4SQygtFEl73+yPefIfenUgwMOUWGTN4uUgLHCsrY=;
        b=n37bb49iWbRzAmdIYS9lkTT2DFK9Qa9igez1eT882eCCZ3W/aQKhksetUkjqPQ3HP8
         VBAkqNaifZJFqjZm8JrMmERn3kDkbvFEjKCGct7TIHoXs7y3D96CxGZZAay3z7qamd0d
         DDih/ssSPD/sHhLirMPtv/Ez98oep3hrHwy8ktgEZt6N9eSqx4OBxvjVvCtT3sdxzCUG
         GztAMX9EkA6Fu7YlJZoi/AGC3qXcishhihrKq3MYHXBKUNt7rUS5j27XQGbMtoXuJDg7
         F/dCpQRarF6j2Akr/iQoCJ7fYGttASpeM9Fx8FFCsBeZZG+ysHjLrBzls7cqq/Y9TzPf
         zqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683555; x=1796288355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPy4SQygtFEl73+yPefIfenUgwMOUWGTN4uUgLHCsrY=;
        b=GE+kRsMjral1FhhgGK5XEPbyW3Vg8imQ2iWLDTF1VGY86ICgy3SeZU2qNq7YfIvODp
         /S4aHh6aWLbBb56rHjVYBUGwI6xHrGsS2uoQEa3J4GKm08B67/VXndFfe6qRha/lqOfe
         nGgiHEYBbwWFT/RXl0n23roPje3n90ClqLqQ1FGdRXZQWp+8POiZhHj4wByHVTE7KPrX
         BP49KwhkLLi5rb+zSfliKGLch1sFCTzXPF4Q3ymhLSYyNBH3XpwVTRIJIgwCqBkgR8EH
         mER+wZurgD4+dTnGvPe76Hvv0AGK0b/9BSaZ4R+2zXblVamta3rOZlZ5Xjdbo4aSDHJa
         sVOg==
X-Gm-Message-State: APuU4Z9hrczMEmioNpklR+R91t95PfLiGpdVC/LRBztG5lXLB2flKkpU
	92ac3ngkoT6IeqSyObaoqXPRGD3E+ztwS/FBhhcn+LNR7Xea5dyM49fJ
X-Gm-Gg: AZFdTZe7aklbhMVThF79+Oa3Sfs6MUDRuRZ8q9FC93KKReRvwnyeRMnHehd2mNL1f7o
	g91/Qh0StJXscEi//oTlslyl9DP/V9U7da9QLaQRdo9Y2WQHi/SIAbw+xShYLe3v//dfHk5tsyv
	0rfgrDN56XDVJyWtTLBqwVum0b3FQZMNHXtS3M18qLMnrgppEZudZM1L94uc1nAIKBOU6iqfcjt
	6eZo4kIL/CIa0PrSfRbLE/DfpE0m0gqPEkCfoyhC7gzl/Kn3srEMQbPNXPaUPx0eibDIyhnawTb
	F5ksYU0X9+rDh5awRvMqfs/OWqP9ypVsDQNGAp3fBYXV63lsEHCWdjsv7TZGcIdIM0JxfbLGPjf
	kXRRJYY8mth0fOsI4qXneN1eixb3qxj6+7dvoLG8OLxvPtj0zE5qEwl5MaEBrbMY4I5BcFmG8HV
	jmXFkV5HdE4vDRjE130KNo8AGRCFW2Xj9w7eQ2/qeQy2n4I/FuYnUXiNUSaRGn60IeiLG4Yb6h1
	kHRqPzVvhgZpHrFuQcnpk//geNLQH4KnhIRxj/u8wtAayOacEewS7XnQdgnKbR3eQUlEJwLWUfN
	E122ViMd/uJLcqJqZT+ia4BTEy1rvL6QsKDtlnqt233m8smuwuJ24g==
X-Received: by 2002:a05:6000:3106:b0:4ac:2194:755a with SMTP id ffacd0b85a97d-4ac219475a1mr46280827f8f.41.1795683554934;
        Thu, 26 Nov 2026 00:59:14 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm30455997f8f.15.2026.11.26.00.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:14 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH RESEND] MIPS: OCTEON: use the free memory below the kernel
Date: Thu, 26 Nov 2026 08:59:13 +0000
Message-ID: <20261126085913.814434-1-orgads@gmail.com>
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

plat_mem_setup() asks bootmem only for memory above _end. The kernel
is loaded at 0x1100000, so whatever bootmem has free below _text is
never added to memblock. On a CN6335 board with the Cavium bootloader
that is 14MB, 0x200000-0xffffff:

  before: node 0: [mem 0x0000000001100000-0x0000000001cc6fff]
  after:  node 0: [mem 0x0000000000200000-0x0000000000ffffff]
          node 0: [mem 0x0000000001100000-0x0000000001cc6fff]

Claim it before the main loop, in 1MB pieces since the holes there are
small and unaligned. It counts towards max_memory like the rest, and a
piece inside the crash kernel range, which is added on its own, is
skipped as the main loop does. bootmem never hands out what the
bootloader reserved (the exception vectors, its named blocks, the
kernel image itself), so only free memory is claimed.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: no reply since the posting of 2026-10-27,
https://lore.kernel.org/all/20261027060227.2687979-1-orgads@gmail.com/
Unchanged and still applies to mips-next (dfe3ece66313); only the
Assisted-by tag is dropped (an LLM helped write this patch).

Tested on mips-next with cavium_octeon_defconfig (KEXEC=y, CRASH_DUMP=n)
on a CN6335 board, 4GB, Cavium U-Boot 1.1.1: "Memory:" goes from
4023588K/4169492K to 4037924K/4183828K available. Built with KEXEC=n
and CRASH_DUMP=y as well.

 arch/mips/cavium-octeon/setup.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..2b1bc8fafac5 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1022,6 +1022,27 @@ void __init plat_mem_setup(void)
 	 * which is handled by memblock
 	 */
 	cvmx_bootmem_lock();
+	/*
+	 * The loop below only takes memory above the kernel. Claim what
+	 * bootmem has free below it as well, 1MB at a time: the holes the
+	 * bootloader leaves there are small and not aligned to
+	 * mem_alloc_size.
+	 */
+	while (total < max_memory) {
+		memory = cvmx_bootmem_phy_alloc(0x100000, 0,
+						__pa_symbol(&_text),
+						0x100000,
+						CVMX_BOOTMEM_FLAG_NO_LOCKING);
+		if (memory < 0)
+			break;
+#ifdef CONFIG_KEXEC
+		/* The crash kernel range is already added */
+		if (memory < crashk_end && memory + 0x100000 > crashk_base)
+			continue;
+#endif
+		memblock_add(memory, 0x100000);
+		total += 0x100000;
+	}
 	while (total < max_memory) {
 		memory = cvmx_bootmem_phy_alloc(mem_alloc_size,
 						__pa_symbol(&_end), -1,
-- 
2.53.0

