Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0263F36196A;
	Sat, 19 Sep 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830857; cv=none; b=ax+KPU74RuYjZSjlyhjc4qT95NUVlraNLjPMZfy+OayslxGewHtkqrRuCXent6IzqnXDffq/6YOCfLLV5ovI4d23oTbURiwfVPwS+SoOPRZnnv3K+ZGpOWGMgAqAHWRnETGfaNY9wLER5n8hLT5jHlM6MxNwXz9u43Cqkqt76Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830857; c=relaxed/simple;
	bh=KmZBJ3WBMfqLyTJcdQQFnIaZRnJUQmiakgbndXJ2Sv0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q2otEjBfZvvCuk/nWHetaVHfwIC2QQu9K4FjEqp4FOdUmmxXSPKUj2Uu3YUzUm88j4k7wiMTZrjboqcXIwrGArVJ4fb/yNWv4TMH6ivXugw4EbyEoEuvRMcP32AIHeHVZ2ZiYU0Ncc/IrtCxhxo+boTrVxfJom8I3PVaXVJL5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 47ECD92009E; Sat, 19 Sep 2026 17:14:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 42CBB92009D;
	Sat, 19 Sep 2026 16:14:13 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:13 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] MIPS: Only check -msym32 when need-compiler
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191513020.27665@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: WangYuli <wangyuli@uniontech.com>

During 'make modules_install', the need-compiler variable is null, so 
Makefile.compiler isn't included.  This results in call cc-option-yn 
returning nothing and consequently an error is issued:

*** CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32.  Stop.

and the invocation terminated for configurations that set the Kconfig 
option named.

Previously commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS 
`modules_install' regression") addressed the same issue for GCC versions 
now supported for Linux compilation, but caused a build error with Clang 
because it doesn't support '-msym32'.  Then commit 18ca63a2e23c ("MIPS: 
Probe toolchain support of -msym32") fixed the issue with Clang, but 
reintroduced the 'make modules_install' error listed above.

Wrap the handling of the '-msym32' option then with ifdef need-compiler, 
fixing said error for 'make modules_install'.

For more technical details on why need-compiler is null during 'make 
modules_install' and why no compiler invocation is actually needed at 
this point, please refer to commit 4fe4a6374c4d ("MIPS: Only fiddle with 
CHECKFLAGS if need-compiler") and commit 805b2e1d427a ("kbuild: include 
Makefile.compiler only when compiler is needed").

NB leading 8 spaces rather than tabs required due to `make' syntax.

Link: https://lore.kernel.org/all/alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk/
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/
Fixes: a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression")
Reported-by: Maciej W. Rozycki <macro@orcam.me.uk>
Closes: https://lore.kernel.org/all/alpine.DEB.2.21.2501030535080.49841@angie.orcam.me.uk/
Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Changes from v2 (1/6),
<https://lore.kernel.org/r/C7DB555D3895DE54+20250422102253.137944-1-wangyuli@uniontech.com/>:

- Fix indentation/nesting of Makefile conditionals.

- Drop "dec: " from the commit heading; the feature is generic even if
  only used by DEC platforms right now.

- Rewrite commit description for clarity.
---
 arch/mips/Makefile |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

linux-wangyuli-mips-msym32-need-compiler.diff
Index: linux-macro/arch/mips/Makefile
===================================================================
--- linux-macro.orig/arch/mips/Makefile
+++ linux-macro/arch/mips/Makefile
@@ -290,18 +290,20 @@ drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 # We can always force a build with a 64-bits symbol format by
 # passing 'KBUILD_SYM32=no' option to the make's command line.
 #
-ifdef CONFIG_64BIT
-  ifndef KBUILD_SYM32
-    ifeq ($(shell expr $(load-y) \< 0xffffffff80000000), 0)
-      KBUILD_SYM32 = $(call cc-option-yn, -msym32)
+ifdef need-compiler
+  ifdef CONFIG_64BIT
+    ifndef KBUILD_SYM32
+      ifeq ($(shell expr $(load-y) \< 0xffffffff80000000), 0)
+        KBUILD_SYM32 = $(call cc-option-yn, -msym32)
+      endif
     endif
-  endif
 
-  ifeq ($(KBUILD_SYM32), y)
-    cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
-  else
-    ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
-      $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
+    ifeq ($(KBUILD_SYM32), y)
+      cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
+    else
+      ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
+        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
+      endif
     endif
   endif
 endif
