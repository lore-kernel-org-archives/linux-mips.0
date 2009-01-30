Received: from rtp-iport-1.cisco.com ([64.102.122.148]:29201 "EHLO
	rtp-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21366066AbZA3Snw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 30 Jan 2009 18:43:52 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: [PATCH] MIPS: Allocate exception vector on 64 KiB boundary
Date: Fri, 30 Jan 2009 13:43:42 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A28982392E@xmb-rtp-218.amer.cisco.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <ddaney@caviumnetworks.com>
Message-ID: <20090130184342.LygTdwlFUCNWrSXFLbfP1KUVGKKJfSQCf9xJdgyzAOo@z>

Fix problem with code that incorrectly modifies ebase.

Commit 566f74f6b2f8b85d5b8d6caaf97e5672cecd3e3e had a change that
incorrectly
modified ebase. This backs out the lines that modified ebase and then
modified
the code to allocate the exception vector with an alignment that
guarantees
that bits 15..12 are always zero. This is a good thing in any case as it
will work regardless of the interrupt vector spacing, and may be what
the
original code was attempting to accomplish.

Signed-off-by: David VomLehn <dvomlehn@cisco.com>
---
 arch/mips/kernel/traps.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 3530561..a0ce7fc 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1571,8 +1571,6 @@ void __cpuinit set_uncached_handler(unsigned long
offset, void *addr,
 #ifdef CONFIG_64BIT
 	unsigned long uncached_ebase = TO_UNCAC(ebase);
 #endif
-	if (cpu_has_mips_r2)
-		ebase += (read_c0_ebase() & 0x3ffff000);
 
 	if (!addr)
 		panic(panic_null_cerr);
@@ -1605,7 +1603,8 @@ void __init trap_init(void)
 #endif
 
 	if (cpu_has_veic || cpu_has_vint)
-		ebase = (unsigned long) alloc_bootmem_low_pages(0x200 +
VECTORSPACING*64);
+		ebase = (unsigned long)
+			__alloc_bootmem(0x200 + VECTORSPACING*64, 1 <<
16, 0);
 	else {
 		ebase = CAC_BASE;
 		if (cpu_has_mips_r2)
