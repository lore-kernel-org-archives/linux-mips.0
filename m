Received: from mail-bn1blp0190.outbound.protection.outlook.com ([207.46.163.190]:35387
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6838761AbaEFPwrFrjiR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 May 2014 17:52:47 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 07/11] kvm tools: Provide per arch macro to specify type for KVM_CREATE_VM
Date: Tue, 6 May 2014 17:51:27 +0200
Message-ID: <1399391491-5021-8-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140506155127.d77ANiEV-u7jFzAU9i7HcgWKJoeeihIXuAGP56e_4hg@z>

This is is usually 0 for most archs. On mips we have two types.
TE (type 0) and MIPS-VZ (type 1). Default to 1 on mips.

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/arm/include/arm-common/kvm-arch.h |    2 ++
 tools/kvm/kvm.c                             |    2 +-
 tools/kvm/mips/include/kvm/kvm-arch.h       |    2 ++
 tools/kvm/powerpc/include/kvm/kvm-arch.h    |    2 ++
 tools/kvm/x86/include/kvm/kvm-arch.h        |    2 ++
 5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/kvm/arm/include/arm-common/kvm-arch.h b/tools/kvm/arm/include/arm-common/kvm-arch.h
index b6c4bf8..a552163 100644
--- a/tools/kvm/arm/include/arm-common/kvm-arch.h
+++ b/tools/kvm/arm/include/arm-common/kvm-arch.h
@@ -32,6 +32,8 @@
 
 #define KVM_IRQ_OFFSET		GIC_SPI_IRQ_BASE
 
+#define KVM_VM_TYPE		0
+
 #define VIRTIO_DEFAULT_TRANS(kvm)	\
 	((kvm)->cfg.arch.virtio_trans_pci ? VIRTIO_PCI : VIRTIO_MMIO)
 
diff --git a/tools/kvm/kvm.c b/tools/kvm/kvm.c
index cfc0693..278b915 100644
--- a/tools/kvm/kvm.c
+++ b/tools/kvm/kvm.c
@@ -284,7 +284,7 @@ int kvm__init(struct kvm *kvm)
 		goto err_sys_fd;
 	}
 
-	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, 0);
+	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, KVM_VM_TYPE);
 	if (kvm->vm_fd < 0) {
 		pr_err("KVM_CREATE_VM ioctl");
 		ret = kvm->vm_fd;
diff --git a/tools/kvm/mips/include/kvm/kvm-arch.h b/tools/kvm/mips/include/kvm/kvm-arch.h
index 4a8407b..0210f0b 100644
--- a/tools/kvm/mips/include/kvm/kvm-arch.h
+++ b/tools/kvm/mips/include/kvm/kvm-arch.h
@@ -17,6 +17,8 @@
 
 #define KVM_IRQ_OFFSET		1
 
+#define KVM_VM_TYPE		1
+
 #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
 
 #include <stdbool.h>
diff --git a/tools/kvm/powerpc/include/kvm/kvm-arch.h b/tools/kvm/powerpc/include/kvm/kvm-arch.h
index f8627a2..fdd518f 100644
--- a/tools/kvm/powerpc/include/kvm/kvm-arch.h
+++ b/tools/kvm/powerpc/include/kvm/kvm-arch.h
@@ -44,6 +44,8 @@
 
 #define KVM_IRQ_OFFSET			16
 
+#define KVM_VM_TYPE			0
+
 #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
 
 struct spapr_phb;
diff --git a/tools/kvm/x86/include/kvm/kvm-arch.h b/tools/kvm/x86/include/kvm/kvm-arch.h
index a9f23b8..673bdf1 100644
--- a/tools/kvm/x86/include/kvm/kvm-arch.h
+++ b/tools/kvm/x86/include/kvm/kvm-arch.h
@@ -27,6 +27,8 @@
 
 #define KVM_IRQ_OFFSET		5
 
+#define KVM_VM_TYPE		0
+
 #define VIRTIO_DEFAULT_TRANS(kvm)	VIRTIO_PCI
 
 struct kvm_arch {
-- 
1.7.9.5
