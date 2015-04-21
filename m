Received: from mailapp01.imgtec.com ([195.59.15.196]:55056 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27007121AbbDUVJpWemMp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2015 23:09:45 +0200
Date: Tue, 21 Apr 2015 22:09:40 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH v3 15/37] MIPS: JZ4740: remove jz_intc_base global
Message-ID: <20150421210843.GA10157@jhogan-linux.le.imgtec.org>
References: <1429627624-30525-1-git-send-email-paul.burton@imgtec.com>
 <1429627624-30525-16-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <1429627624-30525-16-git-send-email-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Message-ID: <20150421210940.RVMCH8b0kUuHtPLcBavAe9DK-UCfklo6UCDYd_GJAaU@z>

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Apr 21, 2015 at 03:46:42PM +0100, Paul Burton wrote:
> Avoid the need for the global variable jz_intc_base by introducing a
> struct ingenic_intc_data and passing it around as the IRQ handler data.
>=20
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> ---
> Changes in v3:
>   - New patch.
> ---
>  arch/mips/jz4740/irq.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/mips/jz4740/irq.c b/arch/mips/jz4740/irq.c
> index 615eaa8..498ff28 100644
> --- a/arch/mips/jz4740/irq.c
> +++ b/arch/mips/jz4740/irq.c
> @@ -32,7 +32,9 @@
> =20
>  #include "../../drivers/irqchip/irqchip.h"
> =20
> -static void __iomem *jz_intc_base;
> +struct ingenic_intc_data {
> +	void __iomem *base;
> +};
> =20
>  #define JZ_REG_INTC_STATUS	0x00
>  #define JZ_REG_INTC_MASK	0x04
> @@ -42,9 +44,10 @@ static void __iomem *jz_intc_base;
> =20
>  static irqreturn_t jz4740_cascade(int irq, void *data)
>  {
> +	struct ingenic_intc_data *intc =3D irq_get_handler_data(irq);
>  	uint32_t irq_reg;
> =20
> -	irq_reg =3D readl(jz_intc_base + JZ_REG_INTC_PENDING);
> +	irq_reg =3D readl(intc->base + JZ_REG_INTC_PENDING);
> =20
>  	if (irq_reg)
>  		generic_handle_irq(__fls(irq_reg) + JZ4740_IRQ_BASE);
> @@ -80,21 +83,30 @@ static struct irqaction jz4740_cascade_action =3D {
>  static int __init jz4740_intc_of_init(struct device_node *node,
>  	struct device_node *parent)
>  {
> +	struct ingenic_intc_data *intc;
>  	struct irq_chip_generic *gc;
>  	struct irq_chip_type *ct;
>  	struct irq_domain *domain;
> -	int parent_irq;
> +	int parent_irq, err =3D 0;
> +
> +	intc =3D kzalloc(sizeof(*intc), GFP_KERNEL);
> +	if (!intc) {
> +		err =3D -ENOMEM;
> +		goto out;
> +	}
> =20
>  	parent_irq =3D irq_of_parse_and_map(node, 0);
> -	if (!parent_irq)
> -		return -EINVAL;
> +	if (!parent_irq) {
> +		err =3D -EINVAL;
> +		goto out;
> +	}
> =20
> -	jz_intc_base =3D ioremap(JZ4740_INTC_BASE_ADDR, 0x14);
> +	intc->base =3D ioremap(JZ4740_INTC_BASE_ADDR, 0x14);
> =20
>  	/* Mask all irqs */
> -	writel(0xffffffff, jz_intc_base + JZ_REG_INTC_SET_MASK);
> +	writel(0xffffffff, intc->base + JZ_REG_INTC_SET_MASK);
> =20
> -	gc =3D irq_alloc_generic_chip("INTC", 1, JZ4740_IRQ_BASE, jz_intc_base,
> +	gc =3D irq_alloc_generic_chip("INTC", 1, JZ4740_IRQ_BASE, intc->base,
>  		handle_level_irq);
> =20
>  	gc->wake_enabled =3D IRQ_MSK(32);
> @@ -116,7 +128,12 @@ static int __init jz4740_intc_of_init(struct device_=
node *node,
>  	if (!domain)
>  		pr_warn("unable to register IRQ domain\n");
> =20
> +	err =3D irq_set_handler_data(parent_irq, intc);
> +	if (err)
> +		goto out;
> +
>  	setup_irq(parent_irq, &jz4740_cascade_action);
> -	return 0;
> +out:

Error handling in this function seems a bit lacking. Should it not be
freeing, iounmapping, and somehow freeing the generic irq chip as
appropriate for each of the error cases?

Cheers
James

> +	return err;
>  }
>  IRQCHIP_DECLARE(jz4740_intc, "ingenic,jz4740-intc", jz4740_intc_of_init);
> --=20
> 2.3.5
>=20
>=20

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVNryUAAoJEGwLaZPeOHZ6PCMP/iArilu6Vl+Ckmg+NQdtAQzX
UDJA1pDgRmY9rK8gpUB0cECLJQT+PSRI2cf14SR87J1mJTFQPDdelZl33Fzb+5/b
6TgVXcfQvDPW21bCmSBRYIzRSWfuMx3bB+GJOpymFnwlvMIg5xVndAWvaPzvFBlv
5DIn8B/nxe7X6VYo9DlsqycS8Twh8r0Gzm4Kf0lg3Qcn8fT6uJxtXFZ/p9sMIQ4o
2KTl0id/FxnJwrSqy+xE5HjsRh8rdVnP9WMjw+TTaO4ntjaDQ/cua5v1zzLUauWy
ELPaMtDpn90xILN7OAgPIl1cngMFFegxVbNm/2+eq+nI5HkCKIcIoBthufOUCSlU
FvrPD16+1asBi5eo2uNQSHHx+TFDe24R16+RikWphGNUv5MC4bNOhmgh0+QHof7T
bmTxUqeqR1eGLsbyEmu9ibIm4EjdX3m775KzE8+QUa/tm3hpwIlgViJtO/FeOSBg
W2C1xlT3TtAxettFBLVzRTwotik5HozhU+p+8OOqkCB6wuTwkAS/enSY7QLSPrZB
65XeQl6dDH0Q0HW3ASwJy0XYRPhaZul2TshLt9c2PO2NUEaSu9uU2Y/JIRFy/VpC
INpHlDC2awurmEhrniARNpgg0MVJ4c6eQZeCqTRs6ydAyXDa+lTsIJ6/tEJmpN9C
PELxPP/pjgxp+x+Jz9gO
=8Mxa
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
