Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387292;
	b=Ex6y4ptx6O7kh2vO4DMLCkVk4qtCXyDoUXt7zA73kGbYxXZT24NTzfYuYAKXlinQv1c7
	 JRQbd6wNTqyvCPGHErm5c2QOF9q0Cha+L/GsCLEdIo8bsx81A7s1UPKHKZzfDk0Rutei3
	 rrlQ6G9nfsQLUUu4WC/Z4dLFw12SaqjWxFef0x5/CI+RujFI+gGEDqBKAG0K70Ts78DsE
	 1xUyFS43T2TrZ5IXffp+YhWPYPLBolsd6z7p2wB5mgUksgCCrnl5EWs8g/6FhF5OGrf5u
	 VZzU8KiZLV86tX+n0KmT0rKRr7c9S5eCQndBXQoqS9ZPI3wkIJKgDNZ2CbMWiKx1qzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387292;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LLwOkpWku+LuRzU0j1n/3ISg+beECDACZb9CL8tnJJE=;
	b=D41ib9oHYT0BF/oxQtnSOWh2kClXK+TSLrSmHXiQAhqys5iWbPJiNx7W5KMRQiB4k/Zr
	 P9yQ4eL2SiI2BkmKFmyWVDddGJf1oNpXyfStWZMC96wNDa2mEn9F6+Krrov+NPOBLG/kI
	 M79MqY0G1Sw8vAYl16CSQck5Z+OetkuAE1PupS8ALXZZ5DKCFRPDfkQrABD/XJlREnoQF
	 zQQGMg+ExiCEQwvmBvzn9RrgjQwhaHJxCsmlbvYigEhq33A1LAoTyyOHQ/NbNTLDgsEq4
	 z3bFOL7DGdxfSE6t7UVQT/YIneccRkTYurmL6Phi1Zl7Vmv1Zz4SQnQCJv1HUx6dquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y3MTWlgW;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49B2606A333
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 08:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C49B2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y3MTWlgW
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VWN8eFztGEEX6q/yBgqDy1q04Jl/aSZsCUJ97YS64+c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387290; v=1; x=1794992090;
 b=Y3MTWlgWk2aPPMJp2eucy29+8mFDNc+CQYurEZgnR0UAQ9qbRM6B8fSYsmwkvuxc2HlO32Ht
 nblvddxnYWvzM/xMJcaizH+lMQAZWXQYtPN5WfIkCPb9JFMhdbsOS0TQh/Sx57rDi6ZL2WA+JN+
 CsvAjf6wCkUr6/xVTc3CQB1M=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e744c096daf5982;
	Wed, 11 Nov 2026 08:54:49 +0000
X-Mizu-Trace-ID: 3e744c096daf5982
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
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/7] Documentation: KVM: Fix lock names and a lock type in locking.rst
Date: Wed, 11 Nov 2026 08:54:43 +0000
Message-ID: <20261111085448.1130701-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111085448.1130701-1-fuad.tabba@linux.dev>
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
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

The x86 lock ordering refers to kvm->arch.mmu_lock instead of
kvm->mmu_lock. The entry for wakeup_vcpus_on_cpu_lock gives its type
as spinlock_t instead of raw_spinlock_t, and its comment uses the list
and lock names from before commit 12a8eee5686ef ("KVM: Move x86 VMX's
posted interrupt list_head to vcpu_vmx").

Fix all three.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/locking.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 662231e958a07..df0db74630976 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -54,9 +54,9 @@ On x86:
 
 - vcpu->mutex is taken outside kvm->arch.hyperv.hv_lock and kvm->arch.xen.xen_lock
 
-- kvm->arch.mmu_lock is an rwlock; critical sections for
+- kvm->mmu_lock is an rwlock; critical sections for
   kvm->arch.tdp_mmu_pages_lock and kvm->arch.mmu_unsync_pages_lock must
-  also take kvm->arch.mmu_lock
+  also take kvm->mmu_lock
 
 Everything else is a leaf: no other lock is taken inside the critical
 sections.
@@ -297,13 +297,13 @@ time it will be set using the Dirty tracking mechanism described above.
 
 ``wakeup_vcpus_on_cpu_lock``
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-:Type:		spinlock_t
+:Type:		raw_spinlock_t
 :Arch:		x86
 :Protects:	wakeup_vcpus_on_cpu
 :Comment:	This is a per-CPU lock and it is used for VT-d posted-interrupts.
 		When VT-d posted-interrupts are supported and the VM has assigned
-		devices, we put the blocked vCPU on the list blocked_vcpu_on_cpu
-		protected by blocked_vcpu_on_cpu_lock. When VT-d hardware issues
+		devices, we put the blocked vCPU on the list wakeup_vcpus_on_cpu
+		protected by wakeup_vcpus_on_cpu_lock. When VT-d hardware issues
 		wakeup notification event since external interrupts from the
 		assigned devices happens, we will find the vCPU on the list to
 		wakeup.
-- 
2.47.3

