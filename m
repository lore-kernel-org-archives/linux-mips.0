Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C334476072
	for <linux-mips@vger.kernel.org>; Fri,  4 Sep 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525932; cv=pass; b=YYAhPM40v84n2kZcH0tErXdshlFN5zGHpewp5ORPYsAXl5+bINvGlv4z+rLpbVDHc84/0ep7qW1EFLPv7Oo86inDXukq9z39+bUPjQhxDKhX6VtuDzasO6gEDcSIl4E4rXimrDXaOshdJEVvRng54h33rxADkPJ15dAkOzWl+zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525932; c=relaxed/simple;
	bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VD/XVhzwzn3tsfuAENT/SxS5oNAOvHlUH4rjLJ4LrHRsfNAzH1r4YR1Xx4K854JgLi2Zo14Jc6IbpPYggP+FPZWWWQM6mLkVz8/hXeyt3CHm1bqigSTZsh7EeUaLvYI4dJLbhuRAW0nexw9PC4G+Q4ND842Wm7vHzaPGtYX/t3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nlj2Z3NM; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nlj2Z3NM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c197e7e4e94so157542666b.2
        for <linux-mips@vger.kernel.org>; Fri, 04 Sep 2026 05:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525930; cv=none;
        d=google.com; s=arc-20260327;
        b=eHg9LLd4L4s3OAS+pt1iPOYZbO6G48GNLMt84T4JCpI9qn/5fcCEXLViRFQ6u59jZo
         HECsFQRwppW2ou+yNs+ZYqtFJt5VwdzdJQh6Prkk+mRUIDh1lHm3KUZ8ro/Pm2oSQlPq
         xiWkccJRx3X3XQ9IhFAJoffr1AeGTQJGah47OD/YVhk7kWcE35LXlYVxKGGTkMxTJyMK
         Ns71vyB6N4YFkoIU47c8TW3Bix6h/VUVj3g/PuiwPx3/cyF2rN+vfu7+L+lNGaHi6f3k
         8OSQzUjN8bOvGTeZ4RS3A8kzFWgeFGbIqjSGUG/CllVNO6yZY3kYXFB2H2VpUvjHHYAA
         3MKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
        fh=qllac+Cb2VBB1l8bxsG1ZmVV3IJdf0nBqyWP+hsY7fs=;
        b=iPkEFL1vLt/a8MINgpgfayyBZsxiGacYbt9o1kHHMv+CNmjVBpcELU48t3/klGy5dm
         Zx4FvluoW0/p4j9AHuNBrKOKXUboxpD1bmLxK6dfM/KD7dWJBGmAzdLPIiFign1hNKLV
         Hs/jbSIURCReWlXV/1xwwNuHBEw/Qu5BH7OmCEMD5E50+IQ7jnr8GTiGnxwolmmBmdr5
         r9o9gCZXhQHxiLeaqb/iR5yb9hVIDOwv1RMNEc0jMUrgHyieAUBwj9S7DlaM8hVPaNzH
         COZGhhfpbmD1E5C8HedkN1RNclOr7rCdbAkQox7K+CmEqdRA+iGX4Ex1gCjt6Zigzj0W
         Uprw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525930; x=1789130730; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
        b=Nlj2Z3NMP945vYPmFS8A/T+djK5rR0QOM/Sf77FlLxxYI05mI1l0HnYr3Nuce5iSRO
         QKeS7bHvw6LjQfqEfx7Kt12GPatAVlpUaUXz7QT3xdTOm5p7wX5k/0uI4vGuzvFVmnIi
         Y2mH+HtMg7cSKyCxrFTiTSbSKon1wdYgt+HSH2v4ORuB8vU2Md2By3TeX21e0T/8OdAx
         A6DaW85w3yMlHgKOSd3JoUqx8GImv1rVtR8W7FwtyaJU6YglUD2AAXO7Y4O3Y4wujYnT
         cTAhkV3RJ3GebedisXrFdvdpCJ5VttrjAEO0NrOvFgZsri4RSE5vADGdpYTomFt5os9X
         uMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525930; x=1789130730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SzDs2yWMGbqw4SuOTjqilOjXglSn17D0yFwlVfQoGko=;
        b=C5voA3K0l5bCE84OGy+ydcCwTEo6U5pfGJdZEKu7h/iih0bqJfusUHtcLxgfq5lNKh
         M4a7aCSBtyGa//yy4dP5u7k0vpJS5F5TZ29nd4ECyCmQKrITRWyWj2PIns2bU8Xs2Ece
         EH0I91yq9JyvuZkLWssFSqOWwMUmPK79XObRSIl/+jQhBQXdeo4yp1f8qQlVAtFWk7yR
         oP6fquJQimuaGM10ZicS0s+NQt54wWNrNQdYHbfjWkPMZBNCDc6DEZnYkFRBgGiOe6+b
         23sTww2x5otr1CoIEOO3ta93fxX/gt8ivv1irGvZvWemoKIwph0TUONvDY7sHtxc1Uc2
         ouLA==
X-Forwarded-Encrypted: i=1; AKwUvBxnxymlOF53k0v17K0W1TyZIBnLUDEx+EhZSHnDdkapr0tr/cDL+OMV8Y1f3GOqZPAVsIG6WbpWjLbq@vger.kernel.org
X-Gm-Message-State: AFuF++l9Mmo6UeUZKcrCiCcK++CfMx/lWJrH8eRTJsl3PwU18yqLJJ0d
	sI3oCtKLCfRqgUfyAM65cBAN3h03iCtucAHZqF0U82W28VxC47G7jG8fQq9q5V+JRGHLzzG+Yuu
	TxK9VoWw/cYcXdnNMbB4XGZ+8gir9ICM=
X-Gm-Gg: AYBFou3WanPIFDXEruSsJMO4Q34nZ/Q47tHYpMGjl+5kbysGjLRTGQ20OE1zQsZQFLN
	VVaCfmBJuv27A2M6mFfoGuoURpnmpw1Hs1WZa1JmaU1i6rXPH3OrhC+VNY5TPkgLkOHMTeIrFKL
	Qo2+12zc9eaQujvPVNZ3UdussGZDllmkz2Sl0vPXV2dLtJWAIUl2WoyPIoAVqeHRkC2Ahb2fbBn
	5kIk/Rf4y9FPR4aWv8HmhtuTWIw8jYqhZ5/T75RHv3PPdS+O7VwBUlvvmtqrrXauTfJSd+vZvyU
	Cn8/1AKMmqbvYDFXuOzn0BKv/wrIEGFdDmaWDHvYcG49nQ==
X-Received: by 2002:a17:906:c14e:b0:c16:2dc0:e1ef with SMTP id
 a640c23a62f3a-c260c988de0mr274506066b.14.1788525929567; Fri, 04 Sep 2026
 05:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904111731.673341-2-main.kalliope@gmail.com> <e473cea93e948db9c27dc4ae0e993eb3e09011e7cbe8c8e4b305c3b12d866502@mail.kernel.org>
In-Reply-To: <e473cea93e948db9c27dc4ae0e993eb3e09011e7cbe8c8e4b305c3b12d866502@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 4 Sep 2026 08:45:18 -0400
X-Gm-Features: AcwNN1XHcgBQzn_feFro3WF9Vkiwio-_jIt5iIjF6wB3SyaChhdHyChwkqqr430
Message-ID: <CAJZwKkgz6h7cjeduFqh8yFsPLZrHaaJ6jp7BYrxjV40YDgnyxQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, mips: Factor register moves into helpers
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, johan.almbladh@anyfinetworks.com, paulburton@kernel.org, 
	tsbogend@alpha.franken.de, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Could the two be collapsed into a single sentence about why the move
> lowering needs to live in one emitter?

The first paragraph describes the problem with adding width handling in
build_insn(), while the second describes the refactor and the state owned
by the helpers. I think that distinction is useful, so I prefer to keep
the current wording.

Nicholas
