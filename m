Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835883;
	b=pB7NXFq9rWji2ejZ7pkCl2TYSXRFQeHa46flhr8XkiogkL0bbgREE0hYfVG1Y/PvLmHY
	 ke6cwwuYvnSuggcABbI7g0h0BVbLXlI41f67oyVsJr/Xkp7FquNcPbXJplhfL6ZwJDNrg
	 +lzEXWGrTcQPmod521trtGkdLHP7xBguJBinN0puAn4H39i+ogm4mkz/j9COy17Gfi8Ce
	 j1FSXIwpjX7TzJVpzvc6I1RxJ/Nye5qb4uuW2PYD+pTrZ1bcp2YJgYrxNUBJhv1fRHj5M
	 clql6HhV53ZS5FbG4+AqSThm6RJ81vtX84HVkVG/BmgYEjJb2NHJUGjCFlhPo0AgC6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835883;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dm6QP+G8YaY/c3dC6XOZVyZ2/2/A8/3XTwxU4Pcnwos=;
	b=bs29jRf2+8ewNxq5l+0YqnuwYa4yOqNKA4I7tsRK1np1rO/6ActDLnZ775LcCpQefoaH
	 noZFY76gprBGdwn52CxCCrv4BVkU0oz6KYCMwez0irFR9fFpFGbD55mNKKV1SAE/P2edu
	 cDN9VlHOWZt4K+eGw9bZcDOjxcwrVBO8usN+F58CCj+HF8FEXZ+wKAjJMaZJhtA8ZfhiR
	 X8Tg042CS3tj2BFsLizhE5FggZSa7/vM8yNyGFowCbaiwLlRztwrDhOLaepQXjSFI84+v
	 1VGWrXHqYIJ+PFACCVDWOgJpMvB9tlNY7/tOut4P2LM2TQA2IMhkNJi0RvcfXe3+WXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRV9Kd1r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635F606A326;
	Wed,  4 Nov 2026 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRV9Kd1r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2E91F000C1;
	Wed,  4 Nov 2026 23:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793835882;
	bh=dm6QP+G8YaY/c3dC6XOZVyZ2/2/A8/3XTwxU4Pcnwos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GRV9Kd1rEsEfAQ2Kfe2peTMHKixUpD0Ori31y5YzsqVoT4P2WLRH8rnVhNC6Xyk29
	 v6YIsfMvm/ZB4AdasbzkGk8QeG1n7W3FFSBj0vTFTxDUI4Jn+C4xvtWVkA71egVeh8
	 kib0ml8hASIq675H42fflpQcJztCXuhT0MJkLTYefQwkvflVfmLiL6+2boJHVzz5u6
	 MEDv0up8aG8FnSD761ItpDhTkIUoqdbf6aoIeKigx3ebZ1K8jYGEQm7OKgVkL2EGiC
	 GvMjcMhD5x5QQpuWNl0O2h1olz7by54ZkT/UDQxQ0+Jyk/pwzbDp03XilCFqkvAPO6
	 iiKGUc92HI91Q==
Date: Wed, 4 Nov 2026 23:44:37 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
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
Message-ID: <20261104-unscented-armory-4dc756ab95cb@spud>
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="A3EGkJjMaBMSuLcm"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev>

--A3EGkJjMaBMSuLcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:21:52AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The USB 2.0 PHY of the Siflower SF19A2890 serves its DWC2 controller.
> It takes a reference clock and two resets, power-on and PHY, from the
> USB block's clock and reset manager.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../bindings/phy/siflower,sf19a2890-usb-phy.yaml   | 58 ++++++++++++++++=
++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb=
-phy.yaml b/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-ph=
y.yaml
> new file mode 100644
> index 000000000..77b8e35d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/siflower,sf19a2890-usb-phy.ya=
ml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/siflower,sf19a2890-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 USB 2.0 PHY
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +description:
> +  The USB 2.0 PHY of the Siflower SF19A2890, used by its DWC2 controller.
> +
> +properties:
> +  compatible:
> +    const: siflower,sf19a2890-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: PHY reference clock
> +
> +  resets:
> +    items:
> +      - description: power-on reset
> +      - description: PHY reset
> +
> +  reset-names:
> +    items:
> +      - const: por
> +      - const: phy
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb-phy@19e0c040 {
> +        compatible =3D "siflower,sf19a2890-usb-phy";
> +        reg =3D <0x19e0c040 0x60>;

That's a weird offset and size.
What lies in the regions around this device?

> +        clocks =3D <&usb_crm 2>;
> +        resets =3D <&usb_crm 1>, <&usb_crm 2>;
> +        reset-names =3D "por", "phy";
> +        #phy-cells =3D <0>;
> +    };
>=20
> --=20
> Git-155)
>=20
>=20

--A3EGkJjMaBMSuLcm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvDZQAKCRB4tDGHoIJi
0go4AP9IBByfY+ZrsMHhRJn/BNGZDtuBmhwUV9BLaN5/9qNPCAEAkk741BcvYirR
jopiYYHvRgcXyohEzT8v2FZsEeU13gc=
=X0p7
-----END PGP SIGNATURE-----

--A3EGkJjMaBMSuLcm--
