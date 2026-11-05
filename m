Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849811;
	b=yjQ1bDOmYwROcQ8BMz6B39+FswL4W0ze0qPOUM264R5psiVOeVviXSFqZBVQrpuPnoQ2
	 9q+y8lSrFq2ylfcrXvk3tC+IhZpmKo2ptm7zF7Aa974lj1J5apYwbXmHUmurbEx9pjNeK
	 0vccnH0pVHsbtNMZXlXKowaQ7mD7SRlWBIFf7B8dYJtsR7n0dXghbFDeBhld2v8TQGyJ8
	 zM3sjktJOCxnrZadLWNJXdaQdhxlNwe9XFYTG1BqzLGktD3AZpC0qAHUl+MlYiP4nQEQA
	 4PSw0BKx2gFF1fiaEb8vBHdn5AiYkkqQiDdsak+ks6/S3VBNo2ALderChQWyQtnFaXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849811;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
	b=tzWEadhphzJ2DDsFVBDVPgwDF4dOy+TzYe3j3D79doErTYtb4g2pQGtaIS8Es/x6QhvC
	 VP6NxLgfQLya8gtRPSCZ8yHgp/cg6Ei+L991WjRqoFt4gj1mokCl5jN8hRxObaUKS4UbV
	 p4M8gI6LqiynYI2Wa9fK+xBMrhMO8+/uBleXn2f+lIgBCKaNPPrJ2u2sPYzWXpJuKZx9U
	 TgAGoLspju4LctjRwp1XfuiHurJhULDGpI+yHxxE4zbzviRBaKtM8GAhB3IlsDy2D2ojW
	 Frj/vZ5yFyfbm/DMJeU2FzRDIQclK9aO6w1yuzy76+DaG1uAhwNk9rgxi+NbHmYNYFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5634606A328
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 03:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5634606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso847426a91.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 19:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849810; x=1794454610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
        b=CqonAGyuDNuji7egRpa9ro4AcILP65YxOFAkOoEG/ECkbagVfvCakfU3ni0HonjeNr
         4yT/2TVI5Lj5BZl0fVJHUjU+UR/5FUsJOT0MR8M8b6Ofzg3iuST49A5ZS3mMYJOlGuST
         pfuBhae4AJjTJdBa0ba3XhimCkW+4czY7AzG4hTQpFijOTYneRSsb0k5IP893GyejPF8
         GZoEUa+3SM+u+Ey22HaunIdQMwwSmAnpZ+wxsRsSejPGAtTm5E8fx2h5hD/P/J1RZjvy
         PIGXhj+we2/53HQLDiaYn2sDYNRfrNUWeMKEOYpErtEN+ddAzn2uhslOLooPDuTt0SbU
         Qceg==
X-Forwarded-Encrypted: i=1; AKwUvBxucRwfELi4q4qM03YFCo5ohlIzybqeXI9bw1+tDCiY7UY8mhQ4FApvjxlUP6p19Y3nb+b2TUCcYLH5@vger.kernel.org
X-Gm-Message-State: APuU4Z8XvAX7TY0QpOnju2ywp8TfQBUC+SpqanHbA/SCAWv1iKiJdNeQ
	+N0iLqkuELzaXsziicObgt7XepJIv9Z24KnLIIUJRV6li10cd8LMgWYEvwnGnaIz
X-Gm-Gg: AYBFou2QyBjfhzDdCgZg9X5FoFogBNCYhWUwStPaN+XpQMaTB9kWiTWdShAbpceRSCo
	aS9x37SvhezMRmh/TK7zBtm6Ip7pid9Jv7rGCh1LIkF0RR5d2bWQBLdeWltfc1Pxvxawi6TLUy2
	t28bsL6/IEsGJCWiRYt7HSGYi9qukbofPNDvGZ1Aahq0S4yf9fbtulsQJr4vKZNi2MGVfvI/GEj
	FvowisYhQXxQ0pZ4wxuokvfhL5/szLKqVpYc6sdChP5IiSHYPQ4a/Hw0Hhl5QE/X806M0v7V1rb
	OJFpeQYl2kfL69a7ijpBdK2Mrv4pIv7UE+N8G50WdID5clZW3Lfz2efQ+00p+DuurmdVf7bDDMC
	0ZXTvAjfYFzrw/YxFAy0JcUruyvjMvsdbHBf8hdthQMdyhTNZ99/GldtzLYRbMC7UqMlgTldD6k
	0WH//mvlxTQxoRhdDNRBUhXUW2I4g5LBHpAWA7eesP11mle6lvATx76HV1LMti2vqV80MSacMAy
	PGaKn6F3qfC478Vi3riU413muudVt2LDkiEtr6HisfraXDuDtHcA8FIN4JJmp8ddHZql2WtK30N
	60Fpc/tMxINMzgfvUkD7shFkYclqCWhj0l9gjOx9f/YSDNHMd30bqfgX8Iku0ty7F/kH4/ehcNx
	qhD+8cfLuBTBiKcfklQiNQxyN4Z4HTELHGAbCkmU=
X-Received: by 2002:a17:90b:28cf:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b099f8ec17mr3118324a91.66.1793849809993;
        Wed, 04 Nov 2026 19:36:49 -0800 (PST)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com. [74.125.82.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d4bf1sm1490769a91.16.2026.11.04.19.36.48
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:36:48 -0800 (PST)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fc585291cso1433420c88.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 19:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwbdBSw5hoTE8Sqy1BGEksdFI9z6AxA+KmD2ekPCxbLFMCDTdRDHIByQZNw2arhgyjcXZcT1yccM58l@vger.kernel.org
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id
 a92af1059eb24-1ac5d1d058amr26264865c88.22.1793849807402; Wed, 04 Nov 2026
 19:36:47 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
 <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com> <20261105-dreamily-quicken-31e2b446a942@spud>
In-Reply-To: <20261105-dreamily-quicken-31e2b446a942@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 22:36:35 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
X-Gm-Features: AclHuK-3idFUv5nBVANz40sgPgySfpizpIMP20bnEM1ST-bN7ItPz_5x2_r8WXs
Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Just link me a tree somewhere with the dts, I;m sure one exists ;)

Here it is, on v7.4-rc1:

https://github.com/The1TrueJoe/linux/tree/sf19a2890-dts-v2

and the SoC dtsi with the twelve managers:

https://github.com/The1TrueJoe/linux/blob/5aca36c1b028fde1794eacda4cb6c1a5f8e9b96c/arch/mips/boot/dts/siflower/sf19a2890.dtsi

The branch has this series and the dts series, with the v2 changes from
the reviews so far; v2 is not posted yet.

> > If that should be one syscon node per block, providing the clocks and
>
> No probably not.

Thanks. Unless the dts changes that, v2 will keep one clock and reset
manager per block.
