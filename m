Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5823AE191;
	Sun,  2 Aug 2026 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785688271; cv=none; b=pyJHV2nwY4LLPgvCDV9cbDhdEuwpZObb2AXAfogKm999VX+djxc4JCrKVoag4lPD2ffR6XaoJ9yLDPFZn2XJBs97f/B4xzoqEF5FMBegrYYz+hdkn0Ap94j+0EDbafE5cWvxG9rrz9erBr2K9DMuw4bZqsJNX07w1yfnMSk4thM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785688271; c=relaxed/simple;
	bh=GDV3b4u2THw5rwUjy9Si0m1tY33Km4wcCnRGRKAgwDI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MEZZfS954XaaA1VClVU+Ma6axd54YlNcGhskvfZEGnuW6CLb3ruQYM+jM/PCN1yRE6kIcjkxKMeeWCzapa4NLIe1+wYNW4pWiMVFB6Nz1rFAST9HZKPuECFfS6ASTg69nAv3bzg7p11iPtln+TqH5PPC+pX6LBIr3+rcXjnbVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=hZnCVe6I; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="hZnCVe6I"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id CBA85CC39E;
	Sun,  2 Aug 2026 19:31:04 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro CBA85CC39E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785688266;
	bh=WLktpL3sm3a9u/Rhlh3bVwZqsCjRE0UfXr0Dsx6NHhw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hZnCVe6Iixr60koF/cxgxLGyP63Q1f1ZQyyJ1SBSNsQYNQphFL1ikX3SrWD3ipILh
	 YYO8gXfs6+DiS2h/+sWBbO/hrHe3RyW6UrhgOG27AqtEmHmLa7jX71lOTNoYhK6a81
	 UKoBVoOwZbyJ6o76CYhjvh8FLGUe3ZtKY5+8Krb1ouA8K/kv6pgG0n1ES0++1CJUpw
	 KRL8/NIr66/YQI2YJSFUpBYaColfowwSEYVeIeC2zY9Yp71G1ruVocj+2LpuAOvrEo
	 kW1YNJGMGte2xeCJlROe+yOT0XPNqoqHH5u0CNDfJPaqRGQPUozwKdTFNWuaNsOi1x
	 FqKw29Ey7RM/g==
Message-ID: <5b1f32679b7afb168d5e13f3230c1d86a0b6a777.camel@rendec.net>
Subject: Re: [PATCH 06/16] irqchip/loongson-liointc: unmap per-core iomaps
 on error
From: Radu Rendec <radu@rendec.net>
To: Haofeng Li <920484857@qq.com>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Haofeng
 Li	 <lihaofeng@kylinos.cn>, Huacai Chen <chenhuacai@kernel.org>, Jiaxun
 Yang	 <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>, Marc
 Zyngier	 <maz@kernel.org>, linux-mips@vger.kernel.org
Date: Sun, 02 Aug 2026 12:31:03 -0400
In-Reply-To: <tencent_296C6E48B9034EBD75B25CEDA27B86815D08@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
	 <20260714132453.3302672-1-920484857@qq.com>
	 <tencent_296C6E48B9034EBD75B25CEDA27B86815D08@qq.com>
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
> For revision > 1, liointc_init() maps per-core ISR regions with
> of_iomap(). out_iounmap only unmapped the main base, leaking successful
> per-core mappings on later failures.
>=20
> On the error path, iounmap any core_isr entry that is not an offset into
> the main base mapping.
>=20
> Fixes: 0858ed035a85 ("irqchip/loongson-liointc: Add ACPI init support")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> ---
> =C2=A0drivers/irqchip/irq-loongson-liointc.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq=
-loongson-liointc.c
> index cf44a333b9c8..6451d8b466ce 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -312,6 +312,14 @@ static int liointc_init(phys_addr_t addr, unsigned l=
ong size, int revision,
> =C2=A0out_free_domain:
> =C2=A0	irq_domain_remove(domain);
> =C2=A0out_iounmap:
> +	if (revision > 1) {
> +		for (i =3D 0; i < LIOINTC_NUM_CORES; i++) {
> +			void __iomem *core_base =3D base + LIOINTC_REG_INTC_STATUS(i);
> +
> +			if (priv->core_isr[i] && priv->core_isr[i] !=3D core_base)

The first condition here is unnecessary. It's safe to call iounmap()
with a NULL pointer (like most deallocation functions in Linux).

Can you please explain why the second condition is needed? Even if the
physical ranges happen to overlap, they are mapped independently via
the of_iomap() call earlier in the function. That allocates a separate
vm area (and a PTE) that still needs to be freed.

FWIW, in the two relevant device trees I could find, the physical
ranges do *not* overlap:
arch/loongarch/boot/dts/loongson-2k0500.dtsi
arch/loongarch/boot/dts/loongson-2k1000.dtsi

> +				iounmap(priv->core_isr[i]);
> +		}
> +	}
> =C2=A0	iounmap(base);
> =C2=A0out_free_priv:
> =C2=A0	kfree(priv);
