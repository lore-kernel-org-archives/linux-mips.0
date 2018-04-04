Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:59546 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991307AbeDDJSzSZg0T (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 4 Apr 2018 11:18:55 +0200
From: Matt Redfearn <matt.redfearn@mips.com>
Subject: [PATCH] MIPS: vmlinuz: Fix compiler intrinsics location and build directly
Date: Wed, 4 Apr 2018 10:18:22 +0100
Message-ID: <1522833502-28007-1-git-send-email-matt.redfearn@mips.com>
In-Reply-To: <20180403160728.GB3275@saruman>
References: <20180403160728.GB3275@saruman>
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
Cc: linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Palmer Dabbelt <palmer@sifive.com>, Matt Redfearn <matt.redfearn@mips.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org
Message-ID: <20180404091822.RswNQEbQ_SbN3GPvjlG9RuxcAapwvVlbhgqX7oY1bnQ@z>

Since commit "MIPS: use generic GCC library routines from lib/", MIPS
now uses the generic lib/ashldi3.c, but bswapsi.c still comes from
arch/mips/lib. The rules for including these into vmlinuz need updating
to reflect these locations.
Both objects need to be built with different CFLAGS for inclusion to
vmlinuz rather than simply including the object built for the main
kernel image. But the copy of the source C file can be avoided by simply
calling cmd,cc_o_c to build the object from the source directly. This
also removes the need for the .gitignore file to ignore the copied
files, and the extra-y rule to clean them.

Signed-off-by: Matt Redfearn <matt.redfearn@mips.com>
---

 arch/mips/boot/compressed/.gitignore | 2 --
 arch/mips/boot/compressed/Makefile   | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)
 delete mode 100644 arch/mips/boot/compressed/.gitignore

diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compressed/.gitignore
deleted file mode 100644
index ebae133f1d00..000000000000
--- a/arch/mips/boot/compressed/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-ashldi3.c
-bswapsi.c
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index adce180f3ee4..8f04d659a915 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -46,10 +46,10 @@ $(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
 
 vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o $(obj)/bswapsi.o
 
-extra-y += ashldi3.c bswapsi.c
-$(obj)/ashldi3.o $(obj)/bswapsi.o: KBUILD_CFLAGS += -I$(srctree)/arch/mips/lib
-$(obj)/ashldi3.c $(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c
-	$(call cmd,shipped)
+$(obj)/ashldi3.o: $(srctree)/lib/ashldi3.c
+	$(call cmd,cc_o_c)
+$(obj)/bswapsi.o: $(srctree)/arch/mips/lib/bswapsi.c
+	$(call cmd,cc_o_c)
 
 targets := $(notdir $(vmlinuzobjs-y))
 
-- 
2.7.4
