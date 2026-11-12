Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510621;
	b=0mB/xbW15fEVh1k7NghJsEnmWUQLxlb2hONB0QColFBx9FWtfYK1k5b9sp4xMkZF2GvY
	 8noCDeaVfgpRabUhUWCJ8/VNRrSeIMamk0HeHaaKgs9FtOjTTWJ4j92k76f3HdS5nA5Fe
	 7IagKQyaMnEAPaYZgjLxDWg1bscYIW76TiOAiA33ej5FVcwkhLrOEGI8yiJ9gWPEaraGU
	 murBQwRxHTPtNILpt2Au4o9MZbtdn236JSdCYE5S6U961Y2KOA/7ZU1i6SbGaITnQNKLJ
	 MPjG3NJCyV5Gjqa6V3k7clMBpF2ixIyiZf55/qB7q0prMP4P98tgzd8EzhsjlBh8rCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510621;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
	b=x/qoSVIX0N6DspOPoY/b+HJdGCRdf4hTz6WBD4pKJNZ8uZfCmrdKH9ssSN2MYGFl0ofi
	 n5YXfWbCBcd+SP2jqVF0ASJBSPo0M76rCUER/u60JwRAT+GSMyUnYD05ib/Tleq8yH3Ps
	 TXfXxH56vulN4Y4ldZHv2ZidN8BXKDyaoIvjMvV/pa4Z1Qst3bdmMM0Zr9JRE/Iqe5UGL
	 w7mW7REq63ap45R4bFtcxfDHcEzyKsxQx0K5i3ajuNwGOez5jqkxgTGNzD1U3CmEfxGts
	 DWEX6HdmN0FHnUfO1OV43RZ8ZzNr/FR3JR6Jeb51jBicSjgtoswbFeR5bBDUV1wqO0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E5260A2625
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 19:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E5260A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso81194e0c.3
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510620; x=1795115420;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BiDOWQWnXjiTVlwWz8It4XU8j0IkMRXtLOxSJ2sBmUk=;
        b=UIIbcZdO7yYH68DawMjBk2sNNYE58g5L3HI22G+DUZfyGTwI4auUb/lJnGMbsYN0Jo
         lv09ajbFlKBsFanQ3GPp4bJwpM8nLN1j2BNP4OjgAEC0gl5TFKCLOYjGsNu/WRtIVwQd
         xFeYTVdIIjDivxi/E9rNst2KsvwsmuXAp/jntjo27gTOYJ9ll6fW2hQvv799iZam2Jb0
         6DAQ6LkjBhxha8uf9KOf1FxlPAN0X7SzIfqzoDP2W/h/6Xkv604zPRKzoMcytMxdSZ8V
         2DCP9WTQpYz9q4ZIzdpSsuHCSuq4Gj+yOvg/sE34O9hdNTiQgtn8HLnrMBTIXSmnhIOU
         z3Mw==
X-Forwarded-Encrypted: i=1; AL+hErHVuEjKctVDBM7DlT5wxWoDn2DIjMxd+JJ1zUm6tpEN7shurGlOPNK0lRoML8RbP5Fw6Gg+zW0yZ2FA@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yesz/bs2/B/tqCBgbfKHycjpYVJHeWhhn9o3A2USpDx4v5zCY
	szwrvEKDqcEVT/YEIRkUhLKhokGnKoX9rl/eNcUu3qmysqHe1WpdtRqBBzBoKwBRtpI=
X-Gm-Gg: AYBFou05EhLVDuD2K4/bLX1mycLM0ex9Xt2XUwO2AULSx4yZLV2dkWd8+uh5h7tcSsG
	cN1UIaX2qlGQBIXV4YPbELQVmjP/pfq1sjVIWUO8W4h/ngDALlVNNkQ0yr293ZfXARW+J7f2pm9
	N/eVykcG1Qd88rOf5IF5Xcclf0KBy+dFlb+7dvhveijrrnV3fNb2jOt+vOekCjFr7NCwLM3SbmT
	+BqZLZU5IX4n+cNZchFHXdfvIJVOaio2ElNnPITTfqySCj09Bol7uXamQA4I/PsNpgkETBLImOt
	2kaDKUB8ow3KnyRrSwzjhTemCUK8rRB7SNRuCuX95sZ1hoH1xH/MteQR4kORNi31ZXWeqL+ahWl
	i5F592sku32YeomMrJP4meQUmE5PfxMMc5mXJ0r12en3R0GECH57GrKXwKkErGHNaD4D3iu+BgE
	T4Z2pUSIoM3+IEWVEAOVMKmv/hj/9a5a+Rkf1ICjY8AcDCvOhwHQxF03m97uMicvMiLJ4S0ozSb
	ryqYCskexB5vJh+2qwSsrlEpGDIErGNU7ffBxqJiRNcafa6H3O875KjcotkpRFzX2PbGCxClJrQ
	Lpg5syX4r5xyslDQ60uyft7WJ9fAHQDxHc3ehLWnzdi7+suZu5sxCBreg1HK7/ViMZZk
X-Received: by 2002:a05:6122:1d0d:b0:5ec:4112:6839 with SMTP id 71dfb90a1353d-5ee34aa3a38mr38391e0c.15.1794510619844;
        Thu, 12 Nov 2026 11:10:19 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34236017sm82313e0c.16.2026.11.12.11.10.18
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:10:18 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2ca055399so20987137.3
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 11:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEXEnrnL9Gl2lJ52NKyWevhYTagYtVaxqtmbXK11XqosGmYGaKql2h4hRQujlfGDFmD6UvWpVoKbF7K@vger.kernel.org
X-Received: by 2002:a05:6102:5ccb:b0:7ce:5952:125d with SMTP id
 ada2fe7eead31-7d64db29605mr42432137.36.1794510618289; Thu, 12 Nov 2026
 11:10:18 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org> <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 20:10:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
X-Gm-Features: AclHuK-k7G9fpVKu6BhCbcWfXavvnldoQZhCl9e2eioRf49lg5T7xpzAfc2z5gM
Message-ID: <CAMuHMdXgM_TMX7HrpsvDaQi96Ht-K6KTBu5PPRRBpcCegf3Q9g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in copy_oldmem_page()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao <leitao@debian.org>, 
	Chris Mason <mason@kernel.org>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
	kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 17:39, Christian Brauner <brauner@kernel.org> wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without checking
> whether the mapping worked. If it didn't, the copy reads from an offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
