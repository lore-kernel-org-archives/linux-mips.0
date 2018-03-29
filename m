Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:45166 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990408AbeC2MYAiCU0x (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 29 Mar 2018 14:24:00 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH 1/2] MIPS: memset.S: EVA & fault support for small_memset
Date: Thu, 29 Mar 2018 10:28:23 +0100
Message-ID: <1522315704-31641-2-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
References: <1522315704-31641-1-git-send-email-matt.redfearn@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Matt.Redfearn@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Matt Redfearn <matt.redfearn@mips.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20180329092823.Nn1eY44UJ5pGvAciJv2K6jKiAzcKVQZp53gZQb15IxQ@z>

The MIPS kernel memset / bzero implementation includes a small_memset
branch which is used when the region to be set is smaller than a long (4
bytes on 32bit, 8 bytes on 64bit). The current small_memset
implementation uses a simple store byte loop to write the destination.
There are 2 issues with this implementation:

1. When EVA mode is active, user and kernel address spaces may overlap.
Currently the use of the sb instruction means kernel mode addressing is
always used and an intended write to userspace may actually overwrite
some critical kernel data.

2. If the write triggers a page fault, for example by calling
__clear_user(NULL, 2), instead of gracefully handling the fault, an OOPS
is triggered.

Fix these issues by replacing the sb instruction with the EX() macro,
which will emit EVA compatible instuctions as required. Additionally
implement a fault fixup for small_memset which sets a2 to the number of
bytes that could not be cleared (as defined by __clear_user).

Reported-by: Chuanhua Lei <chuanhua.lei@intel.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>

---

 arch/mips/lib/memset.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index a1456664d6c2..90bcdf1224ee 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -219,7 +219,7 @@
 1:	PTR_ADDIU	a0, 1			/* fill bytewise */
 	R10KCBARRIER(0(ra))
 	bne		t1, a0, 1b
-	sb		a1, -1(a0)
+	 EX(sb, a1, -1(a0), .Lsmall_fixup\@)
 
 2:	jr		ra			/* done */
 	move		a2, zero
@@ -260,6 +260,11 @@
 	jr		ra
 	andi		v1, a2, STORMASK
 
+.Lsmall_fixup\@:
+	PTR_SUBU	a2, t1, a0
+	jr		ra
+	 PTR_ADDIU	a2, 1
+
 	.endm
 
 /*
-- 
2.7.4
