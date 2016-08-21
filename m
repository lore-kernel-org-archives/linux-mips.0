Received: from mail5.windriver.com ([192.103.53.11]:45864 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992473AbcHUT7DdJmNn (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sun, 21 Aug 2016 21:59:03 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/5] mips/kvm: Audit and remove any unnecessary uses of module.h
Date: Sun, 21 Aug 2016 15:58:17 -0400
Message-ID: <20160821195817.5802-6-paul.gortmaker@windriver.com>
In-Reply-To: <20160821195817.5802-1-paul.gortmaker@windriver.com>
References: <20160821195817.5802-1-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Paul.Gortmaker@windriver.com>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20160821195817.-epnAvfoG4gBehh91p_s3QaWBibwEW8IY4hIv7eFnGY@z>

Historically a lot of these existed because we did not have
a distinction between what was modular code and what was providing
support to modules via EXPORT_SYMBOL and friends.  That changed
when we forked out support for the latter into the export.h file.

This means we should be able to reduce the usage of module.h
in code that is obj-y Makefile or bool Kconfig.  In the case of
kvm where it is modular, we can extend that to also include files
that are building basic support functionality but not related
to loading or registering the final module; such files also have
no need whatsoever for module.h

The advantage in removing such instances is that module.h itself
sources about 15 other headers; adding significantly to what we feed
cpp, and it can obscure what headers we are effectively using.

Since module.h was the source for init.h (for __init) and for
export.h (for EXPORT_SYMBOL) we consider each instance for the
presence of either and replace as needed.  In this case, we did
not need to add either to any files.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: kvm@vger.kernel.org
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/kvm/commpage.c  | 1 -
 arch/mips/kvm/dyntrans.c  | 1 -
 arch/mips/kvm/emulate.c   | 1 -
 arch/mips/kvm/interrupt.c | 1 -
 arch/mips/kvm/trap_emul.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/kvm/commpage.c b/arch/mips/kvm/commpage.c
index a36b77e1705c..f43629979a0e 100644
--- a/arch/mips/kvm/commpage.c
+++ b/arch/mips/kvm/commpage.c
@@ -12,7 +12,6 @@
 
 #include <linux/errno.h>
 #include <linux/err.h>
-#include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/bootmem.h>
diff --git a/arch/mips/kvm/dyntrans.c b/arch/mips/kvm/dyntrans.c
index d280894915ed..b36c8ddc03ea 100644
--- a/arch/mips/kvm/dyntrans.c
+++ b/arch/mips/kvm/dyntrans.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/highmem.h>
 #include <linux/kvm_host.h>
-#include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/bootmem.h>
diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index e788515f766b..68fd666f8cb9 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/ktime.h>
 #include <linux/kvm_host.h>
-#include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/bootmem.h>
diff --git a/arch/mips/kvm/interrupt.c b/arch/mips/kvm/interrupt.c
index ad28dac6b7e9..e88403b3dcdd 100644
--- a/arch/mips/kvm/interrupt.c
+++ b/arch/mips/kvm/interrupt.c
@@ -11,7 +11,6 @@
 
 #include <linux/errno.h>
 #include <linux/err.h>
-#include <linux/module.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/bootmem.h>
diff --git a/arch/mips/kvm/trap_emul.c b/arch/mips/kvm/trap_emul.c
index 091553942bcb..21d80274ccff 100644
--- a/arch/mips/kvm/trap_emul.c
+++ b/arch/mips/kvm/trap_emul.c
@@ -11,7 +11,6 @@
 
 #include <linux/errno.h>
 #include <linux/err.h>
-#include <linux/module.h>
 #include <linux/vmalloc.h>
 
 #include <linux/kvm_host.h>
-- 
2.8.4
