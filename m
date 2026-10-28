Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214188;
	b=oXvI+L17Y4hyGwTOAM4X+3815I9yvLZC3XrqxCM7ZK/z+QFIR1qVu548ocYQQmJz1AEw
	 LIzusFxDXodZXgbZi05KIh/6lMQIN4V2qi1t+DXx38231c/bvhwlcy9hSZdUS7GVeNXJI
	 Yhj5dLQ+ZRzVDQgJjCSorRWhpXBl4cXc4smf0Rq3Nv2kmKjLkxvADbaTYAuinxgze/Jj5
	 AkrQTGUXe0Q0ejZfj6KTKgXTMyR5ycWFljbTmGqF23meRIAxq99ivMdQBr9dMeAEL+Qac
	 G5Vrr59qW2kGpmAHsazJ5trLjWPxyOpi5YVlffZSMwc43Irhtj8olsZjSKzEw4UeWJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
	b=CLCVbVatktpCvfNmUR5F+m02JrWe710K8u+FaypXQRkvPvBCA8AVYOZTi+FH2EbuHf8m
	 FA9P9dH1h4K1YIBPKbNtHiJt2BdxDO6Q8hVRaJWE6n0ilpA1zGTeN2SrSpy95LfVNaeDI
	 bTk2AUH2Use3oxRReq0B5e4yVo2otjnRsJvSZ/DuLaaxDafDfwgdTt/k3qqY0o7Bm5DB8
	 bKLUV242pq5rzxAzfIjNSN5OIBNQWlRIyQsduoDwHezMqEQ43NVHSbuVbCcLJAX8icQuV
	 IHdFadWkKchqNRgRmnVx6Amy4NRXslUQrkyilYDodfdoZvmrMomu/JMTizMbWj5ycxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jzH4kia2;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812D960A3807
	for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 19:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812D960A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jzH4kia2
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso11935055ad.2
        for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214187; x=1793818987; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=jzH4kia2yfr+yDj533Sy1CVo5oa3Snw3/kZKq+TA4XhD5kt7pldlMsWeTQ4KVx7ejN
         TRW33zJGMnikyEo6KpCgTjRSveMnJdDy4cTdCYVS0XvWWMQEtXtWWUBOYD9r7m5KlE4/
         6a5zVFGT3nMx0Ldnw48TJaSYVRCv0n2Y379J0cBvTj8GLHS+HID7guUQmbT0rh/6Euuv
         QgYZKBM00ohhrMhckJvzpFs3QgEWPsIz3o39+ONWhEoCeFxINcRozL9VPC24L4CsTn9F
         +1GJOiq5584WhDCQBB9uEeTB5wvjACeZ9Rt9VJ3yegkAssNd8Qt+QW+jCZ0uLZLdrBQg
         82+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214187; x=1793818987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RloCiG6ktfajfft7oZXWWlUR2yO2W/arq16CEWx06hk=;
        b=qznaWNclilxgtTGcRxRqBy7n3PvGMFXyvfCqXhvzmXU8v7Z2beanPZpM8jzctyiI9C
         b/G61Kn1AxLFKQ/zKwAJkhQII2RehRRnue4Qn4Ilnnn5ME78D0nHBFoFjVm6fqCbLOcb
         91s4zHV+T7J4cmlDxrtv/wWUTxsaui3bMPh/krgWxqT0sExH1bItpaadvWq0HOndavMt
         jUiY+n+BcyFtqFI68OPcYYM/A4rYetnt/LpY2hiV+0i24oqRd399MhprskAywZ/HIi9D
         VeGhJDmbcBpN0HaKhEPkoMd774xGQlHDmtBx30pk/2zXLgJz7wBvOrB8PVD/xBO25rfK
         5wdA==
X-Forwarded-Encrypted: i=1; AKwUvByKW/tZThr14CMq1gXjEqiK6ACJ8Gcrsm97B0AJGjF8c7QPi2fIWpJOHX/1WPcqjfO9HOXGxVNUNZtA@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/91iD5e8UcFqajKB36McahRzkFoHXyGgsG3yVcXeGnrZ5C5y+
	U1ec0/7ZiUidMaGXM6I7+oH3aiW8mBUlq2XVTJbhif/j//IFzV8HHcjjpoh+6GheMZskqk571cs
	W/n7K4g==
X-Received: from plma18.prod.google.com ([2002:a17:902:7d92:b0:2e9:73da:58d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d504:b0:2e8:3d48:4d92
 with SMTP id d9443c01a7336-2eb003bf1dfmr27738995ad.33.1793214186739; Wed, 28
 Oct 2026 12:03:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:56 -0700
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
Message-ID: <20261028190259.1819571-5-seanjc@google.com>
Subject: [PATCH 4/7] KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use
 standard implementation
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

Rework MIPS' kvm_arch_vcpu_should_kick() to use the "standard" arch
implementation so that the arch hook can be dropped (MIPS is the only
arch other than PPC that implements a non-standard hook, and PPC uses the
recently added @force param when invoking __kvm_vcpu_kick() instead of
relying on kvm_arch_vcpu_should_kick()).

Convert MIPS to the standard implementation even though the code should be
unreachable (neither kvm_vcpu_kick() nor kvm_make_request_and_kick() are
used by MIPS or common KVM), so that there is a bisection point if the
code is somehow reachable.

No functional change intended (because the code is currently unreachable).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..c37e212bc0a3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -122,7 +122,7 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
-	return 1;
+	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
 }
 
 int kvm_arch_enable_virtualization_cpu(void)
-- 
2.56.0.313.g2479322e68-goog

