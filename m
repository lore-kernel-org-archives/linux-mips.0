Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540079;
	b=dAOyIf/Yy6LhZ8EjoouZKEAOlwJPpI7veIWukR/dBe4tkLtQK/qhLhEjlFIaa939x+xD
	 PC2kWC/3IS8noD+eYmoniKfa0JOATaoqZboKp5QXxUG/lFyzdBO5gsRn3yJdRPzzF0r4Y
	 T4fxACf5IcQvYqWcUJ6qPjhGnxHfliPOA3EPL2437Q/G9pW3xMEGzZS8Zb0BsZjzEKGC0
	 4u6Zh/e/4N7YqFfrgYDDohbpCreCC6B/31X5yXcyIi9X9+i9nppi4ERbL/fokMuKQxj2v
	 4YV/MtKikVjjlO2IslZ8C72EY7s1vugAp0L6WCLH5mADnvXihpbUfMH+n40p6WdyKaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540079;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=YuIrq2dA/h1Re098M2B97wM63OaK+lYvl9rfL1gmPt4=;
	b=cMpcg0WEWZ65uQ+YwP4SU8u1LQAZ3jNHECYbvXtxGMJfKV1ytHnU6pyVN7ISzCaZ4RSV
	 ZKoSGR6qL6OLtgVFxjHfq3wtjImyFYyH99dB0l55witXcd6UAgqS8pWkpiqhKBGPgRlkf
	 C9UizjvJu9Rhr6JacC/h1r8wSjc40O6UXvMi6/u3JD5ObSxyEoXY7yWGEyaToztpFTLSt
	 6fBHSaiDaasz64rZQnn8Kpy/mXCWiZb9UejkYnBADkiGIqzu0FiVW6TLZS/927Ke519rL
	 9j8FDpMgnWsTWp9xuw11mcBr2VIym3rWVo20Hi5wi6Y1OZNQeUK10cYZD1T+D6pwl4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx80eIXN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1592606A31E;
	Tue, 24 Nov 2026 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx80eIXN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B061F000CA;
	Tue, 24 Nov 2026 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540079;
	bh=YuIrq2dA/h1Re098M2B97wM63OaK+lYvl9rfL1gmPt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fx80eIXNIkmzTrunY/15lbwja2FHWZpZPkgC5LBbIkUFlF/QfgQRlbnP4MJlb57m2
	 ceOu8yfCF820LUqrKG7rwZ+T6or2kaqatl4Ceqw9048YllP2k4lwtN0QhgEtNoZrJ2
	 ROYSDAqVsoU2ptvKUrixlDYNGy3ekWHilUKjIGTV2uTcsbJTLiQCLvaYTK1ONc3/KQ
	 XthGG96xjne3XqZKTxH6hQwpBef3amGNn2KZzcZMf15meZO/0MKM6Nr4PKus4v8J2v
	 cyMeZoH6TlSRFs7JEXfTdLhmS4ELbmUzbcZ7zBgxbsfDV1dPEUxuoNKK4QVxkk6Gug
	 KIEl0APBVMKCw==
Date: Tue, 24 Nov 2026 17:07:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: jz4740-i2s: Add support for the X1600
Message-ID: <67b465f9-a848-4ce9-b151-40216ab729e5@sirena.org.uk>
References: <20261024214438.33342-1-olivier@mgcrea.io>
 <179495557744.2707353.8222109296948133350.b4-review@b4>
 <20261122120251.2083-1-olivier@mgcrea.io>
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
	protocol="application/pgp-signature"; boundary="Ake2uQqVv5+1uf/x"
Content-Disposition: inline
In-Reply-To: <20261122120251.2083-1-olivier@mgcrea.io>
X-Cookie: Real Users never use the Help key.


--Ake2uQqVv5+1uf/x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 22, 2026 at 01:02:51PM +0100, Olivier Louvignes wrote:
> On Tue, Nov 17, 2026 at 10:46:17PM +0000, Mark Brown wrote:

> > > +	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),

> > In the v2 thread Nikolaus said that there are separate TX and RX
> > dividers, is that the case?

> Yes, I2SDIV has TDIV in bits 8:0 and RDIV in bits 24:16 (X1600
> programming manual, 9.7.2.6). RDIV is only used in independent clock
> mode though (AICFR.DMODE set, the "6line-mode" with its own RX_BCLK and
> RX_LRCLK).

> The driver writes AICFR in probe without that bit, so the AIC stays in
> share clock mode, where capture runs from the transmit clocks and so
> from TDIV. That is why both fields point at 8:0, as in the X1000 entry.

> I could not test capture, the R1 has no capture path.

> Would you like a comment in x1600_i2s_soc_info saying so, or is it fine
> as is?

Please add a comment.

--Ake2uQqVv5+1uf/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFxGkACgkQJNaLcl1U
h9CkTQf+IsQ8pG7LCX+8SD3EK8zdJL4KFLjttrGF6B3p/R1mux9NddBHXgn9Pzcf
2HHXv3ZSp+nEqwvCdxiLXGI0f82IUVaq0d8te44bLDfXyJcnwSGjz9/BIcX89RWX
PS/PnRJ8lOd2oWI140irWy0KquVbkr3xBx0tH1aMXwRImGbv9ush2NfqHqHY4eMC
9D+YUjx+TpMr9aLRe6XWrm5b0c96vQUM4ehUTSfuCJZZvElydNBOEB3AFnrHFwZZ
9a0t0fkji6C840khsO6BR81fXgKvXrL1+3QJ84UVF8mrPq2WSNPhKCpvlUrfy5sq
XE8mtP3UQvTS9l9ZYjSqFSn6XpkhxA==
=tFvJ
-----END PGP SIGNATURE-----

--Ake2uQqVv5+1uf/x--
