Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D739DBF2
	for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453913; cv=none; b=CCMqa2WRu/EWgOOjEvqavlHi/aCj4WCiKLIMMsJ3mcD5JujjKOx0+JPxzu0p7ZM3gV809afHrctbmWaz5zCkiQBytDem0kGGen96Y5H7Q23+vaE6B9Zr0l8ThtAq0xZLy2GYT9RG9HPafONgcn6MeCOGM3EH+vZx6Tte5iCxR1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453913; c=relaxed/simple;
	bh=afQnCziSQw9RqyG0RZJ7CbnfZsgxFMZUmM5i6GoRTAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=tNU6H5vmKfPtn6FIv55Ol80Kcx1CGJ14s7N2F/Y3sPbUGXUvBv5t60mKOExnUx4qz+BHfrQTAzwGm8o0b7ZwwqZ6dY9B7b2tcu67ScvyrlqYbz7YDXRrW2W48Xw5YAC/0gWNnOoMdCWeMZ5G8sbMdAxSsftfdxws2kmimIp372c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zmRS1fZc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zmRS1fZc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D240C5CD50;
	Wed, 29 Apr 2026 09:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AFCE601DF;
	Wed, 29 Apr 2026 09:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F6F91072981A;
	Wed, 29 Apr 2026 11:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777453902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i3fH3BpVMeeL6++Hnod35PBAc+GS+PtWdmZnjJ4bk/w=;
	b=zmRS1fZcRQcufPaj2iR31c+INVvnAYOmBMP2BMYDwjW9StiHpyVBDzZth60XATUgOafcBl
	iYKPVuAiddpcI3nVvFRltfkEMY52E8zag0A9xFINsCpYyHk5zQ7q4kiotQ1r02B1jdGNfY
	Gi9MIArPBeco30jJyZLWFdstaLnPu8e3OTHzdwmr7fmmQMTWIoLK9LI38PO/K2irBfFMJJ
	D3AvWnBEjR4vJeqacFj1sHSQXiwXXZwMvCTpmkv2ODLCnNTumQhAHyvjGNJAxICwgKJlMD
	i1zqy2+CE3P22+0Ax4k2ot8ynf7JOC/1pD6nSpcFGf+gz0iqW7XS1J86SZPjzw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 11:11:39 +0200
Message-Id: <DI5ITKXOJOEE.28MZGWL8UPDOA@bootlin.com>
Cc: <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Jerome Brunet" <jbrunet@baylibre.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Philipp Zabel" <p.zabel@pengutronix.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v7 3/3] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
 <20260225-macb-phy-v7-3-665bd8619d51@bootlin.com>
 <177742824867.5403.11815560359227140766@localhost.localdomain>
In-Reply-To: <177742824867.5403.11815560359227140766@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Apr 29, 2026 at 4:04 AM CEST, Stephen Boyd wrote:
> Quoting Th=C3=A9o Lebrun (2026-02-25 08:55:07)
>> Our parent driver (clk-eyeq) now does the
>>         device_set_of_node_from_dev(dev, dev->parent)
>> call through the newly introduced devm_auxiliary_device_create() helper.
>>=20
>> Doing it again in the reset-eyeq probe would be redundant.
>> Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
>> Also fix the following comment that talks about "our newfound OF node".
>>=20
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>
> Applied to clk-fixes

Thanks Stephen!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
