Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010806;
	b=K0I8MZOF4wwf8fKU6CXMuYBKedqPF+WO6kF1CgXtbSRJT1ki2IlMWNBIsxxm5CB9b0my
	 jwGZAfdkLmJN7JFx2x5U+GVkxxZvGQPq3SaXugWfrxYe8h37LKez8hNMZqr5GtThxsmA7
	 1TDtfnXAc4/IYgZHsw9Co04BOMjsuDKfl88LH75s1ITVPwFiocS+aXHFbQxHLqBNcyTVz
	 uUwt/WEizBswDL1WvIQEyiawdJ1ojrnT0vDSZhhJIKulkslJ2rqUWtno6zenfBawNCESU
	 ioZ6gtN/2enbZdMDk2SYn+XeBf/sWnNz/yWTTGy3JiTvcXJpme0lpl90Bd6gmcoA0yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
	b=38yebWfJyiex8eNlO1IUsA1su77E5hGJz09k2IoFSaQxkPvqlgfi4LM/O9icZzvMMlVq
	 vbDjOh4FLeO1FVskVr2uDEMBGamG53jpa6Nn1WJ6UZb0A3bQx5cerj1oPqHwzvh5+W7lo
	 DAdKhbdlTarYi01308/c0mR3IenJ2+KsZS7WLzQ3bbxJ6MNQO0NHM6Jo2bm6hUmMm3P2g
	 KuMZodwL5GF0i6h7/RYHIgUScEaFjHtGFKCb0Dv+v7uL3mx9YlXUyOMQBZUAWAluzLLdF
	 E7LgVi4FC2N6HAMiFPnqeLMx8XA9Ogmeq8sRuEISri+KXiO5vWbScZ3FKuCLVHUx2Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hvB4iIuS;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E5606A331
	for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930E5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hvB4iIuS
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so14096865e9.1
        for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795010804; x=1795615604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=hvB4iIuS8DtMM18Ur596rOV7xllkzUpzo4bnzWY5k0fD7sJ/BrV+0/KQ18Tb6pH2GQ
         Nn2XziESA7mgE+1ydj355M2ewaMPCB3cmzRLaf+4expSmHER9hyZhW0nCxUr2loegpzU
         v2vTQH5dENOkhb4kscIg+aakWJcGbF9MAAkh4SZJI6rGEXhJQVQlImPEQVZy9D/uWfuh
         lDrFchgZk3gMfEELQRtJ9+u3oShBMhztuAghg2t6cw5GK+Z0k/4AVTMUC4iL1yw8I5bG
         i/Xdt4P+65LHR2xp+JkHPJ1b0MAuBhDHUI3DZNZG14O9PuuXWHSk3/UrorTKJtCBmPfK
         xItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010804; x=1795615604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=n6CIQC0sZVOLYpjHY+dhF9mbArcHCTVILmZtU8EBSRk5FnU1i+WOc71We7mifWnP6H
         fYpWMsYGPq+WDm/aeYdmXOqVoibHmCft/31kPw7zTM5FvbWmAWpRdyuxK/+J0k7DyGQd
         QR/o32H8Q3wIVCEcDsE8Y7kX07YHhwq9lMffjvYrNMijtbsIPx4ztXse4eWQRJkJLcqQ
         tnqa4pltZz3BTt23xhj4zoPUEUBA22ctVF1chqhg0mmj2HzA2fP8xPDYcC/XLbRqww15
         bB2G0Qakzu2JcyWd96ExOfuBnCnRjJBXoYiUC6LQQfT8xjUnHAoTBlTj+jobzAK1Xv9M
         Q/1A==
X-Forwarded-Encrypted: i=1; AL+hErFwMG5ZY6JgUvjAZrjCJV+MlK+KJ2FqBgpoqZqyRa5QPVkcnUuLbIdPrZCq6ssvdZvZVIMUU/8mLurW@vger.kernel.org
X-Gm-Message-State: APuU4Z/PKjzK4XXKnL6uOdAlYYluDSDHm/izFF6pYUNgro8UFXUcoqvR
	DF6DGYf8MnO2TTE67AjKazvq5YN75wnRTwFmUToQ0uDLbXYEdYGn7FOE+74jcNnF2/g=
X-Gm-Gg: AYBFou31wSSwSWrIzd3fTxxiT85y/LVcQeLNGLJfllKf4wmAcxlAWs9JCL6C9tJF4qU
	250LH0CUsH7Hy/RA9HXqerf5xDE/w6mCkL5XbQKPeXJiu2BkdCQkh4RInVfTbtq4O5Ev52VWnU3
	YjgRgWA7detSPCHJnUTjXQLBxqYavWmzVju2JA/qK77Pr4TwnE/TIbAakvZD8NFiJgmK7pbCQKN
	4xjP5Wx4rGI3d/pm8iDBr5oEGhqhBryx8tzVhYWuSW64c8xI1ECEhkRJkohYTNlDoBJbg1mrQK1
	bCOX6KNLXDfTfRJEO9klDugSNPTHa3jmEjLbiE3NYn4w+UBc2Ywt5ivEGvya4hBVH8MCXfMVtse
	dRHSPQMrFTB6BpnmCHWM9lY6Pwn0FyJkvM3f7BO1EhQCt5IP1YbK8DV2RcYKOLGE0aJSK/adSnf
	VAuoGvg2mL/X7rvoscY8mK4SCM76a4e6bQvmMiQ4whfmprul74o6Id2pG/a8CegZcxZLOxbE6sP
	uj7ztXaYKkU2/qpF5q6PXy1QL92umySFTdKKxOKdyCG8NXs1GJ9MmzU8iPOWAEt7tf8oZaSAhEO
	triTd++tHQ88t7PmU7XaXhK8eZF9ysNkIGA=
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb7da03954mr52120315e9.9.1795010803953;
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d256f64sm61534715e9.1.2026.11.18.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Date: Wed, 18 Nov 2026 15:06:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <k@chaosmail.tech>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	imagination@lists.freedesktop.org, linux-mips@vger.kernel.org, lima@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
Message-ID: <av2rKJQ0AKU9CFZI@monoceros>
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
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
	protocol="application/pgp-signature"; boundary="5c6ped4sw6nigwko"
Content-Disposition: inline
In-Reply-To: <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>


--5c6ped4sw6nigwko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
MIME-Version: 1.0

Hello Jani,

On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
> > [...]
> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>=20
> How do you expect a patch of this size be merged?

Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
branch and offered to rebase to 7.4-rc1. When trying to apply this
series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
and 5x content); these are all not so hard to resolve (and even dropping
the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
for me.)

> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 84a7dc6ab5db..faceb3de4fa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> > -	{}
> > +	{ }
>=20
> Personally, I would *always* use {} instead of { }, and would rather not
> change.
>=20
> Across the tree, {} is slightly more common than { }. IMO changing them
> is pointless churn.

It depends on how you count. My statistic looks as follows (on top of
next-20261117):

	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devi=
ce_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uni=
q -c
	      2 	}
	      2 {
	      6 {  }
	   2598 { }
	   1262 {}

So over all *_device_id { } is more common by a factor of > 2. This
series fixes one {  } and reduces the number of {} by 37. For only
pci_device_id it's:

	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/=
pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | so=
rt | uniq -c
	    159 { }
	     32 {}

Without the context of an array initializer there are many empty
code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
{} in Rust code, which IMHO have to be considered off-topic for this
statistic.

Best regards
Uwe

--5c6ped4sw6nigwko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9sOcACgkQj4D7WH0S
/k4vggf+PQfM4MkbLgaQRCdXRWWsc4/Fa0tTMBQAl4gjx2p5NE/N7TDUO571o3+N
oWcelzY5O1uRcc2qHZVnu3vAxFqzk4YHfGjsbGHsxQAibxnIFW7ttYTzt0w5a9NH
v65V6+sebCdwLrPVE5ilcqzFFSgmnv1wTNm2vCEUxdKGacifySaGRmg4+ax+fLb1
CL+RS7fM2EkQxG1k4iDEPv1Onrm9S4DtwTts0wxkK780rWYD9FoSLjHyX/x21Y8x
SZKaXeNZlxtHJpQLq8ub8AL/t6k82nC020wYZOUbUmvPyqxhNoUuuS0/RVlz9xT6
kXiliIwWzcMtAKt4ik8nbTRO5JERhQ==
=0alU
-----END PGP SIGNATURE-----

--5c6ped4sw6nigwko--
