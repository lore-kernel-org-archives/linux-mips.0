Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181680;
	b=IzIroY0LVhR590HtdpZDiv2Mwi3mWne9bBbNnfwy5GPrSITq/xYL/AO1tImScEsAp8AT
	 /N2HroYeeAfmWPWBoDAlobUZfwHGE8iZTMerO6gE+IIeIXh1WEsC6lP3miMQbGcK/i+lI
	 5giFxIhe3AnR3e4B6JjJkTgDIbBuGMh0ecBufvwzJLFeW+3wmlQBLH5Xa2trJpQI4jgJ1
	 5FQi3Iii1tpiWlHvmeRCKhZ8aAYphldxNm42Q/vlP+RXgygXigDEQUkTvyOL6dlX7TBqm
	 l2+w2SO+PX9r6mPK3BoMzJ71PVHAvNBBLMS42j0CBKllQWBWQnknRm4aGHfegCkUShQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181680;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=dwe1PeZdwkaZcpoPdtfySXtr65K7N8ufYa2n7QOg7B4=;
	b=dh4lU4kel0CnGUK0YZb7ZZCvjxRpWc5+w6QxH1qahCFtFy9Uw8CvQ/yBsprPZOwqLVqk
	 kdapk4olqPwFHuHib9eRiNX2mTSCCiFOXGNJIoSlecKILbLfJ30+Jk1VvL3kpS1i7yK9B
	 ZaD0wIkBd1RYacVEDDzNTo1iu0v971syZ2khyCP0d/OY/KuedaRQtz0kafO4SeW1SNdM6
	 G+PAtPoSRKoHBPuFF8AGXrb4phOom+DOlHHcG0BMNlwsaYB5Vx9FEzOdwIKQ+vz4mS+iU
	 PHSAi8Uda0D4As8/Q8rqvjt4Sg8pnm4BxHzj89IoxAUAQa7E5Pz3MCH33TbvX7hxuvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B0606A31A;
	Wed, 28 Oct 2026 10:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <b4572f2ab818da900ee417b8356f55d3ddfdbd1a.camel@crapouillou.net>
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
Date: Wed, 28 Oct 2026 11:01:10 +0100
In-Reply-To: <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
References: <20261025191640.13592-1-olivier@mgcrea.io>
	 <20261025191640.13592-3-olivier@mgcrea.io>
	 <20261027-hospitable-apricot-scallop-166448@quoll>
	 <270ef5220fdd5ec3e0b88ba5c4ce044992fca41a.camel@crapouillou.net>
	 <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
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

Le mardi 27 octobre 2026 =C3=A0 20:50 +0100, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 27/10/2026 20:04, Paul Cercueil wrote:
> > > > +
> > > > +=C2=A0 port:
> > > > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/properties/port
> > > > +=C2=A0=C2=A0=C2=A0 description: The output, to the panel or bridge=
.
> > >=20
> > > No port for IPU?
> >=20
> > No IPU on the X1600 - the display IP is completely different there
> > (hence the new binding).
>=20
> But even if it is different, don't you need to represent the datapath?
> Your LCD controller does not need IPU?

There is no IPU.

Cheers,
-Paul
