Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9162F532F;
	Sun,  2 Aug 2026 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698375; cv=none; b=KuzcWw+3zjAJHER8j/57baCQwE3DKxQykeGyJ7aj/i++Dro7CcZbAuDq/CFmD/aQUGF1l8gJ3tgHoFEeHfTtlD1wAL404S1paPLFLpGpHY41cN8q9NglHvrXSietcUAxX1Eh23DwzTVp07sHgw20DvNoTeVsskNjvGwsOgjHpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698375; c=relaxed/simple;
	bh=CSqd/D6u48XZ23fXkmz+uo6TwAbCSdvqVYBpkQyxKDg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BKe3qwS9tiBDOKrrT5j0PoIyOVVuVvqvMj/qnujW2rW1iaNGtDUqPXYdlN7l66hxAprINDZswHyXzqUsnQy/qHlukLZ5n6CuSToiZaivEADYqNVob9EKkGxhfBgEqRaiQrOuEstWFG7rfhh4O3/PdsxgkH+I2ysF7o6eyNEx79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=V+i8gHlv; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="V+i8gHlv"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 23FECCC492;
	Sun,  2 Aug 2026 22:19:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 23FECCC492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785698364;
	bh=n0NrpcorlCaXAORnPRxERteYQvquxhlHbdsTUgM2M9g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V+i8gHlvNotGemVqzt40A0WNm2+bP1SZUH/56s0fsvtoGUch6xNjl3SZkCU0HuoKD
	 Svz4cMzLYtv8d1UaUEkiQW4wDxjBnN164mAPTsG737EuacXGcTP1atZ+8HOq92a3hx
	 fpRYpi7rXna4AnKIEt1qnjEAAfaIpfymp8vnbyg9q6W7CCSEZTkLagYdb2bKNhz4H3
	 smsNF86GOpXzMzubhoAZpWxKPSTTbJ/z3SBZe5ckngiVSl6BlJgFQrrzsAFZkDbO7B
	 m0fO8SPEOGDUtYQ1TUMeVvPVLxmftChJRWRGpq1gpqRDPAQt+fYpnlKcXSVyfMcYyI
	 4/mazjXFDE64Q==
Message-ID: <b9f6cd2aa90ec2bbcf46d98695e52762d698d8b4.camel@rendec.net>
Subject: Re: [PATCH 07/16] irqchip/mips-gic: clean up IRQ domain creation
 failure
From: Radu Rendec <radu@rendec.net>
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Haofeng
 Li	 <lihaofeng@kylinos.cn>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, linux-mips@vger.kernel.org
Date: Sun, 02 Aug 2026 15:19:21 -0400
In-Reply-To: <tencent_BE6F86AC74FBD69E73A00D9B3552D1C06A06@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
	 <20260714132453.3302672-1-920484857@qq.com>
	 <tencent_BE6F86AC74FBD69E73A00D9B3552D1C06A06@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-07-14 at 21:24 +0800, Haofeng Li wrote:
> From: Haofeng Li <lihaofeng@kylinos.cn>
>=20
> After mapping the register base, irq_domain_create_simple() failure
> returns without unmapping it.

It does, but this driver is meant to initialize once during the (early)
kernel start-up and stay there for the rest of the kernel lifetime.
Also, this is the Global Interrupt Controller (GIC) driver. If this
fails to initialize, I very much doubt the system is usable anyway.

> The CPU chained or VEIC handler is also installed before either IRQ
> domain is ready. Unmapping the registers while that handler remains
> published would leave a path to unmapped MMIO,

... which is probably one of the reasons why the IO range was not
unmapped originally.

>  and a later IPI domain
> failure would expose a half-initialized controller.
>=20
> Unmap and clear the register base when primary domain creation fails,
> and publish the CPU interrupt handler only after both domains have
> been created successfully.

Why? Please see my point above about the role of this driver. This
driver not only has a fundamental role, but also has a different
lifecycle and does not follow the cleanup paradigm of a typical driver
that can be unloaded/reloaded/re-probed.

>=20
> Fixes: fbea754123ae ("irqchip: mips-gic: Inline __gic_init()")
>=20
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
> =C2=A0drivers/irqchip/irq-mips-gic.c | 24 +++++++++++++-----------
> =C2=A01 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gi=
c.c
> index 19a57c5e2b2e..85fe0d8a34c5 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -956,23 +956,14 @@ static int __init gic_of_init(struct device_node *n=
ode,
> =C2=A0	gic_shared_intrs =3D FIELD_GET(GIC_CONFIG_NUMINTERRUPTS, gicconfig=
);
> =C2=A0	gic_shared_intrs =3D (gic_shared_intrs + 1) * 8;
> =C2=A0
> -	if (cpu_has_veic) {
> -		/* Always use vector 1 in EIC mode */
> -		gic_cpu_pin =3D 0;
> -		set_vi_handler(gic_cpu_pin + GIC_PIN_TO_VEC_OFFSET,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __gic_irq_dispatch);
> -	} else {
> -		gic_cpu_pin =3D cpu_vec - GIC_CPU_PIN_OFFSET;
> -		irq_set_chained_handler(MIPS_CPU_IRQ_BASE + cpu_vec,
> -					gic_irq_dispatch);
> -	}
> -
> =C2=A0	gic_irq_domain =3D irq_domain_create_simple(of_fwnode_handle(node)=
,
> =C2=A0						=C2=A0 GIC_NUM_LOCAL_INTRS +
> =C2=A0						=C2=A0 gic_shared_intrs, 0,
> =C2=A0						=C2=A0 &gic_irq_domain_ops, NULL);
> =C2=A0	if (!gic_irq_domain) {
> =C2=A0		pr_err("Failed to add IRQ domain");
> +		iounmap(mips_gic_base);
> +		mips_gic_base =3D NULL;
> =C2=A0		return -ENXIO;
> =C2=A0	}
> =C2=A0
> @@ -980,6 +971,17 @@ static int __init gic_of_init(struct device_node *no=
de,
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> +	if (cpu_has_veic) {
> +		/* Always use vector 1 in EIC mode */
> +		gic_cpu_pin =3D 0;
> +		set_vi_handler(gic_cpu_pin + GIC_PIN_TO_VEC_OFFSET,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __gic_irq_dispatch);
> +	} else {
> +		gic_cpu_pin =3D cpu_vec - GIC_CPU_PIN_OFFSET;
> +		irq_set_chained_handler(MIPS_CPU_IRQ_BASE + cpu_vec,
> +					gic_irq_dispatch);
> +	}
> +
> =C2=A0	board_bind_eic_interrupt =3D &gic_bind_eic_interrupt;
> =C2=A0
> =C2=A0	/*
