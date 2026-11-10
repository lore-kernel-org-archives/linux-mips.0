Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314459;
	b=HJOgxa/EzpJLvN95chKuwRA9tuKLGQGV7f5LUUmfD/ZSMLS2xCTq/8P7dJM4GKOU2e2y
	 8Fr8iMbstEaZtaa+/JDSiYqmTNXBPaH5EowzKeAB4gIp9FYgbv9lMTBOzcJutlMpCQ+Sm
	 HTVbAD6CXLaY3eNf0axw8HPTyYQJ6Els8yc8XkyTpJ6otEBIdXYoBtcYkBAysk5h0Z/8O
	 tScuzIkNnBdCC7STa2t/xeJUcJ5+Pa0YgL+Yo7VurmcumOeqFCd1g/PPev7KL5IzOcLZD
	 BM3Mc6SVuyMcAbwHhCBCDOpw0Z6REnX6bN6e/rifCfoPKwM0H9YJwrpziSnFkZo7B+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
	b=K2Rd1tcLv3JX9EFYmdR8j+kOQArprjqaltgYdu5npfl60hUeqSwDEZNCnevtgk808zXs
	 BzgDwNaQ6cqbqWIb2m6FE94Ah5mnZiLKafPEIUQn24q6FPdWgyRnW7mHIAmwPhay+QJtT
	 dYEfkcCRJR0mrTCzg4gk36DIO4cDmtzhs4tzq4kf62EaHMsk2k3IOCE+6zfi8ydwqFD1I
	 hAKqcnnnXQHTEYLHATaHhwsi4X3OmN7R5QVEI92ioA01TLMiW9L4DdczchGGLubB3oSfR
	 2fnXXhKbUI6LAOuq8EVFkkWa6dzBMiEoZZcwS4vqy7sLSb/60MHfL74in86Bx6C/brg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiED+id3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3060A2607
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 12:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A3060A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiED+id3
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e64d52949so174548885a.1
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 04:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314457; cv=none;
        d=google.com; s=arc-20260327;
        b=hlUB/Vb+fdx/0e0YlfRX0LbMHM7bqcdUnwPePxx+bt1Je8lzy8ycD7duu9ATtAlYcL
         cstiK+x+0EOx6JD0HYdeEWEhrCP3EE8jjtPJ341lb+Emr71icOgP3VX0+6Dv4TUUZHSs
         ZDdCFZwIU9KUOPW0xthfESKdvUvQdnqzc5G0D4jJELW8PGPcREHkSD13UYwmRY28eYVO
         Z34GjQpslA7uwhlxIlEyY+xs/N0PSoZAyd57t/cZhX/cUGgd6AoVINQFZz7ffr24qrxV
         DwNhsVNNt2qT2dcai4m8hJxz7UXUn36gyrRmbwz+opBmVZu9/N0I8TrgY2Xym2DiD5PV
         Rahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
        fh=HoOc6DkcT3KLkbP+SVKkVjmWUMceasByiL/c1CxkKwQ=;
        b=CqqF+UU91u9Uzlb4KpL9Scaa7ysfKkKQpVwcUpWQXprqcJJzYZD5Ou9zl/IuuAd8Ow
         qK6Yps6TGPdWNAWEoXN611wEb4BJUn2llnvgt6XS75knnI/e6gno1bksH6sYOy+/fs1v
         BCZnkzoxSO5vVc5h61nUENXnVSLdUe5ZM0bnz+2M/7RBy2zDVbV3cKjUbD5uFORgZqyu
         13KHu+7cBQLI865UAVnfiLUBDF4TeswiV8mz32eAY1Y27SaovNLLam6dimqXrNAQbPn6
         RZr4nJHGyluNBr/HTnPDLqz8vbbD1sO+wnDsSIv2LX7c9XAEiy1NP6Cg9vcXUxW3y1/k
         2qYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314457; x=1794919257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
        b=UiED+id3VSZdgsoZMA1YSiLfBE2mMY0BkkqRrECjgevQDkAnzJCGpADOVqPQp4JgGo
         vbpL2Fq8GGvTlgPBqzQaZus1cEssuCIBBMyAckf5TSHJObOkYJZTktiBshe3GcXV0IKc
         /pjZZ1e48v0/hByYGiknK8QpRcyOBsvNR/M9aM5VQa1vzPCcwAS8wnHbNUayF0a+QM56
         gOFHXs20ttDRdZqaJ8lq0X/5G96YGrfpF2HqKsL48xUHNVi7qT+w3nPsVOhzCG977We4
         Mc3r++vex9Ysg9cMkgoWhDd7ZjUu0Rj0WGogNlcP3gH7howVxcZzz4qLX9id2JvsT5ea
         650g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314457; x=1794919257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
        b=pR7spFHca7RrX7nzvCLYW1FTrz0nr4DE/qfV1wb1Ps4BQHDNoYTWEM2v2v74wHSmAt
         yS9i5r5pqdOhjQX1QxjI9Gp8jJACNHkjXPh+Ve8r22OUEdzjbTCf39wGRM/MaFskhSrB
         uyTI5l6o7e71F3D0a4hNiJGQNxK+KYUKQ/tyTa49M26ZnN7/U7sZwk+MclKmCuJ6/9L/
         SjpfIJPiGDEQcj0Alqa1jI+JHqlzSLtzQsmEDt3v83CLCH/l2M28SXKBWVMQVPNjssQ1
         wzpbf8enDVCdLQbaRghxGMZkyRbah7RKegYWHiExz4JlCFmRkDOTOPDyhPzZzBI7NP4M
         0Pxg==
X-Gm-Message-State: APuU4Z+nMY0j2MKOMWrHK7OdPbNE7sgjg37MSEQ/WloT4yvmficSqCuh
	kSDMl4Of8U5wXLtmFjZEODO02M55uYiWF7yhPTmMeMt49WEi5BeBD87FpgtmF5QaB94h6TVRjl2
	CG92HVqTt1pEbbFqW7e4AmXyMqlEI53U=
X-Gm-Gg: AYBFou3xaXNr9OArZBtByqDD/8i6XLxp8HUedc56++tMsIXxHj1F1NavHUUr2EREcKx
	wjUa2jtieVYMTbcF/ex2Y4+uW6JQ5+jhF2F3psjY6NDpcH1UEshnHZh+7h0ARc/KVgPVeMwG1cY
	dNavhIIHkEp6eOx0wEzI9sfvS3NkkDsT3J0wrIylUTcE9nAJV+smQFrf8Lruwnn2aM8s4y0qTNV
	mZTKvvxluXScDX2vBauA15kk62xQX+H/hAXTW4Ivm4E6uDcoPGT3o8p0J9SKt6XDZHyOmtN27bO
	upq9W10fC2k7anc+Q2cakK23CZt6pteLuBGkFyB7w/Kb6P4gcYBydN2S5fFpfWTJIr9ycbQ3flg
	dRsr9hCXKXBQln321KR2iWsrGZoeZJlSrhdNilKTXpjrW4NlwHEwnPfQCWTh3FW2KpXG+ZUq/L4
	hTHXx4nagf/x+qzq22ot4Y
X-Received: by 2002:a05:620a:450d:b0:93c:b6db:8c with SMTP id
 af79cd13be357-9479f093b28mr391627885a.0.1794314457277; Tue, 10 Nov 2026
 04:40:57 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261110094847eucas1p125691a852f3621482adae13de1205223@eucas1p1.samsung.com>
 <20261110094830.2081847-1-m.szyprowski@samsung.com> <20261110094830.2081847-2-m.szyprowski@samsung.com>
In-Reply-To: <20261110094830.2081847-2-m.szyprowski@samsung.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 10 Nov 2026 04:40:44 -0800
X-Gm-Features: AclHuK83CWJc5YlF2QehrZfUW5W7mZ4EuCDQrpmAsXstQoXrFuDrYSPavdO9f3s
Message-ID: <CAMo8BfL04-yz8VppH6P+dcBTJEvM5zPR-=d9GMdRG4F2B78YXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] xtensa: write back dirty lines in arch_dma_prep_coherent()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:48=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> arch_dma_prep_coherent() is expected to remove any dirty cache lines
> covering the buffer, so that they are neither lost nor evicted later on
> top of data written through the uncached alias or by the device.
> xtensa implements it with __invalidate_dcache_range(), which uses the
> DHI instruction and discards dirty lines without writing them back.
>
> This loses data written through the cached kernel mapping right before
> the call. dma_direct_alloc() zeroes the buffer with memset() on the
> cached linear mapping and only then calls arch_dma_prep_coherent() and
> switches to the KSEG bypass alias via arch_dma_set_uncached(). On cores
> with a write-back data cache the zeroes still sitting in the cache are
> dropped, and dma_alloc_coherent() returns a buffer with stale content.
>
> Use __flush_invalidate_dcache_range() (DHWBI) instead, which writes the
> dirty lines back before invalidating them. On cores with a write-through
> data cache it maps to __invalidate_dcache_range(), so nothing changes
> there.
>
> Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/xtensa/kernel/pci-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
