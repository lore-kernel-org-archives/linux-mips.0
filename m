Received: from mailapp01.imgtec.com ([195.59.15.196]:62068 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013069AbbBIQp1FYnHT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 9 Feb 2015 17:45:27 +0100
From: Daniel Sanders <daniel.sanders@imgtec.com>
Subject: [PATCH v3 3/5] MIPS: LLVMLinux: Fix an 'inline asm input/output type mismatch' error.
Date: Mon, 9 Feb 2015 16:44:58 +0000
Message-ID: <1423500298-21368-1-git-send-email-daniel.sanders@imgtec.com>
In-Reply-To: <1423481632-27903-1-git-send-email-daniel.sanders@imgtec.com>
References: <1423481632-27903-1-git-send-email-daniel.sanders@imgtec.com>
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
Cc: Daniel Sanders <daniel.sanders@imgtec.com>, Toma Tabacu <toma.tabacu@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20150209164458.hv8VePt5_9To9_ZIvlw_P7V6PVJidoQh0h6oYvzkp54@z>

Replace incorrect matching constraint that caused the error with an alternative
that still has the required constraints on the inline assembly.

This is the error message reported by clang:
arch/mips/include/asm/checksum.h:285:27: error: unsupported inline asm: input with type '__be32' (aka 'unsigned int') matching output with type 'unsigned short'
          "0" (htonl(len)), "1" (htonl(proto)), "r" (sum));
                                 ^~~~~~~~~~~~

The changed code can be compiled successfully by both gcc and clang.

Signed-off-by: Daniel Sanders <daniel.sanders@imgtec.com>
Signed-off-by: Toma Tabacu <toma.tabacu@imgtec.com>
Suggested-by: Maciej W. Rozycki <macro@linux-mips.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org

---

Rewrote the patch following Maciej's suggestion where he observed that
the assembly was somewhat strange and suggested correcting the
constraints and using a local of matching type.

Fixed a silly whitespace mistake that was introduced in v2.

 arch/mips/include/asm/checksum.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index 3418c51..ebad4f4 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -228,6 +228,8 @@ static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 					  __u32 len, unsigned short proto,
 					  __wsum sum)
 {
+	__wsum tmp;
+
 	__asm__(
 	"	.set	push		# csum_ipv6_magic\n"
 	"	.set	noreorder	\n"
@@ -280,9 +282,9 @@ static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 
 	"	addu	%0, $1		# Add final carry\n"
 	"	.set	pop"
-	: "=r" (sum), "=r" (proto)
+	: "=&r" (sum), "=&r" (tmp)
 	: "r" (saddr), "r" (daddr),
-	  "0" (htonl(len)), "1" (htonl(proto)), "r" (sum));
+	  "0" (htonl(len)), "r" (htonl(proto)), "r" (sum));
 
 	return csum_fold(sum);
 }
-- 
2.1.4
