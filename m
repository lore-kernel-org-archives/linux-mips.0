Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297710;
	b=YPX9K4pqEDkB8Snd2JH6nwRtVHyWMyEgJ8/cyKwFbuyNeQcPkgoGkbDRCLIrmbaJwweZ
	 bZoc71Sg3sTo/CjA3x2GTGsFi1oNEh33TeXAmuBSS4W/Na68HwCrAt5lgt35Lyp/lFflH
	 2qkjJ3TKkpRG3N5JBSxw7HoqG/tjJQvRb4dETaLoPiEc/vQc9xkLGwMBOt8nxMWVn7RVW
	 pEPdoKlNdcbXv5KMwgGJ+TOtCBVEprEfKP5WYi61iov7DgWlG5TJWLpkdZoaYg15TEv10
	 875xeaLJICw383AIXh3VVUHY2D9hOKDp4Ly9tQ6WrcAeuI3GilwRJsvpUweTMm+Gs7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297710;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:User-Agent:References:
	 From:Content-Transfer-Encoding:Subject:In-Reply-To:Message-Id:
	 X-Lms-Return-Path:To:Date:Content-Type:Received:Cc:Mime-Version;
	bh=bcIJeNa/s/CZobvKVdNkLsGHNQtQLHi4ynaZuvo975c=;
	b=nX1HeflW/ZfLi1qKSPUhSSwJOX9QZfnASWtdF/rstYMJ5FfF/7PlESBBxfhHK704lrbx
	 rXJ7B/jRNpYuNZjsZEOx/8N4SgQAkVph/GnAy0Bn3SdwROJCGnpTvs3R0SZkUCBRFmKik
	 FCHadBd7ZiYzFYbmpIDiuxv6yJpv2oCSwPptj3HGRSD7FgCK3qCbGv7QH/Wdm63hp5zTo
	 jMp8G4v+HDgCloP4OBobgfHM0cclOcs2At0r6BHcdNTXSbDMqnI5G6D/LsZwth8F4M96A
	 PQ0sJoLfSKVQDtfkqGV1kXFsNQVCyGu8UdlSRL5bXq9AuigBhlNi2YOw7whJTPYyR7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=n9S2nBno;
	arc=none smtp.remote-ip=209.127.231.43
Received: from va-2-43.ptr.blmpb.com (va-2-43.ptr.blmpb.com [209.127.231.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACCB606A31C
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 08:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=n9S2nBno
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794297704;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bcIJeNa/s/CZobvKVdNkLsGHNQtQLHi4ynaZuvo975c=;
 b=n9S2nBno6lmw3YPyEIi3OB/norYfLx29L9zUe49XKx4J60eIFGpStO+DJ55ICwKH+5cA1i
 oa1G+BFlJmQL1MwccQLgT6pH2vfJzoKrLIM3HavsCbBLKXCOIRY5FypjHdH/xJbIF6HcOa
 myq1Mx6rCbRXxl5tRCcSPO0rKanHf6ioU9U7fmtczua0qvMvzLvh/pDsfx4dpk048MND81
 bTRXutQCeSIITXDXM8pPkDJxwmTj0XXTj8q7lRPEgd5cZ969ZrL2jlg7YhHzGSMad228oD
 vcx7xpuLZIoP3aN4sfftB4rzf4KI8SQ16b2OhJx/nFr06VwXZjLKeRWKux2WLQ==
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
User-Agent: Evolution 3.62.1-3
References: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com> <20261110-mips-ls7a-wdt-v1-2-968bb85122e6@oss.cipunited.com> <9525d680-71e7-4dc8-a1fc-1be178453cb2@roeck-us.net>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/4] watchdog: loongson1: Add Loongson-7A watchdog support
In-Reply-To: <9525d680-71e7-4dc8-a1fc-1be178453cb2@roeck-us.net>
Message-Id: <a1cae24c83e4b60bc6abfd1b387b3e92fe54c07d.camel@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af2cf66+7d6f78+vger.kernel.org+rongrong@oss.cipunited.com>
To: "Guenter Roeck" <linux@roeck-us.net>, 
	"Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Date: Tue, 10 Nov 2026 15:59:59 +0800
Content-Type: text/plain; charset=UTF-8
Received: from [192.168.8.156] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 16:01:40 +0800
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Hi Guenter,

On Mon, 2026-11-09 at 23:47 -0800, Guenter Roeck wrote:
> On 11/9/26 23:02, Rong Zhang wrote:
> > The Loongson-7A watchdog is similar to Loongson 2K0300, except that it
> > has no clock controller.
> > 
> > Retrieve clock frequency from OF to make it work.
> > 
> > Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.
> > 
> > Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> > ---
> >   drivers/watchdog/loongson1_wdt.c | 29 +++++++++++++++++++++++++----
> >   1 file changed, 25 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> > index 2811e7eab631..57b9e699c131 100644
> > --- a/drivers/watchdog/loongson1_wdt.c
> > +++ b/drivers/watchdog/loongson1_wdt.c
> > @@ -31,6 +31,7 @@ struct ls1x_wdt_pdata {
> >   	u32 timer_offset;
> >   	u32 set_offset;
> >   	u32 wdt_en_bit;
> > +	bool no_clk;
> >   };
> >   
> >   static const struct ls1x_wdt_pdata ls1b_wdt_pdata = {
> > @@ -45,6 +46,13 @@ static const struct ls1x_wdt_pdata ls2k0300_wdt_pdata = {
> >   	.wdt_en_bit = BIT(1),
> >   };
> >   
> > +static const struct ls1x_wdt_pdata ls7a_wdt_pdata = {
> > +	.timer_offset = 0x8,
> > +	.set_offset = 0x4,
> > +	.wdt_en_bit = BIT(1),
> > +	.no_clk = true,
> > +};
> > +
> >   struct ls1x_wdt_drvdata {
> >   	void __iomem *base;
> >   	struct clk *clk;
> > @@ -129,6 +137,8 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
> >   	struct ls1x_wdt_drvdata *drvdata;
> >   	struct watchdog_device *ls1x_wdt;
> >   	unsigned long clk_rate;
> > +	u32 freq;
> > +	int ret;
> >   
> >   	drvdata = devm_kzalloc_obj(dev, *drvdata);
> >   	if (!drvdata)
> > @@ -136,16 +146,26 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
> >   	platform_set_drvdata(pdev, drvdata);
> >   
> >   	drvdata->pdata = of_device_get_match_data(dev);
> > +	if (!drvdata->pdata)
> > +		return -ENODEV;
> >   
> >   	drvdata->base = devm_platform_ioremap_resource(pdev, 0);
> >   	if (IS_ERR(drvdata->base))
> >   		return PTR_ERR(drvdata->base);
> >   
> > -	drvdata->clk = devm_clk_get_enabled(dev, NULL);
> > -	if (IS_ERR(drvdata->clk))
> > -		return PTR_ERR(drvdata->clk);
> > +	if (drvdata->pdata->no_clk) {
> > +		ret = of_property_read_u32(dev->of_node, "clock-frequency", &freq);
> > +		if (ret)
> > +			return ret;
> > +
> > +		clk_rate = freq;
> > +	} else {
> > +		drvdata->clk = devm_clk_get_enabled(dev, NULL);
> > +		if (IS_ERR(drvdata->clk))
> > +			return PTR_ERR(drvdata->clk);
> >   
> 
> Wouldn't it be much easier to just create a fixed rate clock and use it
> (as suggested by Sashiko in the devicetree patch) ?

Makes sense. I will take that approach (and fix other concerns found by
Sashiko) when I resubmit this.

Thanks,
Rong

> 
> Guenter
> 
> > -	clk_rate = clk_get_rate(drvdata->clk);
> > +		clk_rate = clk_get_rate(drvdata->clk);
> > +	}
> >   	if (!clk_rate)
> >   		return -EINVAL;
> >   	drvdata->clk_rate = clk_rate;
> > @@ -191,6 +211,7 @@ static const struct of_device_id ls1x_wdt_dt_ids[] = {
> >   	{ .compatible = "loongson,ls1b-wdt", .data = &ls1b_wdt_pdata },
> >   	{ .compatible = "loongson,ls1c-wdt", .data = &ls1b_wdt_pdata },
> >   	{ .compatible = "loongson,ls2k0300-wdt", .data = &ls2k0300_wdt_pdata },
> > +	{ .compatible = "loongson,ls7a-wdt", .data = &ls7a_wdt_pdata },
> >   	{ /* sentinel */ }
> >   };
> >   MODULE_DEVICE_TABLE(of, ls1x_wdt_dt_ids);
> >
