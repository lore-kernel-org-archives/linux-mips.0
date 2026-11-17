Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911373;
	b=WQZzRGiGVKIW2VuRBzb1Dd1pVrltLjkxr2Z6PnA1tLVLJ5yCIUaZQpuKYzcCkQHVRZ/J
	 Yo1miRlzbeplETpXzDwgvy5Kgqle8PDJdz6FM6OWWqVIZudjayeBQ84FehR/Buawe9g9a
	 8Qvhtn2ukv5hOInjy6709H8Y2j4G+pYEWAXKKkQhy7fE4K04It5oQ90xPfkAQ8nFWs60a
	 AqMQTyQRhnjSPUoOOyqwlPWuiflVftyoYH+lJmro8f9bDFzsOJJjkqms/S5XVcWSu1Xcm
	 wXcIRMyaHOUMgJKGVl3o6xbn0MV3EhGeb5RRZYzeCiBAfr1qenVcGQ0ekJ5c5k5tYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911373;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=roHu/Z/48x2jFVCiSKFmPi5VbniaoexvcccUh8/yKfg=;
	b=IvbAj8HRhUtKn9fOGnPvBcAt/zbm3uD0gAa5XE6UQGDa96Aj8sK7B3GGjVcwQV76SWzT
	 FubU/5jz0AK5ifF4rn0TzL/Ocest6MJllWXD6nl3FtPyjLq+PDiGEf8Q4QDE/7fxllC9H
	 /UWoAOqKgusiqqUnzZqflE7GgpFm/OWQrzvr5hkrUA/CtqQlC8N/+mBpSTRY+QJbGP5WU
	 qApoZrgC4MzjAM2xY1vF9RYaP7CKLo0dgMHzHEFeX/YIGAGs6fAcMbdCt0VrDfESdIK8C
	 1Yopda24JRegrXnyxs3CdRZTJQnEiaJsNiZ4b03deHQEwuYvt68Z2uktd8VieCbEP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D893606A32A;
	Tue, 17 Nov 2026 10:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D893606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
Subject: Re: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state
 across removal
From: Paul Cercueil <paul@crapouillou.net>
To: James Hilliard <james.hilliard1@gmail.com>, Miquel Raynal
	 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, 	linux-mips@vger.kernel.org
Date: Tue, 17 Nov 2026 11:29:25 +0100
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
References: 
	<20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
	 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
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

Hi James,

I tried to apply on top of mtd/next but it does not apply cleanly.
So what base are you using?

Le vendredi 13 novembre 2026 =C3=A0 11:15 -0700, James Hilliard a =C3=A9cri=
t=C2=A0:
> Unregister and disconnect all chips before releasing the ECC provider.
> Retain each chip and its shared controller until the final MTD put,
> while releasing hardware resources during device removal.
>=20
> Run NAND cleanup during disconnection; the final core-owned put only
> releases retained allocation and layout data.
>=20
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: linux-mips@vger.kernel.org
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> =C2=A0drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 ++++++++++++++=
+++-------
> -
> =C2=A01 file changed, 27 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index bdda06ae0d72..2818ffe76796 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_dev=
ice
> *pdev,
> =C2=A0	if (IS_ERR(cs->base))
> =C2=A0		return PTR_ERR(cs->base);
> =C2=A0
> -	nand =3D devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> +	nand =3D kzalloc_obj(*nand);
> =C2=A0	if (!nand)
> =C2=A0		return -ENOMEM;
> =C2=A0
> @@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_dev=
ice
> *pdev,
> =C2=A0	if (IS_ERR(nand->busy_gpio)) {
> =C2=A0		ret =3D PTR_ERR(nand->busy_gpio);
> =C2=A0		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
> -		return ret;
> +		goto free_chip;
> =C2=A0	}
> =C2=A0
> =C2=A0	nand->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW=
);
> @@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform_d=
evice
> *pdev,
> =C2=A0	if (IS_ERR(nand->wp_gpio)) {
> =C2=A0		ret =3D PTR_ERR(nand->wp_gpio);
> =C2=A0		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
> -		return ret;
> +		goto free_chip;
> =C2=A0	}
> =C2=A0
> =C2=A0	chip =3D &nand->chip;
> =C2=A0	mtd =3D nand_to_mtd(chip);
> =C2=A0	mtd->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(de=
v),
> =C2=A0				=C2=A0=C2=A0 cs->bank);
> -	if (!mtd->name)
> -		return -ENOMEM;
> +	if (!mtd->name) {
> +		ret =3D -ENOMEM;
> +		goto free_chip;
> +	}
> =C2=A0	mtd->parent_dev =3D dev;
> =C2=A0
> =C2=A0	chip->options =3D NAND_NO_SUBPAGE_WRITE;
> @@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform_d=
evice
> *pdev,
> =C2=A0	chip->controller->ops =3D &ingenic_nand_controller_ops;
> =C2=A0	ret =3D nand_scan(chip, 1);
> =C2=A0	if (ret)
> -		return ret;
> +		goto free_chip;

Blank line here

> +	ret =3D nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)));

This is quite convoluted, just do nand_set_lifetime(chip, nand);

> +	if (ret) {
> +		nand_cleanup(chip);
> +		goto free_chip;
> +	}
> =C2=A0
> =C2=A0	ret =3D mtd_device_register(mtd, NULL, 0);
> =C2=A0	if (ret) {
> -		nand_cleanup(chip);
> +		nand_disconnect(chip);
> +		mtd_put_master(mtd);
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	list_add_tail(&nand->chip_list, &nfc->chips);
> =C2=A0
> =C2=A0	return 0;
> +
> +free_chip:
> +	kfree(nand);
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
> @@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingenic=
_nfc
> *nfc)
> =C2=A0		chip =3D &ingenic_chip->chip;
> =C2=A0		ret =3D mtd_device_unregister(nand_to_mtd(chip));
> =C2=A0		WARN_ON(ret);
> -		nand_cleanup(chip);
> +		nand_disconnect(chip);
> =C2=A0		list_del(&ingenic_chip->chip_list);
> +		mtd_put_master(nand_to_mtd(chip));
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_device
> *pdev)
> =C2=A0		return -ENODEV;
> =C2=A0	}
> =C2=A0
> -	nfc =3D devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KERNEL);
> +	nfc =3D kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
> =C2=A0	if (!nfc)
> =C2=A0		return -ENOMEM;

Blank line here.

Cheers,
-Paul

> +	ret =3D devm_nand_controller_init(dev, &nfc->controller, nfc);
> +	if (ret)
> +		return ret;
> =C2=A0
> =C2=A0	nfc->soc_info =3D device_get_match_data(dev);
> =C2=A0	if (!nfc->soc_info)
> @@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_device
> *pdev)
> =C2=A0	nfc->dev =3D dev;
> =C2=A0	nfc->num_banks =3D num_banks;
> =C2=A0
> -	nand_controller_init(&nfc->controller);
> =C2=A0	INIT_LIST_HEAD(&nfc->chips);
> =C2=A0
> =C2=A0	ret =3D ingenic_nand_init_chips(nfc, pdev);
> @@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_dev=
ice
> *pdev)
> =C2=A0{
> =C2=A0	struct ingenic_nfc *nfc =3D platform_get_drvdata(pdev);
> =C2=A0
> +	ingenic_nand_cleanup_chips(nfc);
> +
> =C2=A0	if (nfc->ecc)
> =C2=A0		ingenic_ecc_release(nfc->ecc);
> -
> -	ingenic_nand_cleanup_chips(nfc);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct jz_soc_info jz4740_soc_info =3D {
