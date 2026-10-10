Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9561A38F9;
	Sat, 10 Oct 2026 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791653527; cv=none; b=h6I34QPNZ/CSUc1v4nAbtyoLzCgJyZtMcKm01p6IeZjDR5FdsXAxafDz6BFCRPA02UXS354MZpC0/ZpyoJPTaGHJ+Vt6n4YZ7YduXUssIZMyteebnEAUKnmYAoPmA4hHtFu2Bn3Lq5ZtUADIzqyYKv+cjm4wAUx8gWot4D/6uAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791653527; c=relaxed/simple;
	bh=g5wXzyRKjRO7EDueR6svTDpzjwrDKZ9xDhYyiHBcpVs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fMB0bdvslQPUnNgA+v8Cx0EgTifmjpJYuOpkXBJpcGf3A8/0ytvmq+QdODDDnRP0S9NRiJtp3aXTCa8mhHTj55YV4cPu7+gafLbgEdm7wEIe4b9+zKhHGSztf/2i3iQ1pOo0d0G46kxvBfm2Q1AzbTUavmQbLoAe6FlmEQUL1Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPjwLqH7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPjwLqH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402E51F000FF;
	Sat, 10 Oct 2026 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791653526;
	bh=IUWT7DJ5VKwNdScNJZ8XESSRx4a5ok3hMOTtULGo01c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPjwLqH7egSTzP1IkBPDk2TlfLdFTZdgB55PDKqpN1nkbztn5M6kEUVZXb3nKloLg
	 jxL61pFl8oKn7Mn8Hb0wMIKmhmRs4hj21xUkGNSh7/e+Z24AS0lBcv/RkePkZaPCTO
	 i6uT7shFGhXDdWrhrPceSx857jgMV0Tk1k1XZfAvP9dJUm3eIKuuiXZx9XIwBD9aIf
	 5C/g92ER491xKjr5V6rF65IBatxFdEio7Yce4jCr9EMtWzVoUbDdv2qngluQrq9MMM
	 eO2tl0hr6LmbXlroecDhljh6eT6GsRvzlX543jP7mKq+GzdRbyWZpIOgTncJTVr0p/
	 hfBKLbw4XrN8w==
Message-ID: <sashiko-outbox-166778@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] MIPS: Octeon: flash: use the simple map accessors
 without a shared eMMC
Reply-To: sashiko-reviews@lists.linux.dev
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, "Orgad
 Shaneh" <orgads@gmail.com>, tsbogend@alpha.franken.de
Cc: dwmw2@infradead.org, ulli.kroll@googlemail.com, corbet@lwn.net, kaloz@openwrt.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linusw@kernel.org, nico@fluxnic.net, linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org, john@phrozen.org
In-Reply-To: <20261010172142.2138956-4-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010172142.2138956-4-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:32:04 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mips: cavium-octeon: global state corruption on multiple flash pro=
bes
--

commit 9e242ec4162d9c7c06bd10d98f2bbfb32869d150
Author: Orgad Shaneh <orgads@gmail.com>

MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

This patch updates the Cavium Octeon flash setup to use simple map accessors
when there is no shared eMMC host on the boot bus. It also changes the flash
bank width check to fail and unmap the memory if unsupported, rather than
just warning.

> diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-oct=
eon/flash_setup.c
> index 3395acde4d60a..28fbe3d15c956 100644
> --- a/arch/mips/cavium-octeon/flash_setup.c
> +++ b/arch/mips/cavium-octeon/flash_setup.c
[ ... ]
> @@ -102,11 +113,26 @@ static int octeon_flash_probe(struct platform_devic=
e *pdev)
>  		flash_map.virt =3D ioremap(flash_map.phys, flash_map.size);
>  		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
>  			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
> -		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
> -		flash_map.read =3D octeon_flash_map_read;
> -		flash_map.write =3D octeon_flash_map_write;
> -		flash_map.copy_from =3D octeon_flash_map_copy_from;
> -		flash_map.copy_to =3D octeon_flash_map_copy_to;
> +		if (!map_bankwidth_supported(flash_map.bankwidth)) {
> +			pr_err("Unsupported flash bank width %d\n",
> +			       flash_map.bankwidth);
> +			iounmap(flash_map.virt);
> +			return -EINVAL;
> +		}

[Severity: High]
Since flash_map is a static global structure, what happens if there are
multiple flash devices probed sequentially?

The line just above this block unconditionally overwrites flash_map.virt
with a new ioremap() on each probe, which appears to leak the previous
mapping and corrupt the state of any already-registered MTD device.

If octeon_flash_probe() executes a second time and fails the bank width che=
ck
here, it calls iounmap(flash_map.virt) and returns an error. Does this unmap
operation turn the first successfully probed MTD device's shared reference
into a dangling pointer, leading to an invalid memory access when the first
device is accessed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010172142.2138=
956-1-orgads@gmail.com?part=3D3
