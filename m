Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823101;
	b=KLzP0ImuTe4VwSqzMRfW4qvoO1zYl48QnMRSk4wUpcqbDRq3ek9jDnWLKuJp0fTkPuSJ
	 ZjtjHwufyYZKXTLGN69YfHbEEnrHbmpj76yrQYm46U3qZhZ6pn21fIvI3HjNZdbJq0QsO
	 9jKVeQA5BC+UIeSkSTn0yPq15EoSDkRjW6WB8SNszZAZnsErKaE0bzBVKvzOujqD+CDUv
	 r7/L+h+C+2MJOF79CODBzo8t6Ju1X2q8JcbkijMJgenjCgxYQhGWgHYQUO4kSNShAgDc/
	 fj58LReQ6UWW6iVgPAfh7RJzXea8IU4Q1giiY+VT/ZvoRoTxuupDKOF0vm3jTeJVtwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823101;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Q0MVmf4IpYCilnXIvfcMMwMLhYICnhyuqiHiEkoOO1o=;
	b=bL3xluNLGrbEfMjoP32fNSwN9iXsFexP46Teh3aP7/3sWPIWUb9biK1A61ODJp1q8qa0
	 QKL0Vo0o0cq7xuB2HUexe9tQxtROEJtITRSeh+P07SGGEtA86kLdfM7+03fYS9YKfi/iw
	 REdNvtKqx/4gj+bbzC5vhd1/oheFy1PoHdlknoNx5+ooDJZQk/fN+XsdG4XE5wuuIlVl/
	 CV1oGkRiytiWt4gIQZMj+6Ow3EhYIyCOk/UpJTIX9XCF+EsDcLGBxjS4oWnuNYqEXrHut
	 Y1lAj6ib5N9j5wJBYhuC5TXBe7jeEOxBSdq9V3rFu6UGw5ex/lO1nO6o5CSlHutwn6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ukenw3IA;
	arc=none smtp.remote-ip=95.215.58.70
Received: from mta1.migadu.com (out-70.mta1.migadu.com [95.215.58.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2416606A33D
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 09:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2416606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ukenw3IA
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mvr8JUoj4s8hurTRT0oqyf6HkIMals3cteGiU9PnGfg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794823099; v=1; x=1795427899;
 b=Ukenw3IAfofwxq6M844AD9kRWPfoiC8hfO86GWjJS8oBoQk/RiSW2Efsz5oo7F8PYiqMOF4Z
 uZcJ2y8lm9h8DdM4HvCVBTmqfXs383+Pkc3CGVgiS6WDXRJVrwHis5a4IEEKHrLN+fGNSlYaCb9
 fKkY5RD0deS1u16emIa9ZFUU=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98f23000b68ba6b9;
	Mon, 16 Nov 2026 09:58:19 +0000
X-Mizu-Trace-ID: 98f23000b68ba6b9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5810e87.1
        for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 01:58:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH3t8dKZsUY8LOKWrZwawb2JgxMgY0Z8wKqMCCm4KGVI+yZGnScOKVDVNBs9v0waW7wMvoHCkp4H7IX@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Yb483usRVfkYuUAV0JBch4E0XewhM3azdq8NY5NNCFA9MaAR
	SUBK7mplAT5cv/FzoxbQjaT6DEhR2HUPtS0m7zGFQRIiDNHYBl7GK+JRQ56yUVlvQWP2KDwToFI
	6gf599eI3eDxWByBt5j9JGcHhcIfoTGws45h+7+LJ
X-Received: by 2002:ac2:4e05:0:b0:5bf:a911:7ee3 with SMTP id
 2adb3069b0e04-5c17d90d3b4mr171778e87.3.1794823093196; Mon, 16 Nov 2026
 01:58:13 -0800 (PST)
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
 <20261111085448.1130701-8-fuad.tabba@linux.dev> <b5927ae8-edef-4042-bf64-da873eff0117@infradead.org>
In-Reply-To: <b5927ae8-edef-4042-bf64-da873eff0117@infradead.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 09:57:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx=SMYSs6Qwmd0BrhbeftsBFs_hzg0T6qE2ZTSYbxW1cw@mail.gmail.com>
X-Gm-Features: AclHuK_nHTjmC_GW6HrL1qkYjVqq18uEdOE3VTq_9PAn58E74FUTCJeR_dnGLlo
Message-ID: <CA+EHjTx=SMYSs6Qwmd0BrhbeftsBFs_hzg0T6qE2ZTSYbxW1cw@mail.gmail.com>
Subject: Re: [PATCH 7/7] KVM: Fix typos in comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 17:05, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/11/26 12:54 AM, Fuad Tabba wrote:
> > @@ -2526,7 +2526,7 @@ static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
> >
> >  /*
> >   * If more than one page is being (un)accounted, @virt must be the address of
> > - * the first page of a block of pages what were allocated together (i.e
> > + * the first page of a block of pages that were allocated together (i.e
>
>                                                                        i.e.
> >   * accounted together).

Will fix that in v2.

>
> Anyway, these changes look good.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.

Thanks for the reviews and acks.

Cheers,
/fuad
