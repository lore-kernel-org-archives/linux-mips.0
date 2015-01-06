Received: from mail-bn1bon0098.outbound.protection.outlook.com ([157.56.111.98]:17328
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27025991AbbAFNPccPmeI (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 Jan 2015 14:15:32 +0100
Date: Tue, 6 Jan 2015 14:15:12 +0100
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: =?utf-8?B?W8OeQVRDSA==?= =?utf-8?Q?=5D?= kvmtool, mips: Support more
 than 256 MB guest memory
Message-ID: <20150106131512.GG4194@alberich>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
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
Cc: David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20150106131512.OE3cpnE4Zh2fQ65UsSV5fr3tsPilxQCuX-thLwrdKv8@z>

Two guest memory regions need to be defined and two "mem=" parameters
need to be passed to guest kernel to support more than 256 MB.

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/mips/include/kvm/kvm-arch.h |   10 +++++++++
 tools/kvm/mips/kvm.c                  |   36 +++++++++++++++++++++++++++------
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/tools/kvm/mips/include/kvm/kvm-arch.h b/tools/kvm/mips/include/kvm/kvm-arch.h
index 7eadbf4..97bbf34 100644
--- a/tools/kvm/mips/include/kvm/kvm-arch.h
+++ b/tools/kvm/mips/include/kvm/kvm-arch.h
@@ -1,10 +1,20 @@
 #ifndef KVM__KVM_ARCH_H
 #define KVM__KVM_ARCH_H
 
+
+/*
+ * Guest memory map is:
+ *   0x00000000-0x0fffffff : System RAM
+ *   0x10000000-0x1fffffff : I/O (defined by KVM_MMIO_START and KVM_MMIO_SIZE)
+ *   0x20000000-    ...    : System RAM
+ * See also kvm__init_ram().
+ */
+
 #define KVM_MMIO_START		0x10000000
 #define KVM_PCI_CFG_AREA	KVM_MMIO_START
 #define KVM_PCI_MMIO_AREA	(KVM_MMIO_START + 0x1000000)
 #define KVM_VIRTIO_MMIO_AREA	(KVM_MMIO_START + 0x2000000)
+#define KVM_MMIO_SIZE		0x10000000
 
 /*
  * Just for reference. This and the above corresponds to what's used
diff --git a/tools/kvm/mips/kvm.c b/tools/kvm/mips/kvm.c
index fc0428b..10b441b 100644
--- a/tools/kvm/mips/kvm.c
+++ b/tools/kvm/mips/kvm.c
@@ -22,11 +22,28 @@ void kvm__init_ram(struct kvm *kvm)
 	u64	phys_start, phys_size;
 	void	*host_mem;
 
-	phys_start = 0;
-	phys_size  = kvm->ram_size;
-	host_mem   = kvm->ram_start;
+	if (kvm->ram_size <= KVM_MMIO_START) {
+		/* one region for all memory */
+		phys_start = 0;
+		phys_size  = kvm->ram_size;
+		host_mem   = kvm->ram_start;
 
-	kvm__register_mem(kvm, phys_start, phys_size, host_mem);
+		kvm__register_mem(kvm, phys_start, phys_size, host_mem);
+	} else {
+		/* one region for memory that fits below MMIO range */
+		phys_start = 0;
+		phys_size  = KVM_MMIO_SIZE;
+		host_mem   = kvm->ram_start;
+
+		kvm__register_mem(kvm, phys_start, phys_size, host_mem);
+
+		/* one region for rest of memory */
+		phys_start = KVM_MMIO_START + KVM_MMIO_SIZE;
+		phys_size  = kvm->ram_size - 0x10000000;
+		host_mem   = kvm->ram_start + KVM_MMIO_SIZE;
+
+		kvm__register_mem(kvm, phys_start, phys_size, host_mem);
+	}
 }
 
 void kvm__arch_delete_ram(struct kvm *kvm)
@@ -108,8 +125,15 @@ static void kvm__mips_install_cmdline(struct kvm *kvm)
 	u64 argv_offset = argv_start;
 	u64 argc = 0;
 
-	sprintf(p + cmdline_offset, "mem=0x%llx@0 ",
-		 (unsigned long long)kvm->ram_size);
+
+	if ((u64) kvm->ram_size <= KVM_MMIO_SIZE)
+		sprintf(p + cmdline_offset, "mem=0x%llx@0 ",
+			(unsigned long long)kvm->ram_size);
+	else
+		sprintf(p + cmdline_offset, "mem=0x%llx@0 mem=0x%llx@0x%llx ",
+			(unsigned long long)KVM_MMIO_START,
+			(unsigned long long)kvm->ram_size - KVM_MMIO_START,
+			(unsigned long long)(KVM_MMIO_START + KVM_MMIO_SIZE));
 
 	strcat(p + cmdline_offset, kvm->cfg.real_cmdline); /* maximum size is 2K */
 
-- 
1.7.9.5
