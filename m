Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871285;
	b=zCgdNSrVEMMqjZg6kE4rx6q5d/ZOzc6kGp9732rhFtYaWyZC+IoeUcD5GsK/9kXMQA8j
	 HHCJPbhtD730v8pylmfrvgJADJDXvS1jJwdu0CX2nonBzX28mmF/Y7y87IYLcTpiiWwa3
	 ZXKqxI1v22jnre1oKuAWa09QNTullutfoPA+kCcEDEkTmmWLyi7NPGnapj47YwiCTyNaw
	 n37SNG2pHX8YkSdYCpPfJ4trrhenDqpHNfqPHjskFlIXcO5xrpZUpZNASd0MDy6frY8ph
	 QvZZ+0Ehc0LrUuI7X2VZKNAFFzBw7h3tXASXBfTFxVGcZkJZ5sycUpJf8Q3OwJpmp5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871285;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
	b=k2lFZdapNuo97sXNSKiGrfkqWYlbJQBYa5sdlFpKq8hmijBlWK/KaWL+DGbYz1xP7T5k
	 a48AJgV1KEOTd2e/Q9G6hg6bMN1erAPORCljnHQCIwaUe9to7wB3Zetex+J5fRMEotHvK
	 zbCP+redpKGxceIdHHE32lmoMrHAi2t+BhCGf00fw1ISTpyNwYwxkOpjx+p8014daZJ8R
	 U8wVBp1HgT7oaDvk1rNiNGxekRMqMX/iIyb0Rot/h5o5W7TA64QivEAPF6Kegtd1E10L3
	 lCuMdof2ikXV6q+XJlpK27Q4qlIrufTWyBYugsS81XJRMTEgDqUhjb1SpGO6UhsHreQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB6606A32C
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 09:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EB6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so461159e0c.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 01:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871284; x=1794476084;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DpLYJIWgXoS5zQrloj/RgE/cGCpS34NjW3pzuN6S6xY=;
        b=HYCAl0FLApQtJcd1mIJFNoqkXqTQto5MnoBuRKfP4QHo5pj+uOGDLC9k6qPkNlK/9l
         bZF+iBf6KCvpW406YU3vQvaf3lNooBaLDhXeJnp2PXBJ0EA9SsJROlIqnqTWn0syUsF9
         oGAiDiFjSJpUU2CjBFzCBI4MEa8DVOsoYgQDrMyTLvi3ydMdq4yYah2eUkq71sz04tw+
         74PUY5RdqdIzFbZR7kZ4dsNVoYBWsuxe8Yxcf7C9dsWKH4CHcb0wLf18NFawPZz/XZ6z
         yisycAfDdu+HANhDyk+9sailP/a3G21ktI6k/cqBDbNsPIeKFB5F4Fd4NmGqFqN+zZ1X
         io7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRNziBJOAEpivMx8AjbSX1Iow3WPbwCYhKhCFm0OCv3C55fjeNjbnHUnfpLZqPRpcJX4hdLjvSSG8R@vger.kernel.org
X-Gm-Message-State: APuU4Z9LS40hd8L/uBaRAuqU9B7DC0giLsrNcYL0iZzWvtn7+YFT1FrN
	axd9FY9sglCfByqifZgl0GEUlDLK8Nar8YVs7dY9gCldc6WkAOEGgOpTS4peg154RQU=
X-Gm-Gg: AYBFou1Av2jo2iwHDv5mgRCYqo30T0qfBjsLjZxDU13DyWFGZdO6UtQOByHH2Elg+VC
	BinRUZnsRGLqXr4jKmlkDcpJRV7ykB+XqaZkiS/xvQM2p3nNDT2/jDbMOy5ybBz420IyP3CXQ69
	HuKZEIftMiKuCAcTPZiNEsrv031dfDdBTwWFCEmxd9cYYqjb4twEb36bR1erZNhwN9EACDSEtfo
	ulvHTzK8GyzmTUS+9U3w+geFORJei6tHlXqOUfYAVX33DIPOydCBFvUkwWqR5oNVCCkIe+4m4lZ
	eI0ec7SSlg0InSv8sZiypl5HvFw1QhDh2S8qFt1ua4m6reCcUA0o+p5AImXkflYv71jdv8g48Nt
	fQVY5hEhEGKNBuqNoFHCM8baGb+cLTdG4pgY8/hNDndHRsfLIkfXmATDLNcGBw8OPWOydVsQ7nS
	VoonkBXIBCZQDYzl4DvIyB4NLpoMnYepVKsn8KUmxIhxUcQKoINtp/0Z99XYuBL38+dMXGk3p01
	G0ZLF5PDmkmiPGoTDIxktGFi4VYz8OohFe7Wfx8uaLmjE9OvdLQjaZc5i01W1XoawP6T0jPGeTV
	OUleQBy2N2gMIRBfRn0BXP62apM1ohUBSQhRvPncvfVPmw45dLD4b+Ku9KCdvQUekA==
X-Received: by 2002:a05:6102:6047:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7d286b92e06mr956704137.38.1793871284412;
        Thu, 05 Nov 2026 01:34:44 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d212bsm4202383241.6.2026.11.05.01.34.43
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:34:43 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-78fb1fb9508so345507137.1
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 01:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwXB73jWwoBGqioZia2dc6b2TCAmO7vTXa3qjEbUcblB353vrWhTB4AeLWA3gqf/M1C878nbEfxrr+1@vger.kernel.org
X-Received: by 2002:a05:6102:3709:b0:7ca:5626:11e with SMTP id
 ada2fe7eead31-7d286b7fa17mr1126485137.36.1793871283167; Thu, 05 Nov 2026
 01:34:43 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105044046.52180-1-dennylin0707@gmail.com>
In-Reply-To: <20261105044046.52180-1-dennylin0707@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:34:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
X-Gm-Features: AclHuK8PYnqOIDpZItZg042mTleQ6jUe2E1wddINt5GGmEiia8n8vhGDZzRowiM
Message-ID: <CAMuHMdWzY9YRnGz1Y_60RYP7TH67q8fxi1VNWwkhhc0EUeSCFw@mail.gmail.com>
Subject: Re: [PATCH] omfs: remove the filesystem
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: me@bobcopeland.com, willy@infradead.org, brauner@kernel.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, akpm@linux-foundation.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, linux-karma-devel@lists.sourceforge.net, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 05:41, Hungyu Lin <dennylin0707@gmail.com> wrote:
> OMFS supports the on-disk format used by the long-discontinued Rio Karma
> music player and ReplayTV DVR. While reviewing a fix for incorrect block
> mapping on writes starting beyond EOF, Matthew suggested removing the
> filesystem instead of continuing to maintain it.
>
> Existing OMFS media can still be accessed using an older kernel with OMFS
> support.
>
> Remove the driver, its documentation and build configuration, the
> defconfig entries, and its name from the statmount selftest's filesystem
> list.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

>  arch/m68k/configs/amiga_defconfig             |   1 -
>  arch/m68k/configs/apollo_defconfig            |   1 -
>  arch/m68k/configs/atari_defconfig             |   1 -
>  arch/m68k/configs/bvme6000_defconfig          |   1 -
>  arch/m68k/configs/hp300_defconfig             |   1 -
>  arch/m68k/configs/mac_defconfig               |   1 -
>  arch/m68k/configs/multi_defconfig             |   1 -
>  arch/m68k/configs/mvme147_defconfig           |   1 -
>  arch/m68k/configs/mvme16x_defconfig           |   1 -
>  arch/m68k/configs/q40_defconfig               |   1 -
>  arch/m68k/configs/sun3_defconfig              |   1 -
>  arch/m68k/configs/sun3x_defconfig             |   1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
