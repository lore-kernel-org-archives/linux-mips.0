Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839372;
	b=4HPuGbOWUDT0oemfJuGxxg/vZlMm18aDqJlLo4rijAHzkbsR7uEZf8N3uTw0eIGjrW6Y
	 44QxPIVfL1EG0fKj/RGvfw0t9NEPuoGnW6IvS3AhKPaFO1Tl56mo04WMtlhelrI5VojaD
	 PhhryvoNTnmE3+dKfsk8fhRsNiZcxSX2v/keYpsBT1e0eWL953m0Th1p9G8Dr9g40iQfJ
	 uW1qKL/LsN3lLb5wwRucIXsKxcvaMSRGoTFIprckeG81I6Rib9oLtuUe7pCE2tuaAbgYM
	 W+d3dsJnUpoeE3xKlt9s0OxzXykcb4kBQRFvWSzyo1GDCzED3ctXuWISUM5znd6KXiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
	b=VZ4RWVKFKQv3EhAnOg36A+Z+iJT5lZrjPW5zGu12EbUOrE98e/Uf20dTz9flLkpnRhcQ
	 /aWB+zgqT8YM8hhQC79uENEaHLsEGPT6skcGtbdXaaFdS2gJbBlMEN4SxrimzqCr5DwQs
	 vwA2M7lA05l26mgEVhcQyEkoAaOvY4fzmtvwipy+BIjv4Hc2xwZvxx7pWnHeg4hyNikz5
	 J1fxxYhtImi4iP9HLjAdqqWVNiHe7vL4YwvLLe8QR7gmd+geELOEgpAw0KZjAs7Wx0X6I
	 67KEt3rKQS5iPFW8r4tfcMXGiPZp0FAAFG7PxtdBlIBnCErrOkBznyJv0q8CK6DBTVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C59606A328
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 00:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C59606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso543816a12.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 16:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839371; x=1794444171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
        b=zOcVk2TlMuTdeTjyHjV0e4UcrMGY9DRQvx076iYUwLagtsbvmq4rb66ofM3crE6Fju
         M5Pw6SGF1Duiq94EpT+HTVHxxGMMe72BmTnq+l5n6we81mxpC558iOJeFMCXvY8eaoY8
         gcid9ha55AxyluhJtte1o/lNZ452NztfiOSr9yDdg2GOwkTxBLgwrbL8XbiC+/NLiupJ
         KKkHjE3xTf1u3Nzo8Xc9gRhcmv17XiFVfA8tXkKvLFUwlUN/lcPuH9d7c/6oshQVRVLP
         DzpN9vP1jLWVdpaNevxquhmpZSlJWZ9PzhsBCtNlD2qYm7pjayoZEmixbMMRwIVd+oYi
         InzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrhWR8MB3oSgwL/y1e2QMcuu4aXwVsx0H2tQEkz9Twjfs4Sn2Tccpgw7pXFjXTZCopcuk3dl1sQ31j@vger.kernel.org
X-Gm-Message-State: APuU4Z9DzTy0JD8ernpktS29bNEiecQsRaaVAc4rek+OPVNrxMuk3QWf
	Qk7169hmUQ6EQ2srVOldDU4eQnNqmglFzzg8qVCS99VVO/u0vrKkAV1HV2s7cVPy
X-Gm-Gg: AYBFou0gNPtfgXw7GSKFrBGnAj9pbA3Zn1HYZsyT3Ncew2LwcVWkok5KL1BH7KI63Mu
	Xo6/zzrrsBfkhgLNLpAJGdQHogJvEacjCk8vk04RqfXIX3T076GQTxVLCgYv1InUAsl8dN11kOA
	c1fSzTm/vlZnZwAterO4DDORIf1JvkcosbNi5AKp+4TaA42GgOIr291UyO+2BYJqsYrBmEFIr02
	4lmL5TNMyihHnQ6uiuhQ+DmoOS5gDM6/ASF7lL7FswPd10895RzE+Rw+iRSgIdEyjIDP4ncOFET
	/X7AaHLz4kPPPFHje0o9YrVn3Xdjt4tr/WNZ1CXLeyuqKnsnhXV3KgalkPQnQMbFgys2IP6h4Eu
	17bqVL3VIaB2fQsEDCgyzbmItflo43HwZNED4NBjJ+0ywy6vDs1iDUgL+wU0kIBEvze6o1JwJhO
	bgTngoqEwjrIIohx2//TwuTLB6WV06wJad91eUdnXMbKOfCOXvAwDEtb2RsUSAXt8lVRx6u2fmx
	vVqjqvkh68nmOUq/azZLg22pdkRC8vTvstO+eDq8MZPWnPMfUfWZ1/+L9CJ94KeATQVXMnlUER9
	3lyT+UB0F6xtHQzRsU3zNMEsyV40aDqzZBBwd5I5B2B0hGqs4coaOulS3qEZLBdsX0XpnmGoJQV
	1EKuKgZ3b1Bh8yo+2ZykonnFPbe5iuw+1dFU4EXw3bwMUXg==
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ae89750f64mr12443331a91.28.1793839371461;
        Wed, 04 Nov 2026 16:42:51 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09699c0fdsm2916822a91.2.2026.11.04.16.42.51
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:42:51 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a18fc7a38so795057eec.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 16:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz7N2D59E2Iw+R6wEJA4kFyZV9yWQGlc8wSS1gR259izJlCTv6Ihn+P9SBzcvczofYZxhpnQ4j3mmVO@vger.kernel.org
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id
 5a478bee46e88-36a423e52c8mr30753485eec.23.1793839370626; Wed, 04 Nov 2026
 16:42:50 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <20261104-judiciary-fool-05c4157a7cc7@spud>
In-Reply-To: <20261104-judiciary-fool-05c4157a7cc7@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:42:39 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
X-Gm-Features: AclHuK9UIWS9fpedIq3oDi0GN4EX_Euc3hJiZbuLEwPXjtpIZ-TUvM_M3RT-lRw
Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> FYI, these other devices need their own compatible strings when a dts
> for them is added.

Understood. v2 describes only the SF19A2890, and support for the others
will come with compatibles of their own.

> > +  reg:
> > +    maxItems: 1
>
> Move this below compatible.

Will do.

> > +  ngpios:
> > +    description:
> > +      The number of GPIOs available on the controller implementation.
> > +    minimum: 1
>
> With no maximum?

v2 drops ngpios instead, since the compatible implies it: the driver
will take the 49 lines from its match data, and the binding will take
exactly four interrupts, one per 16 lines.

> Please fix the ordering here too.

Will do, in the same order as the properties.
