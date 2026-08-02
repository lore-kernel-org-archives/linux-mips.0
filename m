Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8370C2EA468;
	Sun,  2 Aug 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698797; cv=none; b=H/NfIbD/SoTRjyuANdHhgbQZyiPPJuMjVw1A51SJoU5OzrudjalyY83r6renfkFxp8LU7oFpwipwRzhqdZ0bfkehV1nsQVMrSkL1LaiDD2muj0EH9U+Vsb5bAYzlc/HQl5TYEfZG1jWrkDTcKoqFqwoI3WU8966zTN065zXJWpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698797; c=relaxed/simple;
	bh=OJwu/Rx9Nv01SfMb+zwmaIvdjHDuU0wxInqTcDr0tAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FbzKQDztUcHjf5SIjeZALmVOqcmUUQnvhMbfIZGGOh9ukZCjHzz6J0Wmg73rBbAVHuu67+cC72c6+wZda76RxPvvULfwEyCaUJx9OM1f2M37AOfqBiSAXRZaYjkumWmygNNQ2jquWZ06a9Inzm8F3aTbFhwt8/Vlev0174R+eqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=HwNmo0dE; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="HwNmo0dE"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 005DFCC492;
	Sun,  2 Aug 2026 22:26:31 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 005DFCC492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785698793;
	bh=gCwubzfW8cVuhl0mfA+FQdWOPUb0ZI8VMh35ssY6HW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HwNmo0dEWRQMyOtUCa1liEDloQuqxYLnhe+1PMm2D3P1zUfO+t6HpLN6/1SbCyzKr
	 N3v2f0y8EMnndTa+6rr+BIWnABDm2Y4y2fo+w/J0mgvS73HAyUmcGAj19yfLLbGCvQ
	 MYXq8HdQWsWf5tZTi7ZGdV4K6poqll2K/Uq8KivvEcs/IrbUyTKYJwF9nXYbydnm9I
	 MFgpNZfPGGRwmWo7CZFWsftMtHegDbzdVLE1iaS0CondwkxDjcnHTRaaXgJmH0ScQr
	 QFMXm9opIuS8UjZRnJjHId3Mvlg9yD8wotPMa6yT/anvmxa8lrlkW4Qw/rah4P2/dH
	 thqampR2wL3Nw==
Message-ID: <b5317094029786e38ec2b42dc49319afff59762b.camel@rendec.net>
Subject: Re: [PATCH 08/16] irqchip/mips-gic: clean up if IPI domain
 registration fails
From: Radu Rendec <radu@rendec.net>
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Haofeng
 Li	 <lihaofeng@kylinos.cn>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Samuel Holland <samuel@sholland.org>, Marc
 Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org
Date: Sun, 02 Aug 2026 15:26:30 -0400
In-Reply-To: <tencent_63B40FEEA9049AB3A522A50D2CF58ECA560A@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
	 <20260714132453.3302672-1-920484857@qq.com>
	 <tencent_63B40FEEA9049AB3A522A50D2CF58ECA560A@qq.com>
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
> If gic_register_ipi_domain() fails, the primary IRQ domain and the
> mapped register base are left allocated.
>=20
> At this point the CPU interrupt handler has not yet been published.
> Remove the primary domain, unmap the register base, and clear both
> global pointers before returning the error.

IMO this patch should be squashed into the previous one in the series
because it fixes a similar problem in the same function of the same
driver, and the change is very much related.

But please see my comments to the previous patch. I think you are
trying to fix a problem that does not exist.

> Fixes: 8190cc572981 ("irqchip/mips-gic: Only register IPI domain when SMP=
 is enabled")
>=20
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
> =C2=A0drivers/irqchip/irq-mips-gic.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gi=
c.c
> index 85fe0d8a34c5..2f2ba54f227f 100644
> --- a/drivers/irqchip/irq-mips-gic.c
> +++ b/drivers/irqchip/irq-mips-gic.c
> @@ -968,8 +968,13 @@ static int __init gic_of_init(struct device_node *no=
de,
> =C2=A0	}
> =C2=A0
> =C2=A0	ret =3D gic_register_ipi_domain(node);
> -	if (ret)
> +	if (ret) {
> +		irq_domain_remove(gic_irq_domain);
> +		gic_irq_domain =3D NULL;
> +		iounmap(mips_gic_base);
> +		mips_gic_base =3D NULL;
> =C2=A0		return ret;
> +	}
> =C2=A0
> =C2=A0	if (cpu_has_veic) {
> =C2=A0		/* Always use vector 1 in EIC mode */
