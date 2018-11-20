Received: from 9pmail.ess.barracuda.com ([64.235.154.210]:59889 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993828AbeKTAtsF98Uq convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 20 Nov 2018 01:49:48 +0100
From: Hassan Naveed <hassan.naveed@mips.com>
Subject: [PATCH] MIPS: Enable Undefined Behavior Sanitizer UBSAN
Date: Mon, 19 Nov 2018 16:49:37 -0800
Message-ID: <20181120004937.8211-1-hassan.naveed@mips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain
Return-Path: <Hassan.Naveed@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Hassan Naveed <hnaveed@wavecomp.com>
Message-ID: <20181120004937.PsmwF92nu4_8McqQIgRKr5vRIl-iO2ZVkQLeT5e6A2s@z>

From: Hassan Naveed <hnaveed@wavecomp.com>

Select ARCH_HAS_UBSAN_SANITIZE_ALL in order to allow the user to
enable CONFIG_UBSAN_SANITIZE_ALL and instrument the entire kernel for
ubsan checks.
We exclude the VDSO from this because its build doesn't include the
__ubsan_handle_*() functions that the kernel proper defines in from
lib/ubsan.c, and the VDSO would have no sane way to report errors even
if it had definitions of these functions.

Signed-off-by: Hassan Naveed <hnaveed@wavecomp.com>
Reviewed-by: Paul Burton <paul.burton@mips.com>
---
 arch/mips/Kconfig       | 1 +
 arch/mips/vdso/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 35511999156a..8418721bb3f9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -7,6 +7,7 @@ config MIPS
 	select ARCH_DISCARD_MEMBLOCK
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 34605ca21498..b0f2382b5671 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -50,6 +50,7 @@ VDSO_LDFLAGS := \
 	$(call cc-ldoption, -Wl$(comma)--build-id)
 
 GCOV_PROFILE := n
+UBSAN_SANITIZE := n
 
 #
 # Shared build commands.
-- 
2.19.0
