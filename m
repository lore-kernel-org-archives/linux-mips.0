Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171766;
	b=CzpWfDXJTmNOplqixvr0OvLRC47TcOa+C4+RB8mXC6SJVDRLsO3PBaw+sQPWGmj+glXx
	 GlCKUD4hHtIYvSSusLW+wVb6bJ+V5w2SFMyLx6DJZxu6ssA21HZy39ykExi/2q5dKc6QK
	 zpUUkYZAHyRQr0Pr3Sm7o07DWo/P5LwGL5yB1Cb/cnE3VVVTwG2sOnxn+/0IWALfSYz09
	 H+PGwhM9xaUsRXXSkcUMWjEW539At7fLplgqip5JUnl6XQN7gJV/UCLYROCZzpAEDUyFp
	 Rphn6cX1clwf/ept1r1fCnBjtBtxl2Uufqtns0hVGeXIcprfN23w7AyVscfHE3S5qAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
	b=r8eFy68B/5aBpwlHzvFsd5bkZfPTnRkwkSAAFu0eo8uC33IsNFSS9sI3Qxna4aFPYMvj
	 GdmcOrZFaZodAzAJZw5f842uJ7M3saSA99qc+V2qeIVxaMrpVle/UeXGJOUa9jIurI5mF
	 iMddy99EVFgsPntTuLVYoXib+UuQ9rvJk/3aBHMx5R0odLIWPZae8QatJ/XgBtw6q9VeV
	 plJ34E3J4QThVC8lhYlWHASkMiZAoxnUGLOoVYisqf8s9QtkSeVjcUf1lSSQyaYpW3Cq+
	 bNNmOnDxO21IGrJ9w0QAvMZGc03Qe9URvTah1bFN+1e4ri3MKka6pe+FHJ/Iu12Ij9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bj1RDHAt;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DD606A31E
	for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 07:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bj1RDHAt
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so3969965e9.0
        for <linux-mips@vger.kernel.org>; Wed, 28 Oct 2026 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171764; x=1793776564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
        b=bj1RDHAtB7vjolh/24QUvBkjTKpiQ4fB+9unIykEiiFy4aRwpzNeawm3XLokJFOah2
         L7uL3NcV9qrvoRUqBUstYTl/vbX7YesKx4ZUfFicl7U0ZsfVEuiRMkTUPaMCfpZXAnxc
         /JjgXahGqqSkk9nnUASL9ilmPxeG/bwigyi1WtMUZTIUPREvuPQt1BM5hJSRONfAHWEf
         afYWiwnrkeiWB613fQ2NABYwf+OZPqsBHno58MpDGrmclIEV2sDw70ph5TLcdta7Hequ
         EyLnEWnEbaAVFzWmaI/hvzq6EOv2s3YJ3knhw/Y/8s2NJDbalyD+DZeCRZSLIiJqsPYN
         yC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171764; x=1793776564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
        b=InoryVHj/fF1VoCj0A9UfdvnJ7opEYAVR/YVG7yLf1uYOyJE2L/HOiVb7ISnQqj3Uy
         JVLZ5786DXJr1FvLj7gxZWKEceNAvN7VcwbCe/fAP9dl3+PlcPCS5AminQUUxRtzmw8N
         exnA/vCnO0t3Asgr8/IgFImixaqQ2bJO9Cm7bmO9Le3cJmtz16A1E/JgtX4qDhqaU3L9
         oVLRR1gcBYD3humPEpmS0YHPrSMFhjaHlJ0YWaSPodUgUkiIn7UWTJGmp4dDzmSpe1Uk
         ChkJVcO+MJjqr7pxXjcIi2HxOk/vH8okzFFSAJ6bgwp99Qyn+o+0w4SzKi5tqLhLgAeR
         hPxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwDLU2upH49L+o9zmlBGjAtPQ8CqxohZUBW8bRr6lIhPC14L9LngenHHN0c3UxdTRcue97JZYZELL2@vger.kernel.org
X-Gm-Message-State: AFq9FYKeaSd+28ziFY1f7MxT6hjQgOO3kIPLroK5HL2SGYVElATqe+OU
	5v5qRnB3vcSp5wl/kscNtEusTrj+9Pe62uCT6K8faFgAhjjonV1D2OQNh72SXqplyq0=
X-Gm-Gg: AYBFou3+OnTGlR2U1CR3ig1bl5DiJ7kHBbgpG/1k/5pT3JuPa9xM9n1Y5JapONQUJGP
	kny++NvntXw8Ok356mPLptqLfLXaDQe1sOJQXj5LTK+W6rniCiuCvqxI7Un1RWyjFQbuWjJSimE
	0qURSefkZNipm1EtiJPLYevJHhKYLlX3e5t8ZjxyOCtko39h2LBVdAR9trhWniQaXzPr4iB+VOn
	BbqfeGSpIuTZWbA/O68g0u/fkQxkYaPITzXdFo7pJFWh+Z21J2V9HF8H2ow+mbJzuzZThY/12ya
	zO8U7sg+vS33aCyartqqk/kZXjVnD0cSCwsNYPfWvM8mB40+WwnpGnuwh6SxhjbRqsNu2stdIJq
	1ofx/kAKgkH2J18ARS4Zt6pOpvd/nUUUzIrJb1ELuz0z1Kmzsrfpa/TM+Q8r5dQpl/cbOXJaPkG
	u+Q5ykJAldRM5udHUO1KEvGxO0KUmJjD3zYsaPRlSdagjmFKy9/JHb4ljpPOz6f9aVCyBG0yMGn
	D42bQs8suDsz3f0uL3fbUXnZv3zTsWPTF44fLlIpi/K/jsoG/ifVyUFkyyUeTSTmc6hYNBQMUZh
	nr7KRlM26HCryyuFmr3IhDOVydVKsCtEn1I6FRxrx3HSNAlsG9Djd2Lm55Ghmlyh+5oXs3IG5YZ
	ks87gFvLVEK7nu70=
X-Received: by 2002:a05:600c:6098:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a9640f2328mr26189545e9.1.1793171763595;
        Wed, 28 Oct 2026 00:16:03 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a930a63eb3sm26054795e9.1.2026.10.28.00.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:16:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:16:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <auGg1AwlHMTKYAL8@monoceros>
References: <20261023204209.48556-1-olivier@mgcrea.io>
 <20261023204209.48556-2-olivier@mgcrea.io>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7kzx4bd5q3rwseko"
Content-Disposition: inline
In-Reply-To: <20261023204209.48556-2-olivier@mgcrea.io>


--7kzx4bd5q3rwseko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
MIME-Version: 1.0

Hello,

On Fri, Oct 23, 2026 at 10:42:09PM +0200, Olivier Louvignes wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id without all the
added build dependencies of <linux/mod_devicetable.h>. If you insist on
full iwyu, use <linux/device-id/of.h> instead.

Best regards
Uwe

--7kzx4bd5q3rwseko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoS4ACgkQj4D7WH0S
/k4yYggApnKsIa+rCf3BFQJjly7WiAmxlAQR57PJQJaEPivBmt7SsrrspxVOOAum
ZSo8hfftL2LyDHfMgYIzt3la64M0m9Ka5MNheXRDG3NuIFW78hiJY1uyy1Sy+fcU
oPNpBjjLJWxzwjcGLUxIbM4kPqmIdsBamY7GrwDSB3BeNHFmOL2l6oLaF7QF22sC
3rDO8bwez9gW80BWN7CJCjpw4ynQK6LaxRX+7fBFbX4fRvqIL3Onp3Nufmp4TVo5
iXpJYlTPv3vt8tTP6rhxFh3R+9bmnzR2nc8MUCJJmAb7qRiaZSoQ3kz09LzpeVWt
eAau0gujuBeEzy26ASfKDcl86MpIng==
=0pQ9
-----END PGP SIGNATURE-----

--7kzx4bd5q3rwseko--
