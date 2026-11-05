Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837173;
	b=QbrySy6Zb23Q54hsvx7B0u3sosnBA7vEyKvQ8fXQQs7CNiC1hKJDtm4YXQrERY+3twR6
	 Zzjj6StTvn+Dl+0xvJlCaoCn9IvRZCg82TDRoHzTVFPuaOYxLp1yRp62vHosmOrbhxk3c
	 ys9d9SCYvKbbGklrpL5G5W0r/gC1A1hzhjvoUjnUQcpnC0IRWJ1+Rmd0TdJQEcu+UMpQy
	 6+U/b823L5UjREICtEqV1kD9/KxuqD1G1Xx+BdgtA8dUT6EWriyBqRTKXqMGlSk6zN+0i
	 o4V5dfdE7UM0b/B3GKnQOmvVgJC9+aGDbwnDI6jNKP6pOblfBbJWKFziPlu2CGvGplw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837173;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Sm1UYOlJDXjrnDJMbAYJXnk6qTnnerBF2ARlGYuVjkk=;
	b=TPZjZDDvHpQoNoWLqp9J7VZJO2qoRNIUbSeFtzRCZCATX86hAnBurznWmrIeQQl83HLR
	 b4CtIKnG3sOdWP95yS3mk2j7RZVbYeRoRZbYm/RT66/wziPLqFagwpxeBuKkl68ujjhT2
	 GRPanOvWGcDAuov8HPEcsjl9g5FiY+4yKpTcE+e+wAqJySc3m8ddMRQpfGbEJDPUhEBI4
	 JwA9CsTYz+UDN9MZ9/ZP5ktYTTCF51D111W1asmh+3ztzcPOEkR/3uSB9xiFaboRaGNI2
	 K01PsIQ8nwNCrHhf4sZn4dtnhDCxx4VRVdeD4xmhyH3LueTFyJR6ji/ia3BszUZJ2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOSivrJB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C439606A334;
	Thu,  5 Nov 2026 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOSivrJB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EA71F000C1;
	Thu,  5 Nov 2026 00:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793837171;
	bh=Sm1UYOlJDXjrnDJMbAYJXnk6qTnnerBF2ARlGYuVjkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HOSivrJBXlcD+LXoVaEuQaLRZ1FizgC2rH66MANdfazV1YEkr1IQuqPWJGZPGOIAj
	 8v77Nxbxyi1hMiT3DJYIjvEUQyw1TKPViKhMH/RZ+lBzkol5UBqAhGdOQxkgt45FUF
	 IQdRNE7kvZJ4J+i+3CqhW4J07B4p7PgcPkZj/4hVMNcxRiSCJ8MSo+SlSN5rDN7miM
	 5/+jnKCHxcd5GMe4pNR6NIw7Ef5ihGlCJuhCKJ/iUU2XP8BV7lfHgCiTzOsPy1tSgE
	 y9kT3oJAJYtroFLMqzzTEhvEz2p1REwANTbRQzylEF9WuCgX8hVPsrqYLA8CylxSsF
	 FL6Oy8DA2cJ+w==
Date: Thu, 5 Nov 2026 00:06:07 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: mips: Add Siflower SF19A2890 based
 boards
Message-ID: <20261105-stellar-viselike-e56010ed5fb6@spud>
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
 <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="vV6FrpfUh31uFgYk"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev>

--vV6FrpfUh31uFgYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:16:53AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The SF19A2890 is a MIPS interAptiv SoC from Siflower (two cores, two
> VPEs each) for home routers. Document its compatible and the first
> board using it, the GL.iNet GL-SFT1200 ("Opal") travel router.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../devicetree/bindings/mips/siflower.yaml         | 26 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  8 +++++++
>  2 files changed, 34 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/siflower.yaml b/Docum=
entation/devicetree/bindings/mips/siflower.yaml
> new file mode 100644
> index 000000000..33110f742
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/siflower.yaml
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/siflower.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower MIPS SoCs
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +
> +  compatible:
> +    oneOf:
> +      - description: Boards with the Siflower SF19A2890 SoC
> +        items:
> +          - enum:
> +              - glinet,gl-sft1200
> +          - const: siflower,sf19a2890
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315..2a7a083f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25698,6 +25698,14 @@ N:	sifive
>  K:	fu[57]40
>  K:	[^@]sifive
> =20
> +SIFLOWER SF19A2890 SOC SUPPORT
> +M:	Joseph Telaak <joseph@telaak.dev>
> +L:	linux-mips@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mips/siflower.yaml
> +F:	drivers/gpio/gpio-siflower.c

Based on this gpio thing being here:
pw-bot: changes-requested
The dt part of this is fine.

> +N:	sf19a2890
> +
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
>=20
> --=20
> Git-155)
>=20
>=20

--vV6FrpfUh31uFgYk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvIbwAKCRB4tDGHoIJi
0sHtAP96aCJIMSr8FW5MfP7soZ97j+TTomOKmetjJfMmXSi/3wEAsulPWBT5tOiw
cU/rix+fncnB97TJC2o9k1dJ+hspBAY=
=MNyj
-----END PGP SIGNATURE-----

--vV6FrpfUh31uFgYk--
