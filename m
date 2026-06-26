Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA03BB681
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467235; cv=none; b=BNLXoAn82M4yDGKgoDUb8DYdKbGux8YZPHnbHty4Ugm8Usz8p6FH5x/ReF1t/gurjwzDg6NE/blxlZ7QeCZdjyzk0OxohjOOHbh1AaeHxfpnPPzypJ7WbqwR3u8efrwA8O9xMlNlbUrv4B4IOjqG1uIl8B6j05e4qZiwGRLfVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467235; c=relaxed/simple;
	bh=JORIyGfUNTvACmKeU8PQXIshs3f+QZpUcfRRa11lOAk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ei52pVnx3eIR0KzexcTAh5H5LpNkfAv9KOzWB3E9aXhbW/niaDsis11Uy13v+dnez+5g7JKJLliav647pHxTmRzYh49tL1t4oZrTvcpl6Uam121PsmptcuzX8JNeizBun/9DNsgac7S011De23WPVjntEEz+4dZXmHcl+9xWeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xrlpubs6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xrlpubs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7731F00A3D
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782467234;
	bh=wHcula6AS66rDDmDjSHgXUf+8Nw6iJL+/3FJuqXZ76U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Xrlpubs6VEtfMFGO72dUfDMjiYgyMHJPHFOKMZ2Jj/DxqmAzQ/r4zRS/k0DVTXx/D
	 7oDQGjEAyjlEqVd+GKJIqK/r7837yac/dQTKIZsXv4szix7593VJCmz5LgtaDxrali
	 giJ9xVSZqRzANqhiRCFoEpOlqkQ/72C0x9EG1xEisbE4ZvsBmaYnL38djMVLDBPB/6
	 dT7AZHR8yQ1Bt6eUMNYlFF5dovLb/lk7oJ/7yMBMizaFt+S6Fk9hVAj4xpkyGpsPAV
	 jjMn5QX9tvpnqqbMuYOa3laGriPOoiOZ7XTwGfDa0iadWfqS0EOICO9K/34qo9NOih
	 hlJJAOHw4o3OQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ad5e719157so633943e87.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 02:47:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YyBLdo9EV2SgD+WT8yXhrEN4PBNZ5MQEuWqYOrgCA9HbDPhTyXS
	viiObLoTFtj+aJay0FUGo5IdJCPRso1mCKGok1xPPYVJ6l1T+uz2DwKpTHpviI2egK+G1kQrJWx
	5gQCCPMEU19e4iUEBKNdCqvOktf8pTn7oPcq15cQInQ==
X-Received: by 2002:a05:6512:450a:b0:5ad:49c7:89ac with SMTP id
 2adb3069b0e04-5aea1f50fbdmr2002923e87.40.1782467233246; Fri, 26 Jun 2026
 02:47:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 02:47:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 02:47:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <cover.1782389357.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 02:47:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeOCELMO7-JX1NVbMeymushdYJLXQ7ukg9X00QC=xs6BQ@mail.gmail.com>
X-Gm-Features: AVVi8CeoAQ8sP43RZ84rcAi4SC2q6m5aXOPCG5l5PaTHlHUyzvjYZ9ghvsa3wTM
Message-ID: <CAMRc=MeOCELMO7-JX1NVbMeymushdYJLXQ7ukg9X00QC=xs6BQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jun 2026 14:19:21 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> 	Hi all,
>
> This patch series gets rid of legacy GPIO interface usage on the MIPS
> RBTX4927 development board, preceded and followed by some cleanups.
> No blinky LEDs were harmed during the production of this series.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (9):
>   MIPS: TXX9: Remove tx4938_spi_init() and txx9_spi_init()
>   MIPS: TXX9: Remove txx9_7segled_*() forward declarations
>   MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR
>   MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
>   MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
>   MIPS: TXX9: Use GPIO lookup table for iocled LEDs
>   MIPS: TXX9: Drop GPIOLIB_LEGACY select
>   MIPS: TXX9: Convert gpio_txx9 to dynamic GPIO base allocation
>   MIPS: TXX9: Clean up txx9_iocled_init()
>
>  arch/mips/include/asm/txx9/generic.h  |  9 +-----
>  arch/mips/include/asm/txx9/tx4938.h   |  1 -
>  arch/mips/include/asm/txx9pio.h       |  3 +-
>  arch/mips/kernel/gpio_txx9.c          |  5 ++-
>  arch/mips/txx9/Kconfig                |  1 -
>  arch/mips/txx9/generic/setup.c        | 45 ++++++++++-----------------
>  arch/mips/txx9/generic/setup_tx4938.c |  6 ----
>  arch/mips/txx9/rbtx4927/setup.c       | 36 ++++++++++++++++-----
>  8 files changed, 49 insertions(+), 57 deletions(-)
>
> --

For the series:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko sashikos as usual but it points out issues in error paths in legacy
board files so we can safely ignore them.

Bart
