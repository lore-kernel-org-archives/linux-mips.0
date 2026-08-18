Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A51466B5E
	for <linux-mips@vger.kernel.org>; Tue, 18 Aug 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058669; cv=pass; b=f5Y48ih/4qB9GrqEtIdAB6qmKAhDOsS+S1ZcsFrp6fygA5ljaSAWJRSHkcjEzx8XckBUJskZk5+Fkp1VBFqtUhFGUcg3pKmYE1nxDHWY/GWq54B7uRIZZd5KMloXJvKq70n8B89+E1c8QQjcp7JAI9mxZRC1HCIZRiSIajO+YjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058669; c=relaxed/simple;
	bh=c36X0NWMKu7+KHbODZSDBkET192+cMQSiS2WCjFChvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAWlIUSCKYYK/0u5TwY91ph2iE41Q6poyGKss//xOXio/7v2GCe8ZEKu9vT4eChxnE6yFJ2KKsiL3dNCWx63Qnz5ZVUcgIuqke9fLbG41GJIQ6ynZtHWZEO+sh32P+lWsYYCnQwH+bZdOy64dWb/+GHc7lRapgw2hGAAdbwiN5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlZ7nbyx; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlZ7nbyx"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso583556966b.1
        for <linux-mips@vger.kernel.org>; Tue, 18 Aug 2026 06:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787058666; cv=none;
        d=google.com; s=arc-20260327;
        b=Fy2wRvFiabGUTSQYgVdeUEAESVxJb7YXIswjvIogXsH3G8JV3iXPVZVcGE5Zl79Hi+
         iqge1Tvc0sr/bpmWAlxiCdjwWrXpYcA/7MdIAB188dIm/nOmXCLpr6m0DrAcPqR+nUsO
         MD4qfNPydMDWcDpZXGZQlrVJnC/MZlVtz9+ml1kzuWxZ+mP4nrhB+o3oVjJHmAvAsIZX
         +ba58dSmEM5PhLlm7tF0D6QobyWpO4n9CB+1araQ+iT593onCk8ApfvFB5Ak6oEeVrPW
         8oDxrLwoVDlQBRNsvkAFSkJduiFIDLvDghpW/5L1NcXiNPgkoM9N4vugsoXwOGYdWCGX
         8Bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c36X0NWMKu7+KHbODZSDBkET192+cMQSiS2WCjFChvA=;
        fh=/tkdtVuagaMAW2GOcUIdFsjXTGLHcDBFWxMSTD/6yGY=;
        b=dlo58/SfvtfO3QjblZh/2C6HEjom5UFoSDKWUsRop4u7BF7jJcTmsOXV3aD5hIfpvy
         xqAuKe8xJqe9O6VkfUej5mFGkDpU2lg/3XedOsbDOPBc7gly64yKF+QgkwOq0MY1fHmB
         8B0S49BQsXmaw5UpfN5ebQgiUp/M4f/MuH5rgCfNoVDUYg7Bh0HY9j/fdlTt2aoZ4S4c
         imNwkNT1pHRb9ZWOSML2UyHDfwz7eWE4BWmNqDTZdk3qsXSGYmSvXQDkwd+Wrt67PLPa
         ejfw2g2q4Iu7xjoti5s4xxgTZZwCVA/sMty7bMR2jQTcdtcfSvgwbYKuk72wj4rm+uaI
         L+FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787058666; x=1787663466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c36X0NWMKu7+KHbODZSDBkET192+cMQSiS2WCjFChvA=;
        b=UlZ7nbyxE2cpDdszld1I8iXmRozRpoALnW557wzwZkR/G/sg+1+fHba0b/XGARll/G
         oww7v4yKLi6TbuBatJ2gVBRE8zfLRzRdd5lbo+aUw05sj1//augFZ2Z/ywFnRpYp0Ra1
         e88XTeHTUJu3tV0S+HqyLDGA4jIRens7Lom63CXrgGQWBMXd/VOCz4I5cUvRVOKtlQcO
         gyQsySW5vDcvhSNpGdcGKgjZc3ZJVZJa7u/gWVWgbzC6CSVbwGKa2BxrsX1Gcm8L/WcN
         Xde8FIMEQD5Ih+L7HZrCFLEY3kJiMIIf2RstDIvzM1ALuoUkjv/9qUA7beUya20FofZh
         DdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058666; x=1787663466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c36X0NWMKu7+KHbODZSDBkET192+cMQSiS2WCjFChvA=;
        b=R/21RlalwOZTJX2T5jLqhQM9TcVWByPoKnbFM+uzRWFuYv+KEq8b+jKos+mqon/4K8
         e/wwYD1QB4RtuzX5Dq3GjwgnDHZyD6IkK87iu0YltUoo7fjghC0oPsLQdcaCgWGlWyo3
         WCkiNCCuysSNeqjmQu73gwZ8u70BysKLB6TTTqPIkssuhogcOVJ/10vV95unLxtS8y6b
         YxXcVi85RwpC/7wDHAuYAUNX4ew835G4ovwczL502d0Dy5XAB9pRAijRRdwf76TCnlqU
         8jnd8P6SEnB32vuYKZY0pp6Vdt4mWWev73+MeqYHDbfXautZLjP4Lzv9tz/i025XWykm
         tPSA==
X-Forwarded-Encrypted: i=1; AHgh+Rqkv4pzBLR/a+iGmZ45WZ+6On+bG9kv5bPaA5icTxKGavYdLeeWHTPlPs8ASmo3wiTPnJeix4FIW7pB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qvlVv+tnO44/FVjWpEztH7Nra3A73Z880QxaSBaoMPJ9Oiw0
	huucmvphThSDq00trEictQjieolwtcJ+IPy5ybvZRbzogF2oimo/dfu/PioceIZfaWE9jRAO+MH
	E8CPuGQhO71vUETZRa/OSYfwoRnkW/9I=
X-Gm-Gg: AR+sD11Ugs+AnNyZoQtf4ukObtSR76B0rq3Bt7pZ8D+jVJ8hTzWMjIkFWOyCBQWzzXP
	8QHzVh9KQYbkPT0ENKv/LpUs8QfdTpssn8Bcq7qr9KSMm/rMJJ2teJY65QVaqQ0evMevg1KWEIJ
	gFwqBdA6UnTNlRIaxvtPmMOaXvC6KHXCrOuGobtiOLzf5SrjIPuAsv/iiYHOQqplNWfS2RlRGq8
	kIj5ZkHA5FauYy32dmj8Ti2jJlh6spHogFi515xlUdlQb0ypqij4PMDq7un93/7PQuqz6k1BXJo
	DMVxItm6OrXWXL2c2ziyPkCHo2ipOrglhsxw1mM1XehWuA==
X-Received: by 2002:a17:907:9814:b0:c19:45df:1856 with SMTP id
 a640c23a62f3a-c2188a9c1dcmr527333466b.17.1787058665803; Tue, 18 Aug 2026
 06:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810194215.3754591-1-main.kalliope@gmail.com> <CAM1=_QTvdWzBpSGnoLV7wiW0dsn_nc04V8KnYuntptQ5mF9Pyg@mail.gmail.com>
In-Reply-To: <CAM1=_QTvdWzBpSGnoLV7wiW0dsn_nc04V8KnYuntptQ5mF9Pyg@mail.gmail.com>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Tue, 18 Aug 2026 09:10:53 -0400
X-Gm-Features: AcwNN1XHCMx74YekEORVzWx4CGffmWW6Q4DUtR82Aia7lWjSu0IKoMhZW4rDKTg
Message-ID: <CAJZwKkis=3NGw9At0WfiZaRYEoMPbQfqJKN0e+vtRDvp4VY5Ng@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/3] bpf, mips: Add signed div/mod support
To: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, tsbogend@alpha.franken.de, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	philmd@oss.qualcomm.com, bpf@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please proceed with the remaining opcodes in the meantime. I will do
> the same on my part as we discussed, and then we can wrap up this
> whole v4 compliance work when I am back.

Sorry to bother you while you're away, I hope the holiday is going well.
No rush on this, but one ordering dependency fell out of my testing.
MOVSX and SDIV/SMOD need to land before MEMSX, BSWAP, or JMP32_JA.

MEMSX, BSWAP, and JMP32_JA are currently unhandled, so any program
containing one causes the MIPS JIT to abandon compilation. Adding support
for one removes the fallback, so a mixed program can reach the existing
MOV or DIV/MOD paths before their off encodings are supported and be
miscompiled.

I plan to post MOVSX today. For MEMSX, I will base it after MOVSX and
SDIV/SMOD and call out the dependency in the commit message. This avoids
carrying a temporary fail-closed check. Does that ordering work for BSWAP
and JMP32_JA?

Thanks,
Nick
