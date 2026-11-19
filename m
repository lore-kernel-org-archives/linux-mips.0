Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108518;
	b=cZe8NbZvIVvVNmZPI1ZTxmJI4layd/YjlaiyuEeG/REfonkdXIHjbDr0+60uOiFgw/35
	 jn7FEnnG4rRKPymFgMbCwHdYwGSelDdCZXs+pwjJqc1c87tdaFjSznkbPKs+x9olh4TsJ
	 39TF7Z7j5Ku2ftZBPyfdwE5vf5SIRNCooTyDxxyBFcpu/bq345D4jQR404ae7MPfmpEWF
	 tBvOVJA5vyncgE2rA49+ej80J3B1kfLEUH8k/uN1Cuvi2sxiIHdrHrCW3ByGiYamCfmU1
	 MF3kWVzAL3viIPG7n7UKW1Utiy28CeO8isDx6a9dWUVwWlrrCUzgmBOOeIkfSnf7ZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=QLlAlF6sccc/yijrm/66Ncx3qXiAKuk+bopz8N9+Jgs=;
	b=RYe7lVvHaUU6YDOytPK5Flg1z0++5U7ixXs8FCTDfcFjtvf0k20aueBkza6o8BJ0eomV
	 v0Pg9Lux8hoTYi5pR//PjG5okFRjfY6qq/0cmgO2VL7/UPxlQIEngTw0LSgAOeHuXQ3we
	 qR00AgYzcyQ8QfPRYLtp80ZqonxB/W3u+n77D3obn2YD4C6JBzuPqCGK503FXts7Skxoe
	 EgXaAa4+GbH8H9gUnMUJ2w4NVLzxQpCucgORCxzbejKNlI5H4MaPiSMk5vvVE7sgMCPIc
	 OpAwmQWQ09Y/enB+5L8ZZhjV3fl3yaw/AmyfsHHHJnp37rvo5OzBES91so8TdZdszQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKC6PKmb;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34804606A32A
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 17:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34804606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKC6PKmb
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so45806a91.3
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 09:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108517; x=1795713317; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QLlAlF6sccc/yijrm/66Ncx3qXiAKuk+bopz8N9+Jgs=;
        b=fKC6PKmbL8T9BU4qs7WIf8UVTCIALkcf6ev15oUA8cgdeK293wEnfx6mIobFpAmzSr
         Mc1PaNPs7SgJwtbLp+mgaIecJjc+K1CJTkWH1O1wNbODCXriHpJPn9eZ9bUBkXkOA2+n
         E9eLthDMC0/s0AphSxs8rEUQz8UlqM4SXO9wWKuEtXfjXvX7mZc85+PWiBCX9CZLo44Y
         2aVI6innRIH9EY4nnoSnIz9iFOgebmAAQXSaGJN4vVIwgUG/mSniiFRqYLz5FN1x18h5
         0td2nm7CY2D2/085i1oEoJIM7/fLtdB8cOz+sQ4KJnTWpz2sS4MY3zZpltKdqFudnVeP
         Bpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108517; x=1795713317;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLlAlF6sccc/yijrm/66Ncx3qXiAKuk+bopz8N9+Jgs=;
        b=z2dUWTdL1D3ShPijSY5nzCzK4aBHpQN6KcPiBmk41sNNiFVA/kFRVBV0RwLwERZKRh
         kHoGW64YIZHsFtr7aDh6BHXpP2dEZ99r+Kqyn59OGLohf6zE8Y2zUJpn+iMUBUsLYmoc
         n0m5vzaExnCJXt8gwuJV7+vvTg79gi7J/oW1V/ZGcSrMdASlycWl3mPbKM+60NWcJ4eM
         lwHFWz/zzfxqyQBNh3TCd4FPLzAN/sKx+EiPvBjh8xslZ/EyGS7mnSTckA3ypJFn+OSF
         E98lffUw7tEr+e11AMOdh3rI0unPIG92m64XroKLWkKPwev5t8xkYgJqTT4WfBvLeqHn
         VTJw==
X-Forwarded-Encrypted: i=1; AL+hErHr24q5mcuXrustIDfO/YIDsJu6LWqtUPgLssjYT1tW2C/OwIL1hw3HLyV8N6yBWPiEmX2dckXvn+WS@vger.kernel.org
X-Gm-Message-State: APuU4Z8B2PP1zjMs/zx89CtqkYVvObzpGcLmb9mhpgrn2oycqPiZo9n7
	YLW19mUthKoAjCdgbGlN7LFMsVdC9/hWhZuc19EdAenToDx+v1Cp8R2h
X-Gm-Gg: AZFdTZekzLvNWhBQZnDtnE2rVG7BGkpdq5ityaMadIBVtnl0WC79+jqWYQVbp8XeQ0A
	NaMt3SpgELmg31DiLsANFNm3Tsw6jXieYReT16IELmdYqWuoAgWilttGG9mDA7VMOkkT57fTvaZ
	WHQcQFIIkeFHjAOBCYiCU6DWpD69XMu6Ed3f5UD9PYTsGtSI8v0a36AGGfxPIxlBdWXPvMwXkGt
	A0fJ+9W4HQrbbabe8aEI/HZDVLaiMFILMimBLUBOhalmgSvkggox3qcoursUNhCFPO8cj8fHNqG
	w0RvGfjllHemJS/DT82s1fAG00KwreSSDZCncKYvGP6a4HfB9qIodjQl/sW+uSxUCfOlmlUWtUl
	XI7igHlujsJItGSMklWtEo+Ntffmv6hA/3DpxrkykyvdqEFoeS5Az+Tkon6AfJ0wbEsoJotJvxK
	lSKI1plvXFY4JlgwMEoz38yzVqClOuhreYGA0iDtnhQrt2DRjzaYN15IcO6ux17GU6ZvdQ4VF/7
	1Ms8RueHlvCnw+Re05KdNXocut/Wr5nSjmlgJW43AD+QDb80mC9mdb2ctDZJBAok1ASY6vTUira
	8UEhJyzKW/oc0UXWf6NIfCSyr6I=
X-Received: by 2002:a17:90b:288e:b0:3b3:ec88:72a6 with SMTP id 98e67ed59e1d1-3b41c85284amr34574a91.3.1795108517546;
        Thu, 19 Nov 2026 09:15:17 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm3418882a91.12.2026.11.19.09.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:15:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v3 4/8] powerpc/mm: skip kmap for lowmem pages in __dma_sync_page()
In-Reply-To: <20261119151520.2383226-5-m.szyprowski@samsung.com>
Date: Thu, 19 Nov 2026 22:43:30 +0530
Message-ID: <4idclp6t.ritesh.list@gmail.com>
References: <20261119151520.2383226-1-m.szyprowski@samsung.com> <CGME20261119151530eucas1p1724ca5c2a4cb0e5a7d9ad91c936a2c6f@eucas1p1.samsung.com> <20261119151520.2383226-5-m.szyprowski@samsung.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> With CONFIG_HIGHMEM enabled, __dma_sync_page() unconditionally goes
> through __dma_sync_page_highmem(), which disables interrupts and
> kmaps the buffer one page at a time. This adds needless per-page
> overhead to every streaming DMA sync on such kernels.
>
> Use the per-page kmap path only when the buffer reaches into highmem
> and do a single __dma_sync() on the linear mapping otherwise.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/powerpc/mm/dma-noncoherent.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Thanks for taking care of this. LGTM.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

