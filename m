Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792966853;
	b=Xgn1u/hIdbG+pDYKDqpAxxrxjSoe1jfKLNN0lFqTYoGrouDi5Mx2K37ayUyVNiwFR5a1
	 ccyznz/AllTSG+xwnWWH3rM3oFyHXZ5RuIJqj5zvqCHRSTg2i46MRRGJ33SESFY81JoOf
	 GpMgGxsE+1Kwsl4hF0F5TMmox7qCvtp4kwZkHDojwdSbY3fDxWirkM2odECwhqYnHEekQ
	 OOdCfSZ7s2ufPVUzd5gH8TIaSZ662BClv1t2YrYm7UdfcojvNvc9j4AbUZclCgq087I5Z
	 PoiVsxH1SfX2ieav+jdeb9OmcaR3Ur03AtfNKD9EXhNw6h4IPP+AkLWq4rd2+BhrXjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792966853;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=CldNzcrAzu3VWmHM+sbxb+ODtt2pdTx5Vl4nZT4d0qg=;
	b=0H0NEZG/9vHbCd221IoqClkq/vFOv6q8vHzrF2+zPTDl2b2k+0az12mzu8W3WrT9Ueud
	 5JTcxFkg8u3v4XY6uPvdt65ieMXMrBB+gXnQ5ZhGriYb+DnuIgsOmruwDrU25cO/WYPLT
	 qXc/xKBTuLfgNp5kxy9MUcGiG3biUm+g2ST+7vaqEpnht+9uZRwNiCb1VvyiWS96ePWs8
	 /m9zuUzGe9PRgK9x0jL9VjXkSzmjL0gNpJT8KVCPCUOg/ywXe1kt+94aw3t/229T575MP
	 z5ypZ5Cj0TcVVElywRIUVyIQBHYc5pLHxK/fcNtihufLJJO/g9md73ypC4aFxmIRVaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E3C606A31A;
	Sun, 25 Oct 2026 22:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <e2aa2eb589c1e1c651dd9aeb09acd378109a0515.camel@crapouillou.net>
Subject: Re: [PATCH] MIPS: cpu-probe: Recognise the XBurst core of the
 Ingenic X1600
From: Paul Cercueil <paul@crapouillou.net>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "H. Nikolaus Schaller"
	 <hns@goldelico.com>
Cc: Olivier Louvignes <olivier@mgcrea.io>, Thomas Bogendoerfer
	 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Discussions about the Letux Kernel
	 <letux-kernel@openphoenux.org>, Paul Boddie <paul@boddie.org.uk>, Andreas
 Kemnade <akemnade@kernel.org>
Date: Sun, 25 Oct 2026 23:20:46 +0100
In-Reply-To: <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
References: <20261023204205.48222-1-olivier@mgcrea.io>
	 <F93B4D14-97DB-4F8E-988E-3C6803F5C850@goldelico.com>
	 <alpine.DEB.2.21.2610250558190.42255@angie.orcam.me.uk>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Maciej,

Le dimanche 25 octobre 2026 =C3=A0 06:00 +0000, Maciej W. Rozycki a =C3=A9c=
rit=C2=A0:
> On Sat, 24 Oct 2026, H. Nikolaus Schaller wrote:
>=20
> > > diff --git a/arch/mips/include/asm/cpu.h
> > > b/arch/mips/include/asm/cpu.h
> > > index 0fd9f9bbd21f..ff7b63587daa 100644
> > > --- a/arch/mips/include/asm/cpu.h
> > > +++ b/arch/mips/include/asm/cpu.h
> > > @@ -186,6 +186,7 @@
> > > =C2=A0* These are the PRID's for when 23:16 =3D=3D PRID_COMP_INGENIC_=
*
> > > =C2=A0*/
> > >=20
> > > +#define PRID_IMP_XBURST_X1600 0x0000 /* XBurst=C2=AE1 in the X1600
> > > (PRId 0x00d00000) */
> >=20
> > Well, XBURST is an MIPS CPU architecture and not a SoC. So there
> > should be no X1600 in
> > this macro name, especially if this ends up in a non-SoC-specific
> > arch/mips/include.
>=20
> =C2=A0Is there a documentation reference available for this value of PrID=
?

It's explicitly listed in the X1600's programming manual, yes.

Cheers,
-Paul
