Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E53750B2;
	Sat, 16 May 2026 23:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973130; cv=none; b=hMvYgXU3xNpJzqI1OzV4PoPuKnnDbkQh3bSbWFYZJ6J5TsTTSPpGZnbRBmk82z+VyejKvhvMbUnsnPB4SHM3KfEO5CMb0MsJv9cqcRPheqHZrwGFUdJKcI/vTo/Rlw+6P5rV7T7KIOcIcsrkZTJxqJqyYlITRPAKZ0sxDiGdkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973130; c=relaxed/simple;
	bh=LeUa/ZHAxHXoBiN1flUfAXHTIF8MVVncZaDQMDkVAjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MecPQX+a8v36NX70H2JKFmUeyLMMsZtX1URko2LQNlDlSgv0vKbTGH149Ng7XWHO6fzSFp+cdFqrFC9g4niBic8C+1cf1i8Erh+oelB5S6P41rNx9C9/fKZSte1OEKBVkrbuJ4BT87z9fSKxF93+ILsqlJKerxKWruvWzTsQBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEFngEkD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEFngEkD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5408EC19425;
	Sat, 16 May 2026 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778973129;
	bh=LeUa/ZHAxHXoBiN1flUfAXHTIF8MVVncZaDQMDkVAjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEFngEkDMStnzVxUs2+OhpDt+1571NDoqVKMfFawIv6pib6mlBiL0UQKsDXkUw6RW
	 qt15C8YNWLs49ammQZ1Pr+e9vZPebeBVn5sy5R6KpPB+XlUVGYmcDE+G+Grigu8NRQ
	 Qv6qGhLVdse0JW3kNFvrYjNwBuzs2Tfce1Iy7Pq+AM1NS/l+UGOtHLlsHkRnMJ+66d
	 AkkpQjeYs/pQ+D3IoAGe94NF8yxDhgQ5nB4Y8MYlD+SqAkoq1m5fy7e3qboKBfpM14
	 INh69kx9yiY86YzkOrjLX48SRJ4CoZ2IRUliSxB0tg6StlolYLczin5lLkI5lWTKYa
	 qCZbN1cN8p/Pg==
Date: Sun, 17 May 2026 00:12:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, conor+dt@kernel.org,
	daniel.lezcano@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	naseefkm@gmail.com, robh@kernel.org, tglx@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
Message-ID: <20260517-cathouse-spiral-6a56c30ec223@spud>
References: <20260516215720.4160831-1-cjd@cjdns.fr>
 <20260516215720.4160831-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B5La+Mptp6gvMym4"
Content-Disposition: inline
In-Reply-To: <20260516215720.4160831-2-cjd@cjdns.fr>


--B5La+Mptp6gvMym4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 09:57:17PM +0000, Caleb James DeLisle wrote:
> This hardware is found in the EN751221 SoC family as well as the
> EN751627. The former uses a percpu IRQ for all timers while the
> latter uses an individual IRQ number per timer.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/econet,en751221-timer.yaml | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-time=
r.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> index c1e7c2b6afde..16f32741473f 100644
> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
> @@ -12,8 +12,9 @@ maintainers:
>  description:
>    The EcoNet High Precision Timer (HPT) is a timer peripheral found in v=
arious
>    EcoNet SoCs, including the EN751221 and EN751627 families. It provides=
 per-VPE
> -  count/compare registers and a per-CPU control register, with a single =
interrupt
> -  line using a percpu-devid interrupt mechanism.
> +  count/compare registers and a per-CPU control register. On EN751221 it=
 uses a
> +  single interrupt line using a percpu-devid interrupt mechanism, and on
> +  EN751627 it uses an interrupt per VPE.
> =20
>  properties:
>    compatible:
> @@ -28,8 +29,8 @@ properties:
>      maxItems: 2
> =20
>    interrupts:
> -    maxItems: 1
> -    description: A percpu-devid timer interrupt shared across CPUs.
> +    minItems: 1
> +    maxItems: 4
> =20
>    clocks:
>      maxItems: 1
> @@ -52,21 +53,31 @@ allOf:
>            items:
>              - description: VPE timers 0 and 1
>              - description: VPE timers 2 and 3
> +        interrupts:
> +          description: An interrupt for each timer (one per VPE)
> +          minItems: 4
>      else:
>        properties:
>          reg:
>            items:
>              - description: VPE timers 0 and 1
> +        interrupts:
> +          description: A percpu-devid timer interrupt shared across time=
rs
> +          maxItems: 1
> =20
>  additionalProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>      timer@1fbf0400 {
> -        compatible =3D "econet,en751627-timer", "econet,en751221-timer";
> +        compatible =3D "econet,en751627-timer";

This is not going to pass dt_binding_check.
Please remove my ack until this is fixed.

>          reg =3D <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>          interrupt-parent =3D <&intc>;
> -        interrupts =3D <30>;
> +        interrupts =3D <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&hpt_clock>;
>      };
>    - |
> --=20
> 2.39.5
>=20

--B5La+Mptp6gvMym4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagj5xAAKCRB4tDGHoIJi
0nHOAPwIJSD2j/JuVJMI0DZeaPv7ZyXJZZnON1vxeZ+Tx1cmUgEA3mCyqTo4QNsL
9lUnnEgrv9jQKrWfb+CcYtMPvj00pwU=
=p6ab
-----END PGP SIGNATURE-----

--B5La+Mptp6gvMym4--
