Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214184;
	b=dvMSqPyrIgO8cmE9O/+lfK3GTf3TmV4kK73EUZBwK0qiTCF+PP8Rnw3a5UC5fhOXYPzE
	 bafLtUe/bfPW+48C8dryxs4xZb64lob2Mgj9VY8E6UpJF0gYnBHPLH0otY2JW1++rfiwT
	 tL/l93DSvccGIc+Z2Pk5qGWz8rijVde97Wum8opHxrcEQksS+RRndlZR/GYUre00ANC7G
	 U2r030cZGY8SDMhAImbRM79I06Lyugpj2BZVO7hqDQFPmQwyqeF/Tfdkc/d98JTKzQxS7
	 L6XFMT28lDtKn/pgIOa1vOSFn2poq+QCfk61oAsO8Y1ChZ0zGv/fUywCbGWwQ5PwNDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
	b=v+neO/D5bv0uHfVvX2bWdkRbL8j5ODnvUmJXY8mutPxwfsAPtVaXwu3Iy1zVb2s7Tbue
	 q80QTwi5c4uai/pYt3XYAP7Vne5e/283Fijrxqfxo21Qt31tKSpBKQmcEoGqM3ZzCtE3X
	 cVfPB5TQIAuG5Oc44loQUmi9KUtQcFGUKnjCChG7VzGtbyLiE2cWnmKaRXLArDUyMgsml
	 53gD5OVHt4UQiHxak0OLEVH3d2YvMimVDt97a4FFhRssCT052et/ribTrmddzoypRrn4t
	 D8J12yF3dv7j9I1SO1qsv/F5d+jO47noMFHZc66cXOywwrEy8G7X9R2+XnT37rA7QDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PBBEXKdM;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D832606A338
	for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 19:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D832606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PBBEXKdM
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adad90c894so1402164a91.1
        for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214183; x=1793818983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=PBBEXKdMwfX+FjL1d5AZipaGfCOiVWPE3ZyGym/gyDjDtfCSZrVdtSa4uiqDHkUAnw
         nWn0JCeheccbKH+eq26vu7CIhvWZv7xT5cW7fsKeMpcAlFpHqzT5ibP85wG2AX/lsRon
         TdSnzsVXvxkKaZGTazt7S0ncI90qxjJdg+x21UouS6k4kJRok83E8UPGJr897LPL3tDR
         /Nx3bD17OLmsPvbZe4ifj4bJFa5nRrjMjbh3Fcx2L0ohXcoB4bWCgz/MfbE825NH4Bcv
         JyNMLGtOSIuFQPO/uobuTFC/iJS3fXRYHvdJqMkt4W9++3eQzL5XW+luaLqedqQZ/n95
         IBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214183; x=1793818983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=o2bT5R91KO6JI/p93KufUNprO4ghuPoWMsYXURopGoMn5OTypAKhasz2/GkTB3FRPC
         bgf12tDuwHIsLm7qMcr506UE9s22gJS/rlUjP7bAxO2BAKdlhBMbmwQayVlhkbX8cWoD
         zsjFg0K1oZhcED+ncObk84JMY7KLsB8FleMls/4/lCqj8ARRenodA4JnQRD4n0q3hfi+
         qGFDrCk9ySEK8jbBAhtLaGolPqbLs2wKreKwfYX0EnCABlD01BGcnqhtAuexDJajMeSt
         Dobg5k86dNnksWVK/tjIaSZ+J8s4O8xYomtfjx1vJikgFtPWtirzI3+s1nZqh9QSdWU7
         /Yfw==
X-Forwarded-Encrypted: i=1; AKwUvBwWfL39kmyMwqIosjmJGumRnljwUQ7KOarjJdij2VujM3FaP9pz2TT0PVhfxwMimP9LtbkrbzWwP1h1@vger.kernel.org
X-Gm-Message-State: AFq9FYKptWuSXoRFGTEzm9jEIsYLjss3zSl72KLScOAbwIDY5M8L2mTZ
	aUStoPR6NDFB/WyfZWNnwn4ddUrk1RASLmKpbvs7j2qIyi4zRWExRR4HP0CI4oGA2xMzNftkec9
	DzDSRpg==
X-Received: from pjbmh6.prod.google.com ([2002:a17:90b:4ac6:b0:3aa:f38e:cb2d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264d:b0:3ac:9d83:8856
 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr2423992a91.9.1793214182870; Wed, 28
 Oct 2026 12:03:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 12:02:53 -0700
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
Message-ID: <20261028190259.1819571-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
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

Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
is wrapped with "#ifndef CONFIG_S390".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/s390/s390.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 18fb200f854a..9900a1a1c148 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -3922,13 +3922,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	/* kvm common code refers to this, but never calls it */
-	BUG();
-	return 0;
-}
-
 static int kvm_arch_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu,
 					   struct kvm_one_reg *reg)
 {
-- 
2.56.0.313.g2479322e68-goog

