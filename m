Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815930;
	b=T8zmfcvfxWznrFP0M7K/Z5HUl/Sqw9J+QGVPJR8UBsMi7YmJ9O4XeLuNCq64bg2Uk6Lm
	 CbYva3aNzVyX0SZSN6WzAyrQfCO/Gvgrh7/YJG6tiRuqLyaFEpN8CHfZL5R03hii1Kyrq
	 YeBpghd3Nea16ci+UhS5Mk6wdrgwD5q7JlgF15lWBCYKC9AKXE8fJaC5jmjSmJKS4l2mn
	 MKEf+kL8s/KCJtqRs3lhOZFpq3S+Sah7cZjfCMcspaX3loeAeSOu99U8axkilOfg6ksTx
	 VbciEYtsjD9WrADwuM2WnB/T7nVCbtWeJLmVYV1mJeK9893aAMvoQXUYInakjG3GsVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
	b=FOWdtiTeaLIq1LTQzkkrMXkRmDNG/j9uWYyt4vRO53sx0/JfCv0+AQAyFNuqiqnuwoUs
	 J4+Xc4S5CGnZ9wc8ooJD1obtYUgw5y/BmTxUbFbmPpvon+5i8UuAh2ammyi+XXL5Gd6nU
	 8JS6R3CcDBvuml9dx7StNDajLhw/q+pCgKmA7Y9PgKtC9RFB6IvTFXx0xOI7NnsrCkgG+
	 Mz6QpD0zBMHMX9cxx84PGgXTfp3PePLisR93ASpNH/1z+yuXEsPkuEVxD/e3w1UEwRG7c
	 m6jeMO1c5KPrlAlF//9W/QFPK12L3ItU5txVcYkvjjjvFOEG7bwKcZxwEeSjo3aRhyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="m/LM6ars";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E309D606A32F
	for <linux-mips@vger.kernel.org>; Mon, 16 Nov 2026 07:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E309D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m/LM6ars
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso19959735e9.0
        for <linux-mips@vger.kernel.org>; Sun, 15 Nov 2026 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815928; x=1795420728; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=m/LM6ars18o8GDKRmm846P52W5VTEeLVl3zm4E6+Ukoew1PNUWaySYAFTHbhwbIHY6
         8zyWRJ3E+soSg5cVCg675JZQUuiKrI7PnShT86jC05Ju/0/IRheNzvGNmD+npQLbnkn0
         fy8Il1K6Vm+A5YZwCa+xzQ2+KQuOMrOvsBIKg/ExEvAa5Y/VxNmGrq1rCHU6BtXLMwTC
         Wsvn5VDRjOEmowS+ZSTEWPRIhLKHrJyNPuqywDI23KP2brkj28XF72ButTpsWAH9l4pR
         IypEgitHhE/vdzZkz5m5Ua6ccTEUz62Pa2MJahrsFOhrSRlAMMkSQY6/3R5U6hM1aN5V
         0hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815928; x=1795420728;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=M8BN5Y7HFFmEKOjTqOdTtxloAaJQEck/GCdq5HwvdLnspdUOML388OHen8yXa8I/le
         sX9/ukj3FuGaU0oDvWgDETbCAXiXx1NjFzfb2+0A907YuVQgpQjNdOMYg/o9MbhpO+O9
         1g+dB1BhiIxE5EE7tA5f+pKcJq+YYU4A83nP2xh2jaPc/GaqBQBePm06O9c4hMvv6lbW
         w3WBq4UslptDvBOa+weHNLraTGqSNj+hN+uH8ivnxw+l9wt33GOKFFa2xC7ejXMmbutS
         rYLyD6KM25B21e7FjcWOEm6obXSZpQHGgMADMV3z0Q2w3TC5SWhGfoeXphRm55syv9gh
         Jncg==
X-Forwarded-Encrypted: i=1; AL+hErGtvvGXmyeyPMZSOPhDtjrCM9CZOvbx8IAs1IMlL7N1+wtVNXKPNv0RKZXh31NMjQy+21xdGq79UqgG@vger.kernel.org
X-Gm-Message-State: APuU4Z8XuuTrz/Gxn87vwVAR2+Ev6FuA1S0kTbcP1c1eSTxlTcNJpAGH
	gLkC1KOmgkf+O7kO7v02Y0Siuzv7EjFdOlb7OA9y4b5WNrwQOO/b3fZ1R/X4M6G9P4KE
X-Gm-Gg: AYBFou0/n0pNs3OU8WE4iXZbvSPyjLeD/3akGqHuShbKOl9ADRnLXqU5cJhz5CaQCrf
	zrFEZ40xpBeEo3iK+TEGBlWjIa0LfzwqKBL4k7Xex37dL0+ddJPdictVaF8DCGpOCGgzuOIE70U
	lM3ZZ7KqlrU/WSpreRJXNjT1YQfOx+DQrte39h1M/OtQs6MY7/b/V69oI4BV6Q4Gx0mj9pEo0/W
	EbbgrJkOdKS5KNzSJmvRSA5OYL4yTUMUPlipN/whW0uuqkOumYbEXEax27eUqJ6LrOe0sS9OV5w
	OUUnWex79MHgVgR+GGF3Kyrhy75c+J4GIDLodJnHmayHi6TD8aeocJXWx22DtcMffeAYUC7n1sw
	oDj6oX9GdX7iBNi0kbWyaR0FNKRaNMAQfckHCk8FMgqmSXrtcxAM48Q/nX8GZH0pss4O6a2dS/M
	8mZ0NBwCKodglmrNxubhKaSyW0/h1P/zOB/nmuPVd1DaWEkgR1VQ6evKPGr+fOue6BNhehRrnS3
	Lq5EBG3BS+OOKnaKhFS/Hl6/9eaJPbrmJcWohMbBn/Yl8GyUnxMnzP38ercD0jn8QDc2Rmm6fHa
	deDotZVcJacvcLgg7sGaic+z2dCXYoAW1MOHT/jBWGYfFf4IW+sGZYEP8C/2yyU=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr172834365e9.1.1794815928232;
        Sun, 15 Nov 2026 23:58:48 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm375768305e9.2.2026.11.15.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:47 -0800 (PST)
Message-ID: <aa32167cd3865049bfe0281b8b651c47f5e1c05d.camel@amutable.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:46 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns
> that into -EFAULT like any other short copy.
>=20
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/sh/kernel/crash_dump.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/sh/kernel/crash_dump.c
> b/arch/sh/kernel/crash_dump.c
> index 19ce6a950aaca..85c0e58f1a59f 100644
> --- a/arch/sh/kernel/crash_dump.c
> +++ b/arch/sh/kernel/crash_dump.c
> @@ -20,6 +20,9 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	vaddr =3D ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> =C2=A0	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	iounmap(vaddr);
> =C2=A0
