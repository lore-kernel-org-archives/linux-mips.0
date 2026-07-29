Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530C61B142D
	for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785351313; cv=pass; b=gTQQx9rbrRbgA16AM0rsukoMPUCDQCIwjV12g+0Bo6zwLlHmMb2wrhv+B7YsrmEqEiIA7YO8ga1QQzJkaGq9acza/PstxOiSc6hji3Myd2Z8zdw+FIJS0LvPbLvA9kMYtyua4dDkbXR9th8llbD/GBo3ciZwo5OE1rrKMgoD89s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785351313; c=relaxed/simple;
	bh=J7Q/JG0CswAWT05HS4viuqu/HlixkuPXvFfCWhRvvqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKniVVBGnKWGC7p7kiuekvU8oWvlraIF8NP+C+cljW87RGLHSsgWAemWJ2gBKxBBxBiacTgP0D2baR3qvgPUThDPz0bQ5QMB9H+83YUwnhRzaZQv+PDLaCRcllhPhQyUAn7w24mUBpm/pMKC2q+Q62RKkZWqgZguMeygQYge97E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD/49TbQ; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD/49TbQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e2dab83eso203056766b.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2026 11:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785351309; cv=none;
        d=google.com; s=arc-20260327;
        b=PgjrIYTR4qGyEmYRRyu79ye2Ju9XSleJIIwbb5E5/lF9sjSA7Z38fbYJo3banBgxj/
         PZgVkfOR5EqSRYyqtbvOaK0rllBbFQmwmIG10dFRgmwh226X734KPKMaM2kJgbjLEIaf
         e0Zg9aQSjBfZg1YgvgZgTbxQtNwqPLSbnBoZuv09DWSA+EEhGxy9y2eI8BlYuwlCa/dW
         xjI3CZLTBi+3gPK2YuqCrePqQvIlEjn2kgpTKvAwVcGJb4UChGxtNYPMqbrcHpJ1ACzB
         PrKhn6Hif88AhaAvqDIANRmAzPX+sj/NAq4fdhWVNdRa8nfylIEjBk3dv+ZTmGrPP6a9
         6VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J7Q/JG0CswAWT05HS4viuqu/HlixkuPXvFfCWhRvvqA=;
        fh=V5bEFUwNExyhHgpM8DSdFEIhpSs2uhFtp7gH5C07EF8=;
        b=J0V/UwtFuW789Hu6q+l668v5g2A0V2Ezv2G5fkenUQl2dRRYr3K/4TCmYnKPGNh5qC
         rg2f6Qh/n3Gtv/F5rKkLLUlprKqGAsIbhHFjmUWL6ye+c1k0sHkqA/d9rvrIdAb5ZEaC
         f3jzSsv8+PEoauEv59gFd4trYEFnx4jkKQt0AesWZjJ4lw96sokcd+sKI73XKmCOlElx
         d3erpyUV/wioD89eCvTaSTi4FQO50oLTdAWGpSdvftBvbc6e45Ox9Et6NSeQLWhRrDL7
         oEVZouRqup0m23SDfRLSaL/wXt62o3liSEmJOiT7gtMw/NeU2DX53Lb5UoJ9+PVvfVtR
         1uzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785351309; x=1785956109; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7Q/JG0CswAWT05HS4viuqu/HlixkuPXvFfCWhRvvqA=;
        b=SD/49TbQ7ecu0O0yrPXJ39fhxeZ+irmfAcw37GW3j2glDbWOzkZ/6+q8nYYNdwqAVL
         YMdPf3qfgdat4u8nE0Zuks94EFwcaTH9escyW7q1DUi7ItPwaPGteVXh3YSqqw+y7Bhi
         +bSLCsrks50HDPYnGE7JgReSofvEIQz9XTzcOSm8+FqO0HU63DIkYYlGI7WZySmxM686
         2jO3s51ibMWikiwM4RMHJ+Yx7uZFsgzi5B9/gdyKLSbUXb4qFt3TYddnnb4A11lBXDv/
         nLETkDpKy79I0QIrIMIMsTRR55lLy9YJAadL8RN5Q9+w6ZnobLyc1cNdBdBBuQKUdeR7
         G6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351309; x=1785956109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7Q/JG0CswAWT05HS4viuqu/HlixkuPXvFfCWhRvvqA=;
        b=atZbuhs+MjBpchfc+KiEKmrIuu9Zjoj1Uoe/wkQ+R62Tu9t6thxHQAI3ZX23qSiDX3
         hy6X6/EF6q7sroAbHzNJf5OLglFfR9kd4rQFet1mwVTmviJfcaHS/z5F1AkmChXb95Rj
         0NvclWVRBAK2phz0SO3DhEP/nSraIKkrYlb0K41hz0l19r/J4c0s1fj+TblhfOQ9US6i
         KFOpOVstNgmYrd1uKceAVMGgVcvgj0JoAg6OpXz4D0mjDH1x6Vv/aX7rB6ngby2cdAFW
         rRs4q21hqgMy/Nqs95XnWmvUKQHuHoTn0owvagMJY4/JQXirVe5xAN5qQH1DfW/BdwOZ
         5wRw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+MZ/5vgRFAS2brh+AjlTJPBh3SQ+m/KPunoC1duIXvLolfqDhguWCFbdZxM3+cfNAvGbtdstDKmUa@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpAi4PRjRu4Xw0/darXpEuokh8Rcl+rOg1r2khkMvIJOvOSJ2
	xqoIIME/sBtjbnVF8yUvxdvbMKOGrqXtg7t2n2uxcgf8mMTMTrjiOHJ+ac+HJT3ZAcdMie8j5Hm
	mGYRTV4MCbngEH2l8N8qirtgb2jhAr6w=
X-Gm-Gg: AR+sD131wmqyTL8Res3kmnHItRrXAZYFB5sSPjFuqBFl4oBxKqEo1OTA3OJOBYeHfpe
	89HZFXkzyCGFbywluIat5JRlZ75RX7+WDs+91Y8Pgx/1Mj05zfaVETLfniQd9N295TQK83pgNxp
	ioDCbuQAN9zxrUAoNOAaIDADQeT69+qFpQ3+8NUfcE7Y7sFfc6QtPOhFWZW1APiHm0jU27rmf2P
	XJS9okkrfq6dZQDna1ir0oZ7/VRIsdihXYMDZZlC12JWQHTAfanaXUOxR58+I9qVbQIOyX0UaOx
	VbpNviNaiPqY0MEo8hvPc8Dp7KABdDah6FFpBtF2/pH+ho8=
X-Received: by 2002:a17:907:8b98:b0:c15:de33:a018 with SMTP id
 a640c23a62f3a-c1f72172377mr425820266b.45.1785351308941; Wed, 29 Jul 2026
 11:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729162931.2369353-2-main.kalliope@gmail.com> <c517c61555d5ac0e7dda77c6f9a4e3624ef8ed742d6372ab3d5af4879291ec4f@mail.kernel.org>
In-Reply-To: <c517c61555d5ac0e7dda77c6f9a4e3624ef8ed742d6372ab3d5af4879291ec4f@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Wed, 29 Jul 2026 14:54:57 -0400
X-Gm-Features: AUfX_mzbDEUq0RxwG2PGkCepUkKTA7z_JftWhQx9fqbQwagGHCFzwbNwaMMOaBI
Message-ID: <CAJZwKkjS6aREL7zSXp-4XDL7aHjCmLpUFOyO8nPAiJMUtBgSTA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, mips: Factor out div/mod emission helpers
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, johan.almbladh@anyfinetworks.com, 
	paulburton@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, philmd@oss.qualcomm.com, visitorckw@gmail.com, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	martin.lau@kernel.org, clm@meta.com
Content-Type: text/plain; charset="UTF-8"

> This isn't a bug, but would a short header comment on emit_div() and
> emit_mod(), in the style of the neighbouring '/* ALU register operation
> (32-bit) */', keep these consistent with the rest of the file? Every
> other emitter here carries one.
>
> Same for emit_div64() and emit_mod64() here.

Agreed that short comments would match the surrounding emitter style.
I'll add them if the series needs another revision.

Nicholas
