Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459990;
	b=mtcnW6T/F+zhXnCdvHacUyRGJh0s6GfFtfbvZXMqikjzjvEfCwv0AFmH/ENnyTcppUUt
	 1FITZfPfAb7jAZbV0SZU+MgK5+CbaL2RkPEwLSL99SgJCvtYYY+uTXKjP0DhvpvQo1ZE3
	 N5IPvg1++/db+pkeXaYV5vUqQha1DdVODnnIqfBmHuiRmaI0tPQxjStKMmF/rqy9QmDuV
	 5VEpyPxBeyHof+h3xrWzJNQyzHR15AhfH2+hf/sjh4MqIgewkrPL98vyeQXHlLOiM2FYG
	 pbj5meuUdUaudlcH4AJ08yrwiSq09tdg0qQ1duPVNTChdx/6Lw2txT3vWsQG/gbgfWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
	b=ryq7uZGxGFa9H1lWI6cLuvO2y1xAo8s/9qdPpHWFvZ4Q3yWlw0FZBnZURMsMxM0rf5UD
	 6QtujGhNMGD+vLrZLaqYRTE2D5zYgzvXvYfju3JuC6zYm9eZ2j3vc0goEJkQ8ZPtscD0I
	 fYGClD1/ss1AhvEgWQXEp4/VAFLjmDTSf2+kHeXT4b3A9qqjlQU55gQEM4935/4zrfhNB
	 4yF4/wZYjPtPzvOQqtDvnNpz8rKCHn7TgBqHnR6AcW2zNW3tyL1/PJJmkHJSt4nLb+zsY
	 +TFBcrfR9LRwM7R4apRDkoPTuUfwH7KSTGIsHNc4YmiA7z5k6Ejq4IkW2DTZmMKUEFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoIgnBbr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C99606A31E
	for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 18:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EoIgnBbr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so29179725e9.3
        for <linux-mips@vger.kernel.org>; Mon, 23 Nov 2026 10:53:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459988; cv=none;
        d=google.com; s=arc-20260327;
        b=qdEY1I1AikDC9+MBqoMNMcgCMBait9/bfZZpT2UAbLrwFbElPz0QqVQy/P60r9u5++
         aIxi6ejyMj3s/eQWLMfL+ecDx0Ju4SJYnYBifv0x36yjDQkkBYJ9LQxYUdlnHbOizoUT
         fVdnQCTc8CSSmEDHl3EAHOHmKWKu9ESr0LqQPG+hBJgIqffjKE3CTnZwlMaFhUP0pQ6b
         YMoq+z3zmGusLnwwk97f6KAkhY9ETgoaqFrDZM8S3JDylAwiSImFMOZ3qhhMzYwNrypi
         SqaertWIbb+W8shoBWD6BK2LWOVn0RwoXfiXbVSL1iqUfawnG54ruo5oHKu5wps599WY
         opFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        fh=FtiNlqOnQ8jnHBEVEKD4whm53Yf+2kI6Bp4srEYOn40=;
        b=oDBRtyLRXzOOWefusp1QK9b71yQ23rKAC095vvxw08bcep4v+QY5DhFIsAKLS949Jv
         kwZjpYAVd7+XeYCeZOUG9EehYRH4DD6twCS9ym6R+NHyB5vnBOSyNmJBCZL8LBUY+8FK
         Gl9SLMoLxxM8XDwNTotudlOCxjTr59JdAZHar8PnK/xPy3P5dff+uSFkgRMaBthUIx+v
         stGt1S87VwWV7721/eq0zD+EgEyaFFcFfX/Us4Wkx2q33t45B0A0IbgoguKU+XcH94UJ
         rwjYdWUgAHl7wMi84Hh08WN/pWvlGBU2bjqNPwFuzniKdv253W2F7zjHJ5OXHiEMMBWW
         7a1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795459988; x=1796064788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        b=EoIgnBbrv+RMOq6D/aaixDhY7cKBx5S9KtzInZdc2qh99zFzozW7pF3lujSW9EIU6v
         UPm5ZRN4FcIPIOk1Z7Xwqax3vheTUg7kPPxM0JeFn0OpvAuh6O5FMR5uniJMS8rqmgiU
         ZcR+ec34rpfD54rJQzVUtB9ynciqkQBAjiuW1NDqSkW2h+Ka6pJZ1KUqWA9e7ypjuV7m
         b0bnHpEG/549JGeWkZhxIabj8hejs/euX2Pi9LNvE8CfYA/eo6RhUljc8fBydRr2iHhC
         Ap1r8z4izptu6qs858xnnPRkMWUGH2AsLuhLmvtmM+ZQQUdohyqYMdiF/4A6nLjMGngl
         OKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459988; x=1796064788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzK8e5va1iOv1sYIdDfpKtFNB5Tj3DOer2I2bPq8P24=;
        b=AV6eWtsWb5q0Nn0Vjkw+exePu1Mmlxi7PbI/lM9KK5q9TnZqtgjEBI+p9V9STsIWfL
         ewi+7ZOiY8+AGNCOgLdedSLANWFbqq7ukuBp3uQVe3WMiwwxOnc8PcQropaqJLancoU4
         lPIjXXaFO8mnZrUqHzNybf8df4lyJdMZbExoCNUDqf45lrJmaAIhZSJ4XYp8c55i7tkL
         X8FWBLRyMGO0ANbGKWu0bxK4TqZ/K6Wl1b5COtqMHOjSIccLKRG9hs6Uqejd5GVin4ro
         euuLLhYKEQuXqWQU7VG0w6ypvP8iSu+xJ+Fl8A1Atp9ME67jPr5goRMCVCPXmDTuUQre
         zpvg==
X-Forwarded-Encrypted: i=1; AL+hErG/eOdNpgKVRBOdm2oRZ5KzJQtKvFYJFi+nveDXLoxsf+x1e4oMH2B2LRDLGWF2x5oo6O1jyJoJAQUa@vger.kernel.org
X-Gm-Message-State: APuU4Z/+fByD3VOSRkE0V3oKxqsFH2qSGtnCL+PDBo7dj6qagSIQGsHG
	XRyk5GyuwhIrBhOJUs9oyJ+T6hjozoHhk+nKw6ARaFNJrvZlyhMfZ1CP1YI33/8YQcuaCWPshBD
	zKpza0OMac29fAb8VS7mYSC+l+GHeiHzaIzH4TsLO
X-Gm-Gg: AZFdTZdkMk909J5jWeLjTAAKepfjvcyOB76hymCElIrXk8/HJsXXFRRc+FI+9UQIUUt
	YxGvHHcWpQwAvLLUiwf69WddVvfxYGloeSE5tQNzF9/g8Uct3nv26muTgEf5KnfQVYAy6ZoK1j5
	8Wf8wH7puxUTzHfzStHpF8B8u7w1qgtq9Dlav/wJvDQBwKgBf7raU6aZLRU7vII2F2TMS46NctK
	+xUFIc3losnAWpZwPXiuPHdDpH4Lq4vQmPZRDDHWDm8ucHf/suW0MnRHOFtI3glsO8pemlcWH1M
	ooPjege41yXw9mb5urYg8dFQ8L8bCbmb7T7rqw0PvIOpvqMnauQNdiWwzodcUfadNPJJVT8vawe
	MrqvGe4ObfIY9+l2OfPmS/yhqCjfeRX8vrn7Pza+SlFtl5g8ZUHHb3k1g9Pcq/HScgE1NjYmBoF
	2irlHsv3pUgxOqCcQu2h/GHe2yiF/z+15j8XzNqf/JDFGVC26sEwVfOx5JoMlmKfF1HwIBdraLQ
	ngcmXXleaF0FybgwZJpAnACJ9GtYs7v99jIyA==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id
 5b1f17b1804b1-4bb8893a963mr247968845e9.30.1795459987961; Mon, 23 Nov 2026
 10:53:07 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123025645.2385330-1-shingekinocore@gmail.com>
In-Reply-To: <20261123025645.2385330-1-shingekinocore@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 10:52:56 -0800
X-Gm-Features: Aa3M54rjSx1yo0dE65bPncdIJw5ozLFQnetXM2ws-XF0yEzirPrTrGmtq_bnHFU
Message-ID: <CAKwvOd=aZam1UR8O5okim1PJqjm5Biv+cBQUmA8ydctUd0v=QA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Fix genex.S build with LLVM before 21
To: Tzu-Ching Yang <shingekinocore@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Marco Crivellari <marco.crivellari@suse.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mips@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 6:57=E2=80=AFPM Tzu-Ching Yang <shingekinocore@gmai=
l.com> wrote:
>
> Since commit 56651128e2fb ("MIPS: Fix idle VS timer enqueue"),
> BUILD_SKIPOVER_PROLOGUE uses label differences as the immediates of ORI
> and PTR_ADDIU. The LLVM integrated assembler accepts such an immediate
> only from LLVM 21 on, so LLVM=3D1 builds of every MIPS configuration fail
> with LLVM 17 to 20 unless LLVM_IAS=3D0 is set:
>
>   <instantiation>:7:11: error: expected an immediate
>    ori $26, r4k_wait_idle_size - 2
>             ^
>   <instantiation>:10:14: error: expected an immediate
>     addiu $26, r4k_wait_exit - r4k_wait_insn + 2
>                ^
>
> Wrap both expressions in %lo(). For that operator, LLVM 17 to 20
> emit a LO16 fixup instead of rejecting the operand, and resolve it when
> writing the object, since both expressions are constants by then; no
> relocation is left. Both values are between 2 and 30, so %lo() does
> not change them. GNU as and LLVM 21 to 23 emit the same code as
> before, except on microMIPS, where GNU as now uses the 32-bit ADDIU in
> the delay slot instead of the 16-bit one. With GCC, the 2 extra bytes
> replace the 16-bit NOP that padded the end of the prologue, so all
> symbols keep their addresses; with Clang and LLVM_IAS=3D0, except_vec_vi
> and the code after it, up to nmi_handler, move by 4 bytes.
>
> Fixes: 56651128e2fb ("MIPS: Fix idle VS timer enqueue")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505071331.Z0N2eSkr-lkp@i=
ntel.com/
> Link: https://github.com/llvm/llvm-project/commit/b65e0947cade9bd39036a77=
00b54c1df4ec00756

Thanks for the patch.
Confirming that landed in clang-21.

Link: https://github.com/ClangBuiltLinux/linux/issues/2201
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> Cc: stable@vger.kernel.org # 6.6.x: 56651128e2fb: MIPS: Fix idle VS timer=
 enqueue
> Cc: stable@vger.kernel.org # 6.6.x: b713f27e32d8: MIPS: Move r4k_wait() t=
o .cpuidle.text section
> Cc: stable@vger.kernel.org # 6.6.x: 2b6d718c8dbe: MIPS: Fix whitespace da=
mage in r4k_wait from VS timer fix
> Cc: stable@vger.kernel.org # 6.6.x
> Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
> ---
> v2: only the stable tags change; the code and the rest of the changelog
> are those of v1 [v1]. The tags now start at 6.6.x and name the two
> prerequisites Maciej suggested [review] plus b713f27e32d8.
>
> What each stable series has today, and what it will get with the tags:
>
>   series  56651128e2fb  b713f27e32d8  2b6d718c8dbe  will get
>   ------  ------------  ------------  ------------  --------------------
>   7.3.y   yes           yes           yes           this patch
>   6.18.y  yes           yes           no            2b6d718c8dbe + this
>   6.12.y  no            no            no            all three + this (a)
>   6.6.y   no            no            no            all three + this (a)
>   6.1.y   no            no            no            nothing (b)
>
> (a) On 6.12.118 and 6.6.162 the three cherry-picks and this patch apply
>     cleanly. For malta_defconfig, genex.o builds with GCC 8.1 and 16.2
>     and with LLVM 13.0.1, 17.0.1 and 21.1.8 (6.6.162: also 11.1.0),
>     and kernels built with GCC 16.2 and LLVM 17.0.1 boot under QEMU.
>     56651128e2fb needs b713f27e32d8: without it, all the code after
>     r4k_wait in genex.S is placed in .init.text. Both were queued for
>     6.12 and 6.6 in 2025 and dropped because of the build failure
>     fixed here ([1] below).
> (b) 56651128e2fb conflicts in idle.c on 6.1.y and older.
>
> [v1] https://lore.kernel.org/r/20261104030147.3117325-1-shingekinocore@gm=
ail.com/
> [review] https://lore.kernel.org/r/alpine.DEB.2.21.2611040746160.6502@ang=
ie.orcam.me.uk/
>
> The notes of v1, unchanged:
>
> > No MIPS hardware here. Against mips-fixes (v7.4-rc1). All builds use
> > W=3D1 and kernel.org toolchains.
> >
> > - genex.o, before and after, with GCC 8.1 to 16.2 and with LLVM 17 to
> >   23, both with the integrated assembler and with LLVM_IAS=3D0. Configs=
:
> >   64r6el, 32r6el, 64r2el, 32r2el, eyeq5, eyeq6, malta (little and big
> >   endian, MIPS32r1, microMIPS little and big endian), ip22, ip27,
> >   loongson3 and cavium_octeon.
> >   - The objects are byte-identical before and after with GCC, with
> >     LLVM_IAS=3D0 and with LLVM 21 to 23. The only exception is the
> >     microMIPS ADDIU above. The 4-byte move with LLVM_IAS=3D0 is harmles=
s:
> >     set_vi_handler() computes the offsets and the length of the vectore=
d
> >     handler from symbols before copying it, and ejtag_debug_handler and
> >     nmi_handler are only referenced through their symbols.
> >   - LLVM 17 to 20 now assemble genex.o for all of these configs except
> >     microMIPS and Octeon, which the integrated assembler rejects for
> >     other reasons. For malta (little and big endian, MIPS32r1), ip22
> >     and ip27, these objects are byte-identical to the LLVM 21 genex.o.
> > - vmlinux of 64r2el, 32r2el and malta, built with GCC 8.1 and 16.2,
> >   LLVM 17, 20, 21 and 23, and LLVM 17 with LLVM_IAS=3D0. Where both sid=
es
> >   build, vmlinux is byte-identical before and after. With LLVM 17 and
> >   20, genex.o was the only object that failed before, and vmlinux links
> >   after. No new warnings.
> > - The malta kernels built with GCC 8.1 and 16.2, LLVM 17, 20 and 23, an=
d
> >   LLVM 17 with LLVM_IAS=3D0 boot under QEMU 6.2 -cpu 24Kf. That CPU use=
s
> >   r4k_wait(), so interrupts go through skipover_handle_int. Each kernel
> >   boots to an init that keeps the CPU going in and out of idle and then
> >   reboots; a QEMU trace shows every interrupt that lands in the idle
> >   region resuming at r4k_wait_exit. A microMIPS kernel does not boot
> >   under QEMU -cpu M14Kc with or without this patch, so the microMIPS
> >   change was not run.
> >
> > In the 2025 thread [2], Nathan suggested requiring LLVM 21 for MIPS in
> > min-tool-version.sh, and Maciej an #error for older Clang. Both would
> > also stop LLVM 17 to 20 builds with LLVM_IAS=3D0, which work today, and
> > the stable trees would need the same change before 56651128e2fb could
> > go back to them.
> >
> > On 6.18.y, which also allows LLVM 15 and 16, the patch applies after
> > 2b6d718c8dbe, and LLVM 15 and 16 fail and are fixed the same way.
> >
> > The 56651128e2fb backport was dropped from the 6.14, 6.12 and 6.6
> > stable queues because of this build failure [1], so 6.12.y and 6.6.y
> > still lack that fix.
> >
> > [1] https://lore.kernel.org/r/2025051415-unloader-likely-b0e6@gregkh/
> > [2] https://lore.kernel.org/r/20250521224450.GA2412476@ax162/
>
>  arch/mips/kernel/genex.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index be1b049d856f..ef27965f6ad9 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -146,10 +146,10 @@ r4k_wait_exit:
>         MFC0    k0, CP0_EPC
>         /* Subtract/add 2 to let the ISA bit propagate through the mask. =
 */
>         PTR_LA  k1, r4k_wait_insn - 2
> -       ori     k0, r4k_wait_idle_size - 2
> +       ori     k0, %lo(r4k_wait_idle_size - 2) /* %lo() for LLVM < 21 */
>         .set    noreorder
>         bne     k0, k1, \handler
> -        PTR_ADDIU      k0, r4k_wait_exit - r4k_wait_insn + 2
> +        PTR_ADDIU      k0, %lo(r4k_wait_exit - r4k_wait_insn + 2) /* dit=
to */
>         .set    reorder
>         MTC0    k0, CP0_EPC
>         .set pop
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
