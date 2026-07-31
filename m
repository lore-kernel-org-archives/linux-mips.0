Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A8E442FD8
	for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513247; cv=pass; b=pBYjsM7RGrRMbmUjabydO4zSutZB4YW3Pxey6ZcFBcO3bPnLn/aQluNN/tD752SdYfueukgf1WtCsXko9tPXTnkJ1qKj+o5ZVlkAQtH5XmFHyB66PAEtZAqv/rMyjVrE9cPiuuWFDrtmzupBjT64uShjRPIPDn5UaVj/FKwcs4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513247; c=relaxed/simple;
	bh=NdjZUpmzPZnbev3nErg8Ah5yqfjCOeg4X4X3Z2k7pW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsYTyMx/Edlhnh6gi83fh9mx9/UW/v8wK48gO/7uapQa+gsyouYchLb5n4mM4yPea/NBE9IkWlCG9W+5ho9X04Be2uSv8Ex5NAzvOTFawSdxbepoSOMipHhofSDYYhXPfx8cqzgFbnxNWrl+WhClk4ECz/qjGKevL2yaFRRNl0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovj9T6dv; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovj9T6dv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c167aa9500dso149665266b.3
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2026 08:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785513245; cv=none;
        d=google.com; s=arc-20260327;
        b=WYp8Ys7GsJ1LERKR4OH1mtcdhFVhVQhgV6qLPKZmHrN7SEaJkd56ZTSj5i7/okDy6y
         OrLE6g1gFdIb24NibFNjRB1IKRK1v3qaIcSN4aOOymWDqZWdDbgbzPHPFaEkWZwZHzDW
         VqSvu5tIm2YVmAEWbfJiAds8/r06xV37mSFdswF+bPE7JS1ZI25DXYWVDUPD9D3ufHTa
         wt4xmS1Xyi3Vo5R8+t9x/NZSnrHXSLzmMdwd66xe35obpFqjMuXYhacAJQMX+fyrHpIF
         wDKUq5+n8mH3Rsz56sXX5ZDKpRHQUc6Lhqh19jfYhp2trNvVEtNQ07p2S4Pwqr+JbMII
         6xSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AUMtluikfNRsC8Z97PB9sPGKAI0yWhOSoIYDn0tGlXs=;
        fh=e0d5c9LpMnwuyKubsu9xQskc7aSMWwyt97gjPpA2bNo=;
        b=er7xQEuwb3H1BiSFHDkqX2gTlJQQUMArIkTQVCEtxkTPGTh9arO9kOupmpz+zxC3wN
         Yh3Ls+IFDMqSlqGj/PsttBg1QnHlGfnyeysyJQQ70sNf2rFV+aM9/L2jUCnzcyhJw+EZ
         MNjqDTAqJWsRPm205IvSu8AaKAdXmlHrZCQjgdOPOjjIr/KtKOP8IT/iNloyU0oKxhGo
         CueDMGeukoMMxyvpk9/gMGXzVWdxaTMR2y0cIqg/fvDV9DFkxbcfPU/FJhInh8F887Qs
         vZM5OLVSeRi7bYlkzPq2zr6yqvoRzxAiYOTt2MOhP83fxnWvh8h2fOPQv7aK5o9SA+3t
         CPEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785513245; x=1786118045; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUMtluikfNRsC8Z97PB9sPGKAI0yWhOSoIYDn0tGlXs=;
        b=Ovj9T6dvfrqi7Fjb6LI7ewOrAsaXe1PQul4uGXl7vrX59UKJrY7IImsY3Ou/2kYZVH
         n/ABKgdR92URlX4tZeFFC7TtS7i3wwmsKXhraKBBZB0PYZAYJdmXn8+XiiulrgW1Vpbs
         aA00gvHZNYXDwadmNdzKi0TFB4IY/Zy2kSuGeVpkRzRuufM65kE7V80qY6HsvV4OAqPn
         z5xqQb4/9PvNyrmP4FbEvSUwL9ldeYALje9JkEwX0hip2aXreIjdg4BSTQG9kXjoTMig
         ppORU5DLmiICruySbckr6nlqvxqMZ92sBTnEBWwgPaqtt5nEMeYa5sk3xXTNkz7fiERx
         2Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513245; x=1786118045;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AUMtluikfNRsC8Z97PB9sPGKAI0yWhOSoIYDn0tGlXs=;
        b=Z+qZpeRHOROKIUcUiNULB6A+kysYK6iTGPmg/v1P5xXRMSN1PdHWuFgTZwgPvZtuBk
         9MIdiaGpJzqeBewryzu5NXv+EZG7RPG76430zz0ZZNNgBgAj2JY7UUv5a86O0zmfKrfD
         BuT/9AbNdqsp0XwBHlkQ5TW3CTQVdd6xA9BeM2rQ+Dmp07MWxLWLVsYvAuoseUO4CbB0
         b8XRPtxtBT9fAEq9g9fD3Tx8BZteMZn38qsJXszLgH0oI/zpS7l1p9vvz754X+bQFzsj
         cY9kofIx/N5SM678HP88dqp7enNX4VcJ5ocXfWQ1WgSTXqRkxUA6I6/FhSQqPpEq/o/0
         T+yQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCpe/g79R+zraLozpe2Rtfghv+Dg4g1BfNAZFqtJN8xi/OYIIVAzLYwTGE3JPiMVfEZjwfOkVBViFt@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZGPYbNLf/0rkfQcbeGvxZbsZxG8vbR+QLzgtQzK2e1HCsTtP
	faNEwy84n2NrPYdButs4eESKeyIp0TH3I1zrYIDGKVVF3ohMZV9k2y4X4TuLjqnt+3PfwGBac3t
	tbIXdhHKjh7UC53MnmESA6ovvJoGPIC8=
X-Gm-Gg: AR+sD12Vty/6fQKxtDNny90uW+M6Fq7C8km/rX4JYEqmFT9v7Oft46IceR80Mlr9WRn
	cahN/q6j7fuuM0s6/BIib6It3K5lRyjWFDnpcfkFjWZuil2fizKXzDF5SW86fvX6bZ6PkGnaIC2
	VpZzomA0jV8Tobc45MbPRAvLUvtZLWEcFpHI73b+6bpGzSIbBF7NB9ZiXmXwFvS/xqe4DVOZRJ0
	FuIcHi6SgPDZy3DFfPloQDtZoBmYWI/RkRYKi6epmOvEHAvpyYrDMyOEXpTQKXnrNElWfzpGZ3V
	9mXd1L+R/p7g8dSFtiLW+yyLe9h6axjYslqbCmzYnbLiIg==
X-Received: by 2002:a17:907:e1cd:20b0:c19:80cf:4c75 with SMTP id
 a640c23a62f3a-c1fe7f3c548mr8494566b.20.1785513244463; Fri, 31 Jul 2026
 08:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729162931.2369353-1-main.kalliope@gmail.com>
 <20260729162931.2369353-3-main.kalliope@gmail.com> <CAM1=_QS79dDBfaaNQXnWd61AqHd1M4o9aDMMiftnoJveNr=FZg@mail.gmail.com>
In-Reply-To: <CAM1=_QS79dDBfaaNQXnWd61AqHd1M4o9aDMMiftnoJveNr=FZg@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 31 Jul 2026 11:53:52 -0400
X-Gm-Features: AUfX_myt_kB7E8Gv4Te28D81GXbe5vzIGv6mSlzfyJbuG7pj3zf6QT86W9HaaAw
Message-ID: <CAJZwKkgXoHhaej_hkBfytY_6N0PdpwfGMt+GUcHJGyaH0+e7RA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_SDIV and BPF_SMOD
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, visitorckw@gmail.com, bpf@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

Thanks for having a look.

> Let me know if you are already working on the remaining v4 support,
> otherwise I could look into it.

I'm working on separate MOVSX and MEMSX patches. Would you be willing to
take BSWAP and JMP32_JA? If you've already started with a different split,
let me know.

> Consider making the uasm additions a separate patch.

Agreed. I plan to structure v3 as:
  1. Factor the existing DIV/MOD emission into helpers.
  2. Add the signed DIV/MOD uasm emitters separately.
  3. Add SDIV/SMOD support in the MIPS BPF JITs.

> Should not "quot" be s64?

Yes. I will make quot s64 so the remainder calculation stays in signed
arithmetic.

> Please propagate the raw offset value and do the interpretation in the
> div/mod helpers instead.

I'll pass the raw s16 off value through immediate validation and
register emission, and interpret off == 1 only in DIV/MOD-specific paths.
That leaves MOVSX free to interpret off as its source width.

I will validate each series boundary on MIPS32r2, MIPS64r2, MIPS32r6, and
MIPS64r6, and build the complete v3 together with the MOVSX and MEMSX
candidates before posting it.

Does that sound ok?

Thanks,
Nicholas
