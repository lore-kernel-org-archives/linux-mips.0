Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B864A1A38F9;
	Sat, 10 Oct 2026 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791653490; cv=none; b=lKQhUmK96rc9HYbfsHmPuNzHs2J2YcXt8MK0z1acVq7h78FBcJd6tqzDW4quNSKcvCWEVleLMXxXJwW6FmVjUJlEI1j6Lj7MPAIbNBMr2JQFDW6Q5IXe1OnntmuYn6n770/2XS/920RAccG85ux/4KxtRdMtO63T16b16Z01FIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791653490; c=relaxed/simple;
	bh=NVE6Rh/E5k7WkcHdBkMG1bVKERtxouFK2fzY6k08J6g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YW2PRnk5XuKCYmopJ1MoKtmsmftJnEqDTLdTiMGcEwwCkdjXtifeiRaGeVmworyCGCmiH5vTptMMoj5Tx5g8nUWJNa68e/KC0IS7RUbCM34rOrwVl1KE/eLAeGJRIm6axjQWTk5t6PHqakMnHscUdhOtGdW7P0uMYsfMcQbs9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKx3XTd6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKx3XTd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD61F000FF;
	Sat, 10 Oct 2026 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791653489;
	bh=h9jtH9reVT3fZzQKDLHU9yAmjKZCqBwACroPOlpRMHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IKx3XTd6My+kUNSfwPz94dRUrgVt7tqZrpqPuo5AMiEeEew4nWoIqHGLlCvgEmjym
	 +yXZg02ZT22507rcGB8H/f88aK8MHvlZ5nWgzUWVONilFqkYMXiQ+y3G3myuwHivpl
	 KfCkjUdHv/rRZACsnKSz7jYIHZngU67VTG5hUpYbwGX6PHloqJhqzSKm/5x/tZIJM/
	 WcGEjN1iyjp8vRKQODFM1mdHQo/7XF9Ou+ZIBgksj4mzTjtWQoQkRsV3ikLPY4U0J8
	 ZPsPwn+/Wu/z24vV2NXdWpOEy1s/AnT4ytWlM3+gwFID0O+hfLMkd/wkznG9xV7aED
	 Wa6vOhB/+WhwQ==
Message-ID: <sashiko-outbox-166777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mtd: cfi_cmdset_0002: implement point() for simple
 linear maps
Reply-To: sashiko-reviews@lists.linux.dev
To: vigneshr@ti.com, "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, tsbogend@alpha.franken.de, richard@nod.at
Cc: linusw@kernel.org, corbet@lwn.net, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, john@phrozen.org, kaloz@openwrt.org, ulli.kroll@googlemail.com, nico@fluxnic.net, dwmw2@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261010172142.2138956-3-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010172142.2138956-3-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:31:27 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: cfi_cmdset_0002: unbounded TASK_UNINTERRUPTIBLE sleep causes =
Hung Task Panic
--

commit 97c2e746b1f52c7744c56b40bf00fe410dca196f
Author: Orgad Shaneh <orgads@gmail.com>

mtd: cfi_cmdset_0002: implement point() for simple linear maps

This commit adds point() and unpoint() support for simple linear maps to
the cfi_cmdset_0002 driver. This allows filesystems like jffs2 or cramfs
to scan memory in place without copying every used eraseblock. When a chip
is pointed to, writes, erases, and sync operations wait for the unpoint.

> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 517db2f2707f4..67578fef02bfa 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c

[ ... ]

> @@ -960,8 +980,13 @@ static int get_chip(struct map_info *map, struct flc=
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

[Severity: High]
Does this logic in get_chip() cause unintended blocking when the chip has a
suspended operation?

If a filesystem like CramFS mounts an MTD partition and calls mtd_point(),
chip->state becomes FL_POINT indefinitely until unmount. If this point
happens while an erase is suspended (chip->oldstate =3D=3D FL_ERASING),
requests for FL_READY or FL_SHUTDOWN will fail the check for
chip->oldstate =3D=3D FL_READY.

They will then fall through to the default sleep path. Because the point is
held indefinitely by the filesystem, could this cause the reboot notifier
(FL_SHUTDOWN) to deadlock permanently?

>  	default:
>  	sleep:
>  		set_current_state(TASK_UNINTERRUPTIBLE);
>  		add_wait_queue(&chip->wq, &wait);
>  		mutex_unlock(&chip->mutex);
>  		schedule();
>  		remove_wait_queue(&chip->wq, &wait);
>  		mutex_lock(&chip->mutex);
>  		goto resettime;

[Severity: High]
Is it safe to use TASK_UNINTERRUPTIBLE for unbounded synchronization here?

When chip->state is FL_POINT (held long-term by a mounted filesystem), and
another task initiates a flash write, erase, or sync, get_chip() is called
with FL_WRITING, FL_ERASING, or FL_SYNCING. These modes do not match the
FL_POINT exceptions and fall through directly to this sleep block.

Since FL_POINT won't be released until the filesystem is unmounted, tasks
sleeping here will remain in TASK_UNINTERRUPTIBLE indefinitely. Could this
cause a hung task panic after the standard 120-second timeout, allowing a
local user to crash the system simply by running sync(2) while CramFS is
mounted?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010172142.2138=
956-1-orgads@gmail.com?part=3D2
