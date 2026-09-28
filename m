Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E843B42F2
	for <linux-mips@vger.kernel.org>; Mon, 28 Sep 2026 05:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574510; cv=none; b=ec6wqrolepE66zhNYWhlMsjRob20zQojSpTV69dq5VUuxPz7YBiVQjKv8rtIWifX/4yxQjtkKe5yr89NCiX581gLsUPEi9bhsPVAa3dC+V4o+nJbKhNZT43fqZBrL0BUI6dT96hmUYE0zRNKKpeNWrx+fSO+151CWiljYmicfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574510; c=relaxed/simple;
	bh=iMYszCd2Q2GkfRGunaTTlbLJABOPePOXot6uhYku9yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szWjHyPoM2epnBDe9xT3ROx5lDV8KHLAeXIcgx6IGIbOAkebUiVU+7FijdpdAT7MRHHjvQDrWeRECY2W0a9I5r78izynvsVOvKqQg1PAJ/rOEhIay2Gg6itM3WlYIHzP3/nAK6LvCOvr8sd+63dUTkwzilZfD9M5TGre0fEwARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bxSu473o; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bxSu473o"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso42995a91.0
        for <linux-mips@vger.kernel.org>; Sun, 27 Sep 2026 22:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790574505; x=1791179305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=;
        b=bxSu473ocLXfE6sENO6UDQCfPbZYu9DTkKv7SzG0U2ent1wE55DvXVZrKbPwgxoTSi
         HFx73BSqIiVKSUS7gxUnPTz/Kkc68NvdKaga6clGtTJ/PFcrNDAoFOz9HrToRPEuY7JB
         w5SzVZBiHKy3ICHS569p+1/EZqyvkGv23nnzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574505; x=1791179305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWV/wHWLQfhp6L6mSocYwp2pbMQ9zmUarPxSrrFDYg8=;
        b=qHQdasncjVbVEq0yxtSXn44gzQa7Syq3m/f2JZq/C8mGxNebshXcA8CNkbzlfVL44Y
         KKF7Xi7X4a9wFkA9oigEaagSFCPC1xWvEzb7lRLdWp65jcK/timfWq9IrDVjs/ZXqFDQ
         D/Juo2nJly/nQfcfRSfevL69M591n55jLazG1zC1aMoQ6VBQZ4mLsHmTASKEE/vbHt5a
         kGyi1AOld1VwFu0NnMt/pV0jvcuTAoHr1S3knTFyabd+310Lz8WYHS9zhPWTrURf8+hz
         oy+A442wei6/DZxV7lGmCT6E34M8oAOaBsGlQZUXGKBmF/xDwGgA4dB9kCrvqqvUScqs
         duPA==
X-Forwarded-Encrypted: i=1; AKwUvByhl2P0TiMhsE9MadiqprzQwmNIzxIQU/3D4zpyn61E9btIFQXvBOn3PG40dw88GeFNwwFEEMsab9sj@vger.kernel.org
X-Gm-Message-State: AFq9FYKL8tZwDZhljsj7UnStQ6xTeBV2V/aKrFh2+APrp5I96k2pf7NX
	LC6C2XodtZgi9X6M/8B+RpWa6MkmVqKr2/JU8mROUKOa/7Gk67EjFb9DJaD5JiUVfQ==
X-Gm-Gg: AYBFou1f9GJRiX/tnfqBjMmTDziLEu8jHvEBxoD1OgWkGtOm6tlgcLICstzI8pbqkZa
	XNUzC45Xz4ofBVObuGRyk9NiYMnYTSJfZ2rIRYdep9YZyPo0/+DQJcGeJAqMlfFfmWUZTRoMBD1
	yuN7YAjODPpJxQiXCO9Oa442WqZnmbJiwCcIpuXpVmAHw7TEoTM8U9xG9EJvbY0vfwN2BASTmqC
	lnavzA/M3APWqgDXCpwRSMEK0YN6IBfKKw46mfZeK5maXSxsdldwavnQyYtoZNceuPVMlmAnOo4
	JaIMkgO8MB6J4NNfgx72Qa2j5ByPrefSv+Hv0arR792YPMsNIxfWsDFQkNYTdT8JJL3dxRGh4A+
	tfgAL1EU7y5UhonS69b8hNJfEmgxVPywQBHF4QVtyxA4CwBV5Md9odnsGYxboJs0e0rYSrJuSZE
	Hf7HBIt4Ws9p95cVGipNnFGpPbhc7kgHxUbHGsmA5zOpE6dcgMcsf7OYdrCv7/Yo1KSwwTb45/8
	D9CApqqu+ujB2FXkpdApl9Jki6DkhJG04LteECUfx5WsNryhA==
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr6256726a91.6.1790574505299;
        Sun, 27 Sep 2026 22:48:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bec30aaasm17853889a91.15.2026.09.27.22.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:48:24 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:48:15 +0900
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
	Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Sungguk <sungguk.na@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 3/9] lib/lz4: add the build environment for the
 vendored sources
Message-ID: <arn9tK5MxxxfH7OW@google.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
 <CGME20260925113456eucas1p136c3cd1f08be7201ad6b3f7b0e8ff02d@eucas1p1.samsung.com>
 <20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-lz4-vendor-upstream-v1-3-1c7ffbe21c4b@samsung.com>

On (26/09/25 13:27), Michal Wilczynski wrote:
[..]
> +
> +/* LZ4_decompress_fast() and LZ4_resetStream() are still kernel API. */
> +#define LZ4_DISABLE_DEPRECATE_WARNINGS 1

Is this upstream code?  As far as I understand it, LZ4_decompress_fast*()
deprecated upstream and are strongly discouraged.  Do we want to suppress
deprecation warnings?
