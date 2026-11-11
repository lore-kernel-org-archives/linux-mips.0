Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420717;
	b=l/y1VJHSt3Ixs+l6qMizMMWRHrux3xtqECKR+X1yLgI4uSoyV2lsgL8aazpzC3hhX/Tb
	 fkY4BiTCl4n9ZPCL3QRSy59vzkVCvTft5x6F7/N4u9kPcuCt6FHvSo4x9KwkY2pI0sslJ
	 XJTgwFBfbREZTZ92+ESTT/HAaZS4iTn8bLUA9b1neRDEUyREnqMFOKhwCgsYs+mqeqSpP
	 +CULTeDJboTjSG0OFjOBcv/g3Tikd29WrjfYQ37JDuRj6WAwgShRUwX3hm0V8OLowi0du
	 Eb509Kb8E2RBVZtXORa4JAp6ZHgWsiALvIvvUY20Oz2/f6ArlyDjIUcI7uh4r5yV6bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420717;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hRnqk+qxFNN0ULp3a7tXjueSPlfrcKy3u5HMrPgKo88=;
	b=rb/lYyDUkw5QvMwGsAB5o4njCj5EJpBbAMzUAiYizjJkAQos3WkbuihiKYYJgEMlFnDW
	 6K0aeEO28fPmGBWgzcUzXy2xev5ogrAmvrzONeAt/yx9E08HPG/EjMNjvS1zCjf2PPc2Y
	 oVwwu3Y1V0Re5sALtW50LZRFUkvOqxbcYJgemRFayF4nZ9CCadvGEE0N76vXQQ06kpu+8
	 PznffunwJz320LKkeAPLzUvq5puetF+vXew5nJ1CtLSLiC0Eo77+uMgbMtWJNxk3HIhcj
	 qGH8Od4nXBkZVwzW7zg51UIUi17sMBW7ub8LB4duC4ZbXC684hUYq04C9Imkha+ogtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAyTyqKZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADED606A326;
	Wed, 11 Nov 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAyTyqKZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C038B1F00A05;
	Wed, 11 Nov 2026 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420716;
	bh=hRnqk+qxFNN0ULp3a7tXjueSPlfrcKy3u5HMrPgKo88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KAyTyqKZPQ/5CKZVcDKtBecZO7fFFH9yjtae6P6sLfpSfO5wPZ0X6/cUB8qCT/mzY
	 GGmDGd5iRgFUv0DQaLVR3SY/p8idULQcZWDYg1Hs1pq5OEePqKeKK9C4ikevHLviTf
	 S/91RY0599vmr/0dQohDJ8UpRPtqmmc17UScOBp9vJEZG/u9gXCFFU6z8riA+nPcx7
	 kX8aGsOa0nwOKWS8KuFixOEOM10yt3/sBt34L9JOmgz5uGZylsnIIJyBjrl6556myF
	 tUszFB1CzEu56g8hw8EJVe/I0SDjmprT8jUCg1m5hZgODYQubgpGj2d6KWGdcIDBVZ
	 sk2MgF+VSfeFw==
Date: Wed, 11 Nov 2026 18:11:52 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mips: Add Siflower SF19A2890 based
 boards
Message-ID: <20261111-ice-umbrella-7e360b77dbf0@spud>
References: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
 <20261111-sf19a2890-mips-v2-1-36730fa4f5a6@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="pt5BJ+Fqj10qhYEt"
Content-Disposition: inline
In-Reply-To: <20261111-sf19a2890-mips-v2-1-36730fa4f5a6@telaak.dev>

--pt5BJ+Fqj10qhYEt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pt5BJ+Fqj10qhYEt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavSv6AAKCRB4tDGHoIJi
0shvAP0S3cxu2RIauglP1cX6X1fEVgmkW6friBP5UkHVJUZEHwEAo8D+vyKUt4vW
ATQ3FGJgN7uQmkEmiWZUBxAQ8Qg+hwU=
=lRi0
-----END PGP SIGNATURE-----

--pt5BJ+Fqj10qhYEt--
