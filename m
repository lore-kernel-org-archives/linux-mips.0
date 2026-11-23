Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406265;
	b=CO+SuQUwZ4P9U1iUjlh9NcC09oa7Rfdy80ZI030ZzTEuK5RqFMZdy7gYxoeLEUVHuIEs
	 Rp4OWcRQ5hyGeeWQeMojJ9PajyXrgzuGiaCWZRacIneaLFw8Z03E5K6M+SeJmNlIDr2ue
	 Gb6OmZCzFVpM9I2AJ/tv3VeSmJ6gzos+ZViEeTfETn0lvlhyVhnShPnSA0TTaQrR+7521
	 qEzxd13K5hP5iRY3TeENg0rsm84rmgbhsMrelXRJZFFrW4mkzFO1Z8XJvtiqox/5DY/R0
	 jNCxdduK3+gyhxnQMBCupxFcnHU8eWvSUTJ8iCqw7IEwd+j8An5oeBlObzgVOIlpnGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rdX3BSYdbVjaIyIWjU8rHw3DXYIedtrWZubrMfj2zsw=;
	b=eqd2jkWliQK+c20MHXzyAWT6Kb7KZSEHnfKP68+1PFy9pkNMn8/+vt5iTdHvTotwx3wZ
	 2qtyBnPWZM+UNz8ToZzn/raePD+L05nwGVgHXO0tTd0Re56PJ7ObIJVwBME3LXJ4CjzTj
	 FpQDUG7HDZdp+kU3MXHnfMpsFY1XK/yriOGzaHLYpBE8PdmV/12l4kwT1gmhDcKSz7Dwv
	 ePMUHtV8nyJw7v+IrVlavjgOJ716pdKtQOYpdRTmZo9KZot2oNEJchQI5tiO9Pa7nr6QT
	 czYyxakd6W8q9Ar6qjQLmxBcoFi3ZgS6i/XuzgJO6u6fJQ/CGaOvD7BHz02m/FAf8gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMIJZ1Qo;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1660606A31E
	for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 03:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1660606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LMIJZ1Qo
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1457889a91.2
        for <linux-mips@vger.kernel.org>; Sun, 22 Nov 2026 19:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795406264; x=1796011064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdX3BSYdbVjaIyIWjU8rHw3DXYIedtrWZubrMfj2zsw=;
        b=LMIJZ1Qom2C68AFpllTmaEmyK4bDNSuOfwCyFUEEFjGXg24xLrirKNdB0moooSg5pR
         Pm6EByrcFA6v2zMj2eRuT08YX8Nubt8m2zJ8MfKzo7WSDkbB4yIY/b1+WCvcDyi47Bff
         gsKcOxJehwThI1lZ05OPE4JoNqX4rSWhqyApu6SkGvX1/XPdQKymHq4/RY7tr0ZHRrJk
         00zVfdEyOSfEFecnq0iAAqLLFmH/jCmgltttFvHBkqhnPNLs88PphNfQoWxOGJIs3HCo
         RA5xp5ySH2USK2qo8hef5bdYj3+gQ/w20yqmIj7uqXH9QAQJ9MZKf5jEkuCG/Qy1bqlk
         y3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406264; x=1796011064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdX3BSYdbVjaIyIWjU8rHw3DXYIedtrWZubrMfj2zsw=;
        b=K1ItG4P5Uz3Fv57bo8OZmx7CYEg56LGPiwuR/UvpnSAyzq9Q5vklfI5/nhdl0CAd+Q
         UQiWheTuGlDzpAj/bsUlLtRHRg5fSrOLCC8Um8VVRdyjbs597UftkZqjSr4gkQmZzEaZ
         mVHK5ayBjrhStfTaBi6pTusxh4L54X6KiuQr6sTX8Rx+Hk3MgMvf1oH90ld9GRgyezCM
         qy68t3ijjNeKQ7BGl9Wj6R/R94f3I1yFGtdVmDs8daULupx5c2z60+OVJtPmvousbJrd
         0aFSATXKV2mfqXmBHRmeaqTJY8KsF+0QWUN6mXHuDGqGLrefXsu0Pbxa3kdwJjg2CKtl
         npog==
X-Forwarded-Encrypted: i=1; AL+hErEIJR9700xtXSlBWXMhOQBVi8Sd/fzGWSZN2TnTDywKMOnrieZZIDT8Uj5OAiOfAUWmaUxJu26gZ4hs@vger.kernel.org
X-Gm-Message-State: APuU4Z/c5XdV7ligvFWpV39w/NpKPGYTZ3LJwecXgdaGRB5+WOKURP4H
	DfW18lNotmJNsCxzfSzVnhAc7RgKLQr+0Bxuxny++SV6l2AbjHYO4nhy
X-Gm-Gg: AZFdTZfjO39m+T2TmqkjhIJsOeA+ACjiA4c3Dl0FyXE0SfEDufLYoNXhiK7qB/3IMw2
	x4jjk4EL2OhZIvUvFHirDX1dZQDwYvFaZguPyTqD+FAMQBz1g1jsvhFWghlorBz1Q73aZ1TLCqQ
	tP8yR1gEO/OIF98RAMLx7VjowAflx8HNh4OhYrXczvyyA66DBolhnTjrl85uF0PKRi7owoc5Ca0
	ougZQrTH/TkKtJ8cLop0CaAq+quanZ+/Ke9kDcIm78eIOqsqG1VK6LXNx1VSUSaUX4KuLanVwKO
	rDU4947zfcB4JOxW+TLcq3Q7EwyFUkt+aKxH3mdkPwh5UdQmACIzBQC5Al5fZoqmGYHTH8WHN/H
	iJDN/3C1dlcVQddqbIrM63H2nJQaaPSaW3amTrPU0gXEnKfgL1aGpiiU+zIxylln5remfT67oFL
	zEOyAhZtwj34ZFYHFvpkDngQTRh8s7FJQ2zdVx4Q2OdeDsiJhomcUSfBqIM4GIlr/m4Nz8coaxG
	R4yysSRiGnvtQ/5T3gZ5Uy5kO/8/zYkxb5f9T7CIh2rFXVT/KmyfIqWwcsfMcBTjHv2V+UBvZMZ
	gCcj8CCYkakAvaTIdv2LdXB6DQ7G+uyqVcWZDeT9sSuwMITfXuWxRfA=
X-Received: by 2002:a17:90b:4b85:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b41c7c2384mr9850850a91.8.1795406264056;
        Sun, 22 Nov 2026 19:57:44 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04a49cfffsm37453605ad.46.2026.11.22.19.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:57:43 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Mon, 23 Nov 2026 11:57:32 +0800
Message-Id: <20261123035732.728281-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk>
References: <20261030140430.1857741-1-shingekinocore@gmail.com> <alpine.DEB.2.21.2610301515350.42255@angie.orcam.me.uk>
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

On Fri, 30 Oct 2026, Maciej W. Rozycki wrote:
>  Umm, the wrong fix.  You want __isa_ge_or_flag() instead, plus obviously
> `cpu_has_64bits' is also needed (and __isa_ge_and_flag() can be discarded;
> I guess it was meant to take care of what `cpu_has_64bits' does and broke
> the whole idea by mistake).

Your form and v1 differ only on pre-r6 kernels. I built both on
mips-next (bfe97f12a0a6), and this is what cpu_has_mips64r6 folds to:

  kernel       mainline        v1              your form
  ---------    -------------   -------------   -------------
  64-bit r6    run-time test   1               1
  32-bit r6    run-time test   run-time test   run-time test
  pre-r6       0               0               run-time test

On r6 kernels the two give the same vmlinux, byte for byte
(64r6el_defconfig and 32r6el_defconfig, GCC 8.1 and 16.2, Clang 23).
On pre-r6 kernels your form compiles the r6 paths in behind the test,
for example the dmfc0 and dmtc0 of c0_ebase in decode_configs(), and
on 32-bit kernels every cpu_has_mips_r6 check also tests cpu_has_64bits
and MIPS_CPU_ISA_M64R6. In bloat-o-meter -t that is +264 bytes for
64r2el_defconfig and +3352 for 32r2el_defconfig with GCC 16.2, and
+168 and -2500 with Clang 23, which on 32r2el_defconfig no longer
inlines two prefetch helpers in mm/page.c.

> Your proposal precludes the use of R6 stuff
> with pre-R6 compilations -- not sure if that makes sense, but let's stay
> consistent with these macro definitions.

In mainline cpu_has_mips64r6 is already 0 on pre-r6 kernels, and I do
not think a pre-r6 kernel gets as far as cpu_probe() on an r6 CPU.
The comment above __isa_ge_and_ase() in cpu-features.h says that
"a kernel built for an older ISA cannot run on a MIPSr6 CPU", and
under QEMU -cpu I6400 (an r6 CPU) a 64-bit malta kernel built for r2
takes a Reserved Instruction exception at the first jr in head.S.

That leaves three ways, and I will send whichever you prefer as v2:

1. v1 with the unused __isa_ge_and_flag() removed, and in the same
   series a patch that defines cpu_has_mips32r6 as (MIPS_ISA_REV >= 6)
   to match, like cpu_has_mips_1 (MIPS_ISA_REV < 6) in that header.
   cpu_has_mips_r6 is then 0 on pre-r6 kernels and the code that it
   guards is dropped: in bloat-o-meter -t, -11524 bytes for
   64r2el_defconfig and -11156 for 32r2el_defconfig with GCC 16.2,
   -18704 and -14140 with Clang 23, with no new W=1 warnings in these
   vmlinux builds. r6 kernels stay byte-identical to v1.
2. v1 with __isa_ge_and_flag() removed: pre-r6 kernels do not change.
3. Your form, with the sizes above.

I would suggest 1.

Thanks,
Tzu-Ching
