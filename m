Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EAF488755
	for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392810; cv=none; b=bVWo4AInmJJtN1fnY3sx5VcDIzixKz13oPaz56QipKE7ljkEfhEKc33sZu/IGhbFBoU10ZD3bWM7QAxncjw5LQf90xYwI6vfnha4JS1S2N5p1hPbMQTrhPCYINJL3WLQ9gB2lReEMWjhAfhZjQZjzsk3sIEWsbjgEf238HctGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392810; c=relaxed/simple;
	bh=d4Ns9MrcjrkL74lU3nY8b1EUlzF1MbtrTa1z9FgniQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKhBpkkIydwAnIcEvXt7e9wgtlGoZf1gbttBfDwp2z7YQhFyCfwMnPaYhefvLjfSCHgCMJo4jXoJTg8+5Qf4MOm9BlKH0vX8GzocW3+bBksrRow0wc0JmozuFGVZQzIwTiYRe6QjxWlAsL7q5q8pnaljtikMBRcCtP2AcDZDTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso15168e0c.0
        for <linux-mips@vger.kernel.org>; Sun, 18 Oct 2026 23:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392807; x=1792997607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjJM139EIVeGEh8rWsgMbCEX7knwMHfAW0CurdOdiu8=;
        b=yHdbvRT70RCwTdQTSysXfD/7OtQJyNS4KBKM8kDgnMhQBmNiy5f7fTJkqIT31l6nsA
         x4fAsE49qlpkvdndp25EQnJ+J+ZPMl59ZZgch/Yu7dodKECspYS+eVuCXNhIy9id1otz
         bzK9g+3pmubvunl1K9VTi7Pw2hIT9cGYa/mjjKB6lnQrj0Cv4/ytHo6PLbSDf1txxEBC
         Rwp29pmgQw7J1o3kld8Dj7aUfmff28dirFxYdd5j9OSDU+Etci8EnKImFXg9wXf0Dp5P
         1+D0XI3m5s4QeX6KR+nQ0Gt+j9ZEMvP5BfNPaymdbgk1qTt+cw+8bl1jW4t9q31lCZtt
         Q7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/Z3l0EThuku+iISH9qRrrqSty/6WsrfcO5ut34Ly6ry7rhpFN++2dwOlDZCincHJqSrJeFonZ1XRZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKfoOi5D4i8r7WgqyNvaBFe5lrov3qlPArhRD34yUnfGJRMJpjU
	BzK9WzcyIHRzkEvxpbh+Bw9GZqURqRiS0EvogxbzoJNp7ESQyOeS3OtCQYsUEDnv
X-Gm-Gg: AYBFou2lGxIMbbclGHkyHpOs6ldbOcIjAWrl7DSnd8qsVqlMMx2WYlepeQn4rBeWjuB
	kCbbxOpfhV9oefETLPg+ZVEaUV3ogIOySvgFTg+Zc4tEqQfHGGt6+HC9z6bgw10/fqUaUSAvL1c
	ZsuVC5n/uDjGMCaJwJHFNyl5nNCRu3OUUsbGY9vLfC2pDoAq54i6HQLCRe+L9lqZgI/JqfuPBoR
	bCyFKaOpbLBZe+37dEJUa0vIr0/eC1DNqgU81B3vlOcbEAfeFFacTEqtdposXUEMlxCCeF0S7y7
	gvm6yA9AwFEXM9yTYAiauWGDt1vxtoMd8mTTB/8P4FRBrvLdm1ux/oaq/rHJLFaN6WiFNnzYaEN
	qVLgZh2RmrMqQImSBgHTjSh4FgwSDmI0YL7y0q0UZgUAeWH8JlZpPWtDDcs7mZSfPwVY+N8UbTt
	Dm1EPK3D/r9VrwIUaR9caFxTVQCoyHKT49SjL5iTAs2iba7ZVGNupsXzdXDsHLPMQCdfMXDUCBJ
	XEWTyrM84TdZqRh4GBHmFOIFUWN9IJXP40Bvnrcek4S45E7WEo=
X-Received: by 2002:a05:6122:8f0d:b0:5c9:c60e:3a41 with SMTP id 71dfb90a1353d-5eaaa688c8dmr2289326e0c.19.1792392807299;
        Sun, 18 Oct 2026 23:53:27 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b518bc8sm8853367e0c.11.2026.10.18.23.53.24
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:53:27 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac3b6b2ceso222377e0c.2
        for <linux-mips@vger.kernel.org>; Sun, 18 Oct 2026 23:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzciqW+CtH9XXBy4r1IPx6w21nFrDbiD+6VtpZ7ZiwtTJO/OwOk4c1AudMN2NNL9yBKfbHQSeyBsqdJ@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:7a1:f980:e93b with SMTP id
 ada2fe7eead31-7cc36a1726amr1724652137.23.1792392804446; Sun, 18 Oct 2026
 23:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
 <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 08:53:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
X-Gm-Features: AclHuK-hkOaUNvhawt4bfdwYbTv8-8VXt4ePnbu5KtWM6yoyqBrlCyoN2rObGDw
Message-ID: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

On Mon, 19 Oct 2026 at 01:26, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Tue, 13 Oct 2026, kernel test robot wrote:
> > config: mips-rbtx49xx_defconfig (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/config)
> > compiler: mips-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610131201.wWk11MLy-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    Assembler messages:
> > >> arch/mips/lib/csum_partial.S:202: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x100($4)'
> >    arch/mips/lib/csum_partial.S:203: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x120($4)'
> >    arch/mips/lib/csum_partial.S:204: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x140($4)'
> >    arch/mips/lib/csum_partial.S:205: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x160($4)'
>
>  So oddly enough we're missing Tx49 support in the toolchain and we've
> only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> which in turn disables stuff in arch/mips/lib/memcpy.S.
>
>  Quite straighforward to fix in binutils since docs are available (as in:
> I have a copy), but do we have any users?  Geert?

Yes, I still boot test rbtx4927 regularly.
I never touched binutils sources, though...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
