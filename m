Received: from dalsmrelay2.nai.com ([205.227.136.216]:49091 "HELO
        dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with SMTP id S1490945Ab0IHGA2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 8 Sep 2010 08:00:28 +0200
Date: Wed, 8 Sep 2010 15:50:43 +1000
From: Greg Ungerer <gerg@snapgear.com>
Message-ID: <201009080550.o885ohjD014188@goober.internal.moreton.com.au>
Subject: [PATCH] mips: fix start of free memory when using initrd
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Cc: gerg@uclinux.org
Message-ID: <20100908055043.h7Jrzldr7nOJPW0uBrpbVxNhJvCivjD7fa2QJdHG1ds@z>


Hi All,

I have a typical Cavium/Octeon (5010) based system, that I sometimes
use a kernel and traditional initrd setup on. In a typical layout the
kernel is loaded into low physical RAM (via boot loader) and the initrd
is loaded somewhere above it. Everything runs fine, but the region
occupied by the initrd is effectively lost from usable RAM.

For example, with these boot args "rd_start=0x84000000 rd_size=0x00206000"
where the initrd is loaded at 64MB (and is just over 2MB in size) I end
up with:

Memory: 59620k/127152k available (2193k kernel code, 67532k reserved, 563k data, 192k init, 0k highmem)

Ouch!  A lot of RAM not usable.

It looks to me that the logic of setting the bootmem is not quite right
for the initrd case. If I patch arch/mips/kernel/setup.c with the patch
below I get all that memory back, and everything seems to work:

Memory: 121044k/127152k available (2193k kernel code, 6108k reserved, 563k data, 192k init, 0k highmem)

The patch just sets the bootmem map to always be the end of the kernel.
Then the bootmem reserve initrd logic does its work as expected.
(A little more cleaning up could be done I guess, but I want to know
the approach is correct first :-)

Am I mis-understanding how this is supposed to work?
Other architectures seem to set the bootmem to the end of the kernel.
Sparc has some extra checks to make sure that the bootmem setup data
doesn't overwrite the initrd, but otherwise is similar.

Regards
Greg



mips: fix start of free memory when using initrd

Currently when using an initrd on a MIPS system the start of the bootmem
region of memory is set to the larger of the end of the kernel bss region
(_end) or the end of the initrd. In a typical memory layout where the
initrd is at some address above the kernel image this means that the
start of the bootmem region will be the end of the initrd. But when
we are done processing/loading the initrd we have no way to reclaim the
memory region it occupied, and we lose a large chunk of now otherwise
empty RAM from our final running system.

The bootmem code is designed to allow this initrd to be reserved (and
the code in finalize_initrd() currently does this). When the initrd is
finally processed/loaded its reserved memory is freed.

Fix the setting of the start of the bootmem map to be the end of the
kernel.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/mips/kernel/setup.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 85aef3f..df8ed83 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -259,12 +259,13 @@ static void __init bootmem_init(void)
 	int i;
 
 	/*
-	 * Init any data related to initrd. It's a nop if INITRD is
-	 * not selected. Once that done we can determine the low bound
-	 * of usable memory.
+	 * Sanity check any INITRD first. We don't take it into account
+	 * for bootmem setup initially, rely on the end-of-kernel-code
+	 * as our memory range starting point. Once bootmem is inited we
+	 * will reserve the area used for the initrd.
 	 */
-	reserved_end = max(init_initrd(),
-			   (unsigned long) PFN_UP(__pa_symbol(&_end)));
+	init_initrd();
+	reserved_end = (unsigned long) PFN_UP(__pa_symbol(&_end));
 
 	/*
 	 * max_low_pfn is not a number of pages. The number of pages
