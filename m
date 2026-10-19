Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422119;
	b=31niYRlgogyLbC8z88CK1F5VW6Crk0CpuH5MUgq/dXnpvEJQuvy5RfnpxG8FFlZiW2Ck
	 L0j+gDoA/6A0EtPF6tUSF40BdSiCEjNvFtCffVI/luzs/z82TqtHUVlkoqWr7exyqADgL
	 x29kUybLo/COWKxpJDJZx+M+odpBtboeYUuYoYSV0SEgAtPkOHkcXvgBqGS8NXt4vJG23
	 KbD3pjCnM2D4oA/jaxXD9FFqo8NsmJNB2XNQIko48cJ7tGTzvkPf42j/uqrO+Z3qJpuRr
	 sUL0QA5lzXjbeqET+Xu1tJEntZn+XYIzv750UTQDyYPKrWhAScDy5dvr3MNaYf8zxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=V5Scv+S8IrXgj+5/CeTTqsxC/iiG0yrpaL3kmiKglBQ=;
	b=vtlp5SOB0gudF0DC+TJt0PZ2X3MRvJL7MK90KlzAk/XnjhZA/RHWNNWRzOfYtRuurvTK
	 l/hC//LZfi+9uudW3kkhWRMc2CIyUO85Ri6rQhf9bPkfCj51HrCGHCH4Cu8ufIBGO4tq7
	 otuXSgLrqLm6+S1+YH2sVl1L1neU2N8BQjsv9gSKpHiWM6RvUEGMhhBl+sbob4zehiDLm
	 N4AdJ9H5JQiCAyvpWCfPAKkTXrxt20incyUfa0idO5T+CGArjqrYD89dhoMyzqMsgoGLl
	 0JYW50hOLUc3m92agcho+U1dwkDEkADrrcT+avE11j2MWiJ2W5WAkMw5HtcRKuJo6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F50D607AF38
	for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F50D607AF38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5e6b5794d26so2289057e0c.1
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 08:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422117; x=1793026917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5Scv+S8IrXgj+5/CeTTqsxC/iiG0yrpaL3kmiKglBQ=;
        b=fFed6MgDx7+Gur58EhIwxq3ku8v0ScRJe/b1bf+WZA6V8I8hOjBG9ltYkqvForwkOg
         An7Aj0Zdjsalyo4VVTHb28KQd7lvFp49mVCOrbzTXvYtbbTJVQ7CJi0z1HcozrhQ7RDT
         crPzyF5uJ1+Aha/JnjPHPuXXpFcY+smYUjH/PhdNE48tlptjgO6Cag1aHqUNwjTZfRaJ
         sICM/Gd4j+PXt4p30L8dxroucZyCW1li8z/hMjFlsiJ0cDvL+svh7+aBgwdbFKgQiPEy
         1h7rs0ud7/N8s35WOM+L1Bcy2OttstKM7T7dbke1oLON0XKblXpJxpkB4o+Cuo1v4VyQ
         jcPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzohhSbmMRNyVxMIlgCeRgUrl8t1wK4pZVBxpCKPVeDW2x+0mG6LOmFXQGpEakxmvEY3BPsgOR0IvNT@vger.kernel.org
X-Gm-Message-State: AFq9FYKFgRRdw41sosT9Tx2yk1D4crq8P78stf2Ox4fuSccakaDxa8mu
	U6G5QmaI1kViaXxAasF8UOk1T/9y1teG67vGQ7ajURFlWkohGmb2pbDK21Q8oiUSApU=
X-Gm-Gg: AYBFou33v+JtLCzUrv5QxKYe812X6sGSoVwpWC2JPlRxqCHpYo/TYJQwY5gO27/43y+
	RlI0WeKchwiHnE4VKNFqMYQ4StMflWAKcUbj+AYi1BoRRSNvrctdIZJl1VvHEcNxxmjMDBNE3XR
	lwqWgJgVwTb6lud2/ilZOu587w5DClX3xFB1gKpcy0LKtrJy7rFBbods5VaIizTBplgoyicNLGw
	B4y/9Dtl1ZmCEmS8ALboeHoPM0srNZpt18eX5kzGEHwh/sQIyymt0Wqb1nYuT12H/kdRLOkHfY+
	ybWxyhsYevYTUMTqEzlXznnii22boLqIKC7AGkdc1LCEzM3P4RYWuPxxzIlyAzz7GdWV1IyLqNR
	ibUPGh0e9u13oHhspOuq1fhYhaSxsNCYAqBSlo9i6rWbe8WJdemx3OMYMpYqJ3mg480Uil+ipu/
	BSBvWTEEzAf7SBivGDlZIXugBUz3LRfi8SU3VIMQXiPBAbFjkphlg+dernX/LhF7dsHt3e7Q2uH
	V58SS3wFAvSNOwodcy2S26QHK1WNfgk0qCRq2ZVtosIRcrh4Co=
X-Received: by 2002:a05:6123:4157:b0:5e8:4f3c:bff4 with SMTP id 71dfb90a1353d-5ea97dca682mr2014023e0c.2.1792422115915;
        Mon, 19 Oct 2026 08:01:55 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb335be9sm407758241.3.2026.10.19.08.01.54
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 08:01:55 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so2163857e0c.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Oct 2026 08:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWLEXTH0TblsD+zGcUfyFg8JiDAIk8aKJicSdH/ywg/9eB9HqmQ7vU7AabcQNFsc+0MShzvFuhxcK6@vger.kernel.org
X-Received: by 2002:a05:6122:25f9:b0:5ea:bc01:a2f9 with SMTP id
 71dfb90a1353d-5eabc01a9b5mr1023930e0c.0.1792422113935; Mon, 19 Oct 2026
 08:01:53 -0700 (PDT)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
 <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk> <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
 <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610191519120.22065@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 17:01:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
X-Gm-Features: AclHuK-kMNll2TJ6SQ0HmyWWYBoxtNWt2Z3yCcXPLPClFSyKDfXs1dfr7tIH4kE
Message-ID: <CAMuHMdXCKXN5PiDwRJiEj9aBGcU0J+H=q5tQoO7OfPEboCWGJg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

On Mon, 19 Oct 2026 at 16:47, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> > >  So oddly enough we're missing Tx49 support in the toolchain and we've
> > > only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> > > because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> > > which in turn disables stuff in arch/mips/lib/memcpy.S.
> > >
> > >  Quite straighforward to fix in binutils since docs are available (as in:
> > > I have a copy), but do we have any users?  Geert?
> >
> > Yes, I still boot test rbtx4927 regularly.
>
>  Thanks for confirming.
>
> > I never touched binutils sources, though...
>
>  No worries, this seems straightforward: just PREF, MADD/U plus [D]MULT/U
> extensions, and DERET/SDBBP debug stuff, much of which shared with the
> Tx39 we already support, so just a matter of sticking another flag onto
> the existing opcode table entries.
>
>  I'd estimate it as one day worth of engineering effort plus maybe another
> one for machines to work through verification, for the binutils side and
> the associated changes needed for GCC, i.e. a `-march=' option update plus
> maybe enabling a couple of existing machine description patterns for the
> Tx49 too.  Would you be able to run GCC verification with your system?

The rbtx4927 is about the slowest system I still do regular testing on.
It uses a Debian 8 nfsroot (over 10 Mbps Ethernet), which is the latest
Debian release still supporting the instruction subset suppported
by TX49XX.
So as long as no native compilation of large packages is required,
it can be done.  I can also give you remote access?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
