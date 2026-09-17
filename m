Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69A44A64FD
	for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681340; cv=none; b=E/G1J8MbGrqbMimNc4eIf2MzaH2ruI3B0U09mcneQYaMaRYLY2tEvBG3PQ2mQr8tz/kT/PYtK9dahhShCRTYg+Jf5wAdSEStemrB5ddg6W1JxWLgZBjsuJw+t3bOzSMUW1SqpuYPs519sNBkq+pdoi2vdFOICYgT1OwW24mdV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681340; c=relaxed/simple;
	bh=J08RF0JippXzOPX16V0ztB6TMUEWSeMwnzGLCutLPYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGpFa0xTshdlGIFmcw4cUYuStSsJQ4We7hyNGV3yHTSPDbj6fZaevZymDkFDzrZpMOY5lKwPh7/l2Xr9dkN/lo2P+EqoXw2gSa4Zh2/zwznBatJT1w+P+7M5qRzYLpUQwOm+zOSgaYTnreZFMXiqFRzYxRmdtBji+aL26MlYryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtJsgdiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtJsgdiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8CE1F00900
	for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 21:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681337;
	bh=+Vd37vlqPgoR34jGq+5SarCAahPWAWe4kwjRPQidlrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BtJsgdiv4lMiFIQVgmdR8uPTGBE3SksCFUE0VRGf/7plR5BsKss0wk44kg/IGESuy
	 5o+jLQ+1nk25fhFU9JgEkagFuLHUQ8UYBIQQX/A5gtdGuybvyN6BKeNY1tB+Qos5n/
	 nGQbSEqmvaOlUery2nP3gouw25q/6al1JCWu3lbTAgXC+ezfwSYIy0IPnOSUBIcIsC
	 7HGmzNbbxOTFkYectDy6svosEuc4md1omiI9N8nRk0Ji7lc/KSfNfeuBrdx/80t0Gr
	 7NEdQOOCzJWxZ08qaZHCoePZWUF1GKnLJHqiDEdXlhu+8H2B8syRuqxpDHTKVGx5gz
	 vtOhO9zii+3zA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso74213e87.2
        for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 14:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGu6RmN2D/d6/2nWx2gJ88c+772juT5jwIBl/5tmlwFhTRqlskNgC8Yjj+BrNdtx0BhBxtRI7tWiHS@vger.kernel.org
X-Gm-Message-State: AFuF++kStpL35Z7EbFMbvq5BGiMMKq8KHXJOgZdQi0WyxpHAFholfQCh
	Op1yPrOBFTWW5e1LpEPvglY//4Df5F9CiTdd65Td1O245f3+yCrPfF4++cWARbRwQXMS75D0fzE
	RziB99A4WMXXKDsBxPLpfDA++owllXfg=
X-Received: by 2002:a05:6512:3baa:b0:5b6:4ae:3ff7 with SMTP id
 2adb3069b0e04-5b8c18449abmr61087e87.31.1789681336165; Thu, 17 Sep 2026
 14:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917204240.1284796-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260917204240.1284796-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 17 Sep 2026 23:42:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=uWFLWB_8T_q9UwbY1KzB+tcjJwOo4GheRF-72eU59Sg@mail.gmail.com>
X-Gm-Features: AcwNN1UfNjWV7KrU9iWOWhdNsDlRn7O6RazPK4CNMASiCssILCbrQZDav7Nv7A0
Message-ID: <CAD++jL=uWFLWB_8T_q9UwbY1KzB+tcjJwOo4GheRF-72eU59Sg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: use dmaengine_get_dma_device() instead of chan->device->dev
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulfh@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Russell King <linux@armlinux.org.uk>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Fan Wu <fanwu01@zju.edu.cn>, Frank Li <Frank.Li@nxp.com>, 
	Rosen Penev <rosenp@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>, Pan Chuang <panchuang@vivo.com>, 
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rakuram Eswaran <rakuram.e96@gmail.com>, Khalid Aziz <khalid@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>, 
	"open list:OMAP HS MMC SUPPORT" <linux-omap@vger.kernel.org>, 
	"open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>, imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:42=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API
>
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
>
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.
>
> Assisted-by: LLM
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This looks good to me. Thanks for fixing all the sites!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
