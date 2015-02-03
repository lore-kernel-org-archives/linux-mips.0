Received: from mailapp01.imgtec.com ([195.59.15.196]:62457 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014439AbbBCNh7hrPUv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 3 Feb 2015 14:37:59 +0100
From: Daniel Sanders <daniel.sanders@imgtec.com>
Subject: [PATCH 3/5] MIPS: LLVMLinux: Fix an 'inline asm input/output type mismatch' error.
Date: Tue, 3 Feb 2015 13:37:17 +0000
Message-ID: <1422970639-7922-4-git-send-email-daniel.sanders@imgtec.com>
In-Reply-To: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
References: <1422970639-7922-1-git-send-email-daniel.sanders@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Daniel.Sanders@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Cc: Toma Tabacu <toma.tabacu@imgtec.com>, Daniel Sanders <daniel.sanders@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150203133717.Qybyu_GdZw-gLyVnKXyaLf3gRspDZISDvWRzBvgVnBE@z>

From: Toma Tabacu <toma.tabacu@imgtec.com>

Change the type of csum_ipv6_magic's 'proto' argument from unsigned
short to __u32.

This fixes a type mismatch between the 'htonl(proto)' inline asm
input, which is __u32, and the 'proto' output, which is unsigned
short.

This is the error message reported by clang:
arch/mips/include/asm/checksum.h:285:27: error: unsupported inline asm: input with type '__be32' (aka 'unsigned int') matching output with type 'unsigned short'
          "0" (htonl(len)), "1" (htonl(proto)), "r" (sum));
                                 ^~~~~~~~~~~~

The changed code can be compiled successfully by both gcc and clang.

Signed-off-by: Toma Tabacu <toma.tabacu@imgtec.com>
Signed-off-by: Daniel Sanders <daniel.sanders@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/checksum.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index 3418c51..683b9e7 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -225,7 +225,7 @@ static inline __sum16 ip_compute_csum(const void *buff, int len)
 #define _HAVE_ARCH_IPV6_CSUM
 static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 					  const struct in6_addr *daddr,
-					  __u32 len, unsigned short proto,
+					  __u32 len, __u32 proto,
 					  __wsum sum)
 {
 	__asm__(
-- 
2.1.4
