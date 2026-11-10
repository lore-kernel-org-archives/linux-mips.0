Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289195;
	b=qGCgZReI94lcxAcdrp1WiWw7dWMMkEWM6fnd4M9kapOIR0ZpQuAhVO61bcflCH/rnIBy
	 IdlFiQzCeUcN8cGp/Q4N76boNRDujp+9zmgTFmPtFCQ1dwVYika3AufDM3Alz9N756utE
	 TnLDiTxqKTdXPp9Qx0tJfvPS14Ieny72Ume/xNVRsBmoElVVM54dKU5/e0xi+upCJeYOp
	 M45zAzTiN7Scl4hfjuN0SIZljzx7cNdQ5087WuQigfZ9uI8fjtwBQwAf3KBnVYZ/tz5B+
	 kp7OKyxVWsfkpjPNdaF4uLs4zzpNQHv/e1WxZOtsu1rkoqriwbCOpuupzhAWRBVHhZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
	b=DwQU1ZxJLyt7gmncj5gmuERP1JFTcSNdj8ZWLIztalGRxNtN7Y+gymEVbIugo0/jmgiK
	 kxFWNPMhPztNPbEXldmf7on7cUFfMAToWZgqHN3QUHmDreJLxVG7CND1RNprIjR7fDWzT
	 qxSeFoRuxYgIp5BU3bYgZWQNxU8WWBtzV5zXx13PjB4jCYBtQ/ucpyvD7+B1DR89HJn3Y
	 rEbZH9R1LdJ+3GJ6kNGS3YnJ88TGk/QMccSPNuIELBp0dKGeyJj+0ii4m1iX9tyhuHBzJ
	 aTHY5Tpi96GIFWvmh3t4OHhonCOkl8+Q2slJE8ZkUQCZyz7AVXKphB+bHTKdb4HsEJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nYCjfLCg;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2332606A326
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 05:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2332606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nYCjfLCg
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso846026a91.2
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289194; x=1794893994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=nYCjfLCguMBjFt7Df/pwcAS/GPhBqgvi5e16XKr+oU3FTl4s7XEOa/w4lwVhENYNEy
         6HUfXInt0Qich4WYX2Rx0OD0rQnYQrTfrGD4byFmAPHBXNocTXgLKiro4pJRUUMPvCHC
         Ilr6Z8eXaJfgpRD2l9SSOO7VTdw3nLqZlt0Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289194; x=1794893994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=M9Gbi+z5ldLyRhUZLHNoeGujpJzyiUjFseBxTZ2CkRj5+axPqU+akPyrDS7wK7yNxI
         wlGNNq/+tK+YECSRnOU7TdeAE7OmEi7TvW6GiIFvhWTLHmfB9fB3Qtio1qXYVOmH21Xf
         l4XCawRn5bMjYKTfjyBFt3CUNsBMozqc+k4lGMNlynCvz7NgLeB1jnuluxIgwBJUrSzW
         GQRxhao+MJAp40uXZBuhFWQuiE8PkwWVF1VkTxS5AQCVtZW0pLvPRCMnQv1MBMvzH1lZ
         2gwhlJWP30DACKL4xW7jy5wcl4siRPEHqDrwaCSI8UfuB8aE99fK+KFc/c2BunoyAqRD
         F24w==
X-Forwarded-Encrypted: i=1; AL+hErFg7wVjuOkDII3HEw4PHXLkUxkGC6grfvtvASrWZe0F93rZqE3/Pw5qAdhoIg9V+s34jECPQIIXYEw7@vger.kernel.org
X-Gm-Message-State: APuU4Z+1MW5CBDTV+gna/tmoXkN5DUMwR3N/pITzfZNtMMU+fBAP8kAT
	xK5eMBnpPWBG2CiCwd6wQ16fBYSzPsrPJe/ZJ/m6+1/sBCOTjAdME4ScD/ScL5/lpw==
X-Gm-Gg: AYBFou02OekkHHUCsC8BdCX1cCGoylmIBjIj/pLj8Tj5XnfqRcbFkx7Nph6P/q+G0aR
	nDy/PVvm3Z/tb8CTHZk7TVC0o4LD44g3Ya7X4zx91xCRlZZz9bq0ajN8UdxmBfuUBIC0oAw/Dgu
	XUN+KsBw3O8gNxvG9sZbxurdesPFlY1ZdXJBWAxYVaDn+UvfwsA/nKR01sDpAcx0Ykn1+Uh4rZe
	X26vxr5zz8z5E9WfHcZ2MXjiqiAPbgQnrF8fAvgiOAM8MPWqIFCuMRUfrG1JDUsKhEQ4+4QsdGK
	33kcAKt06tEBUqngPKBzgDW/gzZsiaP4S95wMngdpvNPiVwDWl3KeMyn2eqrm5q7zpCyBpmdptd
	tDUg4B8iulL3b8zFnsnPf3bnOxGHsvP/tFhp7d3VlnbV13zesXqZcaCqp01b9Tjj+brQbyuOYBp
	hiv7ABquOnhGEvxpQdEQfKUUlI+CQDZzRG2U8iq5M4+yDzFO9gJ/vZ230wGgeQDU6AucrCd6FmI
	b5GRFGNN9xbyA6/MNGYF24qA/WWj3b5oaFnUMq5yD0xte+kc8k635fB/j1uB2eZGmOFkJCEzZAk
	2VJse1BOa888HoR7hpTlICzSf7xbAinWMysrKkoYNEpl+C4m2QHn00ZdCGoyKKdhTAsBEnIWcM3
	PuvHGLozrnAx2RZg=
X-Received: by 2002:a17:90b:380f:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b166d02addmr1882552a91.34.1794289194303;
        Mon, 09 Nov 2026 21:39:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168ff86e7sm1041404a91.2.2026.11.09.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:39:53 -0800 (PST)
Date: Tue, 10 Nov 2026 14:39:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 13/15] lib/lz4: switch the decompressor to the
 vendored sources
Message-ID: <avKtyCOOmK3AH0xy@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144310eucas1p1d60fe5c2e0170c49f38a3142bb1d8f94@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 50265e3ce256490994cb6dae32a45da376e408e0..b9b8a5f678c155442fa3fd2c1984e45182e6fc38 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -84,7 +84,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;
>  
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> index e7ee3740219852f079d1e0866da6b213a3f3a583..1e09c93016264259c149e2913b2819571b56fab6 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -65,7 +65,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;

Ditto, outdated zram code.

My ask would be to not squash zram changes with lz4 changes, when (iff)
possible.
