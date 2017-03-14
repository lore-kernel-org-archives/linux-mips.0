Received: from mailapp01.imgtec.com ([195.59.15.196]:50948 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994801AbdCNKSOABDIU (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 11:18:14 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v2 13/33] KVM: MIPS: Add 64BIT capability
Date: Tue, 14 Mar 2017 10:15:20 +0000
Message-ID: <a2b054dbbe5d2a4aab1589634ae8fa585c9cf6db.1489485940.git-series.james.hogan@imgtec.com>
MIME-Version: 1.0
In-Reply-To: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
References: <cover.26e10ec77a4ed0d3177ccf4fabf57bc95ea030f8.1489485940.git-series.james.hogan@imgtec.com>
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
To: linux-mips@linux-mips.org, kvm@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Message-ID: <20170314101520.QO4VLgL_-wyV2wnJFLCTAgBr7junptcrQhU4T7LCyRw@z>

Add a new KVM_CAP_MIPS_64BIT capability to indicate that 64-bit MIPS
guests are available and supported. In this case it should still be
possible to run 32-bit guest code. If not available it won't be possible
to run 64-bit guest code and the instructions may not be available, or
the kernel may not support full context switching of 64-bit registers.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Radim Krčmář" <rkrcmar@redhat.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
Changes in v2:
- Fix section number in API documentation, which was accidentally left
  unchanged after a rebase on the KVM changes for v4.11.
---
 Documentation/virtual/kvm/api.txt | 25 +++++++++++++++++++++++++
 include/uapi/linux/kvm.h          |  1 +
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/Documentation/virtual/kvm/api.txt b/Documentation/virtual/kvm/api.txt
index 4b5fa2571efa..1b8486c094b4 100644
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@ -4192,3 +4192,28 @@ to KVM_CREATE_VM to create a VM which utilises it.
 
 If KVM_CHECK_EXTENSION on a kvm VM handle indicates that this capability is
 available, it means that the VM is using trap & emulate.
+
+8.7 KVM_CAP_MIPS_64BIT
+
+Architectures: mips
+
+This capability indicates the supported architecture type of the guest, i.e. the
+supported register and address width.
+
+The values returned when this capability is checked by KVM_CHECK_EXTENSION on a
+kvm VM handle correspond roughly to the CP0_Config.AT register field, and should
+be checked specifically against known values (see below). All other values are
+reserved.
+
+ 0: MIPS32 or microMIPS32.
+    Both registers and addresses are 32-bits wide.
+    It will only be possible to run 32-bit guest code.
+
+ 1: MIPS64 or microMIPS64 with access only to 32-bit compatibility segments.
+    Registers are 64-bits wide, but addresses are 32-bits wide.
+    64-bit guest code may run but cannot access MIPS64 memory segments.
+    It will also be possible to run 32-bit guest code.
+
+ 2: MIPS64 or microMIPS64 with access to all address segments.
+    Both registers and addresses are 64-bits wide.
+    It will be possible to run 64-bit or 32-bit guest code.
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 58ddedce4235..1e1a6c728a18 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -889,6 +889,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_IMMEDIATE_EXIT 136
 #define KVM_CAP_MIPS_VZ 137
 #define KVM_CAP_MIPS_TE 138
+#define KVM_CAP_MIPS_64BIT 139
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
git-series 0.8.10
