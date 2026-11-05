Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906298;
	b=3tJXLhYQ+idr8KFOHX1iEQ4Lz/MmbK5yMjPxKhEhSM6HNbLb2yZ3VVpNL/hFxyTulRfK
	 s9rjylFAO+sWNnwxUGdgH7lFbOtbzhVOtoMr8nkLtG29fZGZ6FqcMHxdn8tIQN1uwi+/i
	 M3HXv24XFHHkZAByqeKHCM/BqzNWblSMMJsvoIciQJIhwGANrQD+hE2UW6BZS9vcl6ZEN
	 4CC6sczk2epngG2GPkHAdJAj4blnd/VuonzsLDDs89PbFV9IewKTuacGsnvR8ZDkmF6wu
	 Ak19nkNWmSNZjMQXBPnj4iErirxSBn52zpZmzn3LeeYRj9llbgkVgZBqWKEOmH2EtNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906298;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XD1Rm+iGqF06DKo2ufDJiE26layU8M+F3N4dQIPcMnQ=;
	b=Yu5mCVY4opQz3yJrL5BVrmXvBp7S4gUSujVg1KtjtmK1FxGt39fRloqR1M48LqEq55o6
	 f4eo1upm5Tvhc4wQn4p5LzHk28EEoQFXXbEpC6ozezFdCQFWwOEhscXJptNxrZFdjwmSe
	 9ZmHNQYyXb/uugEvrvXPNsqK4l8mcJYW+TKJRe9mW5ORFXmMQiDKeShjHLjwwqR20StBG
	 0OPuQ8eR3VAZwn2IfPpmCH+N+qZ45hHtvkNrF6gCahEnX7Qq0ROw6HruCdBO+uX2U9VKL
	 1xllFDX/7zghxd1zihtj8pKGVplZC2iAz/Q5tD8/niGBj471abeBO4NWTSXPhGjopig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lL5hLUwk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944B0606A31B;
	Thu,  5 Nov 2026 19:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lL5hLUwk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01A21F000C1;
	Thu,  5 Nov 2026 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906298;
	bh=XD1Rm+iGqF06DKo2ufDJiE26layU8M+F3N4dQIPcMnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lL5hLUwkxIEo+DdtEPhhyGUDjYZ/mqvi7E1mpsRNbQY6sAmzotey2EfNE84CYdqeA
	 n8MRfrJrjOAwcNBinA0i2s//nahSVK+0tD9WboGj6Hb66RtNJDJz7nRFfvRXV4TvN/
	 FMxdDfN4G0CN1M2wHB8VynPd8ULeTEwfi7zUwGWxNPYgawFCNbdphIx9V8kzSjZTns
	 AN2VsJ/5biQ8mfSA//Gx7Fu3kf9Mw+2T1whck9xyZdOOCoalUm0JHsfb7Kh/Lp7Opj
	 KIPjiep9zOAODo2OjWuF+3zgLbdg35OpG8IsXKkHsUAbz4MaOFREJLQAVntAzWa3f+
	 FoXQwxrLeNBow==
Date: Thu, 5 Nov 2026 19:18:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY
Message-ID: <20261105-shampoo-osmosis-6975c7cf734d@spud>
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev>
 <20261104-unscented-armory-4dc756ab95cb@spud>
 <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="fkTf2+Z1l1LqlU4y"
Content-Disposition: inline
In-Reply-To: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>

--fkTf2+Z1l1LqlU4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 07:39:32PM -0500, Joseph Telaak wrote:
> > > +        reg =3D <0x19e0c040 0x60>;
> >
> > That's a weird offset and size.
> > What lies in the regions around this device?
>=20
> It sits in the 1 KiB from 0x19e0c000 up to the next block at
> 0x19e0c400. At 0x0, 0x4 and 0xc are the reset, clock gate and bus output
> enable registers of the USB clock and reset manager, which the clk
> series describes as siflower,sf19a2890-usb-crm; 0x8 holds a value I
> have no documentation for. The OpenWrt port gives the PHY 0x40-0x9f,
> and its driver only uses 0x44, the PHY's sleep control. Read from
> U-Boot, registers between 0x40 and 0x8f hold non-zero values I have no
> documentation for either, and the rest reads as 0. The GMAC's
> configuration registers sit the same way, at 0x40 past its clock and
> reset manager at 0x19e04400.
>=20
> If you'd prefer one node for the whole region, providing the clocks,
> resets and the PHY, I'll restructure it that way for v2.

No, not asking for that. Just making sure this wasn't some sort of
syscon being hidden by the offsets and size.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable


--fkTf2+Z1l1LqlU4y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzWdQAKCRB4tDGHoIJi
0htFAQCpfD/ATW+Oh8iIXCWIFJJ9g6tE4XFONhEBugZlFfDZ8gD9GLc6+0RrUu63
KYjkd0LAmVIcn/ACklIrnrIlzsL5sQ4=
=PI9i
-----END PGP SIGNATURE-----

--fkTf2+Z1l1LqlU4y--
