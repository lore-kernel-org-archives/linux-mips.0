Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155362D0C94
	for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789241837; cv=pass; b=q9aSB70ikcYe+2q6yDgABkThURqRtrUylctlePakXJx+QWXPjJGlHKtSZRw7qDsNI1MXqyhgj2SeDhLhnG+dZsE29iw7BtoMEdyYCtXxRqPuedTFNMXTK5GFjGR/vllZ+xa68YBWb3Sxe0OStUAQJaN07gUxanNfoc1JQ20TrC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789241837; c=relaxed/simple;
	bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhRK1mWwQmlRcNiKOZKH0xREudDI+nD7WD+JNNRCxQhdhx9uazbwjAALMnce/+/U27VzVIAsvQAHgdCLoNgnkD7vB9vVRN58caIISb844mUon1tP3fLxzr/knUPKpUf/6IFkHMmJ/C3fJjE5UlfjzNbrTI1aUERwCyeAROqKB2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5BPX/27; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5BPX/27"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663bfso166959066b.1
        for <linux-mips@vger.kernel.org>; Sat, 12 Sep 2026 12:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789241834; cv=none;
        d=google.com; s=arc-20260327;
        b=O0EXRhEU/4jiKZl8JpWf7RTstvYsCbaZppB2AuSgYAKDrca7LIE09W+uzKFEjBDzU1
         jFO2NaGyhuERTvLP9PTc3uk1VjDr6vpzxhPkpNAJc4Hzn16t1d/fOllDkLvl6M+Zjg/l
         jY3BGsnajrr09nHSaWlf3pHR0eGgf0CRggk6Due43h09pttQznghh1J237HwiwP7WAh1
         g7cDf2HDFlrSACIHftKHij602LRPLZGtkztkK5w/CnSiH5XOe7wrg2Zjux+2lknwuEMD
         bRVql4ZauwfJcLtGCO3uZAy6+G1xF8IKfgbOUClOHFiZjCpTuesYf8dSi3gajB7llytW
         lx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
        fh=m5CazoD1iyRbnTIGZ980inD0wYxaOhqmvmnahzjalNc=;
        b=mWGpKZEcRTSetvCGHLXbfjmJw3UxMcTK0C/Vvx5IU4YqTC3mEVGzv3K3jkx2TJ/Ndn
         QI7A+GrU6H8a5aVWli7JeOiYz5dsQ/6NHS01naAvNQ7oeQYgoD1nyttAifRAhJYvLLh6
         iJSWVHYEPWj9lKJqVMqBIf5QL21k2RW63W8dS3uMA7NIlvT9nvXFPv9iwe22s7s13201
         ybwiXdi3PCspn2FQglqWgNaKAuwy7EezpD8YOXYoLgFA7iTADi+GbG0ixek1D1GdSbly
         lF9ox1pjeW4jQbx599apV4kvraBpDx41RL+hvIZseg3283GXgwt0frmAmTSu3LcnvSmd
         rbJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789241834; x=1789846634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
        b=S5BPX/273smdf5hGu1RZqsnKIeG9jaEAApfwcb3c3vcOS+iRFwsRGpQq+7OjUMoi15
         kX4sHxeOONT3uDDQ4eEUuo0CMxSDaCepgYZ5nYxFTdvkhG//sGuoHXn1sgIx/Q+BjQ/Q
         1CIAkvlwwjlZSYUmNtYzxdBkwVQjHKbVu1FundhKsNpUft/gKcPtSAFTTzcX86GRp7hY
         oeHg208vN7VnE4fv1maRPx4P22lBp2Y4+ORQ46jrk5NsCPr8G4hSWKl42/gjuuq6EsT5
         QxrV0CZhcE9wGY5BuOhG1gScvJPw6TKmltQfZNIGOnTrE4sti4I4em7Y9vO2yo2a0CAL
         tWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789241834; x=1789846634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rTTsBHK4um1yjRGf2YHu9S8y6qTmA6zHLJxC9T3Jyao=;
        b=p/8lFCGrh0eYbZ5dYW4yzZQpYftXVh6NPlKCLFzoR0uFBIceOJIXf/Dunrkbasjly+
         7PIcue/x4KpgoLk1bBRa8gX6wV/p3S0emj/n6mWUqRcMv9PNjnd0WcsrZdWsukGfRX1u
         uyuxclGXVuFwmHmubkJqgnuAlDkNbeYleFI1/VjsTnUm/9b7JOlz+TZ+lntcn6h0h1Yo
         8zqWyPOeIFROLZtpHTizp4NbyKFqb57gXmCFABtIf7xDbRZk85E2lKGy6QxjLhLSm7cU
         n5IODTvHpT13r6iN90hU4mg2VFZdzAq78LRqgnNyDt6s+i1C8s4PtgHrBuWXEWfDTeOK
         mZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLI9dSnB+X34m5uTtBwtidYuG7jP5eQVgcgZAvl23BUwTh+zkCHm/6is2HdO/GNJ44yII5s7fztFk3@vger.kernel.org
X-Gm-Message-State: AFuF++kIU+g++kPDgrLyRJLDqTUOC6Wq7lkUNbxDZYR1ljZBaXw530LU
	SSkcgXWchyHMdMidLLxKwHnmk+6JjYecn2xiW5OybCRgTClTzUjvsFuLGi4SRrOciECi2g4z81H
	/8d8ygWmuFCSz8HFDsGc3+9AT30/ZI6UmIOEp
X-Gm-Gg: AYBFou1dG06n46hw0sAyJkCl5vWebGcgFJwrz/NZ3cnl6fhWblEgpZ/+orR0MlHcc1M
	nXFpk0HBmogwzcU7Mdb3OyuhF+fXb0Ok7Y41rjjcorQvu6M+0GAgaNsMAQCOh6rYsYZB2a3avrH
	98IRwJ8rBSOPts+eE0p62qPxOSQHdkDU5SO6EI0jfCk133z9pV9V9Jkr0pjMfJzYZYnCK1/fJRB
	rCvZGL8jOTtHB1pTAZkpGVEVY1EQ9IAm5SIDg5C5oYlug+tqY964aivDvh/jsdauGDoztwDqVd3
	rZPIPcedLJTqWiO73N1VYBl+oN4vEn4T5oviTvrCD5U2W45MBXy0rA==
X-Received: by 2002:a17:907:7245:b0:c26:2a5:819 with SMTP id
 a640c23a62f3a-c29666f6d30mr953226066b.18.1789241834024; Sat, 12 Sep 2026
 12:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912041220.444715-3-main.kalliope@gmail.com> <1b4cc37b0ee6e1aa473c372e07c89f8fd60ac5f89bad550275edd3f7dc8f8e24@mail.kernel.org>
In-Reply-To: <1b4cc37b0ee6e1aa473c372e07c89f8fd60ac5f89bad550275edd3f7dc8f8e24@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Sat, 12 Sep 2026 15:37:02 -0400
X-Gm-Features: AcwNN1WgyD2ePwBCZDxRvueIh3zWMk4fdTmPoVsiLcsmEMMRdq6RUEG1P4mLE08
Message-ID: <CAJZwKkiwTqeVrB=KRYOVrN3h1CD-K60FbYPg7aH-NaqiLecwxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, johan.almbladh@anyfinetworks.com, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

> The changelog describes a silent miscompilation of already-loadable BPF
> programs, which indicates this is a bug fix. Should this include a Fixes:
> tag pointing to the commit that introduced BPF_MOVSX to the instruction
> set?

This adds MOVSX support that the MIPS JITs have not previously
implemented. I classified it as architecture enablement and targeted
bpf-next on that basis. The incorrect ordinary-MOV lowering described
in the changelog is real.

This distinction was discussed during the RV32 MOVSX review. Pu Lehui
explicitly requested an "Add support" title and removal of the same
Fixes: 8100928c8814 tag, treating the change as added JIT support:

https://lore.kernel.org/bpf/2ca2a85a-d4a9-4459-a534-6159de6e5890@huawei.com/

> Does this compile? The MIPS uasm assembler appears to have no seb/seh
> emitter.

Yes, with the prerequisite declared in the cover letter. Patch 2/3 of
SDIV/SMOD v4 adds the uasm declarations, encodings and emitters for
seb/seh:

https://lore.kernel.org/bpf/20260911213340.3767930-3-main.kalliope@gmail.com/

The MOVSX cover letter links that series and includes its prerequisite
patch IDs. Applying MOVSX without it leaves those emitters undefined.

I built the combined stack and ran test_bpf under QEMU Malta on
little-endian MIPS32 R1/R2/R6 and MIPS64 R2/R6. All five MOVSX cases
passed with the JIT on each profile and all 16 signed DIV/MOD cases also
passed.

Nicholas
