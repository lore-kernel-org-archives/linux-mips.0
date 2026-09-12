Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4F2165EA
	for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2026 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174392; cv=pass; b=VK9ZZydAFDacGpdIATswMl2vomfrVF3hjTSJ5r9CoF7iL6V/bhr59R84UO5hpWrJWGk+9rq5lcxCWYEDEtTlvHqMMIAyvTKd2cLJEqcr5WjjDTQm2O7yFcg6pNimedkwMi3wOCruRaZ5HwNMPb19xXWlt6PgoTmmZvtwIoKvQAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174392; c=relaxed/simple;
	bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGdvfhj02Aljm7uMUOvuQWUaaoYB6X3LeEY3W0uoKLuxpWUNjrt9NjJekihzxWl7zq9VA8tT4MNYhN3ao630ETzhG2o7WKhZtAmx1Hf4Qy03rOouFu5XdVPdvAeYardIBugM5qy5BD75XxCRSdpUWioPb3mGD2mMR9znU8gfqKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6nXHCLg; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6nXHCLg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c294183384fso256124866b.1
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 17:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789174389; cv=none;
        d=google.com; s=arc-20260327;
        b=mno5CVVdic3yVm9eWGNZHrgr6TvJwjx7bTE8GV/eCoRPjarUiNod2CVwLuMel+IJeZ
         YuIPIESRK1rWkpLWM/gvrQPiVCmsSA81aswGtNcXjQhl57+6gSz8N6TB62iK5HLyiV7J
         phTL32uzDjNFvnoQVKvnntYtgTIftZIaOVKiCRL1eeuHjtunioOhWYYwnLUU58AJMKUX
         9Wvhk3i7nEP+AheJwjTItcFFhFqrMUDPiD8CnFvul8ncGGF7boW1PydksBykKQFWSypg
         /b9TIrfHyGirqDlYGqo/UPX90buwHdzP4vfG/OeGIlzUs5NHAXmkLgzLmlbbQd0aAKrd
         EIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
        fh=G2YTyvAkwUkyRrKWdWCHfT6l+1SqTHDRI8Rzvo5d0V0=;
        b=TrHePpqRlMnh20NrEl3LfewEy9/5WHTpMn0UCh5KA1vFJgRmADhsNXzqkICvwpTqhU
         oEUamXphPDp1Tj4Ln7QW/W4RpKnNTYD3zpaKaxNR1K4R2PS0ObtlWGqxCK6x2VdcvxUo
         h1aTG5W1whnkJzMaPc32OAO8mvyRcaxoh/WG+GITVpWTC982UNAV+UgLnW1nonlY3nos
         4J9etHA7bbUcTIj1thJpaWaVvmSEH3lxoY6msCMHnuguci0v6yFJEwcFqjN+HaeCgjky
         KOlfoYQJzM3cD4v8otJHZ6geyHNwL8SrODzvyMnnsknBtuomW/irgh4YM6DxQ82V7P+U
         c9BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789174389; x=1789779189; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
        b=M6nXHCLgKnJz4RWXriSUPlzYrFaCIph0CapgEoDCVGumdGLXCy9dHgs5YIpz74mfrg
         b+yNKGpNJgLcRRtb8vi2BC215CfpFuabnyscg/ZCKSw1subIrni867Q56obS505FXtyO
         yXU/+XqdNsqHNL38TCFRE55ZF4DCGaLHPPBx2E2zKYInrcfNywFh1EBu4axQ32QmgTF8
         8gCJRwnwS2Qt/Pud4RFTXgZzCC7nF+EoJEXXA2TApZy0MCE0TfnJm87VbZo2fysfA7IV
         BZ3pjLWYGxHc727jFJRM3UC2twiFfjTaszCR35Gw4CHV05K+tlL9UQutozGzEFuWHhJf
         kA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789174389; x=1789779189;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
        b=X0+Z6oCoRkDaCkf9kcGZix7sOBqb3lroEraLxOhr+6qbc+mgc8H0kvTJET6Jk0ujPS
         90A9nqlUGBjClqNnJa6tBDTfGaDt+/6PE0ty1JjGywqae/L0IJo0bydd2FFBup9TaSJe
         7S1U8FBPMqqRPqH4VLur9qKO2aWLdE2jkUs0peBYGRBcXNz7DrYlElizgUxWmzwt/8pB
         LYJO4M1q2hoalGx8iP1rG5Hpuw6sVfqK4EBgMWnYTa9nzgnkG9PYKixYB7AnxKjL7lkh
         urczZuLnvX3S+qAktXMtPjnBuJRKAQvqhmcFkuN5KSLg1RXPYZ0RY4xzAPK9V05yXbXZ
         VWDw==
X-Forwarded-Encrypted: i=1; AKwUvBz3O8GdDVDRYIx+2zg1qDkGIrAkCMYaijvTWbse2fJwaXWWm+7o8B6bOU/364HH3ip43dyufuHtjPej@vger.kernel.org
X-Gm-Message-State: AFuF++l2/G/dwS70ExOEX8Ogdc5y8zhQ5F1Rs8JFrK75EPcBi1kX09S8
	g6gcYpxoBjwNXoiFp2JPRWIpIo2+E85PJzElyCuDKHOZRD4wyQGzc9oAWMQogAIBtYElXdWsWqc
	sP7JlzFJJGK2Sy9R1Mcfg/dGuCz8sp2w=
X-Gm-Gg: AYBFou0PDtKuD/aARMCTVkN08w9Md2fBCGV6VQTy0MrRFWF5icS//VwesDKb+7R34EV
	+jnuF5XGrxA7lh3C+u22rAnIumY9PvjWbi8bKLEfZYdk4A783GdmniVWJBtc5hE4TFIfFgQxTkw
	ilEG861bVrknILPH8gkFKOy+49QPCy6d0LwlI8EY0T2v+pjIXR9WSG/o97vqPgWiWW/haO0pJFU
	KIAmNFbq5Z4gRlZe3UmA2RzhADdQ69nRIhYqefj3n+TVw3p23WSDKxNmiH5fG0+boHu806LoKAQ
	fqcRK2dGPJDB8m5/esMOqDnFShXSEBTXBhoqDksrzuDN/ei3d+tO9rDL19SdZ78E
X-Received: by 2002:a17:907:8b91:b0:c28:f9e4:836c with SMTP id
 a640c23a62f3a-c2966746c86mr293173366b.28.1789174388992; Fri, 11 Sep 2026
 17:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911213340.3767930-3-main.kalliope@gmail.com> <c440fa97680eae9966579d51586c2e6b9936bfc3157225269166e1c133515f8c@mail.kernel.org>
In-Reply-To: <c440fa97680eae9966579d51586c2e6b9936bfc3157225269166e1c133515f8c@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 11 Sep 2026 20:52:57 -0400
X-Gm-Features: AcwNN1Ur_WOJSfWbT1nTjTcNVZl3abwhTBIueEcresXiT5wFs3FL9dx_llrHL2k
Message-ID: <CAJZwKkgKjSOsHADdupd8cFdyUXKQeVzNmwLyX0jDorru1p1W7A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/3] MIPS: uasm: Add signed div/mod and
 sign-extension emitters
To: bot+bpf-ci@kernel.org
Cc: tsbogend@alpha.franken.de, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	johan.almbladh@anyfinetworks.com, paulburton@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, philmd@oss.qualcomm.com, 
	martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

> This isn't a bug, but would it read better to add the SEB and SEH emitters
> together with their first caller in the BPF_MOVSX series?

I grouped the native-MIPS uasm additions for SDIV/SMOD and MOVSX in one
preparatory patch, with instruction selection handled by their respective
JIT changes. MOVSX v3 will declare this series as a dependency. Keeping
SEB/SEH with their first callers would also be a valid split.

Until those callers arrive, the emitters are unused. Their definitions
do not generate instructions, and the existing opcode encodings are
preserved.

> and CONFIG_CPU_MICROMIPS kernels would hit build_insn()'s panic for them
> since arch/mips/mm/uasm-micromips.c isn't updated with their encodings.

That requires a microMIPS caller. Neither this series nor the existing
kernel code calls these emitters, and the planned MOVSX callers cannot
be built for microMIPS: MIPS only selects HAVE_EBPF_JIT when
!CPU_MICROMIPS.

I checked this on the posted v4: olddefconfig removes the attempted BPF
JIT settings with CPU_MICROMIPS enabled, and the microMIPS uasm object
builds successfully. Compiled-table comparisons also confirm that every
existing native and microMIPS opcode entry is preserved.

I also ran test_bpf on the official base and standalone v4, without
MOVSX, under QEMU Malta on little-endian MIPS32 R2 and MIPS64 R2.
Both showed exactly 14 signed DIV/MOD failures becoming passes, with
no other test-status changes.

Nicholas
