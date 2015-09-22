Received: from mailapp01.imgtec.com ([195.59.15.196]:26849 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008792AbbIVSoghGsAP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 22 Sep 2015 20:44:36 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 4/6] MIPS: tidy EntryLo bit definitions, add PFN
Date: Tue, 22 Sep 2015 11:42:51 -0700
Message-ID: <1442947373-13345-5-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
References: <1442947373-13345-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, "Maciej W. Rozycki" <macro@linux-mips.org>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150922184251.wJK3kXU9RtyxsGU3uytyypk9hK4SLUGQMw0f10Xzjgc@z>

Tidy up the definition of the EntryLo RI & XI bits using BITS_PER_LONG
rather than #ifdef'ing on CONFIG_64BIT, and add a definition for the
offset to the PFN field for use by a later patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mipsregs.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index d3cd8ea..76dbb38 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -126,15 +126,9 @@
 #define R3K_ENTRYLO_N		(_ULCAST_(1) << 11)
 
 /* MIPS32/64 EntryLo bit definitions */
-#ifdef CONFIG_64BIT
-/* as read by dmfc0 */
-#define MIPS_ENTRYLO_XI		(_ULCAST_(1) << 62)
-#define MIPS_ENTRYLO_RI		(_ULCAST_(1) << 63)
-#else
-/* as read by mfc0 */
-#define MIPS_ENTRYLO_XI		(_ULCAST_(1) << 30)
-#define MIPS_ENTRYLO_RI		(_ULCAST_(1) << 31)
-#endif
+#define MIPS_ENTRYLO_PFN_SHIFT	6
+#define MIPS_ENTRYLO_XI		(_ULCAST_(1) << (BITS_PER_LONG - 2))
+#define MIPS_ENTRYLO_RI		(_ULCAST_(1) << (BITS_PER_LONG - 1))
 
 /*
  * Values for PageMask register
-- 
2.5.3
