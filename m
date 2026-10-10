Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A63314C4;
	Sat, 10 Oct 2026 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791656311; cv=none; b=DKipgca25jZERBLG/fRqFxsVUfkiFNTQz7LpHDBi8mmcU/0KM53LHCukaetWBJuABgNGQvnxf5SuJJOlm2ckhTmtfqhWccVdKQ6C+2U8jIaimQopUJC25A3MmJftA3JIXMUmgZKt2Hp9RGYQLa6CjJX8ocsE/dfBJP8RO3jLCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791656311; c=relaxed/simple;
	bh=Qo64louV01f5nI8Xu6Q32opf0kDq79BfYBCtWY4FHc0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CsBcayVUDVdg95uzMoNPmYpn7ZzqrMPoE819BBDP1NzhCifkAoDCyI/6cF/RTL4dB+EHcHLT/ap9Sg5l+y2p05ITkT568o8zuUTfTYEHz27EB0a0kWerWMXaL9v8355Q1Ai8ykrSdKJcElezyFAFvX0ptNDlsueB9r1exo5Yxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSUqUjhs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSUqUjhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B979C1F000FF;
	Sat, 10 Oct 2026 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791656309;
	bh=MibGS/SpY0Ht5gaekMQ0o/eJhlHCrk+F8KrkjlZ3ZDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSUqUjhs8JB8WpDj8yztKXZhVbc6EY77S5ELQMVm6BCxtosTcbXOrLgMzqn+wgftU
	 DHlAeAf9bGGm+zhbrMa+05fUlij/t9lrqCDrv8kDeetGuUZ57Z3AZcixlZXfHsU/LF
	 VNm/8MGAlIyIGDFN9O7e+wFtUk87azQ+7c6Afd5VPuOUqZAvHx9hW/Adt0FOpJNZHb
	 B6ar9H9vf/wtdxHvPoIrSYYkLPu4unHPa24lA0wzNhy/tNgXzogAUYD5ko7fwbO8P0
	 RMtlaDTH8i7QRB2zR+Ur4Yb2Iyn3sNRuQMJjYjqmu00XakzraIbHgs1D2OCJWtY8RP
	 Z41ZWeOc79ZVA==
Message-ID: <sashiko-outbox-166799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mtd: cfi_cmdset_0002: implement point() for
 simple linear maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at, tsbogend@alpha.franken.de
Cc: dwmw2@infradead.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, ulli.kroll@googlemail.com, linux-mtd@lists.infradead.org, kaloz@openwrt.org, linusw@kernel.org, linux-kernel@vger.kernel.org, john@phrozen.org, nico@fluxnic.net
In-Reply-To: <20261010180840.2152492-3-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
 <20261010180840.2152492-3-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:18:28 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: cfi_cmdset_0002: FL_POINT deadlocks and hangs XIP erases via =
FL_XIP_WHILE_ERASING
--

commit 5f3b3543d5ee6dad5e8171d86ea7a290abab737e
Author: Orgad Shaneh <orgads@gmail.com>

mtd: cfi_cmdset_0002: implement point() for simple linear maps

This commit adds a point() and unpoint() pair for cfi_cmdset_0002, modeled
on cfi_intelext_point(), allowing linearly mapped chips to be scanned in
place. It handles FL_POINT operations and ensures that a point does not
suspend an erase, but waits for it to finish instead.

> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 517db2f2707f4..b0330839a2133 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c

[ ... ]

> @@ -906,8 +926,12 @@ static int get_chip(struct map_info *map, struct flc=
hip *chip, unsigned long adr
>  		return 0;
> =20
>  	case FL_ERASING:
> +		/*
> +		 * Not for a point: the erase would stay suspended for as
> +		 * long as it is held, which for cramfs is the whole mount.
> +		 */
>  		if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
> -		    !(mode =3D=3D FL_READY || mode =3D=3D FL_POINT ||
> +		    !(mode =3D=3D FL_READY ||
>  		    (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x2))))
>  			goto sleep;

[Severity: High]
This patch correctly prevents FL_POINT from suspending an erase here, but
does this also need to be applied to FL_XIP_WHILE_ERASING?

If mtd_point() is called during FL_XIP_WHILE_ERASING, get_chip() still
allows mode =3D=3D FL_POINT:

drivers/mtd/chips/cfi_cmdset_0002.c:get_chip() {
    ...
	case FL_XIP_WHILE_ERASING:
		if (mode !=3D FL_READY && mode !=3D FL_POINT &&
		    (!cfip || !(cfip->EraseSuspend&2)))
			goto sleep;
		chip->oldstate =3D chip->state;
		chip->state =3D FL_READY;
		return 0;
    ...
}

This allows do_point_onechip() to successfully change chip->state to FL_POI=
NT
while leaving chip->oldstate as FL_XIP_WHILE_ERASING.

[ ... ]

> @@ -960,8 +984,13 @@ static int get_chip(struct map_info *map, struct flc=
hip *chip, unsigned long adr
>  		return -EIO;
> =20
>  	case FL_POINT:
> -		/* Only if there's no operation suspended... */
> -		if (mode =3D=3D FL_READY && chip->oldstate =3D=3D FL_READY)
> +		/*
> +		 * Only if there's no operation suspended: the chip is in
> +		 * array mode, so reads, further points and the reboot
> +		 * reset (which only re-enters array mode) can go ahead.
> +		 */
> +		if ((mode =3D=3D FL_READY || mode =3D=3D FL_POINT ||
> +		     mode =3D=3D FL_SHUTDOWN) && chip->oldstate =3D=3D FL_READY)
>  			return 0;
>  		fallthrough;
>  	default:

[Severity: High]
If chip->oldstate is FL_XIP_WHILE_ERASING because it wasn't filtered out
above, will subsequent operations deadlock here?

Because oldstate is not FL_READY, normal read operations (FL_READY) would
fall through to the sleep block indefinitely until the point is released
(which for cramfs is the mount lifetime).

Could this also cause the XIP background erase loop to spin indefinitely
waiting for chip->state to return to FL_XIP_WHILE_ERASING?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010180840.2152=
492-1-orgads@gmail.com?part=3D2
