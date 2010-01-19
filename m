Received: from mail-iw0-f196.google.com ([209.85.223.196]:61856 "EHLO
        mail-iw0-f196.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491791Ab0ASJno (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Jan 2010 10:43:44 +0100
From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: [PATCH v1] MIPS: fix vmlinuz build when only 32bit math shell is available
Date: Tue, 19 Jan 2010 17:43:09 +0800
Message-ID: <42fa29d2007a40a31a0bb8fbf1091e11eb9b5ac2.1263893871.git.wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Alexander Clouter <alex@digriz.org.uk>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, Wu Zhangjin <wuzhangjin@gmail.com>
Message-ID: <20100119094309.vaMEQPF19Zu5KWBTHj2kLkjf3NY14egyyso1W0IRiWk@z>

Hi, Alexander Clouter

Does this revision work for you?

Regards,
		Wu Zhangjin

-------------------------------

Changes from v0:

	- Revert the '-n "$(VMLINUX_SIZE)"' to avoid the error of "make clean"
	- Consider more situations of the VMLINUX_LOAD_ADDRESS

Counter to the documentation for the dash shell, it seems that on my
x86_64 filth under Debian only does 32bit math.  As I have configured my
lapdog to use 'dash' for non-interactive tasks I run into problems when
compiling a compressed kernel.

I play with the AR7 platform, so VMLINUX_LOAD_ADDRESS is
0xffffffff94100000, and for a (for example) 4MiB kernel
VMLINUZ_LOAD_ADDRESS is made out to be:

----
alex@berk:~$ bash -c 'printf "%x\n" $((0xffffffff94100000 + 0x400000))'
ffffffff94500000
alex@berk:~$ dash -c 'printf "%x\n" $((0xffffffff94100000 + 0x400000))'
80000000003fffff
----

The former is obviously correct whilst the later breaks things royally.

But fortunately, this works for both bash and dash:

----
$ bash -c 'printf "%x\n" $((0x94100000 + 0x400000))'
94500000
$ dash -c 'printf "%x\n" $((0x94100000 + 0x400000))'
94500000
----

So, we can split the original 64bit string to two parts, and only
calculate the low 32bit part, which is big enough(about 4095 M) for a
normal linux kernel image file, now, we calculate the
VMLINUZ_LOAD_ADDRESS like this:

1. Append "the high 32bit of VMLINUX_LOAD_ADDRESS" as the prefix if it
exists.

2. Get the sum of "the low 32bit of VMLINUX_LOAD_ADDRESS + VMLINUX_SIZE"
with printf "%08x" (08 herein is used to prefix the result with 0...)

The corresponding shell script is:

  A=$VMLINUX_LOAD_ADDRESS;
  # Append "the high 32bit of VMLINUX_LOAD_ADDRESS" as the prefix if it exists.
  [ "${A:0:10}" != "${A}" ] && echo -n ${A:2:8};
  # Get the sum of "the low 32bit of VMLINUX_LOAD_ADDRESS + VMLINUX_SIZE"
  printf "%08x" $(($VMLINUX_SIZE + 0x${A:(-8)}))

This patch fixes vmlinuz kernel builds on systems where only a 32bit
math enabled shell is a available.

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
Signed-off-by: Wu Zhangjin <wuzhangjin@gmail.com>
---
 arch/mips/boot/compressed/Makefile |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 569b6ad..0c4eb01 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -15,7 +15,11 @@
 # compressed kernel load addr: VMLINUZ_LOAD_ADDRESS > VMLINUX_LOAD_ADDRESS + VMLINUX_SIZE
 VMLINUX_SIZE := $(shell wc -c $(objtree)/$(KBUILD_IMAGE) 2>/dev/null | cut -d' ' -f1)
 VMLINUX_SIZE := $(shell [ -n "$(VMLINUX_SIZE)" ] && echo $$(($(VMLINUX_SIZE) + (65536 - $(VMLINUX_SIZE) % 65536))))
-VMLINUZ_LOAD_ADDRESS := 0x$(shell [ -n "$(VMLINUX_SIZE)" ] && printf %x $$(($(VMLINUX_LOAD_ADDRESS) + $(VMLINUX_SIZE))))
+# VMLINUZ_LOAD_ADDRESS = concat "high32 of VMLINUX_LOAD_ADDRESS" and "(low32 of VMLINUX_LOAD_ADDRESS) + VMLINUX_SIZE"
+VMLINUZ_LOAD_ADDRESS := 0x$(shell [ -n "$(VMLINUX_SIZE)" ] && ( \
+				A=$(VMLINUX_LOAD_ADDRESS); \
+				[ "$${A:0:10}" != "$${A}" ] && echo -n $${A:2:8}; \
+				printf "%08x" $$(($(VMLINUX_SIZE) + 0x$${A:(-8)})) ))
 
 # set the default size of the mallocing area for decompressing
 BOOT_HEAP_SIZE := 0x400000
-- 
1.6.5.6
