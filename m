Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90293F65F9
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722323; cv=none; b=a3QjzOLY1pOqJfl8Zqi8Sdlt0C3pyhQwNaAcs4pBcnIbKmU4icHFJaijSmGtzVoEAD4zAvnSpM+M2vjIcEO7azfQjZmJiWRJ2LkKovUjTLWM+NSY8v+NmtFlZEqyp0z9TPnfB/7CCmeZh8ZbMEmmo6+nbh8s8mm4j8cdrTYH91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722323; c=relaxed/simple;
	bh=S2YOaxtQdi6QG/AVmwNg6keinWl60WoxMa9xPYTPTjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvJYo96SdEjggMTienbsDHoagVg8KQnqlfSrvFwpNyCrwSl8AqWEwamgHMn5LVsYMWFLTed4dYdqz/M/W6GWtCnJOSrSp3zaIaap3Fzz2NfR1wbbukWol+ImcjN4c3BbFvdg6dqeSlhwOc392Gm7oiGsvn+X+7B4Hae/o82sn5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ab0377d0b2so954034e0c.3
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 01:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782722321; x=1783327121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04ii8yk8L2rC2i4LLn0g5pk2Zun6f5/ExAFsCusWtvM=;
        b=NejBrLGnx/+YXlmsJLhR0WjO+phNuxUd3NFX9lkTFwU2awG2wN0dWU4JvkC/Gb4DXv
         8qON1IW9NvjEvk5QjqaMZuEJJED/pl2vC1iaFq/iNu9s0Ghwws2G+qlFvCrL+MI6iiQ9
         bVYPOkD6uFeLClDsYWrMSbwJiiySmObXPX5c5kIhgkKkOL5Sv1I2R62t3u5d/ZgguRzM
         F7JRUEqerVUguH9kWuh0tN0SkyhzLGs0ZPEBDiWfC9l+Yw1NWjAj5qV0ZV1eqh5OPeBL
         4bisSeXN0RpID0rziUNCwltyy0ELkr4MdT+4n1Vy1OlTBeb97aRtlepr7+O8fTKI0GrE
         UtEg==
X-Forwarded-Encrypted: i=1; AHgh+RrlCw3+jIlE7mhOLdwgJAwgxhEijGyXuzorMJmuOMwTZrCoeHLYn0fPBdv+DEPT2i2SoJov7yhcoqxP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx04qO8N62oZNgRmQ19DJ0vRnquL22pRbN3hOSy3ZZH0TMvLg4O
	H5tpNsn/Kfbo5/1Tokg3E3frldybK5UKPel/xfB2utEbq9orwrLMuaZnAJTgSNoG
X-Gm-Gg: AfdE7cmcQM8u1dsCF7XeEu1MtbijMqrYv7U458dBq3aZGUMESrWwb2RC3UR8YR54fEQ
	qbvOZ288ddqx6WYgsP38d500OfHGMu+4Yb31IaEFQRf3JFuY26/HENLv21y3ooMvgW+hyEzHNKt
	6jqWL8d++X4LKNPesNa0WUQ8PjTNoWSuYWh+9rQiJvovRF7lYDF59Dr3v8uFqmLXRTUXrVNF2hS
	KYrziENTXXBOnT89cTgHrNsIBXjDkiY8ffEq9q5kNhrXK8xJNJtGU91SjqmRMZLMSAB1GC4MjwD
	61tjE8mKvDKY5jHK0qE+uQiHXQJIYIG/pqGUVazPjnayD3P+BLpkjViwaLKL9eI/jJ54Is0lPS2
	ZnCFWThqABEbqaKlUdgr/58mBo50bMj+w1ZMN7BzitswkS1oFKN8BiGdmGXvkLjKS0jiRHIDAeV
	KeD9QcxG1NSOZY4xMZ4qcZcZjAE4OJ8hv9TsztOaf5BePLQOkwQw==
X-Received: by 2002:a05:6123:420b:10b0:5bd:aa13:c9a6 with SMTP id 71dfb90a1353d-5bdaa13e036mr531262e0c.0.1782722320823;
        Mon, 29 Jun 2026 01:38:40 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd78e999c5sm5326031e0c.6.2026.06.29.01.38.39
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:38:39 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7387ac7d28cso213450137.1
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 01:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBzK+Qbi/Pq1Lg7+8bMV33iBWj9DvnbmZHceu2a2V0MsbAXt0shUCGApAkElulmGxPpIef6eY0wUMd@vger.kernel.org
X-Received: by 2002:a05:6102:d89:b0:632:88f6:d6ae with SMTP id
 ada2fe7eead31-734367c8106mr6364001137.22.1782722318721; Mon, 29 Jun 2026
 01:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org> <3615eba18ff6a9351ecb11d9f5a0c86ef7b0e670.1782389357.git.geert@linux-m68k.org>
 <tencent_58921190AD10FFE0501A235142CA54786B09@qq.com>
In-Reply-To: <tencent_58921190AD10FFE0501A235142CA54786B09@qq.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 10:38:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWfYCZwgX1Wv00ZALpk4GNSSnEMwZjo1zWL=5_H3OyQQ@mail.gmail.com>
X-Gm-Features: AVVi8CdpnUH32hqaglQnMeq_k6Bf99DAuybF4xeX8lRDAL_aN0eHjy9ZZecfqJ0
Message-ID: <CAMuHMdVWfYCZwgX1Wv00ZALpk4GNSSnEMwZjo1zWL=5_H3OyQQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
To: XIAO WU <xiaowu.417@qq.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiao,

On Sun, 28 Jun 2026 at 21:23, XIAO WU <xiaowu.417@qq.com> wrote:
> I came across the Sashiko AI review of this series and reproduced the
> use-after-free that it flagged in rbtx4927_gpioled_init() =E2=80=94 a KAS=
AN
> slab-use-after-free triggers when platform_device_add() fails on the
> error path.
>
> The Sashiko review is at:
> https://sashiko.dev/#/patchset/cover.1782389357.git.geert@linux-m68k.org
>
> In rbtx4927_gpioled_init() (arch/mips/txx9/rbtx4927/setup.c), this
> patch introduces a GPIO lookup table that references the platform
> device name.  The error path looks like:
>
> ```c
> pdev =3D platform_device_alloc("leds-gpio", 0);
> if (!pdev)
>      return;
> pdev->dev.platform_data =3D &pdata;
> if (platform_device_add(pdev))
>      platform_device_put(pdev);       // frees pdev on error!
> rbtx4927_gpioled_table.dev_id =3D dev_name(&pdev->dev);  // UAF!
> ```
>
> If platform_device_add() fails (e.g., because a device with the same
> name already exists in the platform bus), platform_device_put() drops
> the last reference and frees the struct platform_device.  The code then
> unconditionally calls dev_name(&pdev->dev) on the freed pointer, and
> assigns the dangling pointer into the global GPIO lookup table.
>
> This is a classic use-after-free: the freed memory can be reallocated
> and overwritten, and the GPIO lookup table will later dereference a
> dangling or corrupted dev_id pointer.

Thanks, I will fix that in v2.

>
> For comparison, the iocled equivalent introduced in patch 6 handles
> this correctly with a goto:
>
> ```c
> if (platform_device_add(pdev))
>      goto out_pdev;   // skips dev_name()
> txx9_iocled_table.dev_id =3D dev_name(&pdev->dev);
> ...
> out_pdev:
>      platform_device_put(pdev);
> ```
>
> =3D=3D=3D Reproduction =3D=3D=3D
>
> Kernel: 7.1.0-next-20260623-gaca8efd71d03-dirty #3 PREEMPT(full)
> Arch:   x86_64 (QEMU Standard PC Q35 + ICH9, 2009)
> Config: CONFIG_KASAN=3Dy
>
> The UAF pattern is reproduced via a kernel module that mirrors the
> same platform_device_add / dev_name error path sequence.  The module
> loads at boot via late_initcall.

[...]

> Build: insert into kernel tree and build with CONFIG_POC_UAF=3Dm
> Run:   insmod poc_uaf.ko (twice, so the second load hits -EEXIST)

Thanks for verifying! But TBH, I think writing a PoC for this is a
bit over the top...

And if the platform_device_add() in rbtx4927_gpioled_init() would
ever fail, that would be due to out-of-memory, and the system would
be dead anyway.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
