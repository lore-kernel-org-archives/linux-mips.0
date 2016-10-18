Received: from mailapp02.imgtec.com ([217.156.133.132]:28945 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993008AbcJRXpoPTdPz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 19 Oct 2016 01:45:44 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] KVM: MIPS: Add missing uaccess.h include
Date: Wed, 19 Oct 2016 00:45:18 +0100
Message-ID: <d852b5f35e84e60c930589eeb14a6df21ea9b1cb.1476834183.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <James.Hogan@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, kvm@vger.kernel.org
Message-ID: <20161018234518.WVTTc7S2LLamP7f2MXuJSLfGhCrXWhS9ZDmJ4eRp9gU@z>

MIPS KVM uses user memory accessors but mips.c doesn't directly include
uaccess.h, so include it now.

This wasn't too much of a problem before v4.9-rc1 as asm/module.h
included asm/uaccess.h, however since commit 29abfbd9cbba ("mips:
separate extable.h, switch module.h to it") this is no longer the case.

This resulted in build failures when trace points were disabled, as
trace/define_trace.h includes trace/trace_events.h only ifdef
TRACEPOINTS_ENABLED, which goes on to include asm/uaccess.h via a couple
of other headers.

Fixes: 29abfbd9cbba ("mips: separate extable.h, switch module.h to it")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 arch/mips/kvm/mips.c | 1 +
 1 file changed, 1 insertion(+), 0 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index ce961495b5e1..622037d851a3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/kdebug.h>
 #include <linux/module.h>
+#include <linux/uaccess.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/bootmem.h>
-- 
git-series 0.8.10
