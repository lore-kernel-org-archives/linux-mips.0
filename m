Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214185;
	b=ruCwCvh0VXhK4M3sCZGp5ho2rG9ClVBnfpzsU/m9g02jRtM4V25H5tYAeKHVXq6Vgwl3
	 Ub3Jbd+EarnUndlFg5B04DMaWZLf5rMvaqd6zIhNiGwF8L3J75+QzIPQtNpAM50HZ1hMC
	 z3FAVBJvi8hKkSKeku0gt+BMiJOjADuGz2sYFW2eRK0Ja1JG3MNTBdXgv0ofam+SZgBUU
	 3WdA+KeXGdOps1ufEcen2+19joGw0nDL4ADqYcdEnGsvSgvFYgwZyMpSlrAqBnNY4wi8J
	 QKnnjR4satRch0e2tq7PJLnoz97TJPx+InSkvmGTIBWSpWoogy+m8gQR8IHzRiRv+3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ua8GfkfDrHDUR8px+Sy19+vmLzFSWzTq6VAHh+SakiE=;
	b=WZJbLPnNqvfKaeMen0/Xquwe55FPkNYqindlwWr4flcJNLzbqS+exVDhJ0WZ/08c5+bV
	 Z38GIUwQ771T/n/TgMIbXETiHNXk0H6+72LpJAvfdUvYb5kg53RuJcHyisw+UAgHYpuve
	 2BjJIwGKEM9V6oLWFwHvedTPgnQkMNFqXknRSFAx/DTfJl0NnKhrbKNa1tAiYdLuhCsrH
	 jkDPyuEOS8iow8SjzY4ExHoGk7IfMQkEu+8Harc86WnX4SS6DoyI8yaxk9HznvM/eqaXW
	 pwn5Znpa/MmoksBnZFd8IQCJl7DBmVU43K61a8Vrys7AA1Kn39J40QdXgixxzzyvJxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bxt7Z8wd;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1041C60A261F
	for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 19:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1041C60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bxt7Z8wd
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so11082795ad.3
        for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214184; x=1793818984; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ua8GfkfDrHDUR8px+Sy19+vmLzFSWzTq6VAHh+SakiE=;
        b=bxt7Z8wde6nB+VKnGLTbQOgO0WAPwnj21OlBYLZL2WreRrQgI/PSzqaByZuydLuYmn
         sDXb8vXBC1zN4uqGCFWL1ZdN/4EQt7dO3X6JV98m7ImqakWH7EBjlfQDZ2Jy9glZxaZS
         m9GjnXqDQGn9+nwwCxzQTmsn6qbLFouAvl5tRior2/pX2+MSgBlGvPyW6FrHBBa/fVaf
         ZYf8Jb+RyeuLpQIfiiWfV7HmIPZhPZ7kM49t12UUdV0ECNgwnf24y3axMKuVhTdP0+z8
         P0SB8puAP/sWa1hP0NKyo6zpkuZFD115enxQ7041dd0h/VoZj0m0v+hNcU1Pu9uKacfd
         WJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214184; x=1793818984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ua8GfkfDrHDUR8px+Sy19+vmLzFSWzTq6VAHh+SakiE=;
        b=nXTSJ7rEqKK8+k8fJ756xoWYKUtcoTCLJR1SCCgN7yzKJaztbyP5nPKF3aTulffNAb
         FiiwlEm1NW2svSJKRYizz1S53Xg//mBJhLfeA9txkPaqASLKvUOxYlAmEz7jw2LaotGo
         ntM95PSWAEmFvZwbMiveGea+jlu3feefV7AFyZTqCzQqakmH1nvHCkv512LNzlyPZ4zb
         v+WJ+bse3h4ffAhZmC46vdXX3nzMqvEMbZI2fvI5BKVarhWm0uLZVVNRTRygLIRYJwbt
         oFOC/zDiLop/MAlXbH1Mt3woqqTebMPqqap2y2Rx+baVqp65Um1209FdOl+Qccu2gZpN
         u2Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwgioyfnLk0y9WroJYrm5HUu+RLYtL8Bzza51dR2WeHTRB7VhqJWfRJhyI6MpESwjdgdqzReNMdKGNw@vger.kernel.org
X-Gm-Message-State: AFq9FYLssVEP/DS73N8NlpyYPx5K0kZoY8M0z60jltZ+ckwQjOKPEZad
	kNkSJtXpt2aWUcsb3vraN1YC/+K9m8Jp0/PJSwGRlxQKJyqUD0h9djbghoVKyX5x2pgxsccAfqq
	OHy5ONg==
X-Received: from pjbov14.prod.google.com ([2002:a17:90b:258e:b0:3a8:d9d:78ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:224f:b0:3a0:b312:1fbe
 with SMTP id 98e67ed59e1d1-3ae580a7ac7mr2187674a91.23.1793214184152; Wed, 28
 Oct 2026 12:03:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:54 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-3-seanjc@google.com>
Subject: [PATCH 2/7] KVM: Add a @force param to __kvm_vcpu_kick() for PPC
 backwards compatibility
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Plumb in a @force param to __kvm_vcpu_kick() to force an IPI without
checking kvm_arch_vcpu_should_kick().  The param will be used to drop
kvm_arch_vcpu_should_kick() in favor of kvm_request_needs_ipi() without
regressing PPC, which for unknown reasons unconditionally blasts an IPI
in a variety of kvm_vcpu_kick() flows.

No functional change intended (nothing yet passes in @force=true).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  6 +++---
 virt/kvm/kvm_main.c      | 10 +++++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..3b9844c3906d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1570,11 +1570,11 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
 
 #ifndef CONFIG_S390
-void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait);
+void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force);
 
 static inline void kvm_vcpu_kick(struct kvm_vcpu *vcpu)
 {
-	__kvm_vcpu_kick(vcpu, false);
+	__kvm_vcpu_kick(vcpu, false, false);
 }
 #endif
 
@@ -2315,7 +2315,7 @@ static __always_inline void kvm_make_request(int req, struct kvm_vcpu *vcpu)
 static inline void kvm_make_request_and_kick(int req, struct kvm_vcpu *vcpu)
 {
 	kvm_make_request(req, vcpu);
-	__kvm_vcpu_kick(vcpu, req & KVM_REQUEST_WAIT);
+	__kvm_vcpu_kick(vcpu, req & KVM_REQUEST_WAIT, false);
 }
 #endif
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..67addb9e48a7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3908,7 +3908,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_wake_up);
 /*
  * Kick a sleeping VCPU, or a guest VCPU in guest mode, into host kernel mode.
  */
-void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait)
+void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 {
 	int me, cpu;
 
@@ -3933,9 +3933,13 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait)
 	 * after kvm_arch_vcpu_should_kick(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
-	 * vCPU also requires it to leave IN_GUEST_MODE.
+	 * vCPU also requires it to leave IN_GUEST_MODE
+	 *
+	 * Note #2, do NOT check if an IPI is needed if @force is true, as the
+	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
+	 * effect for unknown historical reasons.
 	 */
-	if (kvm_arch_vcpu_should_kick(vcpu)) {
+	if (force || kvm_arch_vcpu_should_kick(vcpu)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog

