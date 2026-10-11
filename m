Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8B3043CF;
	Sun, 11 Oct 2026 06:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700787; cv=none; b=BDJauqXA4jyhbipcdHcExDLUIvpqR4wlrrtJm7J/nfrhsQYKj/+d52wPVBLAdw/Vgan3Ad3POOMbfA+78csni8iOSzTIFKv38dt56ruIOBZQtr2NUuPdCMiDtqzTg/jI35MEqR/1ERrS6fyZ73eCWPeKa2XLc+Pc08pJmt3rHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700787; c=relaxed/simple;
	bh=C5Rxy1xxYjielGyndIfYhv706RkItB1VEhDqvVi8v7c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=df7llGZ50gBKWIgQjHs/B1BsgD9KwAeW0cVw1AiImLhwsdNec+nn9bVFOJ2Yumw4FnlLsd75w8wG1I8cksQceIGzz6c0BgN1Vjj2XQL7HgqKpU0gft04CktMc8qHTNITG0gcQ/BJgBsHCaT54/4k/+Jk6rSrG5sQOrnVKBunYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VD4cxtcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VD4cxtcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B601F0089B;
	Sun, 11 Oct 2026 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791700786;
	bh=JeEJOoAQZinF5jq024suht+rQLWI0JuvVje59ye2Z2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VD4cxtcp2VHzq/DBwXdVnu5D5j5jn5CglTljQvtMyrb1dqq+SQFvM645n8iCbAzcF
	 dXKqNLD+sKGIByrnQFRnyWibE2Kj4MCOFmCjWWtpHwsGwFltqXjdWoIOLLAhvwCwQn
	 EOWrANlTKFLOJ7AyYVZ1Pv7FEF6ltg2qTohkYd74hvnELAVNXiV5uHshM6wS3zFlvz
	 xy8R2xjwsBnz/DGEERXErbv1ZfMAbbpAO/I8Anhx/kCnq/9pTZSQusePEERtWyQ4DM
	 PR8WAn/hrggKSn86zA45KJtLqfDQpwdXVEqRkYrzK+4r9XZN5/gZNnjX36adO0oWTv
	 K5aDZmlRDdxQw==
Message-ID: <sashiko-outbox-167073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] MIPS: Octeon: flash: use the simple map
 accessors without a shared eMMC
Reply-To: sashiko-reviews@lists.linux.dev
To: tsbogend@alpha.franken.de, "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mips@vger.kernel.org, nico@fluxnic.net, corbet@lwn.net, linux-doc@vger.kernel.org, john@phrozen.org, kaloz@openwrt.org, ulli.kroll@googlemail.com, linusw@kernel.org, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261011062908.2365879-4-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
 <20261011062908.2365879-4-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 06:39:45 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: cavium: global state corruption of flash_map on multiple prob=
es
--

commit c32cf6c857e3356732452178a52a4e739fcaf273
Author: Orgad Shaneh <orgads@gmail.com>

MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

This commit modifies the Octeon flash driver to conditionally use simple map
accessors when the bootbus is not shared with an eMMC host. Doing so avoids
unnecessary semaphore usage and enables MTD to use the point() method
for faster jffs2 mounts. It also adds early bank width validation before
mapping memory.

> diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-oct=
eon/flash_setup.c
> index 3395acde4d60a..5448d5139c640 100644
> --- a/arch/mips/cavium-octeon/flash_setup.c
> +++ b/arch/mips/cavium-octeon/flash_setup.c

[ ... ]

> @@ -102,11 +119,20 @@ static int octeon_flash_probe(struct platform_devic=
e *pdev)
>  		flash_map.virt =3D ioremap(flash_map.phys, flash_map.size);
>  		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
>  			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
> -		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
> -		flash_map.read =3D octeon_flash_map_read;
> -		flash_map.write =3D octeon_flash_map_write;
> -		flash_map.copy_from =3D octeon_flash_map_copy_from;
> -		flash_map.copy_to =3D octeon_flash_map_copy_to;
> +		/*
> +		 * The boot bus semaphore only serializes the flash against
> +		 * an eMMC host that shares the bus (the CIU3 parts have
> +		 * their own). Without one, use the simple accessors: they
> +		 * let MTD point at the flash, so jffs2 scans it in place.
> +		 */
> +		if (octeon_flash_bus_shared()) {
> +			flash_map.read =3D octeon_flash_map_read;
> +			flash_map.write =3D octeon_flash_map_write;
> +			flash_map.copy_from =3D octeon_flash_map_copy_from;
> +			flash_map.copy_to =3D octeon_flash_map_copy_to;
> +		} else {
> +			simple_map_init(&flash_map);
> +		}
>  		mymtd =3D do_map_probe("cfi_probe", &flash_map);

[Severity: High]
Can this cause global state corruption if multiple flash devices are probed?

Looking at arch/mips/cavium-octeon/flash_setup.c, flash_map is defined as a
single static struct map_info instance:

static struct map_info flash_map;

If multiple cfi-flash devices are present on the platform bus,
octeon_flash_probe() will be called for each of them. A second probe will
overwrite the phys, virt, size, and bankwidth fields of the shared flash_map
instance.

Since do_map_probe() passes a pointer to flash_map to the CFI layer, both
mtd_info instances will retain a reference to this single map via mtd->priv=
. Any
I/O on the first flash device would then use the mapped memory, size, and C=
FI
state of the second device, which could lead to data corruption.

Does it make sense to allocate struct map_info dynamically per device inste=
ad?

>  		if (mymtd) {
>  			mymtd->owner =3D THIS_MODULE;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011062908.2365=
879-1-orgads@gmail.com?part=3D3
