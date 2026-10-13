Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16A5218BF;
	Tue, 13 Oct 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897555; cv=none; b=Mk7wQvMD84AFicHyOVCGcg7KJcYTgqnxeLr44dX9V4FnsrmKBi2A4AW3tiH1h2pEbCZ3/W+IBQN88lWKicfjymPcZ6MAgHNK3ugHB+k+qysuSV+ipAeumsSHFlKWjiodJyrMTjjmGLifsF9NuCIAVyxGI8Ldeq7K/IMQK0Qf7PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897555; c=relaxed/simple;
	bh=lbHjYbC1zRCOk7XVI2r47M9FUf5nAX7UuUudqwW6SPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI2TrMerQRo44kF6F+KQLIGB/DoiGqasSRnjPJisuH/Y29LCoRMp0MP43J8p7CTXJ908bgreryOYnykLybvSeaJBVpGpo8JTlNeIuQ1nlAMGXu6G5YUsFIFZjtqjskW8sNheMgk81g/rKO61FUCkgPri9CYMLJiY08tcbBTVkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3dl+9wU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3dl+9wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A9A1F00893;
	Tue, 13 Oct 2026 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897553;
	bh=poBhghnObYxhWWfQ1lKp5AWTCknazXXlCxi6JwoNMT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U3dl+9wU0+/yQXBoR84Bu/V4AcQDApR9ZY3AAmy3qUjK+mw9hi9+dr+OUohlgn0yN
	 4byGSq+ScvhKczK9RGY4eNqc+Pj27a1MwmCvaXlkQKfePtXExmXEvepyeB37UMedRO
	 c/0uvFpoPpo9ObWYRbPlDhZ/UQLXwfNIaJpdIGxsaHH5c+5PUVgbHR/3KgUBvVAuCd
	 ILTEE7dNuJsk0EF7ODbvI/2Rm8bvQiymntjqAkKnBKaOBIHp+SlFIurvw1VgtBu2jB
	 UxM2Dgt7lIDwIORWXrSOCCSox5T0ap4r8v9aiiAtReihztQ9lYtyopI3mSEDrIcA/D
	 4DEu4GuSJvZZw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 22/53] MIPS: SGI-IP27: load the kernel at node offset 0x40000
Date: Tue, 13 Oct 2026 15:16:42 +0200
Message-ID: <6653ff69dc537385ed564f9240616b1183d60857.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Bedrock machine's PROM owns node memory below offset 0x40000. Link
both the mapped and the unmapped kernel there instead of at 0x1c000.
On an Origin 200/2000 the kernel moves up by 144KB, and the 144KB
below it stays reserved and unused.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/mach-ip27/kernel-entry-init.h |  2 +-
 arch/mips/include/asm/sn/mapped_kernel.h            |  6 +++---
 arch/mips/sgi-ip27/Platform                         | 11 ++++++-----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
index 1bedd3c3bc58..958f4b390df8 100644
--- a/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
+++ b/arch/mips/include/asm/mach-ip27/kernel-entry-init.h
@@ -49,7 +49,7 @@
 	dli	t0, 0xffffffffc0000000
 	dmtc0	t0, CP0_ENTRYHI
 	GET_NASID_SHFT	t3, t0
-	li	t0, 0x1c000		# Offset of text into node memory
+	li	t0, 0x40000		# Offset of text into node memory
 	dsllv	t1, t1, t3		# Shift text nasid into place
 	dsllv	t2, t2, t3		# Same for data nasid
 	or	t1, t1, t0		# Physical load address of kernel text
diff --git a/arch/mips/include/asm/sn/mapped_kernel.h b/arch/mips/include/asm/sn/mapped_kernel.h
index 3f1049807018..28227718e391 100644
--- a/arch/mips/include/asm/sn/mapped_kernel.h
+++ b/arch/mips/include/asm/sn/mapped_kernel.h
@@ -10,7 +10,7 @@
 
 /*
  * Note on how mapped kernels work: the text and data section is
- * compiled at cksseg segment (LOADADDR = 0xc001c000), and the
+ * compiled at cksseg segment (LOADADDR = 0xc0040000), and the
  * init/setup/data section gets a 16M virtual address bump in the
  * ld.script file (so that tlblo0 and tlblo1 maps the sections).
  * The vmlinux.64 section addresses are put in the xkseg range
@@ -18,8 +18,8 @@
  * on IRIX to see where the sections go. The Origin loader loads
  * the two sections contiguously in physical memory. The loader
  * sets the entry point into kernel_entry using a xkphys address,
- * but instead of using 0xa800000001160000, it uses the address
- * 0xa800000000160000, which is where it physically loaded that
+ * but instead of using 0xa800000001184000, it uses the address
+ * 0xa800000000184000, which is where it physically loaded that
  * code. So no jumps can be done before we have switched to using
  * cksseg addresses.
  */
diff --git a/arch/mips/sgi-ip27/Platform b/arch/mips/sgi-ip27/Platform
index e734ee6abd44..b312bf69bce1 100644
--- a/arch/mips/sgi-ip27/Platform
+++ b/arch/mips/sgi-ip27/Platform
@@ -1,16 +1,17 @@
 #
 # SGI-IP27 (Origin200/2000)
 #
-# Set the load address to >= 0xc000000000300000 if you want to leave space for
-# symmon, 0xc00000000001c000 for production kernels.  Note that the value must
-# be 16kb aligned or the handling of the current variable will break.
+# A Bedrock machine's PROM owns node memory below offset 0x40000, so that is
+# where the kernel loads.  Set the load address to >= 0xc000000000300000
+# instead if you want to leave space for symmon.  Note that the value must be
+# 16kb aligned or the handling of the current variable will break.
 #
 cflags-$(CONFIG_SGI_IP27)	+= -I$(srctree)/arch/mips/include/asm/mach-ip27
 ifdef CONFIG_MAPPED_KERNEL
-load-$(CONFIG_SGI_IP27)		+= 0xc00000004001c000
+load-$(CONFIG_SGI_IP27)		+= 0xc000000040040000
 OBJCOPYFLAGS			:= --change-addresses=0x3fffffff80000000
 dataoffset-$(CONFIG_SGI_IP27)	+= 0x01000000
 else
-load-$(CONFIG_SGI_IP27)		+= 0xa80000000001c000
+load-$(CONFIG_SGI_IP27)		+= 0xa800000000040000
 OBJCOPYFLAGS			:= --change-addresses=0x57ffffff80000000
 endif
-- 
2.47.3

