Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289020;
	b=vrYcbF674MAONf40AHELLb4xmQ8XeLcBWQ9cfKIlbhlUrDOPLpRtlZO/nqiIytnBZCP7
	 OE21D85+gZwsqs4pXO8a8Ehz8JESpZFFBw+8M+Cg+0BQgtoTbGSZlZQkl8Ru4sAcPrcPR
	 O375TtAHjKx5A6RJRw/oziS/T36UTc9wZ0FwVOmAh+YFs/qE5/VI8vje0Up4spCm73Q5Z
	 BCHvrcsfTEeb526NTaLJU//rXiD3oNColtd95fDSZLdsUE15Ied3heZD2x7fXwa+rgWcL
	 IrkRwzD8C9nm3ucc4bFtstYszQL3fB9S11gc7WJj1I2HCiikEDPHwLc9hjWF36bZpnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
	b=mQqg/aF5xZS2FsLln7OObZji6tbmmb0nSov1f/CYpJUDO+CRPsNOQ3oyKaBOtx5jLxTq
	 TXmDl4wMKzwiYrbY83mV6MJ2dKMU0/kLp0IGp7cvbZEjqIxR7p1khUV19PnRVxeARYfcr
	 b1Z7mxtcMpRpUhnTsOIyUrNQJK41mQEd+Y0V8dWlkN0GEd8Lez9Eb72OuqwQF2/FFW5s9
	 9QnqjCy7LgD6KBSB+jid4mSy4n7rRZtujlZQe7gltKBSXY7AeagScNAU4Iz1uSxAvQIO6
	 Ib6uoQzomY1CXG3SWtMslxycuPei/+gsXAV2TgTmu3Q30s62zmxx0xQ94EwiRgunBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a20xVX7N;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A3760A261C
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A3760A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a20xVX7N
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a06e79e152so842069b3a.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289019; x=1794893819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=a20xVX7NeZjvXNyM41dYWvLkg80id1Mtm74DkyBWYfM0GGXgLb8i1+nApuqtrL8uLo
         zE4qrJ3gNwkeUVWkpUNiFHGrdIzZeRo9Bur+lQwMh5IboV/ahqD2hnLAdr9gSwVdEq52
         47ewJ4dnUp54hAJDfsvJlQHVaRbFtqFrQtWkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289019; x=1794893819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=Ab041XYk7GootyvP2PfGVlvKHMTfat2OS50JGQESS8lGYZ028sbbXST9//PbkmEDZE
         UdFhJ5NKZ9fxVNqZEq6V3mzlUPAnuy76tt/iHwdZnyMAmD9RCbq4OrNvtte5g7hOqYhG
         DAT9SZQ4i9WSX9yX4uVhxWfhBRcv84BtzIBZ2bhPOkgZfEdvVGbMxfS1oM/K1QjJUe3y
         I9pTHZKkPdUL61s+XPq4ip23ynrjqYnUE0AJTu7AuIPjPlDzJxHXakNrUIrmuelnXk0e
         otctSET8+bEyCsroTJL0HrQUfcajpaxPdNw34VH4y/g15O982gkO7xAODefxK6LJ5q/o
         UN+g==
X-Forwarded-Encrypted: i=1; AL+hErFGkjzeeqBD9PH1718fL53LJArTQ/3vtVT5EVRWmxTA0Zid+BBv2qsCcULPJutfuslGZtY6uk6iY9XJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8oDVEQNz4JMWTZuIGhj4fKSoBYfl/xOfV5IWOVzGtCBwHe8XOY
	dXrobs605CCbDfosPhn9bj0SRZcXySuAYZFsqDtcQkD5RzfvDNK9gBkP9/5b2mnjPA==
X-Gm-Gg: AYBFou3YY8TwtDjq/gMlRyIcga7SmBGFYPuaGAsUvFyuixm4AthdKnZdwlu8qaIMiG2
	J9YKYSvhUc313Yo8Al3EIHxwlAp+h6IditqJhyLa4kqr6YCX+utABdjykq2Bv6le7k3pu1Idb8W
	Xrk0FHZ5WFMCF34VF5rz2JVhhw7ReAtsQoPhxqdq3oTQnEPll4Px1yBON6eqatVVITbWrB9h/fF
	MEKxAeKATou2XqR5RJ0N2rRWpLfawNoN07rUIw9rlxPwo/sUuPNaqmTaI8cJIE0fRwmf16BFasN
	Kdl9BIF9tGIuud3TuiyX5kI6opv2H1ZEo9czIa7f+QGbTDcFuaEIRrH4d6tEmflslr/c/GZKM+x
	Tha27iLkJCT6EuRbXDwrJ4WQ5/YAY3EkwHjfOYoiKBowxMrD3Dn8T4qol95c/bzH1TuXLGGl5hY
	purwGbD19w6Nj5DzHlOEvhCMr+QB6x6QxIpVA4QXJqz+2RpPrchkMqFVy7jgahNIL8924OnlgO2
	uDuyzF0M9OPQgU6ldD6KdiHJ115mPVocD+LoEajZYhRwV9gGQPMdg9O42dOwjELHc1WvbFi3jzy
	CRUTpV5Uz3AjjlXBz3X5FzzlJKA3V/M0KlDykTs2CNG5W4d2KZTYYKSxetnmro5JFkQWXA==
X-Received: by 2002:a05:6a00:1492:b0:89f:5c84:46ec with SMTP id d2e1a72fcca58-8ba89661da0mr1558178b3a.40.1794289019108;
        Mon, 09 Nov 2026 21:36:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm405355b3a.52.2026.11.09.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:36:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:36:48 +0900
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
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
Message-ID: <avKs4_S7r6EiUVgC@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
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
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 1e4ad31d39a63f45b3bddd3d8a467d8d7d095beb..50265e3ce256490994cb6dae32a45da376e408e0 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -42,7 +42,7 @@ static int lz4_setup_params(struct zcomp_params *params)
>  	if (!params->dict || !params->dict_sz)
>  		return 0;
>  
> -	dict_stream = kzalloc_obj(*dict_stream);
> +	dict_stream = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  	if (!dict_stream)
>  		return -ENOMEM;
>  
> @@ -88,7 +88,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->dstrm)
>  			goto error;
>  
> -		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
> +		zctx->cstrm = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  		if (!zctx->cstrm)
>  			goto error;
>  	}
> @@ -112,7 +112,7 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
>  					zctx->mem);
>  	} else {
>  		/* Cstrm needs to be reset */
> -		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
> +		memcpy(zctx->cstrm, params->drv_data, LZ4_MEM_COMPRESS);
>  		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
>  						 req->dst, req->src_len,
>  						 req->dst_len, params->level);

The zram code here is outdated, it has been reworked quite a bit
(patches are in linux-next and Andrew's trees).
