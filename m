Received: from mail-pd0-f176.google.com ([209.85.192.176]:39913 "EHLO
        mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6827897Ab3FLS2taEALf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 12 Jun 2013 20:28:49 +0200
From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH] MIPS: OCTEON: Don't clobber bootloader data structures.
Date: Wed, 12 Jun 2013 11:28:33 -0700
Message-ID: <1371061713-29028-1-git-send-email-ddaney.cavm@gmail.com>
Return-Path: <ddaney.cavm@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20130612182833.pYv-jgdawe_9NQRxsfVnTZE-2MpfB2cI3KoxUY8Ta4M@z>

From: David Daney <david.daney@cavium.com>

Commit abe77f90dc (MIPS: Octeon: Add kexec and kdump support) added a
bootmem region for the kernel image itself.  The problem is that this
is rounded up to a 0x100000 boundary, which is memory that may not be
owned by the kernel.  Depending on the kernel's configuration based
size, this 'extra' memory may contain data passed from the bootloader
to the kernel itself, which if clobbered makes the kernel crash in
various ways.

The fix: Quit rounding the size up, so that we only use memory
assigned to the kernel.

Can be applied to v3.8 and later.

Signed-off-by: David Daney <david.daney@cavium.com>
Cc: <stable@vger.kernel.org>
---

This should probably go into 3.10

 arch/mips/cavium-octeon/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 01b1b3f..1e1e18c 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -996,7 +996,7 @@ void __init plat_mem_setup(void)
 	cvmx_bootmem_unlock();
 	/* Add the memory region for the kernel. */
 	kernel_start = (unsigned long) _text;
-	kernel_size = ALIGN(_end - _text, 0x100000);
+	kernel_size = _end - _text;
 
 	/* Adjust for physical offset. */
 	kernel_start &= ~0xffffffff80000000ULL;
-- 
1.7.11.7
