Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8CAEB64DC
	for <linux-mips@archiver.kernel.org>; Tue, 20 Jun 2023 11:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjFTLUi (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 20 Jun 2023 07:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbjFTLUc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jun 2023 07:20:32 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCAA1726;
        Tue, 20 Jun 2023 04:20:23 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-39cc64e4a44so2257781b6e.0;
        Tue, 20 Jun 2023 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687260022; x=1689852022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcos9rYozgTwJbvaSVJyi//nKCVNmkQcGh88Moyom8Y=;
        b=suizU+8uHwf4l5ynlBS5gXrjesGaGhxzrrSWLBm5woFjHETH1IKuQ9GOZOn4j9mc3R
         +jqzId5ccWcSo5Moojrr5kD5CkcdT8toMedmworNCLFv2/WFANMeg2mTUHXLQaegFJYf
         4l1cXKLFC3kfFOKsSrK0lYeXAu0kX3s9AeEs/x+Ouj4SaWrU8zMG08ehIPeK2gnvH7J8
         hRyHGtMYljTVkAwrwM5nLj4+TdOTAWr2TUZkjadoAlawT0dFwm+5dNfTTaFyxt65Ac/n
         DHEb6dfwIHN4uIO09oHi6ei/J2y5X07ltoTHU24so1bCO5G7KxSsZXKpLzSaWetXmlOO
         hfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687260022; x=1689852022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcos9rYozgTwJbvaSVJyi//nKCVNmkQcGh88Moyom8Y=;
        b=RS8OY5UhKF/AOP2uohoG9nDlvx6x/ldqPjf2EyituUMPNipAPGCD/ql2qajtn7kYKU
         Lr9DGKPhGCAI2f6TPBluCp/c5cvHKJmD6hgfTvqz93ufnoeCdfZkxmkzbf2gZW+iOi1Y
         cIjnElz+y3sSUDdZ4MAPw9T14IQbZbTcxr8460h40477EO515PQ+zN6OOpHjSnNSU24b
         Xa8/0e/wp8+hoVq00lZ23AbtscvAjlEl4dJOSmb+xw16YTkRHoa+WqAHdw8VeUDrVRjJ
         QMOXtjgED28RkapV957fyODh7RHJjQH+lRZOx6fhcpljrCLTeLqCzIbRrAn9unl4Qgkv
         gLnA==
X-Gm-Message-State: AC+VfDx1LyLLfRzzIL5TPKbkqaarZJcSZQQ1lfaYn6ak+g7ttJON/A+r
        jtHZ8Dt7bgrDOo3i1VWj+uYwTV3PSjWmwjvKVqw=
X-Google-Smtp-Source: ACHHUZ6n8i+nk31+ccA1f4eiNCOsybxQykNUWkao53GaENjUkHnY8z+m/1OrALtYfIVnvDsc7cmNRx7TKwJG2XMXjpo=
X-Received: by 2002:a05:6808:1444:b0:396:40e8:689 with SMTP id
 x4-20020a056808144400b0039640e80689mr11447679oiv.53.1687260022362; Tue, 20
 Jun 2023 04:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <TYAP286MB0315B9598EC3BBB0783203CBBC5CA@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYAP286MB0315B9598EC3BBB0783203CBBC5CA@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 20 Jun 2023 13:20:11 +0200
Message-ID: <CAMhs-H96z65X5L-8=ouuKS-fkBUS4Uo4GTaYYgMDkw5G+v73hQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mips: pci-mt7620: reduce unnecessary error logs
To:     Shiji Yang <yangshiji66@outlook.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 20, 2023 at 12:48=E2=80=AFPM Shiji Yang <yangshiji66@outlook.co=
m> wrote:
>
> These patches silence some mt7620 PCIe driver error messeges by
> removing the useless debugging codes and replacing incorrectly
> used 'dev_err()' with 'dev_info()'.
>
> Shiji Yang (2):
>   mips: pci-mt7620: do not print NFTS register value as error log
>   mips: pci-mt7620: use dev_info() to log PCIe device detection result
>
>  arch/mips/pci/pci-mt7620.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

For the series:
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

I'd really love to have this driver ported to PCI_DRIVERS_GENERIC
moved to 'drivers/pci/controller/pcie-mt7621.c' since they are pretty
similar just changing that mt7620 and mt7628 init the hardware
different and only use one virtual bridge. My problem is that I don't
have and cannot find hardware to test. Do you have interest in helping
me to do this?

Thanks,
    Sergio Paracuellos

>
> --
> 2.30.2
>
