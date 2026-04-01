Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37F3C6A44
	for <linux-mips@vger.kernel.org>; Wed,  1 Apr 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033733; cv=none; b=V8dprCzr8cffz4//9auyGBC/K/jBl50Hc5QhXlQPUMWS/VkZQ+diNNOFMFivlA0Xa+B6IJUNumvTnaEgIjEohI4ghE0oeKNHYkZlH+DR1RO9r4+ROpK1SRqemYqib5N39s03W+fooVb+KaXfdA5KvdSGAcY9gx/ZKFhfS25njU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033733; c=relaxed/simple;
	bh=PLwE7ZRL+90SQiNMXF/jgGyBWAlL49+g6LjfNcljtzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8ohVgCwvF7uIozxRET7F82Pl201cxL4EWx+rMgX89KUGqTskFS0BZqFqulBEptGb4ZkZ8cyk9F7mgwk859oavFPv810Yfrq3ypMNqpefwqcr4VZULSZwDAOqXYWSWUZ4hDH1gO0z1ew4deB7KkfYDdOnBaUnBkk0pr+gAlSzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-60567e76830so446588137.0
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2026 01:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033730; x=1775638530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JovjSUZC1lNxdv0gpf2LIekR3ONpuaO8xMZDQYnx+qs=;
        b=Wi2oQJo8KZzRqEdLKRqxVV2KrmLvS0PfItyKkEcEnZFF6Iz7umfhmbCN8KeWnFHyH1
         x7jhjTHn85A+ih8zsa6pcGqodw3ROkeOP440ezGk9/0aSbjlqakbQLLu16YAjUY4S0QA
         wGUrwYf4iQ8yOewmM7Tx/Iep8PLKuXtRSr+mjUJoXhf6x4mhSu7kIc4hn06Vy95dIPd6
         QgWWrLzwvsap3+Ir6LiFDiw39lCOSbuk90X7maEtKFpeqqm01kLJYpf+q/kL97tZLviA
         7llUEI+G4Umsv9GRo6dqJTT/KswVIscNHSZufIYkOXYXv51smcV82J1XJCfoBb3zOOZJ
         HRCg==
X-Forwarded-Encrypted: i=1; AJvYcCV/+cyEGhriHXlawbNsV2qQfBPghke7/mMa6BE1xIF+Xb1gtjpwjiqJj8amrStHw05lH0s5f8C4R5hT@vger.kernel.org
X-Gm-Message-State: AOJu0YxI5CwenyupQ3owtwR2cZnXMyifRMpS426YGj6R2iAhqpP53QFC
	DhdFgsS+8FxDbIwk1UqX/HBGSY4shzGapkLP7orJfpCmLqWNfv8W5SuOAjuaEPIb
X-Gm-Gg: ATEYQzzNkZNDHpqqJShSSlsdF/AAzDtcPvTsE7e3dnr5g0Tr7pfZBDsge7Qya0g9iaI
	F72eu3UJhhMIZQ9dcAJDT3A1CF+7zP3aJmmJnRDXIbkMoa44pOoh1MnMtwEm4uoAxtU1lNwqnmw
	1l+e6349/nS46hDu1DOhcN5BzM6/G9wLQXKOZVoh/9rv728OnwZL5PuaEUIu0erZMySOxKYqyws
	aoUw1BeWT+3NHT6r19vTMtk6vSO3d6ZarHbaZX0WCSoqNcUILZVXXcjywTiwkGATgT+7vbZzPGm
	XIH9EG3uC7PoaBeGET0KUeQyR7ge60n89399GwE9IgFnIL6KG788U7iF15xbWTBo+g3q0V/ayBl
	V50qrBXwJ98vt969Q+nfZ+N+BMNDNA0u0zeEX5NAcqjEv1XrUkxyOYrhvL9+4kA/qfFAJ+hQfeK
	ItTzzrEwLJuoQ0hWZCfXmuyjjTqmW69XULsxIwot0P40OLP+SQuTDQqV0aZezn
X-Received: by 2002:a67:fa10:0:b0:5f8:e54c:2f72 with SMTP id ada2fe7eead31-60568119328mr767323137.20.1775033729782;
        Wed, 01 Apr 2026 01:55:29 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e259bc9sm13409403241.2.2026.04.01.01.55.28
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:55:29 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so3387024241.0
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2026 01:55:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSYQi4oemy73dLg+V2iRgkLMmmDTlwRKsDEBmUjrFakVIq6Kn8vgav4QTPHAUgYPQH47MesKRBZpXL@vger.kernel.org
X-Received: by 2002:a05:6102:14a5:b0:5ff:d434:b507 with SMTP id
 ada2fe7eead31-6056811633cmr1013502137.17.1775033728220; Wed, 01 Apr 2026
 01:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401083242.214492-1-tzimmermann@suse.de>
In-Reply-To: <20260401083242.214492-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 10:55:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5B6LpZ5ffaOc0Et0PK+G=_c8yD5K8JynRwu5T8rHfsw@mail.gmail.com>
X-Gm-Features: AQROBzAaKXfPphxAx92Ddhxtbq8urMrWt59bUWKyg2D17bALeZWDk-W7fhNxXrk
Message-ID: <CAMuHMdX5B6LpZ5ffaOc0Et0PK+G=_c8yD5K8JynRwu5T8rHfsw@mail.gmail.com>
Subject: Re: [PATCH] arch/sh: Drop CONFIG_FIRMWARE_EDID from defconfig files
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	arnd@arndb.de, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

CC arm/mips/ppc, as you sent similar patches for these arches.

On Wed, 1 Apr 2026 at 10:40, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
> true here, so drop the lines from the defconfig files.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

Upon first look, your changes match the (current) dependencies
of FIRMWARE_EDID.  The dependency on X86 was added in commit
7e35fc7ab433683f ("video: Make CONFIG_FIRMWARE_EDID generally
available") in v6.17-rc1.
However, CONFIG_FIRMWARE_EDID also protects fb_firmware_edid(),
which seems to extract the EDID from the PCI ROM, and is thus not
x86-specific?  That function is only ever called by three fbdev drivers
(i810, nv, savagefb), though.

I assume none of these work on SuperH, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
