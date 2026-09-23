Received: from mail-vs2-f26.google.com (mail-vs2-f26.google.com [74.125.227.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712FE412BFA
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185309; cv=pass; b=aXgfyceXJYBrsYkH3LhpMJicA1k9e2pYTdg6X32CjmMDpJvDLr/NWTWawcx+/pFaNKyOpkcEjYnBKm0DPLL/gTj5dZCHpSScD+esBJeWnK2fh3IR0yCqx8PbWZrSEabnmXwpepF52zntJjelgVOQddk9yGlj+4/LVHiVNuTvaAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185309; c=relaxed/simple;
	bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqbnu8V2NIhHIY8tqbUhKM9YA4DplO7WicxL1nYntb5ROKqsohnNuuwpp7n+BWxYWJbuosEGdQtZPmJph4Y2VSvwdZaQ6nj5tg1uKT+jorQsvxm413lLI3LF8F+g0Q45Sba+cmODLqvgVp9YHahfAQXRoaeZLIzdWVTNOc/h1YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=pass smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b=XbqwyzBO; arc=pass smtp.client-ip=74.125.227.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b="XbqwyzBO"
Received: by mail-vs2-f26.google.com with SMTP id 71dfb90a1353d-5c67e529da9so488418e0c.2
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 10:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790185307; cv=none;
        d=google.com; s=arc-20260327;
        b=Zd36t35zf7OMKroRtnN1hsTpz3o7/YuVSZHkvhaSgyeZiUDdRaYDdoHBWJnJTqwXBr
         5Y/MUTN6Sm8Gs/VzpdPjraWnE95TkN+wKjh20cEUcRI2EPH0/77SeQCulPcoxapjLdSP
         GHqW7BrYrJY0fYY1DFW939aO1c0CdRVpBSD/2UoG5f+Lnwk4CEvhLqCpILk+7bJW96h0
         SB5pZln8e+1hFvNPlQzEDFnmE/GIIsR210UvVoKeeNVau3v4leTrReShXGiBGYPaa2Wk
         vzcRRm904BHlGvm9OdcUTxQRS1SKzhBZmoi40rTskxCzF+Tfbzn7odnZVE93Rs2wgW1f
         L5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
        fh=s3lpCkSuEiFV0T5hBcIonUh9rQn32Ql58VuPvvjrL+I=;
        b=Y36hwzSE7V/vNqw20kZQ/t/mCz2fmyYxs/2HOgM1+4a3/bIhwzT9oQsG5HCCbFqfvQ
         oVlVxIKE35ludc+Sfvy+bzYHFXdXan7HdRqX0m+Tugk7bDEfpykpfH1PdkFLdFzQ2jY2
         H/ul6YmI4kOjrNmVYc0wq+oQYx3J+pR9ICEAHphHSZ/G2j3gd3FCwcEFkUQNAR+6Xktc
         8fnl/rMyhW3mBIxSSq3rTYw75qffMvEYPctvfq6bsJ7sqYwbb7aneHIfbQGexm3rXIk3
         W3FhTXvyb4RqSaxWB4IfrYq6rFhpFCy7ES7eTe1hobShRf1F4A9J9HekTxFb+VEALl/n
         opaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks.com; s=google; t=1790185307; x=1790790107; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
        b=XbqwyzBO580wnwSqu1bce/6Bu7P0NuoV8UcknY8G8wgjWYDJzy8WJFPYKSAvR5WLNN
         SqrYwX/vHaHnCxWbP4Ex5w22EI8A0pyLqJQNBsZdFLomS9iqC5VCddJE/fPNmlZDNhDM
         +2Ue5+9yYvHCksv/eRB7xr59f+5m4qTTqDjfZOhvu9JVdCumdDupcdokUjLxYhBPjHS9
         XrDYAkaI+aAkaw0VYacR0l1a5k93WLyl79yINDtUn94ttjq78d/JhMcYe1OXsBpjYeAr
         sHZ1u89SuJ6QPi7YkRW3h/8fm2u5Ukrxs76FAr2lGNW4yWn5FW1Ll+zORPHUolQ3BJC9
         Abxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185307; x=1790790107;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eTXt+YWRlRejCDOgioYTKQsqgUN/p/gA8amlQ8yNWKU=;
        b=WgEWfAUZmSCbhUIE18AJ35BE4ES98t8Ft41G95wLqODGkCMlmHKz9vBprIpppvfHwc
         Mf1UOk25JlZFAt9BHKM9rT+nepVycA8hbVyUGHVie12n62x1Dhy42BEPvsmEbKTYr7aB
         R5IKOswgOwVweSvF6Np9Y+cKtvdyq81o9DwX77x8O9a9aq8tPml3t4PWaLL+f9TNvoJW
         8KY9QSo8aLexyC6eOor1b66ya+DFi5jBmAM7hRRA0O9OKiZuXfJ2LSZSCv7sB/O3XS25
         ZU9a/xSRF+ma4S+gnaI41l2iVG/YKGlI7ERBClrKQdY59p2HbzjhChmwVoXaKqWM31/V
         3eew==
X-Forwarded-Encrypted: i=1; AKwUvBxfFMHqy7hwYKq1DCKxJHi6HJuVkuHHCknpMBhOsnfsQFuyZVi89KUDtJbEESEDeOxgYkYz7dKfK8ph@vger.kernel.org
X-Gm-Message-State: AFuF++n7kd3L3J9jC0W9jrxeoPPZRTscG/SNxvitBdUhh74Tg/JuFGsc
	5uwvDyqThToV0FNMmJ2y7KkkMRQ2QVTLjhtyHCUq1jS0E3DNetzqKbmDVJLsywXQRWSMhJrc3GV
	vaOMvlaQdTDhUzrNHlukG7WP9cdyCMBdZ51jFhz2M6A==
X-Gm-Gg: AYBFou10bPPHPVhfOObc+QHP+v6BcnGv5Pzk+S6Uxw6QBkDenzmZqdBptNB6RVzGsFG
	+A+ziodniNu9a2YYC/DfHKmbeg7LwFbDV3LSTh0+ODE4L6gDnDlWEu43bXb051lhngmK97c9vEh
	50gUF6b0XjMjQP09i97PSWkacyHG8WUbgNJBgkHKbJ5btTE38WJrvrm2pCFQ4WuX+ZKALARR8lc
	PQEuwoug2DDc7LfyLegAGqp6yKOAyScKgtl45gbI7UNGR8Dn3i32FbJrzS/MwPtsHQsBi1OJHJR
	N+tZyHJc1bDUWJf2fr4PCA/t0ljECChUARtJ5j0kqQw/ayHOe64Ald5H5P86UEL4+g==
X-Received: by 2002:a05:6122:2207:b0:5c9:a60b:e5d6 with SMTP id
 71dfb90a1353d-5c9f167b9e1mr4151746e0c.16.1790185307262; Wed, 23 Sep 2026
 10:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912180643.1426488-1-main.kalliope@gmail.com>
In-Reply-To: <20260912180643.1426488-1-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Wed, 23 Sep 2026 19:41:36 +0200
X-Gm-Features: AclHuK_YVE_M0LMnByAXkUpK3TPaTMcOIBWbPB_vF5KvqXaURtUamsR22WrjU-Q
Message-ID: <CAM1=_QSGvyph2hUcf4xD0gkNeVN5vM-ragecigyy0dGpr3ZU_A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] bpf, mips: Add BPF_MEMSX support to the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> An out-of-tree
> fixture strengthens the signed/unsigned load comparisons and adds negative
> and sign-clear loads with dst == src.

Consider adding this to the test_bpf suite.

Tested together with the other MIPS BPF JIT series and fixes. See
https://lore.kernel.org/bpf/CAM1=_QTjcyMtMLawSFnCt2c5wJJ-if40GSfo+o-CoZqcgx5wYQ@mail.gmail.com/
for test setup and results.

Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan
