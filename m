Received: from 9pmail.ess.barracuda.com ([64.235.150.225]:52461 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990406AbeCVQcRbY9Q7 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Mar 2018 17:32:17 +0100
Date: Thu, 22 Mar 2018 16:30:41 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: [PATCH v3] MIPS: Use the entry point from the ELF file header
Message-ID: <alpine.DEB.2.00.1803221611430.2163@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org
Message-ID: <20180322163041.91jVX9SbryiVMUMfRBpI3Q2ChhU_Quh975uGBygdyVM@z>

In order to fetch the correct entry point with the ISA bit included, for 
use by non-ELF boot loaders, parse the output of `objdump -f' for the 
start address recorded in the kernel executable itself, rather than 
using `nm' to get the value of the `kernel_entry' symbol.

Sign-extend the address retrieved if 32-bit, so that execution is 
correctly started on 64-bit processors as well.  The tool always prints 
the entry point using either 8 or 16 hexadecimal digits, matching the 
address width (aka class) of the ELF file, even in the presence of 
leading zeros.

Signed-off-by: Maciej W. Rozycki <macro@mips.com>
---
Changes in v3:

- renamed from "MIPS: Set ISA bit in entry-y for microMIPS kernels", to 
  avoid confusion with commit 5fc9484f5e41,

- fixed the `sed' program to correctly pass through 64-bit values.

Changes in v2:

- rebased.

 We still handle the load address wrong in the presence of the 
CONFIG_PHYSICAL_START option, e.g.:

make -f ./scripts/Makefile.build obj=arch/mips/boot VMLINUX=vmlinux \
		VMLINUX_LOAD_ADDRESS=0x84000000 VMLINUX_ENTRY_ADDRESS=0xffffffff8463c870 PLATFORM="mti-malta/" ITS_INPUTS="vmlinux.its.S" ADDR_BITS=32 arch/mips/boot/vmlinux.srec

which again will be an issue with a 32-bit image and a 64-bit processor.  
But that's a matter for a separate fix.

  Maciej

---
 arch/mips/Makefile |   20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

linux-mips-start-address.diff
Index: linux-jhogan-test/arch/mips/Makefile
===================================================================
--- linux-jhogan-test.orig/arch/mips/Makefile	2018-03-21 17:22:12.000000000 +0000
+++ linux-jhogan-test/arch/mips/Makefile	2018-03-21 17:29:53.524879000 +0000
@@ -249,20 +249,12 @@ ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
 
-entry-noisa-y				= 0x$(shell $(NM) vmlinux 2>/dev/null \
-					| grep "\bkernel_entry\b" | cut -f1 -d \ )
-ifdef CONFIG_CPU_MICROMIPS
-  #
-  # Set the ISA bit, since the kernel_entry symbol in the ELF will have it
-  # clear which would lead to images containing addresses which bootloaders may
-  # jump to as MIPS32 code.
-  #
-  entry-y = $(patsubst %0,%1,$(patsubst %2,%3,$(patsubst %4,%5, \
-              $(patsubst %6,%7,$(patsubst %8,%9,$(patsubst %a,%b, \
-              $(patsubst %c,%d,$(patsubst %e,%f,$(entry-noisa-y)))))))))
-else
-  entry-y = $(entry-noisa-y)
-endif
+# Sign-extend the entry point to 64 bits if retrieved as a 32-bit number.
+entry-y		= $(shell $(OBJDUMP) -f vmlinux 2>/dev/null \
+			| sed -n '/^start address / { \
+				s/^.* //; \
+				s/0x\([0-7].......\)$$/0x00000000\1/; \
+				s/0x\(........\)$$/0xffffffff\1/; p }')
 
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
