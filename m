Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9B4A5C44
	for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346552; cv=none; b=E9oBz4J0uVaU2rwidoYJWxdmcFQ1NkYLi9W5CuAreX4yc8XPE/WOkMzMBp//7/+gVI5o1PFiZdG2Y8OTTVixBn706XqK3/p0ifFx98/sj3XC4nMe24cSJLx0yLaObJYzbfQKNat9FO/SRq8KK/BCqx9FtGqIEjZ9zDu22c6vSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346552; c=relaxed/simple;
	bh=ml/kJmd2QciEkxkIPM0iG2xc9A8CmDKmcLQrId8i3uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mOoK2fweI0UdZBKroafyoJX6HFiLDdn8okLodUkyaCJ/EfmPm08nWOQfbrM6pkkzaGIR21SZDotXU3oVOTS++ZGniggzkI6Ca1UxMJf9D0Uh5vPsL13xcub+mQp29VM8AUYSG9YvtUCP/YwCEXoQuW23sk3kYsPqNywev4Q6jz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ijk3lvV5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ijk3lvV5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF4101A1024;
	Fri, 25 Sep 2026 14:29:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F3196073B;
	Fri, 25 Sep 2026 14:29:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55F52102F08C8;
	Fri, 25 Sep 2026 16:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B9SAdsKIM9po5e3COkJx3/f5eCr9H91R3DRSye2x0s0=;
	b=ijk3lvV5Ytolj7ONBao+6E1jKrnPnfqy9PllVh0sQCIKiPAby37e8RfcmECcCv+xY5uLnP
	4JvEKceRY00bMEL3lG2XtcvoIuwGkJbZaS3yZV+5WifBxC67dfZ3v9AwpGbE99XT75VJto
	q7Tak5DIT/J8DVIyRCsa/db6qkwEwG/Mae2miTe95upekFvjLycmzNk2ERWRoHGxA+gRg0
	9w6BtmJ+qGCeIm0mKS50LpaDZVzGFdRx/AYZV9Kh8nSShWs+CGTqXxyQVc9pdtgZW6DcOJ
	vsy96kev8o5HMZpeYOx/l14ApShn4aI5DXIWAe3q8tpuxM8k4H0KA69523GogQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Richard Weinberger <richard@nod.at>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>, Frank Li <Frank.Li@nxp.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Haotian Zhang <vulab@iscas.ac.cn>, 
 Johan Hovold <johan@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
References: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-Id: <179034653501.1166139.9018677426507757712.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 17 Sep 2026 16:47:06 -0400, Frank.Li@oss.nxp.com wrote:
> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API.
> 
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: use dmaengine_get_dma_device() instead of chan->device->dev
      commit: a018524a2ec96da5bb1965053967a20e0069ed9e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

