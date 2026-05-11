Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A5A363083
	for <linux-mips@vger.kernel.org>; Mon, 11 May 2026 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481750; cv=none; b=BzneN4PGzRn2ncv9xGrr0ENdJh5anqsBOGsVvILgkUaAqjiupe6B1Lfr95yTqbPJYG4OEP7eLtryTvCR8QnE91bxmEqcYX9QjhrG0ghULDstFiazuSk0cukfEG3/Zgr9O+VJkR2nftkIAzrnX0UIj4NF0+Tn7RXetDddz3UhdyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481750; c=relaxed/simple;
	bh=ESqdwpO1PaZzMNYLF3fxyPf6qP7RM49WGjHDzTkKeUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEaY3qDl/NYaASv+iD6jhmW4LTAir2EcEIAoPnoNfZQRXlAovJ9XDs2x9zWCdsqsN+NOAwnxyMtnmo6PMWQC/RgYjyhY9WBDF9YgYUVF2g8aB3vTaPPwR180YwLLM40rVEkZ16HbZJ0rqGatF3MYKcjPMpucAZKAY1rd3aZGBLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f70865797so2102479e0c.1
        for <linux-mips@vger.kernel.org>; Sun, 10 May 2026 23:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481747; x=1779086547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmM7uPcTxOtt/CXqxfbtSzgj1ys1bMpqCcKcPX8L8Aw=;
        b=R1GB8ScTwU5Fpl+zwLRmeKMlNXKBEEQ3rqNuh0cX5E7Q9HOIjkpJ8qNxsmjTbbRC9p
         LGaRa1EF1YcqnEqtL3TJhQ9v9Y6AiaPMBywzjASNApLPmYd4XrNvmNXEYXbMq/cUo+tD
         VV7HlViHic7zIuwCnI5b0bgoMAP+ZbneSjMMN0jQNmo/Xv6SisxGe92fIsNy9hzafNiF
         yc07yM92vSDZ9zpg9rwXgH0hyJ0pR5JJQ1vUOdRVEox3VODlvQeNnwz/CvQmVMMhmXv7
         Eavy1Ed5kXIJ4eEFhdlgL99Znv2eRwH42wQpDOW5YMPRMFYTI393HZ/Gg6E3vUOmJsh+
         VhzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iW4OuskiHqJzRnRF3F84ic7SYZvoD3PLp5EIwyomEsniViUlQbZ4mIRR3JXBCAxUclyFlS/enef4H@vger.kernel.org
X-Gm-Message-State: AOJu0YxfMAHyoHLuWJex+OrtZ7QYoXKBwD7KM1Rmfskq+sKIumbzyQ5d
	0vLurIao5OFnsCtnyDB8oFjAwzC+Fk8LnKW+OEXAmez95RyAIPWTPQcfjVjftL2f
X-Gm-Gg: Acq92OEBmqPP8134W4ZHvbW5HCcMk45Q5Mu2YLSy8IdiSwllQz5d8GERuVGBgXoOrh8
	cuemq6D+IDOPJ4RZz3bEytGGDK31eCJQ9GA1aRmJcd3Ro6K4Q6o45nOVK+jaSFr3lQjrOO2Yi+/
	pe/pGQg/Qp9JYWtgKGsnOxKxbQMA2nRzuDuggOIeFq6uFoRgxztoYf/bKdf+Abjf66ctXtLi2ER
	oh1zF6C45Y3Ec5k4NsVWY/8/4TmY8Z30rXaFR7qvsnx7AY/CBlMaLdG70TBnRj36p47ceUfrwOz
	0sGKiYXqdLyD/DRuB2iQ4xyn8/40JMBW0f2k2LPIn6KmU+uKES6cuOgjUfS3GoaeO7CrPKj74TC
	KIQDYhjfAIYjCXrWuuKyttjXPutjl/xoAJk+HiCk/vYz6FeTuZMj7TJk8wQEMiXQMefVe+V3jiT
	V7lqo6T4hdXwPqpZ/uxzG8HZTssNeOVJkNlwzZiKzY+oxE4M6bbWUOcgGMeDUj
X-Received: by 2002:a05:6122:3d42:b0:56e:8afc:de8c with SMTP id 71dfb90a1353d-5755937cb24mr11664009e0c.3.1778481747507;
        Sun, 10 May 2026 23:42:27 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57586996d3esm6215366e0c.6.2026.05.10.23.42.26
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:42:27 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6313b7e3d03so1824666137.3
        for <linux-mips@vger.kernel.org>; Sun, 10 May 2026 23:42:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/H6MLzY+Apk3tA9z0jX5W9HsvwSdBybtBCbLfbsoCtYj0KnQZrkJn3MvHP8V/Xf0bmHJuYY/0vlcKv@vger.kernel.org
X-Received: by 2002:a05:6102:2ac7:b0:633:c6c4:b32c with SMTP id
 ada2fe7eead31-633c6c4b990mr1428757137.15.1778481746411; Sun, 10 May 2026
 23:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202605100125.l4JVHppO-lkp@intel.com>
In-Reply-To: <202605100125.l4JVHppO-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 08:42:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
X-Gm-Features: AVHnY4LhC2w7Nls0eAOnAROXGmHfJhM8ihUdL8l1JwrVFRMxvNzDPSpVspNG9hQ
Message-ID: <CAMuHMdXPeUnjN__PvY+HQg+cSxKe-RLnyT-A5KGe=4cmjnUNbg@mail.gmail.com>
Subject: Re: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is
 larger than 1024 bytes
To: kernel test robot <lkp@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 May 2026 at 19:07, kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ec89572766744e844df24c27d31c97b4c00f4e07
> commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
> date:   9 months ago
> config: mips-eyeq5_defconfig (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605100125.l4JVHppO-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    crypto/ahash.c: In function 'crypto_hash_digest':
> >> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>     1073 | }
>          | ^

This is one of the few defconfigs that still use CONFIG_FRAME_WARN=1024.
The default value for 32-bit systems was lifted from 1024 to 1280 in
commit 32115734c0ed8b46 ("Increase the default 32-bit build frame size
warning limit to 1280 bytes") in v6.18, so perhaps the downgrade to
1024 should be dropped from the following defconfigs:

$ git grep CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq5_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq6_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/eyeq6lplus_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/lemote2f_defconfig:CONFIG_FRAME_WARN=1024
arch/mips/configs/loongson2k_defconfig:CONFIG_FRAME_WARN=1024
arch/powerpc/configs/fsl-emb-nonhw.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/arm.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/armeb.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/i686.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/m68k.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/mips.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/mipsel.config:CONFIG_FRAME_WARN=1024
tools/testing/selftests/wireguard/qemu/arch/powerpc.config:CONFIG_FRAME_WARN=1024

I am not sure about the wireguard selftests: they might use the lower
value deliberately for testing?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
