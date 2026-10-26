Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022184;
	b=pWWkoqcw9xLf9V3vCleuTQzqXuHdTtKxNxbj6rRSJv8kaRuJZed6EBvLEwJvGr8V8J0P
	 8kdKUTIRaJ1UBSzCV2Rhwqb3mbHjSmfzSA1Thm7Sbe7RukIecbHLr7mVPfpQ4849DYpAu
	 Dl3EA8xmPRgeeI9dgZlHloWUcv18oHHAMhXkD/v6tZxtGdI/0NzOpFtECP7ekf5jPNcV4
	 Ako/++Zoi8bzpBZYqKZuSxQAdb3HTIUDw9H/EwpaIs0BitTBj6NV5HcI7GBntwOi8gQIq
	 PqZYF5k1Xvgx52q2vO1sku/R+K73xaIOx+doRJELBUalJDw0Meon5zAfKon4q90YhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022184;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u4KKCk1xjejNMSMyah5Bx7wSAw8O+SLNygyU60aqdPY=;
	b=FT8tRrTVYw5xu5/463PN0Uy0dCde02nExshxVlWiel2WCInEFgQYcoC0lYqwMDhAuMfI
	 ug86/hD1AVQ0OwsP4743Kuv1fm573S/JDzA7gRLIDXPjhR2s2BtKmbhvIcRW/XQg3uM0x
	 lSz8lZDvm6T67ciJVmFEmRQWYeiq8gN07THposgzQ3n856KnoLT15VugmZL4roGu3tdND
	 Ww2P7n1R0qahoZ0Z77ahxSQVTlx3UN42OtnK0k7AEvg+/sLmx7EQCbu11gWw6Wkyd7V49
	 lFT2E/KD6qxKfvp8jJIXxghOHgvCbINnHvOzpSVAKSengq9YukvqOL7RhdqqdVyatng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BiQ5VTYp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6E5606A32D;
	Mon, 26 Oct 2026 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BiQ5VTYp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD51F01828;
	Mon, 26 Oct 2026 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022183;
	bh=u4KKCk1xjejNMSMyah5Bx7wSAw8O+SLNygyU60aqdPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BiQ5VTYpQHUNvSixNOIKNW0WjiyoBkZhgsKz6E0zIaMMO5kVziTjCawhxiX/fRm0S
	 NJ2aHpL4gaeaFmj1PtwcPa4aKcVK/I97wWUsmcS7cP1eaCcpT1nY83LnXsmNDxE9Eg
	 NJ7ZD8oONFSgjC/LNZBmgnY+x6dBc1dmcCeLl4c7upUD2+4fwE+VW+Fd+kywLSD14/
	 dPwafEu4uWuCWB9n42cnJ+5/CAWqItJSnfMyHQGLDH53vMD2/4IF18mW6xSOoM7Rty
	 CeMUVwi78XsgoglLH5xrB8Edc7c3NCcFVadNETaPw4M1qfgZfCBBN+hnV15FUnJc4D
	 7BOW+FYkHicPA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] MIPS: Use SC_BEQZ in the futex and sysmips ll/sc loops
Date: Mon, 26 Oct 2026 14:41:41 +0100
Message-ID: <20261026134147.15988-2-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134147.15988-1-kaloz@kernel.org>
References: <20261026134147.15988-1-kaloz@kernel.org>
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

The R10000 variants of the futex operations and of
sysmips(MIPS_ATOMIC_SET) open-code the beqzl that SC_BEQZ expands to
under CONFIG_WAR_R10000_LLSC. Use SC_BEQZ, so they follow any change
to it.

No functional change.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---

Notes:
    checkpatch warns about whitespace before the quoted newlines: the
    replaced lines keep the column alignment of the surrounding asm, as the
    beqzl lines they replace did.

 arch/mips/include/asm/futex.h | 5 +++--
 arch/mips/kernel/syscall.c    | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/futex.h b/arch/mips/include/asm/futex.h
index 05832eb240fa..9bfae351b82e 100644
--- a/arch/mips/include/asm/futex.h
+++ b/arch/mips/include/asm/futex.h
@@ -12,6 +12,7 @@
 
 #include <linux/futex.h>
 #include <linux/uaccess.h>
+#include <asm/asm.h>
 #include <asm/asm-eva.h>
 #include <asm/barrier.h>
 #include <asm/compiler.h>
@@ -35,7 +36,7 @@
 		"	" insn	"				\n"	\
 		"	.set	arch=r4000			\n"	\
 		"2:	sc	$1, %2				\n"	\
-		"	beqzl	$1, 1b				\n"	\
+		"	" __stringify(SC_BEQZ) "	$1, 1b		\n"	\
 		__stringify(__WEAK_LLSC_MB) "			\n"	\
 		"3:						\n"	\
 		"	.insn					\n"	\
@@ -151,7 +152,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 		"	move	$1, %z5					\n"
 		"	.set	arch=r4000				\n"
 		"2:	sc	$1, %2					\n"
-		"	beqzl	$1, 1b					\n"
+		"	" __stringify(SC_BEQZ) "	$1, 1b			\n"
 		__stringify(__WEAK_LLSC_MB) "				\n"
 		"3:							\n"
 		"	.insn						\n"
diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index 1bfc34a2e5b3..cdc03322839f 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -115,7 +115,7 @@ static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 		"1:	ll	%[old], (%[addr])			\n"
 		"	move	%[tmp], %[new]				\n"
 		"2:	sc	%[tmp], (%[addr])			\n"
-		"	beqzl	%[tmp], 1b				\n"
+		"	" __stringify(SC_BEQZ) "	%[tmp], 1b		\n"
 		"3:							\n"
 		"	.insn						\n"
 		"	.section .fixup,\"ax\"				\n"
-- 
2.47.3

