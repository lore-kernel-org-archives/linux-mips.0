Received: from mailapp01.imgtec.com ([195.59.15.196]:14689 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994922AbdHRQqpSgIaq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Aug 2017 18:46:45 +0200
Date: Fri, 18 Aug 2017 17:46:30 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Set ISA bit in entry-y for microMIPS kernels
In-Reply-To: <alpine.DEB.2.00.1708181302480.17596@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1708181731080.17596@tp.orcam.me.uk>
References: <20170807231647.19551-1-paul.burton@imgtec.com> <alpine.DEB.2.00.1708181302480.17596@tp.orcam.me.uk>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170818164630.HzI_Hszz2Pd3wOIPuU3kzQ1H9cygS7nMROWlwb3QbEc@z>

On Fri, 18 Aug 2017, Maciej W. Rozycki wrote:

> > When building a kernel for the microMIPS ISA, ensure that the ISA bit
> > (ie. bit 0) in the entry address is set. Otherwise we may include an
> > entry address in images which bootloaders will jump to as MIPS32 code.
> 
>  Hmm, what's going on here?  The ISA bit is set by the linker according to 
> the mode the code at the entry symbol has been assembled for, e.g.:
> 
> $ readelf -h vmlinux | grep Entry
>   Entry point address:               0x804355e1
> $ readelf -s vmlinux | grep kernel_entry
> 156535: 80100400     0 FUNC    GLOBAL DEFAULT [MICROMIPS]     1 __kernel_entry
> 156742: 804355e0   146 FUNC    GLOBAL DEFAULT [MICROMIPS]     1 kernel_entry
> $ 
> 
> or no microMIPS (or MIPS16) executable could work.  Is your build process 
> or toolchain used broken by any chance?

 It is indeed the build process.  You've come up with a valid, however a 
complicated solution.  How about the change below, on top of yours -- does 
it work for you?  If so, then I'll wrap it up and submit as an update.

  Maciej

---
 arch/mips/Makefile |   17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

linux-mips-start-address.diff
Index: linux-sfr-usead/arch/mips/Makefile
===================================================================
--- linux-sfr-usead.orig/arch/mips/Makefile	2017-08-18 15:25:58.196676000 +0100
+++ linux-sfr-usead/arch/mips/Makefile	2017-08-18 15:27:55.309653000 +0100
@@ -242,21 +242,8 @@ include arch/mips/Kbuild.platforms
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
-
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
+entry-y				= $(shell $(OBJDUMP) -f vmlinux 2>/dev/null \
+					| sed -n 's/start address //p')
 
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
