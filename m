Received: from mailapp01.imgtec.com ([195.59.15.196]:63806 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27011830AbbD1LDOQjJeN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 13:03:14 +0200
Message-ID: <553F68ED.8090307@imgtec.com>
Date: Tue, 28 Apr 2015 12:03:09 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 20/37] MIPS: JZ4740: support newer SoC interrupt controllers
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com> <1429881457-16016-21-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1429881457-16016-21-git-send-email-paul.burton@imgtec.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature";
        boundary="3cT9p1RPjpqlaH9VcwhViiJQswiP8THBa"
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150428110309.uYNE1N2TMsE_u1QmngEqhm5yhCnglPUjTyS97bQKISg@z>

--3cT9p1RPjpqlaH9VcwhViiJQswiP8THBa
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 24/04/15 14:17, Paul Burton wrote:
> Allow the interrupt controllers of the JZ4770, JZ4775 & JZ4780 SoCs to
> be probed via devicetree, supporting the 64 interrupts they provide.
>=20
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> ---
> Changes in v4:
>   - None.
>=20
> Changes in v3:
>   - Support JZ4775, and use a more generic "2chip" probe function name
>     for doing so whilst sharing code with the JZ4780.
>=20
> Changes in v2:
>   - None.
> ---
>  arch/mips/jz4740/irq.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
> index 65b27c8..5f4ec08 100644
> --- a/arch/mips/jz4740/irq.c
> +++ b/arch/mips/jz4740/irq.c
> @@ -161,3 +161,12 @@ static int __init intc_1chip_of_init(struct device=
_node *node,
>  	return ingenic_intc_of_init(node, 1);
>  }
>  IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", intc_1chip_of_init=
);
> +
> +static int __init intc_2chip_of_init(struct device_node *node,
> +	struct device_node *parent)
> +{
> +	return ingenic_intc_of_init(node, 2);
> +}
> +IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init=
);
> +IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init=
);

I'm inclined to think the binding documentation should list the
supported compatible strings explicitly. If nothing else it helps with
grepping.

Cheers
James

> +IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init=
);
>=20


--3cT9p1RPjpqlaH9VcwhViiJQswiP8THBa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVP2jtAAoJEGwLaZPeOHZ6gfQP/2TAPPF86JFy/sPyJbuX9FSs
RvfpUbMhPfOt1SOB+pgXwk4RTPdtG6Iz/d2GobfRFCmgtR1Gc6BkwEFbGUPslwfX
efRPGvhmGkNemZUWH6pNLOwdlLXGQqShhGpMDEDggTQbUK+Kd501erHriL1HGda1
ffs+Ai1fvF4LFxhFEOVuhjZbHmk/g5WGw8cWRn8YXCx41YbXQlSxznHNkFyCQXy7
qSRu6bWxyktdhyG7rJ13W5kdDoZbn5fPHnErSe+r0ALgTh16mJTeiExMHbd/kRbq
kt1j3dgzwt6Aa5WHNeJ4x+XaGwXArauNm1HZxhg8E7SRJoSr63CvoIfa6glL1Uhd
IYkk2ByPQTKcc7mt9Uu0VbA0f4koTjx95kDt+AWNKDAP16LPraY4T+SJmZZjl11X
BHYvEXbad+4x9F5zJ6/I2QIkgdLWxSJuToKORKFhvEJHGlsDsm2fVoSgDyIh1Rdf
19UzybA7UVf2u4buBfGLb6DIi9fFeEVlJeqwKeLT2GTjJ7FVBGLLY7GLyQNKIlmS
u3IQdQtSoaG7zYFMfn2z8Hb0on1S6r6TYCy6J4kuxaSB7qmjv9Muz9Z+UxHEPm0E
aC6RCMev4N8sVPs73/tIzHJ4yUJdM55R0PWmyzPhAsiNAXukUJuuoh0ipVgukxjB
fawHWCaPw11eA85mY051
=OKcw
-----END PGP SIGNATURE-----

--3cT9p1RPjpqlaH9VcwhViiJQswiP8THBa--
