Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024732;
	b=aX5nEOckxDQpz3EwKl3xov9b6j2tlmrNFSl3lOAhHbUKKkmwO6vsuBN2Onk7lh5zTmay
	 DsOWMQBWetUGIPMz1Rs0LiUnZrRGbhsMETrXKpxBsGK0ruRoMTAmwxDRoRXB6VH+aYCx/
	 RvfnH5TZUapAki7WGWoJZiivFbScR9irwaLagQmc2NUCxtHp/Tfs2LoEG15dsu1Izhe8P
	 hvBQnsblpMdnLlsbpfY0d4Kh+r2qgdRrLo25JB4h5O+SJ6bW9A2stlhtwiYokZRzGWyBf
	 vb9v3veK/q60ViFi2ewRZiQGwF4XyWfTcvSJhAG3jkNd6A0V4egITAEw3IDFI5cNLBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024732;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=/aEvVPN2vkIpoOGbqbjwslntOnXXcoUrCbDoxZ9fqIU=;
	b=QhcCyYZvPHusicNQahWTSp9kjPCQEcAXM8fUD5DydCQyahm37JrqdbLP0H1dDwb7V8Ye
	 RONEGFryaXdy2Uq9+Pqx+wFEbNTFoHB+0I3NSjLeq9s4oZVEA4k0FHg9OC3pu/WAkd4IB
	 AocNP1XzcXEPskYpPby+nb/Enwwdzrt/fUEug61YL4IX8APW2sPbVtZJt/4AwfbC5C0Ai
	 7cKnrdMrCNUY7Uf4sjasW7P4PZ9u64C9uB1W3chTKrpdOcjRebXGxm0GDWbw31ne7SiNd
	 fTXhHMy6gfPlS/+kMXRHWCIZ9TgHfFopqE6yywpFHYD+eKEnGOpJWo5Q0NdVYpiD3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRFNZv7C;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F3606A330
	for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 17:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02F3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CRFNZv7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795024730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/aEvVPN2vkIpoOGbqbjwslntOnXXcoUrCbDoxZ9fqIU=;
	b=CRFNZv7CxAET3nfMyvvDBROVxxtWrCrK8aamd4AIX+335Zh3J+4CTsplY4FEyfpdZdHoSr
	b6tL788y24A68xeGBZIg2mrKU2WUhnqYbQKPy8FfGkeMBuQiu08/76x1d+n4ZlpPoCkAbC
	6XuuY4iCS4yET3bYpYRgShFA2RJ+2YM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-eKEYaacdP5iXcYIWe_UR6A-1; Wed,
 18 Nov 2026 12:58:49 -0500
X-MC-Unique: eKEYaacdP5iXcYIWe_UR6A-1
X-Mimecast-MFC-AGG-ID: eKEYaacdP5iXcYIWe_UR6A_1795024724
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7C8C1954B09;
	Wed, 18 Nov 2026 17:58:42 +0000 (UTC)
Received: from [100.90.222.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ED59A18004F5;
	Wed, 18 Nov 2026 17:58:35 +0000 (UTC)
Message-ID: <4e4fb011-9171-42c1-b499-27b0333a2fd6@redhat.com>
Date: Wed, 18 Nov 2026 18:58:33 +0100
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] KVM: x86: Widen the plane vCPU fd ioctl allowlist
To: David Woodhouse <dwmw2@infradead.org>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
 michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@HansenPartnership.com, Melody Wang <huibo.wang@amd.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com,
 Mushahid Hussain <hmushi@amazon.co.uk>,
 Sriram Nambakam <snambakam@linux.microsoft.com>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261111222911.477-1-dwmw2@infradead.org>
 <20261111222911.477-7-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20261111222911.477-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/11/26 23:29, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> A VMM that puts an initial VTL context on a higher plane cannot finish
> the job through the plane vCPU's fd. kvm_arch_is_vcpu_plane_ioctl()
> refuses the ioctls it needs, while the one capability ioctl it does
> admit, KVM_ENABLE_CAP, reaches *every* vCPU capability handler.
> 
>   - KVM_GET/SET_MP_STATE: a plane vCPU for an AP starts in
>     wait-for-INIT like any non-boot x86 vCPU, and nothing ever sends
>     INIT/SIPI to the higher plane of an AP. The VMM has to mark it
>     runnable itself.
>   - KVM_SET_GUEST_DEBUG: single-step and breakpoints on a non-zero
>     plane. The debug exits surface through the plane-0 KVM_RUN loop
>     like any other plane exit.
>   - KVM_X86_SETUP_MCE: mcg_cap is per vCPU and every twin starts with
>     the KVM_MAX_MCE_BANKS default, so programming plane 0 alone leaves
>     the planes disagreeing. Hyper-V shares MCG state across VTLs.
>   - KVM_ENABLE_CAP: accept only the audited capabilities on a plane fd,
>     the SynIC pair and the two CPUID-enforcement toggles, which change
>     state that each twin keeps separately. Anything else gets -EINVAL, as
>     non-allowlisted ioctls already do. The nested paths behind
>     enlightened VMCS and direct TLB flush have never been audited for
>     plane_level > 0, and without the filter any future vCPU cap would
>     work on planes without anyone having decided that it should.

Not sure about KVM_ENABLE_CAP, the other seem sane.

BTW at some point I'll rewrite these commit messages, they're infuriating...

Paolo

