Received: from static-72-72-73-123.bstnma.east.verizon.net ([72.72.73.123]:51463
	"EHLO mail.sicortex.com") by ftp.linux-mips.org with ESMTP
	id S20021788AbXGJRV3 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 10 Jul 2007 18:21:29 +0100
From: pwatkins@sicortex.com
Subject: [PATCH] [MIPS] Fix resume for 64K page size
Date: Tue, 10 Jul 2007 13:20:51 -0400
Message-ID: <11840880513393-git-send-email-pwatkins@sicortex.com>
Return-Path: <pwatkins@sicortex.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Peter Watkins <pwatkins@sicortex.com>
Message-ID: <20070710172051.lNr1NYNkCpTjuGdTOHNQkPw-3Du_7Fwy9lk3gkjbSbs@z>

This fixes a bug when running 64K page size on r4k machines. 


Signed-off-by: Peter Watkins <pwatkins@sicortex.com>
---
 arch/mips/kernel/r4k_switch.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 0672959..65f0f91 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -85,7 +85,7 @@ #endif
 	move	$28, a2
 	cpu_restore_nonscratch a1
 
-#if (_THREAD_SIZE - 32) < 0x10000
+#if (_THREAD_SIZE) < 0x10000
 	PTR_ADDIU	t0, $28, _THREAD_SIZE - 32
 #else
 	PTR_LI		t0, _THREAD_SIZE - 32
-- 
1.4.2.4
