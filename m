Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794935740;
	b=mdbHaXIA97l982ytXxP9o6UMAPF1YNUzKZhgwXSt/xa7Jg3+ev+llqiStxvZ4EA0T6A2
	 LVjNNXKQbA/O9LrH7Ohfem/gYk88C4jeLdaQV4DqKfv4sTVmaNYroN42vBwMQvAGAJmSV
	 3fsPcfGfHu7ZosoYYiMf3e4QzVD9ctyje9i7vaQ27SclL+YMMr8euT/MXXP6DTH6L3njw
	 SqRhk7Rx/zhHzW9OME2gNuEthBns/52hD0XRvhtJN7uiWb7EYTZebAgaT1kBNUzIO32qI
	 BF+CLRphXPWc5rJiwFZtgJTbO15MamHG1llMpfHZxGAE8Rhg8F4kZsFJI4pmRryqRxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
	b=PW7N0IVbMHGZu65nL1k0UKiGeawd/idVDNpq0ftUDqr43hhyNmzP+U1Y93wv7DzqswfX
	 0ABbzRz9n83FSEJvPoGrCpueYP9AlBzTHVjVTH7WzzrbHTYumZmvEXt/DXLFJhBNvXwDN
	 YT7miiJjKArvI+qItpvaj0OHZwxjKSyKfK3Bn7LewPWgt9wM7amYogdoOeSS+PVZapJmU
	 TOlEsBqR2sdlKL/1X7/nvPo+ixEb1eqmMcjikERFRGYtQY5QKsb6TAmLMz+vQ7VNV9w83
	 Qcw5XnVO23HXdcuRAfXCS19t1R8iQcbrvwFzSwSTRMc1g5Q+Lmesmeh2wg24G+H3BSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Y76Ifj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F35606A336
	for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 17:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F35606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Y76Ifj8
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b7efd3bc26so112188a12.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Nov 2026 09:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794935739; cv=none;
        d=google.com; s=arc-20260327;
        b=WlocbP2tf7LMAv0MAcZZd0L34CGlynAAH0q1Di5QT8yjpb18KR2MiDah1LvRTBN5C/
         eqYaF5l6r76Fr28PZY8F79hzKnf82Rr6FrcLixWPbvCZKKlRmu/ZkUijPP+VMHURPN9U
         bWfsK7cBEwSX6bRg83Wep2wp2DdKirYx0tSsWEFImZdQlge3+ljCuASDX5NTyEceKVR8
         49REHvuylIxEs+9DaPFlRpHknGcZxwZvmU+KYGxXnDCaCimw5eGALwC6CKZ89D1k/y/p
         atXqKdCG6lhBNxJBsg/NqaPEs0fr01cuDF+BMKowqwvRzGUn2oRR0hVFoXLl2+kZYXY8
         59DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        fh=4cgaHmspT1ijltfcCqAlIjRfdxrHhMmIHE1HvzUzwQE=;
        b=UoSdcGO+Ty16XlYlm9c0lCg37W/twdjH8uuNmdi2BJSbIc0W8ozJkVXTtpYnHuQnY/
         X7i3jdSk8BS9JWoTzIs4cLDe2lXS1EYOqt6j2MWcSwWFwn+Ljzxg6z5FeRSJ3TgfujSd
         +L/ka7CbDA1LDexK6DJlK3d6yZM5s/OOJepvDmeu/W04jbanb+XkFxa8FH78ba62ArvA
         +SW7IKrU7YtiHceOowJsLTPB8LwauN6HKmWiQgOXczmKX3E4Ew0Yit8/NHicfsE1mO6j
         s4qGo5aQ6eN3z7u6FTyIj8YPFeUil9ULJzCnTMEPylZil7CiFz39UHgBR5GN42J4rD/t
         lT+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935739; x=1795540539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        b=0Y76Ifj8d0i/HievOD+S/vLbshO8yiCsFsY1cg0g2oVP0cooU21euS6mvQFEHc3qd3
         Iapj8n4Yx7i/NWXzCUxZcq2lrb5Vev4VOMQtniN6TxwVp8WPYgW0yNp3l7kedussZYzF
         qcXmHM+4/yDOcZtzBg8zXkDF4HCm8Jtc6s6CS+p57usGGBT4CVCDcoYX0D5/LDlEQ6Q8
         lRF+jjb3HMeHLmvNLtxoKK1f5X8bvTsFKAYwH5+vZ7nftrzqoOMKRObc+uPnHmouEHEh
         KwFhXMQ95I6R2na1XzIfN4mrBJi67rUeDzPwcUuBFu9FU5VtcUrK9V3cijnCkydyduXE
         8Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935739; x=1795540539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        b=zC8wKT+QdInfvgbVCHygnPmkmMnrV1h4d0z3f4zn7lnhcLGjuSHubuVvdKAUGIw8ST
         KxYUjqx32G4skrWN8Tkl0frxDCw/X22jQ738yObNJ6Ot2yY0W0CZVJ5qRsjfwN7GPgOg
         8DZ4lff1Ep0CBZGvsZqLjsUrli7sg/Nv7EYhXBwCxsLE4BAlpLPmZkNNPyyqDtBMaTwZ
         DiAgAGj29KTukybqniVh08TkfjRtGehsJltKNS9N+wQzHk/CJhZ9XhuYaeQRH5HPjNSJ
         HcDszfAeZ92df2of2GtmMYC3mwnxHzZAfX4g4CnXBoNRdumkxi1ZdKKi95bF8NevFkQx
         sQeg==
X-Forwarded-Encrypted: i=1; AL+hErF1Dudb42mMrDpTxg81rhf5Y/4WB2tebVdxmZ8AX5osHXYF+pZMLYZfnlj+jII7l01aEuXp6J3KWUsa@vger.kernel.org
X-Gm-Message-State: APuU4Z9b1+wZT50ripES9uTRVJA5sENKFGj77IMLN5GNYLJw3eepth/V
	3/Wb3/lfDbq0WWgPnz9gWIlMP8ClIEzroA/ufnjx2/UEedcX0dUB+u3YC9oGjzHDBmStXnafN7v
	hDMX9pwGXaT532SswPiTxi655FObkXiA=
X-Gm-Gg: AYBFou19Y6/H3wVxHGdkP4c+QwGb1Xz6ioCenX1yUpspRLh/yF8+k7Hes5mqAHtqtsN
	LnUGyPFqwuZilvProyjeYVhdS44vx+HPZVr4DzCuTsvlGugw9qwwb9L6CqyeO9Ztr2BG7DzUNLw
	1O3KehCxGWj3dbo6vkKJZ7jJfjnfZCApVaY1IGDW333ne9UX6D3OnNg0nN6Syuz5TQdshEStLtu
	AMVwI4jDveVlETQYO34ObFUKDOJlQMn8L188FOhDpHnQhM9IXOWFHoWD1+ZJ1QwbDoNxBw3vGCf
	DxXnHWf6NmuvzH8dnKoSTgBBFUpYvKzEnGVnjt2hqQNuXUlG4lhRyjT3P9bVTfyFxAw2aTDhLoj
	hiVWBn2wJY+XErf4MzlQY6uJN/m3XpegsA2UdeJICg4snz6eTV1NPeZlfqOZZEqL1M7j7BVzDbr
	+2A2N6dBoi0TV35GhRfZGpPFXje5wx2q6WykAIOGdS0WHc9q6UongOM72JkQgypeiafG15Qg8wm
	lcvA0S2Vdpg1xNyYx987RZ5RXnlMw==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr11109937a12.3.1794935738608; Tue, 17 Nov 2026
 09:15:38 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
 <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
In-Reply-To: <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 10:15:24 -0700
X-Gm-Features: AclHuK9KT8grAZrRLLebF-am9hX1f-i-TowuArJi-sKzS1G3iCSB2RVcRvk6uKs
Message-ID: <CADvTj4qJXb5sUQbDrAj5uY+VDYcP9HOGHuy4j3iA0dQEDF3amw@mail.gmail.com>
Subject: Re: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state across removal
To: Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:29=E2=80=AFAM Paul Cercueil <paul@crapouillou.net=
> wrote:
>
> Hi James,
>
> I tried to apply on top of mtd/next but it does not apply cleanly.
> So what base are you using?

For v4, I used NAND next at
30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85, plus the separately posted
fixes listed as prerequisite-patch-id entries in the cover letter.
The Ingenic patch also depends on the earlier core changes in the
series.

With released b4, shazam -H uses the declared base and retrieves those
prerequisites before applying the series. Provided that base commit is
available locally, this reconstructs the tree for review:

b4 shazam -H -v 4 \
  20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gma=
il.com
git switch -c nand-lifetime-v4-review FETCH_HEAD

For b4 0.17-dev, add --merge-base _specified, since its default base
selection changed.

I verified that all 16 prerequisites and 58 patches apply cleanly on
that base, and the resulting tree matches the sent v4.

>
> Le vendredi 13 novembre 2026 =C3=A0 11:15 -0700, James Hilliard a =C3=A9c=
rit :
> > Unregister and disconnect all chips before releasing the ECC provider.
> > Retain each chip and its shared controller until the final MTD put,
> > while releasing hardware resources during device removal.
> >
> > Run NAND cleanup during disconnection; the final core-owned put only
> > releases retained allocation and layout data.
> >
> > Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> > Cc: linux-mips@vger.kernel.org
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 +++++++++++++++++=
-------
> > -
> >  1 file changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > index bdda06ae0d72..2818ffe76796 100644
> > --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > @@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_d=
evice
> > *pdev,
> >       if (IS_ERR(cs->base))
> >               return PTR_ERR(cs->base);
> >
> > -     nand =3D devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> > +     nand =3D kzalloc_obj(*nand);
> >       if (!nand)
> >               return -ENOMEM;
> >
> > @@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_d=
evice
> > *pdev,
> >       if (IS_ERR(nand->busy_gpio)) {
> >               ret =3D PTR_ERR(nand->busy_gpio);
> >               dev_err(dev, "failed to request busy GPIO: %d\n", ret);
> > -             return ret;
> > +             goto free_chip;
> >       }
> >
> >       nand->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LO=
W);
> > @@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform=
_device
> > *pdev,
> >       if (IS_ERR(nand->wp_gpio)) {
> >               ret =3D PTR_ERR(nand->wp_gpio);
> >               dev_err(dev, "failed to request WP GPIO: %d\n", ret);
> > -             return ret;
> > +             goto free_chip;
> >       }
> >
> >       chip =3D &nand->chip;
> >       mtd =3D nand_to_mtd(chip);
> >       mtd->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(d=
ev),
> >                                  cs->bank);
> > -     if (!mtd->name)
> > -             return -ENOMEM;
> > +     if (!mtd->name) {
> > +             ret =3D -ENOMEM;
> > +             goto free_chip;
> > +     }
> >       mtd->parent_dev =3D dev;
> >
> >       chip->options =3D NAND_NO_SUBPAGE_WRITE;
> > @@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform=
_device
> > *pdev,
> >       chip->controller->ops =3D &ingenic_nand_controller_ops;
> >       ret =3D nand_scan(chip, 1);
> >       if (ret)
> > -             return ret;
> > +             goto free_chip;
>
> Blank line here
>
> > +     ret =3D nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)=
));
>
> This is quite convoluted, just do nand_set_lifetime(chip, nand);
>
> > +     if (ret) {
> > +             nand_cleanup(chip);
> > +             goto free_chip;
> > +     }
> >
> >       ret =3D mtd_device_register(mtd, NULL, 0);
> >       if (ret) {
> > -             nand_cleanup(chip);
> > +             nand_disconnect(chip);
> > +             mtd_put_master(mtd);
> >               return ret;
> >       }
> >
> >       list_add_tail(&nand->chip_list, &nfc->chips);
> >
> >       return 0;
> > +
> > +free_chip:
> > +     kfree(nand);
> > +     return ret;
> >  }
> >
> >  static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
> > @@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingen=
ic_nfc
> > *nfc)
> >               chip =3D &ingenic_chip->chip;
> >               ret =3D mtd_device_unregister(nand_to_mtd(chip));
> >               WARN_ON(ret);
> > -             nand_cleanup(chip);
> > +             nand_disconnect(chip);
> >               list_del(&ingenic_chip->chip_list);
> > +             mtd_put_master(nand_to_mtd(chip));
> >       }
> >  }
> >
> > @@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_devi=
ce
> > *pdev)
> >               return -ENODEV;
> >       }
> >
> > -     nfc =3D devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KE=
RNEL);
> > +     nfc =3D kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
> >       if (!nfc)
> >               return -ENOMEM;
>
> Blank line here.
>
> Cheers,
> -Paul
>
> > +     ret =3D devm_nand_controller_init(dev, &nfc->controller, nfc);
> > +     if (ret)
> > +             return ret;
> >
> >       nfc->soc_info =3D device_get_match_data(dev);
> >       if (!nfc->soc_info)
> > @@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_devic=
e
> > *pdev)
> >       nfc->dev =3D dev;
> >       nfc->num_banks =3D num_banks;
> >
> > -     nand_controller_init(&nfc->controller);
> >       INIT_LIST_HEAD(&nfc->chips);
> >
> >       ret =3D ingenic_nand_init_chips(nfc, pdev);
> > @@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_d=
evice
> > *pdev)
> >  {
> >       struct ingenic_nfc *nfc =3D platform_get_drvdata(pdev);
> >
> > +     ingenic_nand_cleanup_chips(nfc);
> > +
> >       if (nfc->ecc)
> >               ingenic_ecc_release(nfc->ecc);
> > -
> > -     ingenic_nand_cleanup_chips(nfc);
> >  }
> >
> >  static const struct jz_soc_info jz4740_soc_info =3D {
