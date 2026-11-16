Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823034;
	b=4uEs54iMTXqFZqKfJXKHaUvi9XHl/v7w4GaKZXP1jv2YcdF4DejBlIpxebyUGjLuz6Fq
	 scJiRJssS3QUIXN6C6j5O9fDcEA3t4ihtU+SNen3PkkastGZG2tn4VK/oyx/gAtPL1aeI
	 t4nO3nnI44XI1Vcgpza+DEQSEqglraPwqcQyrit7fk76kKA3qTGp0px15pg4qr1gGN89F
	 t/TnBBjs96/X0AdvBa1nPQCTLKcSSM1i7OUjyf1WNJj+7SFkSQo6AuDTz4CeXEaQDwYIR
	 GrSuB8ZllNusQCDXlu6FTSlVBOQeNTJoKUXQPY56BNK8h+v1uJvqBWoL2HefQerTIdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823034;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=I3+Y3topNYRnSbwR28B8ZoCVuIdcjYVT77tTzbCq1BY=;
	b=E0cjgMVvbC08c7x7qhFwqku6E6J/K7w3faZa4XuThjqmaxZlPTfLaxyFGDdUEIRwsWrN
	 k5ldSTRYkTunje2Hg5/TZaC8+SQ8rsI0eHwBAH60/gABU0/1qblPvsNE8UgqQgklfqXcM
	 g3+DMpTqznYcJcS8Cj0yotRU/zR28q75Nz9CuNN8lFtoNvCeEkbvH+dfvn5eSlrqOOX9s
	 O1/dZEfxKQbqmoMPflku2P+QzGzU0He3HAKjZWAIVQeKCdJTofrPsLUd2reeAT80J1Pr3
	 JECYzOW7950BvOQPrd/h9xFpftYNEOQFVlQw77l4lpqHXf9nFsRIxQ14FFFq5trgK+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lsUJop9r;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D30606A32F
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 09:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4D30606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lsUJop9r
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0M/7xDonC715x6+9O5Xr/LSHzL87I9czc2uSQmfZOqY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794823031; v=1; x=1795427831;
 b=lsUJop9r8CHnDzBQh8i8sjyGKankfy8hpFGi6rHV+41qUTxI4HiP+Iy2JSdqUvglXsFRL8IO
 NnBTQpOY/jD3Kt7sLxpAHcWxO/+WIhWBy4cr1WQbv3CsCxIMGgrCJ1ADY7+AZ62UTmSAd/KZGO2
 8xUenxUN85TsaeJWc4DeNIVo=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 03f36098bd8c8cbd;
	Mon, 16 Nov 2026 09:57:11 +0000
X-Mizu-Trace-ID: 03f36098bd8c8cbd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso6400e87.1
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 01:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHug+ezldkrNwx4rJBnTU8Gc/IZ+UBAcYgsl5G5eVyCEmzrZcuZmPEx4ZXMj/RADjH8D10yZBKkVAru@vger.kernel.org
X-Gm-Message-State: APuU4Z8S9IGJUIT5hhuZfDxjkYTNxCJWqmICSmuLOGwstENPJGRsqqT3
	g/8LJ/CTMKWj96qo+ZvVvHayN4kMQwUlUpgKEbntR+/riBGfRjzcagqrWVJ8FFp7Olq2FkEcWZ7
	dZiO84AIM4/6R3BaR92tWPEwRFjt3uKXUkBfh+fkd
X-Received: by 2002:a05:6512:1244:b0:5c1:4bd2:df42 with SMTP id
 2adb3069b0e04-5c17e452300mr150202e87.12.1794823025609; Mon, 16 Nov 2026
 01:57:05 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
 <20261111085448.1130701-2-fuad.tabba@linux.dev> <f2f36f67-a993-735e-39d3-70e22ce6c87f@huawei.com>
In-Reply-To: <f2f36f67-a993-735e-39d3-70e22ce6c87f@huawei.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 09:56:29 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzVCi6y7FJPjnaY=xR1c+EEMTk=uSU5M2=jiXrMpoEhag@mail.gmail.com>
X-Gm-Features: Aa3M54oK9gpHPc0L5YRcoRoBDe4bteAeLTEBUq9FrNTkoJZSiv4ya5-nPjY7kqk
Message-ID: <CA+EHjTzVCi6y7FJPjnaY=xR1c+EEMTk=uSU5M2=jiXrMpoEhag@mail.gmail.com>
Subject: Re: [PATCH 1/7] Documentation: KVM: Fix references to non-existent identifiers
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 09:32, Zenghui Yu <yuzenghui@huawei.com> wrote:
[...]> >    * ``KVM_STATS_TYPE_LINEAR_HIST``
> >      The statistic is reported as a linear histogram. The number of
> >      buckets is specified by the ``size`` field. The size of buckets is specified
> > -    by the ``hist_param`` field. The range of the Nth bucket (1 <= N < ``size``)
> > -    is [``hist_param``*(N-1), ``hist_param``*N), while the range of the last
> > -    bucket is [``hist_param``*(``size``-1), +INF). (+INF means positive infinity
> > -    value.)
> > +    by the ``bucket_size`` field. The range of the Nth bucket
> > +    (1 <= N < ``size``) is [``bucket_size``*(N-1), ``bucket_size``*N), while
> > +    the range of the last bucket is [``bucket_size``*(``size``-1), +INF).
> > +    (+INF means positive infinity value.)
>
> Could we fix the broken reST while we're at it? I mean

Will do in v2.

Thanks,
/fuad
