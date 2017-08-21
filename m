Received: from mailapp01.imgtec.com ([195.59.15.196]:15828 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994848AbdHUUU4orYle (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Aug 2017 22:20:56 +0200
Date: Mon, 21 Aug 2017 21:20:38 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH v2] MIPS: Set ISA bit in entry-y for microMIPS kernels
Message-ID: <alpine.DEB.2.00.1708212102200.17596@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170821202038.TTJdjURnGq5RwmqB9xJ_HeTKvbrFUs_Qk7IunzA7NaI@z>

In order to fetch the correct entry point with the ISA bit included, for 
use by non-ELF boot loaders, parse the output of `objdump -f' for the 
start address recorded in the kernel executable itself, rather than 
using `nm' to get the value of the `kernel_entry' symbol.

Sign-extend the address retrieved if 32-bit, so that execution is 
correctly started on 64-bit processors as well.  The tool always prints 
the entry point using either 8 or 16 hexadecimal digits, matching the 
address width (aka class) of the ELF file, even in the presence of 
leading zeros.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
Ralf,

 As you requested, here's v2 rebased as a replacement for 5fc9484f5e41,
with the heading reused.

 Please apply.

  Maciej

---
 arch/mips/Makefile |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

linux-mips-start-address.diff
Index: linux-sfr-usead/arch/mips/Makefile
===================================================================
--- linux-sfr-usead.orig/arch/mips/Makefile	2017-08-21 20:48:38.000000000 +0100
+++ linux-sfr-usead/arch/mips/Makefile	2017-08-21 17:47:16.802753000 +0100
@@ -243,8 +243,12 @@ include arch/mips/Kbuild.platforms
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
-entry-y				= 0x$(shell $(NM) vmlinux 2>/dev/null \
-					| grep "\bkernel_entry\b" | cut -f1 -d \ )
+
+# Sign-extend the entry point to 64 bits if retrieved as a 32-bit number.
+entry-y		= $(shell $(OBJDUMP) -f vmlinux 2>/dev/null \
+			| sed -n '/^start address / { \
+				s/^.*0x\([0-7].......\)$$/0x00000000\1/; \
+				s/^.*0x\(........\)$$/0xffffffff\1/; p }')
 
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
