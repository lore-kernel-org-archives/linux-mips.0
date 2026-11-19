Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074514;
	b=CFteQXiwJCZ7BhiCPA15iKU1EslQRUnUZm5R8zL+9ATrokQ6xSL9q2zgIKraXu4CMSDe
	 kYkvRl8JnecSlkPIXBujjGBCj9VOVY0o2zs/99aqnGxl7DwohSseJvzhqvj+kISsTjQd9
	 pbzON/GPZLThp0Fw4ozfGPc3Jgbh1Zsj8AVk90WpsFghjBvMtzCuTQ+T4vnTZD5RDRoD7
	 oMBbhJ3VWSrQYVwQkEjMgey9BoTn5ljKwpv0VKwWRi/9GQngOzVYOweNgeXLi+wBUF+6f
	 T1/FEgcRqgcuW/MCjgBFtCbDdnRVCdjKVpiSqySe3CIHt3LAy7zS9PMVrV9JSqTD4sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074514;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rhbKilbj1FUsGuogaR9rA79TUtedLUv57kTcPATorNU=;
	b=W9F423OsJa/jFrygm7C4crdfZtJ+ayoYACO7CKKPmpSE2MOrrHAZH1yZEER+9WhfMzKq
	 u7QQRABrVMmMvs1aCsii1pML6H9zXcfsqiiaNc5Ky3tqwCYyfSvDM0+nuPQXyvYWNPqfY
	 P1EMubDJakplP7PPFJQTSlSL0ng1WDEgNmktaHRMTLhctca9tFI2Jnla0gLQ7OPm1IJXz
	 dQ2Jqb9JkRBK/QU5cmK3HdDmIZrcpqLBWJzRDfByyz03UW6WNYjR18UxA32QdN6b6mCqj
	 m07CGM0rNDGqvGqQCxWUCvoRa+ewSN0MJU5zZs6VHOSQC8Iq5jOvkgOxAUlxtLMT6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pef6v6Y1;
	arc=none smtp.remote-ip=91.218.175.67
Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD994606A325
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 07:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD994606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pef6v6Y1
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0GyxFb1qj2Ksztez9USKBrBQrNju7005VYiun8PqpOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074509; v=1; x=1795679309;
 b=Pef6v6Y1Bk2lT5BcEiVIlReseHh2k/f8OXAoqqVurOsJN5RB5mUg67+kYfhxAWZDeXOFxkkw
 HzwWID86LC2u8oNEsUcKFx+LQh8gfd/cCpXEoPIfJn8rLfziFYSXb1r0W2CKMUvcFWWONcL85pB
 zRtIlqmQdwciHYRk+QtC7mKA=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2b3a01d6596f9792;
	Thu, 19 Nov 2026 07:48:29 +0000
X-Mizu-Trace-ID: 2b3a01d6596f9792
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 5/7] KVM: Fix comments that refer to non-existent identifiers
Date: Thu, 19 Nov 2026 07:47:50 +0000
Message-ID: <20261119074752.1027729-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119074752.1027729-1-fuad.tabba@linux.dev>
References: <20261119074752.1027729-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comments in the generic KVM code and its headers misspell the names of
functions, structures, fields, capabilities, Kconfig symbols and an
object file, or use names that have since changed. Use the current
names.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/kvm_dirty_ring.h | 4 ++--
 include/linux/kvm_host.h       | 4 ++--
 include/linux/kvm_irqfd.h      | 4 ++--
 include/uapi/linux/kvm.h       | 2 +-
 virt/kvm/binary_stats.c        | 2 +-
 virt/kvm/eventfd.c             | 2 +-
 virt/kvm/kvm_main.c            | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index eb10d87adf7d5..0a5e0fed77997 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -29,8 +29,8 @@ struct kvm_dirty_ring {
 
 #ifndef CONFIG_HAVE_KVM_DIRTY_RING
 /*
- * If CONFIG_HAVE_HVM_DIRTY_RING not defined, kvm_dirty_ring.o should
- * not be included as well, so define these nop functions for the arch.
+ * If CONFIG_HAVE_KVM_DIRTY_RING is not defined, dirty_ring.o is not built,
+ * so define these nop functions for the arch.
  */
 static inline u32 kvm_dirty_ring_get_rsvd_entries(struct kvm *kvm)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a8..4b91ef9667703 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -764,7 +764,7 @@ struct kvm {
 	struct mutex slots_lock;
 
 	/*
-	 * Protects the arch-specific fields of struct kvm_memory_slots in
+	 * Protects the arch-specific fields of struct kvm_memory_slot in
 	 * use by the VM. To be used under the slots_lock (above) or in a
 	 * kvm->srcu critical section where acquiring the slots_lock would
 	 * lead to deadlock with the synchronize_srcu in
@@ -802,7 +802,7 @@ struct kvm {
 	/*
 	 * created_vcpus is protected by kvm->lock, and is incremented
 	 * at the beginning of KVM_CREATE_VCPU.  online_vcpus is only
-	 * incremented after storing the kvm_vcpu pointer in vcpus,
+	 * incremented after storing the kvm_vcpu pointer in vcpu_array,
 	 * and is accessed atomically.
 	 */
 	atomic_t online_vcpus;
diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index ef8c134ded8a3..bca430a4ae3a8 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -23,13 +23,13 @@
 struct kvm_kernel_irqfd_resampler {
 	struct kvm *kvm;
 	/*
-	 * List of resampling struct _irqfd objects sharing this gsi.
+	 * List of resampling struct kvm_kernel_irqfd objects sharing this gsi.
 	 * RCU list modified under kvm->irqfds.resampler_lock
 	 */
 	struct list_head list;
 	struct kvm_irq_ack_notifier notifier;
 	/*
-	 * Entry in list of kvm->irqfd.resampler_list.  Use for sharing
+	 * Entry in list of kvm->irqfds.resampler_list.  Use for sharing
 	 * resamplers among irqfds on the same gsi.
 	 * RCU list modified under kvm->irqfds.resampler_lock
 	 */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8dff2fc1972e9..951b891b8ae60 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1459,7 +1459,7 @@ struct kvm_enc_region {
 #define KVM_GET_NESTED_STATE         _IOWR(KVMIO, 0xbe, struct kvm_nested_state)
 #define KVM_SET_NESTED_STATE         _IOW(KVMIO,  0xbf, struct kvm_nested_state)
 
-/* Available with KVM_CAP_MANUAL_DIRTY_LOG_PROTECT_2 */
+/* Available with KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 */
 #define KVM_CLEAR_DIRTY_LOG          _IOWR(KVMIO, 0xc0, struct kvm_clear_dirty_log)
 
 /* Available with KVM_CAP_HYPERV_CPUID (vcpu) / KVM_CAP_SYS_HYPERV_CPUID (system) */
diff --git a/virt/kvm/binary_stats.c b/virt/kvm/binary_stats.c
index 76ce697c773bf..c772fe7be5dd7 100644
--- a/virt/kvm/binary_stats.c
+++ b/virt/kvm/binary_stats.c
@@ -116,7 +116,7 @@ ssize_t kvm_stats_read(char *id, const struct kvm_stats_header *header,
 	 * The descriptors copy would be skipped in the typical case that
 	 * userspace periodically read stats data, since the pos would be
 	 * greater than the end address of descriptors
-	 * (header->header.desc_offset + size_desc) causing copylen <= 0.
+	 * (header->desc_offset + size_desc) causing copylen <= 0.
 	 */
 	copylen = header->desc_offset + size_desc - pos;
 	copylen = min(copylen, remain);
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index f43b8b25bc854..81ed20ec0d4a1 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -248,7 +248,7 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 		/*
 		 * Taking irqfds.lock is safe here, as KVM holds a reference to
 		 * the eventfd when registering the irqfd, i.e. this path can't
-		 * be reached while kvm_irqfd_add() is running.
+		 * be reached while kvm_irqfd_register() is running.
 		 */
 		spin_lock_irqsave(&kvm->irqfds.lock, iflags);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f1407..ba8f53ec3d718 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4338,7 +4338,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 
 	/*
 	 * Pairs with smp_rmb() in kvm_get_vcpu.  Store the vcpu
-	 * pointer before kvm->online_vcpu's incremented value.
+	 * pointer before incrementing kvm->online_vcpus.
 	 */
 	smp_wmb();
 	atomic_inc(&kvm->online_vcpus);
-- 
2.47.3

