Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127850;
	b=Ko6YgVW4e/N4WfGErwcDZhf27qthY10nB8PlO4Tux/qrINLbDPT35P32Xm+Md2G/BLuq
	 ws4/OSY3TX/Kr0Pv8Po6eEhjvaTsNys8sr0+GrlGhI25ZdbIXKW2mMNBSnwHYjFINRgK7
	 toQL9cn3FgyDF0yKzSYZMyTfyITtlMvxUBxTQ9BxA1xwY9xsaJrnD++8kJTiknFq3PvK5
	 z0Vi9pQA+serhLZIoG4tWS3bdnpJ32UMlTQLkc/qLnr2f+52uAtwIXxJRVbs/8zriXHV1
	 ooMl3itnTUDLS7lF3eWChDo6fKAiqRwwjupge6w6W3tNxm/8hd6wpPBLH4meGgLVTYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127850;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=Anwfvzr4UNpSt3R11bjkzI0PR2uto9vDnOqikj/TogM=;
	b=3oQUZ3e1CWibOf+ifVxp4A6bgJsfW2LgF30RrL7sYZ+Wk3iDvFswmSM5k8IZ670YN8bb
	 XlFzYh6Yp2XV1dekIjOGUYNgx0s6iqVQW7uZtdf8FgSNShw4EQb0ttDJw3/Tswwr+L7vK
	 01K5DdF/WaiceEJzI76+8I4fSoalmYKTeG+BMgOaD4qwUiaWbFUrKCs8GN0A1Uu8H40ov
	 6OMoPhWkZCUdXQ4zPa9HBhgWzjAdiMz0pS2FMr/zpq6OwwQt/T3G8jXGZ6dfwbm6w1G1n
	 0hEX21qPH6B0NC8nsRmgLsLJQXc22zObZobAH3TSJjKOPu7Q+W1ENAQQkXMea76kFKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C1A606A31A;
	Tue, 27 Oct 2026 19:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <270ef5220fdd5ec3e0b88ba5c4ce044992fca41a.camel@crapouillou.net>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD
 controller
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Olivier Louvignes
 <olivier@mgcrea.io>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter	 <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, "H . Nikolaus Schaller"
 <hns@goldelico.com>, 	dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 	linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 20:04:00 +0100
In-Reply-To: <20261027-hospitable-apricot-scallop-166448@quoll>
References: <20261025191640.13592-1-olivier@mgcrea.io>
	 <20261025191640.13592-3-olivier@mgcrea.io>
	 <20261027-hospitable-apricot-scallop-166448@quoll>
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

Hi Krzysztof,

Le mardi 27 octobre 2026 =C3=A0 12:00 +0100, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On Sun, Oct 25, 2026 at 08:16:37PM +0100, Olivier Louvignes wrote:
> > The X1600's display controller fetches frames through descriptors
> > and
> > keeps its interface and timings in register blocks of their own
> > (X1600
> > programming manual, chapter 10), so it shares nothing with the
> > controllers ingenic,lcd.yaml describes. Its registers are those of
> > the
> > X2000's display controller without the composer.
> >=20
> > Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> > ---
> > =C2=A0.../bindings/display/ingenic,x1600-lcd.yaml=C2=A0=C2=A0 | 70
> > +++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 5 ++
> > =C2=A02 files changed, 75 insertions(+)
> > =C2=A0create mode 100644
> > Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
> > b/Documentation/devicetree/bindings/display/ingenic,x1600-lcd.yaml
> > new file mode 100644
> > index 000000000000..171536c78f4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/ingenic,x1600-
> > lcd.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/ingenic,x1600-lcd.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ingenic X1600 LCD controller
> > +
> > +maintainers:
> > +=C2=A0 - Olivier Louvignes <olivier@mgcrea.io>
> > +
> > +description:
> > +=C2=A0 The display controller of the Ingenic X1600 SoC. It fetches
> > frames through
> > +=C2=A0 descriptors in memory and drives a parallel RGB panel or a smar=
t
> > panel;
> > +=C2=A0 its registers have nothing in common with the controllers
> > described in
> > +=C2=A0 ingenic,lcd.yaml.
> > +
> > +properties:
> > +=C2=A0 $nodename:
> > +=C2=A0=C2=A0=C2=A0 pattern: "^lcd-controller@[0-9a-f]+$"
>=20
> Individual device schemas do not need to enforce naming, you can drop
> nodename.
>=20
> > +
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: ingenic,x1600-lcd
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The pixel clock, whose g=
ate also gates the
> > controller
> > +
> > +=C2=A0 clock-names:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: lcd
>=20
> ... and drop clock-names, since it is the same as device name.
>=20
> > +
> > +=C2=A0 port:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/properties/port
> > +=C2=A0=C2=A0=C2=A0 description: The output, to the panel or bridge.
>=20
> No port for IPU?

No IPU on the X1600 - the display IP is completely different there
(hence the new binding).

Cheers,
-Paul
