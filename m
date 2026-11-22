Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320368;
	b=pn7wMmLy01vQEKygB9UT60WKHY58PWr8nCA3mjeCZw63EU2qk9/3eH12SQF0AkykSley
	 uXkNjfLPZ5aqkqBBQyuLbP903LXsP2YBzknMbJZZKcMq7s2vUMZNlVOmiRH4bHuid9u1M
	 FpRmWRD4wZPMtqxXwW+coXNJFYRBO1lc356uYJhc3AZcBAvtk/plfjZaOE0LPArIpXpmU
	 Z0Wskt/xlvvC7UaC4K+pxjjMJvQ+IRzuOIdPUBpvFcMoww7t76K7DTZnnpjaYgxo4tEMw
	 ZJm05MzbhzPnvjsMmqPIQE2MjlEgLK1xAxrRPGgrMVJkKn3MgSuZT9Fs3q0hNcEJMLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
	b=vqMF+wZJlUF0Rtg4i8S4n1TF6MWezjbQsI7Ha+vz94s+234v4IIJ/N2yKXYXXJ5+QnZj
	 6doQ9WCFrXmXWcTDZBgg2gqNQnOZwaDGDnyP0E8H3lLb89wQpaxKKbnUWrr+3dxP2vQWQ
	 JhB14/TOStcUVGqda3k1rK/l3YK1TSSPjDMVDk5l/kFItzeRUy+u+HvjLO2WB12w2rgml
	 Hsnid5O2cctNax5IewWavaIpFK7FbIFy4wJHTz47ssxh/NnAWLc21sgydRE8mhD6U6Sgt
	 YwUN+UwCkDy1P1Tjs/MLycM7IFOwvj8iRf4Q+g0H4Qv/StXO2UHWJfQEUwiZnEmz88w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evJm+oLs;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7E606A331
	for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 04:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A7E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evJm+oLs
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04ad2c46dso10317625ad.2
        for <linux-mips@vger.kernel.org>; Sat, 21 Nov 2026 20:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795320368; x=1795925168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
        b=evJm+oLsq+4kzc84VKAr4CtJzo3IfsCj/gVq3bR6b4/RunCaPdIAKKDRdB60FHOri/
         kXkXUd0mdLQsZD09OcorgB7ZMX+ElbW8SGM/rhASv2H/S4TvQ/n74BdpSG623qt//u5z
         j/uJNP4KhMU6uyWbwCttDb9FMO4E1+Q/ZvKCu+sot3am8SunnqGZPV5NgSDEKslxjHgm
         wiUGdjewEbxDdTxs2y/9gUKe2RNXOeRrSAiMr5oJT+4Z0P/P8FvOXQOm2AGNtYLiI9N4
         lSlvhzjKnZRdrISEPM0wO7qK2abATsVypk4L5e8RDNAkPgWRh158PSz+CsDiimAzaEyy
         EXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795320368; x=1795925168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PuR6BxW1bsGd2uW0XkZ13RLiKGF+CwssnUyvB4C4G8=;
        b=IaJsK1Cbq03vC9tjA9/UJ5dfnJEG7GP6CLAeQvbq4uHUwBVtR11lTmLsv/Q4fY7ivZ
         2zd3qRoIb6m5aABQRjFXA19z4Pkr/dSH/o00wxLTAWNij9GQyyXBlGnGG/LgnJy8Gv4a
         DFqZOIJFIEoDyWRJIooMj78YZIS2rlZ/QknK8W3v6XHf6DxNR1gaIgzYWbPsvdQc0xYz
         saxV+Zycm+XP7Zj2xt6WoB20AKreWbSPlnncFfC94922aL25/xevPJiBJxw6XuQl0XHt
         p9iXy9Wcwof341TqvcCJu/RnKOBT2foApsDb6F3iSHgIg06MSYPFcHfq6oNnb0ygd4Pj
         w+Fg==
X-Forwarded-Encrypted: i=1; AL+hErFhNV+BQRY7VNNgBoaCbnCs27F4zpvKhh9zdPNEwLN3GsEzkxoCXOl+VDNkaiPpq/2xDhgXXhG0Lmn2@vger.kernel.org
X-Gm-Message-State: APuU4Z/+lagt38zKPI2iDO9mfuGAcwxDUgf0tE1robeJa3WymrX8YyZE
	UOvnNzMzURRQXc6Wumk2kWaXoMTUpwMvTXdkh6PTr2o4hG4PIqRaojG3
X-Gm-Gg: AZFdTZfFmmQ/hfvhS0IlvvHfnY4T+bWJD++z9FBGS8f06N0bQqaukDjU67b77mxzksX
	DOXbFV0rmF248fLjSuC79s/V+NhlW8Xo7kpwAy1+N5fssNKZL3m1dfef77nJLTIaC5LI0s0BUUX
	fCAeKjmbFjp10pxV3vS9cdgHm/7QpHawSyZ5s/4hHwgW+z5QTFigR7IxsW2IoftWlzyeVJZoirl
	s9bGu+F8d4ZOf0x9wLFdcwrA1o+gYb82rDwcMo8qv8O0EnGY+gQe9808MA4Cu6su8VVG7BwPMNC
	qsjtGgzjFK7m2QwzpsDFKA38cS/btmSvcXJqK+aohJvtsOrG30VDAl8pglAra6i0XUbNrCKxfZ/
	mCZyxNPerkqX4HnW/EhcG4iJcw7iPPcG9SupUPjOz6zY23Jv8XSLltXkkmn8tJwJshncjarEJAS
	J59IZjBiKTfv0s2i7vlBUiQVbSXtNtCMAHB1iA6D8qyv/a62YHgXQKISWwrre4khtlXGF9nEc5b
	gHKlC4TWfd/cFwo3cHqLVjPZUxe6oICbf8g+b+YFTjSQBztPqXNd9jd+UIMRJkBQZDOVehlkQxr
	+s84+buYaGyTK3gmAFdtY+i4TQNuTm8ZXw==
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr6039371a91.18.1795320367746;
        Sat, 21 Nov 2026 20:06:07 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm10947018a91.13.2026.11.21.20.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 20:06:07 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix genex.S build with LLVM before 21
Date: Sun, 22 Nov 2026 12:05:59 +0800
Message-Id: <20261122040559.1120594-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
References: <20261104030147.3117325-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2611040746160.6502@angie.orcam.me.uk>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late reply: your mail did not reach my mailbox, and I did
not check the list archive until now.

On Wed, 4 Nov 2026, Maciej W. Rozycki wrote:
>  Shouldn't this use:
>
> Cc: <stable@vger.kernel.org> # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer enqueue
> Cc: <stable@vger.kernel.org> # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace damage in r4k_wait from VS timer fix
> Cc: <stable@vger.kernel.org> # 6.6.x
>
> then to get this all picked up?

Yes, with one more prerequisite after 56651128e2fb: b713f27e32d8
("MIPS: Move r4k_wait() to .cpuidle.text section"). I will send v2
with it added to your tags.

56651128e2fb adds a .previous after END(r4k_wait), and the .section
that it pairs with only comes with b713f27e32d8. With only your three
tags, on 6.12.118 and 6.6.162, all the code after r4k_wait in genex.S,
handle_int and the other exception handlers included, is placed in
.init.text, and a malta kernel hangs under QEMU about when the init
memory is freed.

With the four tags, the cherry-picks and this patch apply cleanly on
both trees. For malta_defconfig, genex.o builds with GCC 8.1 and 16.2
and with LLVM 13.0.1, 17.0.1 and 21.1.8 (on 6.6.162 also 11.1.0), and
kernels built with GCC 16.2 and LLVM 17.0.1 boot under QEMU. On 6.1.y
and older, 56651128e2fb conflicts in idle.c, so 6.6.x is as far back
as the cherry-picks apply cleanly.

> Or is it unsupported annotation syntax
> where a prerequisite matches a Fixes: tag?

It has worked before: the prerequisite named by 4409df5866b7 is
its Fixes: target, and 6.1.76 and 6.6.15 took both.

Thanks,
Tzu-Ching
