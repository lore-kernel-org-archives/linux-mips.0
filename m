Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059941;
	b=Nb61O79bzbvrzteQgKyt0oPzmbDsR/Xn3JXvmEdSut81ML7YwAEyBQuoo9L1SEx7D4fk
	 gqudV6c1foh71S+waiRQJYPa3vlnJ7h6Tl2WlsHHEa1Lpsy/lKmtrposDN74pLD4LToH9
	 6hIB1VYK2XO9E2nGxmS4yMfc35D14sgZxV/4yT9NnrphchPSEgl9dEMritjqNnvnN/AlU
	 4LYpDFpGW6X2Jl086GFq07jU9YiqTwLRnQTqG1srv+fGuc70y4gvWyNVIjMxg7tFcHj/r
	 0yT9apn/Omp+fZhG0xxnMxMdnyCY3Dc28DjDrENDT0RhQgyoV/cZgoD0xXDHb9ihLwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
	b=So2CxOCkfi6FIqUsF/IYIWuEX63jMMTflN28zR0+LEaODKKuDiiDBWkGY5bTrsPVku+/
	 Uhq8GakFLp5gq/YO1DyQI0MFyHHLAuzyHyPP0xhRZbwueo7ythLSBPu28lIvgqe6wBXPT
	 kwkKmkZzjWbJhNgAwl60kSP6qa5q8HR8K8Qo3YHm/AMSE33q047o9MBhrJLRdXpNlnzl8
	 xDUj4ngjTNemoj1CjitA5WrkUPOqENS2VCdwV+4EN/UAFZG0nahPyUz6HvGZwWe8BWdlH
	 Rb7z4QIPBILIYY3rWNFIzHPVI7NWucdghKuEykDRVyf5WhO2uSkyeXO/wHLJh/VEGgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEyUDNy7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2633B606A331
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 13:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2633B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEyUDNy7
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-677bc4704cbso1744551d50.0
        for <linux-mips@vger.kernel.org>; Sat, 07 Nov 2026 05:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059940; cv=none;
        d=google.com; s=arc-20260327;
        b=WHVZwqgJIv3/5J+w+EWnJU4uea8rnrCXItEo4gb+LW1T9+TNAsbVIVuf7nkrehyh3N
         1jQBp/oM5X2k3/zMaT/QTMkLozkmohPnmTwJBZEjEQv9N9bNtsHDYA+BhCrt89mHXs2u
         CDhNgALGDs9YaACD91BBP4H5gvMzt8dN3Xq8Auow48S8y9V3oSspe/0KAHtzgDJKSRx5
         0szBGH4Q6orjbEEFKVvjB0YjwIvhxBJ84JQq5Bgc++T6CGjbuWRZesPg0an9ndWu1asZ
         0YNQmh52wt+XPfk7bDGqcORfnFmf+XYpwh2uF9BswiUauVpfP19iueG0ptl6jOZT3tQL
         NxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        fh=0dIjlUXrmZki7psCvoBcFB5lvwMAEy8L8EWFA4HWG6s=;
        b=F5asnypVuLocPDcK4xm3uCh1Hsxy3lznlj/Gc0kaXECK0Oxz4IG9eQed7Bvnm2B0jV
         /zZh8+GHF0+UjpKtB+BKqNcxvFYl7rhYUGPcvvgPkPz/EiBaD/K5M9ShjIasCESjs468
         usqzX3ffciVU9c/1zx9mYcRgbbJq4abWaqv0a8/g6C3S8EYe6k0rhC8OhDoaeaBVXQj6
         YyGhVN3I/B2jyYkOFPqF0HMH71LYTunY/3Er7NqzH4NxmkqKB4NgkAM9SSQnQauGRiIY
         b3f+vnTr4CEYMTECRhrGOsnmQWhqm4TSwj6RblmqM5IWSfYhW/DS/PwE696+NSDT++c7
         BD6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059940; x=1794664740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        b=EEyUDNy7aTmKMbp07qiBDqoiEA0tfEvhxsvjvhJxPef/sSPkm6POk75XkrdCRdYrpM
         tojYcXpOv7axIcxgqaHJuvhLmYkffGeggO4Go0AcUoUYgM/xZ8a+v7/l4G9W6ZijU8mf
         Ew1yzpCgBieEoqnP2VqqaqvO64qkm3QLT/ltZNYatirrZW1+57A1t2gNo/WJZ7kmCO4K
         KuiZpBCZMcuSjsn8q3TVoA+eXXjfx0JYU/dLdAYQYAssdmDBxEFzuOBpSmoJt5jrChNY
         d+p28ksu6U1shxwFf4BaqGkkiPAIRuuEZCpq4hZE5hUsl9PvFK5lB4j/EzRCZMZYDt5e
         VFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059940; x=1794664740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVi/e87sJpab+voYaoq45WS0pEGrOtNiYKBZsW27Q+s=;
        b=BaU0TkzjOcAmtAfBm2JSfmPg0NbjwPzM0TjeqmpyuS6qxC6PVvS0ozvO4YHGM1pkhw
         zVl+n6+ACoYp72DlMhc+wArtjQK3EECnGYCPYKXlGQWmPlrGkkrl1f1DgVNdxsBPL8zh
         xdRyDOy2lA6df89c+uo+0Ln1orkZSM9KdVVpI50WJzbMhZTAcdQQ2cjezD20l5QMwvfy
         2aMoCXbMqPkidSLO8Y0y48phBA5i0M7SlD2DdOQFBhpYB8Fjjfu4xciea+MmRAEKS6Co
         DdRvrTQX1dsL1UW1GJaNO9DAObQukV+3CCiQ05u5MDnTI4ByLPFM0dWyAeshmY2EIapE
         SW1A==
X-Forwarded-Encrypted: i=1; AL+hErHagurYTfGvPiCp5eg/kUji8+pLaG/ppVs/1St1y4np3ekbyGSGipoT5etG5RTKzwKmmPWonJfPZQhg@vger.kernel.org
X-Gm-Message-State: APuU4Z+mt43Bw+M3gGIosmV15pRL4HRsayJ/Gx5wAIrxqKUPDtShG3f/
	GMnynRkCacBCAO8a93OumrrSYjHe9Ubd79YW+Sb8SBhaYmbByzv9qLfVezwtaxGQcs156d5vb10
	CGUskPbqXXZ5hbrl7HYQH5A26M2JdS1M=
X-Gm-Gg: AYBFou0rHkpf4iH7VI2OoLBYYT3Gzfxlag2WTxkHit9xzJorH5TP4Ob/G8YoGPW+ovn
	PgUJu5UTZGwvBG1sFupVqK8YNnU3Nr23j6F6yN8ncXvh2FXwKNXa8zv0sDnbvqOnobWxsyNw9rA
	G4soellcrOwsjEmVK5T/NtCBHof7SluMp/2sQ1GkVLArHQS5Y/RVTrs+pQB7OLUdEeNbK5IRTbr
	Z9i7n+qPRezl8UA6p2WbD+BgegSB62lbpzP+j9nyGPS5Q8wo3CazJHU/lo9uBsMvU4vXeObkqHL
	WEckIJPNEnTjNcrnIew9cS2ollfiKBEKFmmPABIGuLFUn2eHrlpKZqY0e4GXeb14rgtlHUmia0t
	+2gxi8GEUlsmRD02r/4feIrt8YZgU4RfVmXFQvTYMlP8BSBgryOeJ/6jCYWjEShUkKATuHHCh2N
	Szn7Ub2l8YE+cz3sSfaeiJ5CKzBAiXglEZXxx+lXr1KYJeA6HIebPiBtEsbA4LpN4XFiYg9U+M8
	o4/X+lzqECAgZgDKyqCDVUW9Ufw5+Wll539wCfDzE94Lxh3Fdd9+sXWUZZzqg==
X-Received: by 2002:a05:690e:14c6:b0:67c:2755:7133 with SMTP id
 956f58d0204a3-67c275584b0mr1164502d50.129.1794059940031; Sat, 07 Nov 2026
 05:59:00 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com> <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
In-Reply-To: <20261106-pinctrl-subsys-v1-1-f17582f32aaf@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 15:58:23 +0200
X-Gm-Features: AclHuK86k0sr_RRex5QWUFnx4k6XGaW6tT01IfPzghodPfwjLTwWTNGGOkqKBzk
Message-ID: <CAHp75VfW-DV_HcorM_XWWkBnc6YVrj0fBReFf=WgziVCOoEjzg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: ingenic: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:27=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Reduce boilerplate code in this driver and convert it over to use the
> macro subsys_platform_driver_probe().

Wasn't there already a set of patches from somebody for the same reason?

...

> +subsys_platform_driver_probe(ingenic_pinctrl_driver,
> +                            ingenic_pinctrl_probe);

Anyway, this should be a single line, it reads better that way.

--=20
With Best Regards,
Andy Shevchenko
