Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218499;
	b=xXBaQd9A6OBMGszyULUGS9rtaUHMqiWRKmLhVR3g4iCuXLqNTQFdy4dYRPbTQmPTbPqd
	 rhgSuE1d6tAR5FuoPLL13cdPRN6mspupnnqx2IouHWawceSLPo/chHrWW8A7uWuxVQkXg
	 XpmSeuU31qhk8KdjQs/r7+RvuB27Zv/Htc68y2cKqK9Zb6UxiJ6J8iH3wwGVkm8iajmxw
	 IfclVjT5ux+Tp5gkWM9f9OxFgHBO3Gq7pvxhsts6i9nI9LUYipgZKHHtVd6Kmqt36COt3
	 BjWVjvrVfq3ATegDKaWHR5D1TTAuJqVxT8mW5LpDVxLGgnCmjTRkCe0k/FJkJcoEmKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218499;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=u7i9Jegrymse5jYW/nuIjFSVf/yelpcmNA/2X5G1/LA=;
	b=0h2Z6lm2X4XqiDRRTkeg9qYGcCOIiTnoMgwmBrBu5Tdx4WRvYK3ZsM3M6GbG7clxW9Tz
	 0JDLI0F3ruZy4X7DkLM90rFVxaaiGzaGc9mRbgkEpEUsbcZRD3wZA73oKJzOTiy7FMW9w
	 8BkYcfWCItAqdrqNsbb+w1QxVh7cowmAuufPhXhubxeCItvA/obTc/uzTDurURiba6ZB4
	 XlereE0ZU4rCQpCtyhtFCnuZkd3bO5fi+lfJrITluaMpsYYvPMmXaLEgwj1Vx3SCZ07VE
	 ep1TDzu4jncHeKu0FAh88zQW/jZst0Sy7ac0Flb+sYyshMQNwlBMKwZeVvJFtzcogaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XM+TBrs6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84243606A31C;
	Mon,  9 Nov 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XM+TBrs6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC821F0089F;
	Mon,  9 Nov 2026 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218499;
	bh=u7i9Jegrymse5jYW/nuIjFSVf/yelpcmNA/2X5G1/LA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XM+TBrs6oKhd7aKCmsI5RYPzjxw0YqPHiVjIDO7X0JhcAm+brDA1dUCnn1KShe8bf
	 Sj4+pHlBOk5qLOHd/Y61hINhxILwmeOMnc4PYXoMZwPHKr8Re2fAhnwnciebO3XPyM
	 tyCe34DHTeJNx/dujU0UuBEkbXMMh86VK4BSmCHaJpsXeXaPb8y6KZk+92KjUgYatC
	 cdHxhUL04zJDY8D6PvixurnzURDrH1b8SOmKLa2xkJaosvo6FNDQ6eUbm6SGxyd62x
	 bcs/fuVDltYJAw3N8DB69pBRpMHjlhXPx2omxsFTR1wCVXkzDiav2k3xTmEuP5kMEL
	 4u0uWbkjADIuA==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Beno=C3=AEt?= Monin
 <benoit.monin@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Radu
 Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 2/4] irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI
 controller driver
In-Reply-To: <20261104-eyeq5_msi-v3-2-2866f732cd38@bootlin.com>
References: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
 <20261104-eyeq5_msi-v3-2-2866f732cd38@bootlin.com>
Date: Mon, 09 Nov 2026 11:01:35 +0100
Message-ID: <87se1auxvk.ffs@fw13>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026 at 13:58, Gregory CLEMENT wrote:
> +
> +	i = 0;
> +	for_each_set_bit(bit, reserved, EYEQ_MSI_MAX_VECTORS) {
> +		irq_domain_set_info(domain, virq + i++, bit, &eyeq_msi_irq_chip,
> +				    msi, handle_edge_irq, NULL, NULL);

Ok. So you addressed that part, but the rest of the comments I made on
V2 still apply. This patch also requires a review ideally from Vladimir 

