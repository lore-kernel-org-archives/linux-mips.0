Received: from mailapp01.imgtec.com ([195.59.15.196]:62717 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007400AbbFWLCp4MStL (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 Jun 2015 13:02:45 +0200
From: James Cowgill <James.Cowgill@imgtec.com>
Subject: [PATCH] MIPS: unaligned: fix build error on big endian R6 kernels
Date: Tue, 23 Jun 2015 12:02:00 +0100
Message-ID: <1435057320-46776-1-git-send-email-James.Cowgill@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Cowgill@imgtec.com>
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
Cc: James Cowgill <James.Cowgill@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Markos Chandras <markos.chandras@imgtec.com>, stable@vger.kernel.org
Message-ID: <20150623110200.o04Nj9GinSZVVS--MpVc77eZlK8GDCTOyIVHRqRXH6A@z>

Commit eeb538950367 ("MIPS: unaligned: Prevent EVA instructions on kernel
unaligned accesses") renamed the Load* and Store* defines in unaligned.c
to _Load* and _Store* as part of its fix. One define was missed out which
causes big endian R6 kernels to fail to build.

arch/mips/kernel/unaligned.c:880:35:
error: implicit declaration of function '_StoreDW'
 #define StoreDW(addr, value, res) _StoreDW(addr, value, res)
                                   ^

Fixes: eeb538950367 ("MIPS: unaligned: Prevent EVA instructions on kernel unaligned accesses")
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Markos Chandras <markos.chandras@imgtec.com>
Cc: <stable@vger.kernel.org> # 4.0+
Signed-off-by: James Cowgill <James.Cowgill@imgtec.com>
---
 arch/mips/kernel/unaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index af84bef..eb3efd1 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -438,7 +438,7 @@ do {                                                        \
 		: "memory");                                \
 } while(0)
 
-#define     StoreDW(addr, value, res) \
+#define     _StoreDW(addr, value, res) \
 do {                                                        \
 		__asm__ __volatile__ (                      \
 			".set\tpush\n\t"		    \
-- 
2.1.4
