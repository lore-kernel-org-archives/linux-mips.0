Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB03F361651;
	Sat, 10 Oct 2026 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791656312; cv=none; b=YDQrKu/nc3gD2eQGT8mJhzcrD1tq6hddWN2P5lWjRMy/azWidnz9jhwXABBPAN98RXJtss6c3HdMnxrITT7YseiKLfuj77ZM/ps1nu80DIcorhoUBodYXQN5AEgo4AVOlu0366QNG5Jb8Hu1cd9li9tM4UmNGCkCePqhLFWOpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791656312; c=relaxed/simple;
	bh=Bb3EZ/tIvgogzBCtsv68AWxR3iFdDr2vxZ4V6MFNBAg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=H7RCFW/9Ox5F18o9hAc8VcsHPTQL5MHKoFh5r59RiL1x9W2aKD7CWRmkhXgwaDba1YlZadERVG+28/OsLJ4E1taYsM6UVQVcz4fWnpwMRU0zuKWUMASWNgmcPy6s2/EEqQS7LXmApkVOLZa99rmWe9u8ipgsk3drsGbAv8TJp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1c+CjvO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1c+CjvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EC11F00893;
	Sat, 10 Oct 2026 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791656311;
	bh=DABjXQsbi9RuJVFUzsnDF0bYFa+oP4wh4gikf+ijQLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1c+CjvOo71L7B1Av8FxkrevRc5fo86Vym756a7Q8j43edRtcYc+TN5SgcT7SwE66
	 Wgxl5xa8TXoNRmWcs1vfEBUZCBLxhfnbPMz2vZ3mTy6zG29XmZAU84tszQTpWcKfLn
	 Z0u0ryJT3A3+VBu6gVdCXu5ZI+0Zg4joB0WrSWEjehEAqL5i0ZAhTydz5fBcnmUNvG
	 yoPQU/9tnc1Lzjkafe7Dr5R+eaK0bymsSrmefvbodKj1MdydEuOriItElCekQLdGKy
	 7GMeIsqGtdE/Bqj0qHelMXZYhFhoX4LgPZIA3bnGN1Sm80OnFy+b2PikUU30NMYlbB
	 oYqq39/dTPaiw==
Message-ID: <sashiko-outbox-166800@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] MIPS: Octeon: flash: use the simple map
 accessors without a shared eMMC
Reply-To: sashiko-reviews@lists.linux.dev
To: miquel.raynal@bootlin.com, "Orgad Shaneh" <orgads@gmail.com>, tsbogend@alpha.franken.de, richard@nod.at, vigneshr@ti.com
Cc: kaloz@openwrt.org, corbet@lwn.net, dwmw2@infradead.org, john@phrozen.org, linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linusw@kernel.org, linux-kernel@vger.kernel.org, nico@fluxnic.net, ulli.kroll@googlemail.com
In-Reply-To: <20261010180840.2152492-4-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
 <20261010180840.2152492-4-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:18:29 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mips: cavium-octeon: static map_info overwrite and memory leak i=
n octeon_flash_probe
--

commit 2d9aae5bb3f634f71b28d3ae93087e12e701fbe6
Author: Orgad Shaneh <orgads@gmail.com>

MIPS: Octeon: flash: use the simple map accessors without a shared eMMC

This commit updates the Octeon flash driver to use simple_map_init()
when the boot bus isn't shared with an eMMC host, reducing mount times
significantly. It also checks for supported bank widths earlier in the
probe function to avoid hitting BUG calls on unsupported widths.

> diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-oct=
eon/flash_setup.c
> index 3395acde4d60a..5448d5139c640 100644
> --- a/arch/mips/cavium-octeon/flash_setup.c
> +++ b/arch/mips/cavium-octeon/flash_setup.c

[ ... ]

> @@ -85,6 +96,12 @@ static int octeon_flash_probe(struct platform_device *=
pdev)
[ ... ]
>  		flash_map.size =3D 0x1fc00000 - flash_map.phys;
>  		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
>  		flash_map.bankwidth =3D region_cfg.s.width + 1;
>  		flash_map.virt =3D ioremap(flash_map.phys, flash_map.size);

[Severity: Medium]
If multiple flash devices are probed, does this unconditionally overwrite
the static flash_map.virt with a new ioremap() mapping?

If an earlier probe successfully registered an MTD device, overwriting
the singleton flash_map could corrupt the previous device's mapping.

>  		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
>  			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);

[ ... ]

>  		mymtd =3D do_map_probe("cfi_probe", &flash_map);
>  		if (mymtd) {
>  			mymtd->owner =3D THIS_MODULE;
>  			mtd_device_parse_register(mymtd, part_probe_types,
>  						  NULL, NULL, 0);
>  		} else {
>  			pr_err("Failed to register MTD device for flash\n");
>  		}

[Severity: Medium]
Is an iounmap(flash_map.virt) needed here when do_map_probe() fails?

Without it, this error path appears to leak the virtual mapping.

The v2 changelog mentions omitting iounmap() because it could unmap a
mapping that an earlier probe registered. However, since the static
flash_map.virt is unconditionally overwritten by ioremap() earlier in
this function, wouldn't the singleton already be corrupted if a prior
probe existed?

Skipping iounmap() in this path appears to just leak memory rather than
safely preserving any previous mapping.

>  	}
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010180840.2152=
492-1-orgads@gmail.com?part=3D3
