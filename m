Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321942;
	b=serFW335muLolqVSb8hSstt9Tuk7ZWF7UyQIaKSW2gVmOxCpLpGS467QYmytAx15Wdge
	 L2i4zg+HzOnFgfs5mLmtaQSwp3jRlH1l/r2GYQUHRyrq4U1aNFYOZ74YVE6pez6EpJLIN
	 jmXeCFYGSFMWubrFYm5lZurD1ONZEZpLVh7n1HfkM4HDsCYi+so/95uGPfdA456LPiKyz
	 MChLCjkiLV+cgHLI6Pxb9GzC33c/6aGusbWgU9XA47aTUKehfR3HLV4fGM2yw6yoBGD2t
	 MeAXbtaaF2olGtQR1ZILJyD48th+3fEOZTPIvPWK9bxtk60uGXp2FCVe1Ayr464feww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321942;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=doxpJ9X9Od4olxxityJ2tpEjQG3iRvZ5SGg2F1kpDzY=;
	b=O8pGhQQelsrzOWlUXXSSVHNif6B8O2hco6pmrzRxWoYoJZDiLlR+Y/G51rIngotYPaQ7
	 gRvukyA2UWYThV3vtreFQNeSB7MQJTM0uPTnStujVAI2PnTXDk4vgIlRILFOJ8BqSThgc
	 fgCp2x9q7rPN61pk3GllRmM2+sYzfrKhrs+OfOUNtltXtpfXoL5sA4KFiXFhabxatYo1R
	 QVQBvX0YyMLj5W16/p0iDKro34aKVyj5RcS9twnvIBECoIEULvIp8UVXiqlOXExB/ejzm
	 Ce6J9n12z5xP4dHvRxXK7zflrjlRpCl5qnfgNJgLb7b+c0Hz8D6x1s1Qc349h1BO7vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fop2ssKC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56760A2626;
	Tue, 10 Nov 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fop2ssKC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B555A1F008AB;
	Tue, 10 Nov 2026 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321942;
	bh=doxpJ9X9Od4olxxityJ2tpEjQG3iRvZ5SGg2F1kpDzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fop2ssKC+bIiNuuqD64vXH6c8X+RdCimoArYS7kPwE8oKnpfbImp6S4ZW/35lYoyZ
	 jW3grRSo6NBJIJ+aVzLnkW/LxC1TCWunkUd9LKcJsTuPwLze3V1mLNZVO5z3/pPEwn
	 DTm7TxRaAe6UhgBvMI5/u4cp7CzqRVUR3ZwNxzflyGvZmAAj0egjNjwjJwuWU/nZGB
	 4d3Z9zUbAwuAU6iaihQK2sdakYAkNitMcWtdBGd26kSVg0LTeG55YfwiXQPeVle5X7
	 u8XTnxuS0L02tOU28u8rafvzSftvx/Z96ZAYOgfRLOC878Vtjd0khhZ2mXfk4pS2Kz
	 x0EvK/kwy4Eeg==
Date: Tue, 10 Nov 2026 15:45:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, 
	"H. Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie <paul@boddie.org.uk>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
Message-ID: <avMt5CTevTANpXqO@houat>
References: <20261105203517.2293404-1-f.fainelli@gmail.com>
 <fb84cd36838875ccd2530b9e3983700fbd23eb3c.camel@crapouillou.net>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fhtqfplx2snhvonz"
Content-Disposition: inline
In-Reply-To: <fb84cd36838875ccd2530b9e3983700fbd23eb3c.camel@crapouillou.net>


--fhtqfplx2snhvonz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/ingenic: Allocate and register the internal bridge
 separately
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 08:46:40PM +0100, Paul Cercueil wrote:
> Hi,
>=20
> Le jeudi 05 novembre 2026 =E0 12:35 -0800, Florian Fainelli a =E9crit=A0:
> > The LCD controller's internal bridge is embedded in an object
> > allocated
> > with drmm_encoder_alloc(). This initializes the encoder but leaves
> > the
> > bridge's reference count at zero. Since drm_bridge_attach() takes a
> > reference, probing the CI20 display produces addition-on-zero and
> > underflow warnings and fails to attach the HDMI bridge chain.
> >=20
> > Allocate the internal bridge with devm_drm_bridge_alloc() and
> > register
> > it with devm_drm_bridge_add() before attaching it. Keep the encoder
> > in a
> > separate DRM-managed allocation: encoder cleanup can drop the final
> > bridge reference before it has finished accessing the encoder. Find
> > the internal bridge through the encoder's bridge chain during mode
> > setting, and use the bridge argument directly in bridge callbacks.
> >=20
> > Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in
> > drm_bridge_attach/detach()")
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>=20
> Looks like I lost my commit rights to drm-misc-next, I guess for
> inactivity.
>=20
> So I'll ack it (LGTM) and let someone else (Maxime?) commit it.

I just checked, your account still have access to drm-misc, and the last
activity was yesterday.

Did you lose access to that account?

Maxime

--fhtqfplx2snhvonz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCavMuEgAKCRAnX84Zoj2+
dhqLAX433eM/0vnV9ZYebgsBu+voRC0kLy2gWMHtwISuzpAxi5CnBRHfHQqDELk+
+P7Ve+cBgIZ+lntBImHBy7XuEsquOyBif3x5L2GJOGBe0IsnMWYFEpVt2ZHGnnlt
/EYPuJ25XQ==
=8xtQ
-----END PGP SIGNATURE-----

--fhtqfplx2snhvonz--
