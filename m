Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7311F34D4E9
	for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144693; cv=pass; b=SM6IBNwIol6QHOCw1b6D9jqlhKkYI7H0vbw9Kj2V7dIkHIPAzSDY2KqP1CX/QQI7opTdmGKme9/Hm8+IHVT1JoL+06z3lIcvo9eq+zExTRQVOlBYaXV4RUf/crh3zGbHcQG/iVgwTlTZLxTQV3jU7/qKs97cFKzku3uCeG9MHCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144693; c=relaxed/simple;
	bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZjoJ/hA1b7rmebhAWsUlURb/ZODJUvc17zjfhzqsxeQk19cFYV7GKoRIeKqmvofwMg5Aw30nhK2DmjU3rhW8Q1KFJl9d0AN0B9UiIZudnjVsQ6Tq44tMmeRBdyhBn89dr9urgFnzebJ6ofmJFUknMeoBe1Glvy7En5wDiG6B5aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2M4yfDS; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2M4yfDS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25420fe973so194564166b.0
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2026 09:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789144687; cv=none;
        d=google.com; s=arc-20260327;
        b=NzgVJCpjgzziIn+aHriM2yAOTFxlPk/lBhRBN1CWLO+kYMpuL72PQWJrr1QM0VXicm
         1zwISGGxOHHBn9uIU2URCEMmFnD6qyCjBaKI7YFsHk2+xK88IZNBpO4VnRJRh4PKNYos
         ngKg/62GjFEbFqHIknXDGK8qHMzT/243gc5v5h5JpCZmRL1eUioB/pPqI3uoBlSf0odJ
         xE8CBtRsI8pmLvCCzAkSnems5mU3f2sKDPfYWI5t9FSwKL8PRXoTDDl4+HBQJ+PRMbnS
         wiV0Aovx64gVnvtHViBdg9F+K4h785CWFDV0iZH2XT29JjeMXefTEaWuk7rnOoD02jLK
         q2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
        fh=dSBsaLxN1O5QcKrihZBIXLHhSA9zyKZVvoxneKAtu2w=;
        b=DzwP3mwbXq4pHkqt23tMAykicBcXfwSv/xNUJefjG59D4civnun7/tZ6YfZyBlZX+1
         9YE/3HNTo2zG+EjZhkuyw8laEKTC9oBr1SR6KvLxHPYlEbKYXMZGK/BcolJkjlM4JOTZ
         VSkL3vhmNx7sw8lizqtGKU/3MCDBycnypmavmnHQBcrkrj6DwzWzj7AuEaJmu0hoxemQ
         YH/2Qm0PdUjY/xXfVYEOCvxqpEyIe99dVs2+flkddSUHpfS4UnlYfyEP82yWvqKB/rq9
         57BI9RhtY0PIFrBbZHbaJAMtiNyKsC0N0OXGGiHqoKZI8bZl4TmGwRtmglb9gdvIjyVI
         rIDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789144687; x=1789749487; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
        b=g2M4yfDSACO/61PjGPBqrQrc0uxYXzpECVYGcmNPOYeaVOercFn43MaC34b7TKeOyQ
         /vboXhT84q4ct7WEnTdjtTEPCkIxDqVol49N9RvYqqrqJFZ2+kouvQKAB4ziBlVuN7ci
         +UH/CzRekC6lUCYwHDjF38Xv6OPAmykgyhQ1LZvh/YZd43KOUnp+HhIAP41WbAl8jbuN
         crgTVbtRD9D+cDvw1ZIS+QSLRRUbXrnlA69krUc3znpM/G5PTzsiJ7+J77KVPhNc7MMg
         H1OnUKJfSWUe1oixFPMtZZmH0g1nfLBX8DY5S3Bl5pUjx6/aVqpvRHp66BaDgp1IbvW3
         Pswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144687; x=1789749487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z05kgezgeQBnAhHNLQ06IrbWptjbuPKQZgHZ1hJUBJw=;
        b=HLqKw3vTQeavEN2UCfmNUl7ASVdsNYEaYWHYE/+48dsRwbUDVUmmTTo0FxJ+0uCG44
         1OeLvxldL3W+DebtAMAtGgSH1b4h3R72Kjz1lDIHskyixVEF58F4Qwhn0GuOF3vBthG7
         JnmhflGgiqBWenkoIB6X97Uc7r769x+ZOU/7084R4917+g72cNRGz9qWPz8cvToxAnEN
         xGUCImsFoKYumUs6N0HXJ8uBILPbsw322P+9xiCp5nmzELhEonkH64OspLneOsnOjtb3
         j2mq2Ez4L33Ryx+Vv0Y/1rKymFzF1pOTVcMo2LAMQ6uwST2U15HYceYTWDXv70kQQlkM
         VhTA==
X-Forwarded-Encrypted: i=1; AKwUvBx8BlsKvH1W0JZFbijWtybp+w8k5BoPx0xQPXzMfJz715H719A/Sd547a+l4F+Y4bPWrbbBa3k5TcFn@vger.kernel.org
X-Gm-Message-State: AFuF++nzfwhHLgYWKljthMpTdxDfgnylnfuGj0l4IO0y7Bprx69Vl1/P
	I5a7kE97VpXMWIrF/6nH1yiYzopET7I7wgXFNB1/C6PRwJ6KbPnnrCV5AyJVYx3zrZ0avQ7C0YZ
	cP98u+fg9iV/WdeQ3OPcKJq0sxtX8KqE=
X-Gm-Gg: AYBFou1vXtOQ+IN8X5ag88JgFHZ7I+wzT58PX2D6fj7C0hSIIWTWlm0NDDfU3EPYYao
	zZyUfBsYQNbMEtr40H/qOVNJz3EVlMxP+drAlR077I7Z0H1xb+93+TLccc4qe6YClxnOZ+dyeYS
	webyaLbLMtg741Pg/nhakqrKqjptgR8+i7cao5z7Hvkabp7Xzr8yi1PQxinBPTIAFkIdWS/42/E
	1xBg8KLLO8Y+DVix+Qnu8ClgYgDJ3ZOam7LDL+kRY5TIZqFkINio9gyNpV4x3SgfQhMzAJ9PcE4
	jZzu/N9kR0/KZplPl9fSjr5WI6Gz5niBPuShSi0ogMtapgfDhG0XIeLaB6xaJnqI
X-Received: by 2002:a17:907:73cd:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c29666bc8e7mr228183666b.24.1789144686888; Fri, 11 Sep 2026
 09:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904111731.673341-1-main.kalliope@gmail.com>
 <20260904111731.673341-3-main.kalliope@gmail.com> <CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com>
In-Reply-To: <CAM1=_QTN3JJ6jtckf32F8wxBzLDbHSrzUttyMBWNqZKmRe=2rg@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 11 Sep 2026 12:37:53 -0400
X-Gm-Features: AcwNN1UBDacB_mdUgPo31Abc79q-kaSzXTwE_yQATKEr1z50cei1mPjcgBoyYeY
Message-ID: <CAJZwKkghmHn1twrwTtfGSZg5NZ5FMu8L_=6N_pb0VrP75GMKGg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I would suggest that we do this optimization.

Thanks for reviewing. I'll get working on the seb/seh additions and
ISA-specific MOVSX handling. I'll send SDIV/SMOD v4 with the updated
uasm patch, followed by MOVSX v3.

Nicholas
