Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841099;
	b=U4IYh6k67vIHctw3aQnn3Isim9lmXPG5U86oGA/VMGIaQ8Zu1lPeUTXbXgTkycaa0Kta
	 dvjMazWcZ7ztrELkMlYDnhfnPbhU8Ib5uDINdwEEMTzUSkI4F5BKsbUErbXDDKnRaWhDf
	 DERtDfq5qdXH5xnXhy0V2EluVEyson/1rBqh0VYYnpH+ZMX4v23sxK5MFI94dMjPHO/FA
	 rsdgbyJRJ6ECul1iUDgdFDcEm8Oe8xYhd9pzLrCTQ3tZw3K2lj9mKgoMDroqJfe9PRY4w
	 al+r1f2/Yonupz8cgR23cbXVhSfMX+xFDUnRyvQQgJF9wSngYVtomNy1NvV7dFQ5PVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841099;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=afpW4vnpyJp1rQF7sDbdJVsvWT4LIy5CP2XonGShR/Q=;
	b=IWGpbMjks8MGZ3H+Jl3Ri6FPZ5xlUsDcgFLLeVvGLymTGS0cAAqLTxWIYc4HKhkw6oZq
	 3vNH25SNCsBeoWds+xDnhSg69VxLpXdy5LHizGiAUPve4PxGRpah9xIzE218Hi19oQTBr
	 TGbv4ykdK7pQoeatV3mhYRP1xuTWy7PEVev9tADPVnL86isUjxsaQwS+zsTxoyC34skvL
	 0VfKO2V9obt/1zMWGgOVUXTxjzdXFeTQp187Udn7KtCsgpHBoI1p7SrTEg66JtX8YOFIF
	 19ZNrbnKW5W/8sgoosIKYAEx51e4pM5dCyCVLch/viQWCcA66Y6v7+SzIelj2dIZ/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B88606A31B
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 01:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B88606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso820503a91.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 17:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841098; x=1794445898;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afpW4vnpyJp1rQF7sDbdJVsvWT4LIy5CP2XonGShR/Q=;
        b=jpVXL3uKMispTXYv28R5wzn2SJxYZgRWV9JAiiPxokcpiqMldyyNTCamEX5bDAtsT2
         yp+AXeCifcyid2HbdYmPKlccLbZow2Ec180DT23B25qhIvuqEnS+l6oGGNs9221+/ghm
         ERhCkDHtpMvR3WIJ6RiVgf6xSHz71XpGR8m5J5digHbLuP5GaYceq4q15rQRrYbJehOP
         O9hFChGZSB5PnpRADcq/ZsnEdCt9BMNn52cqNO4QBfZ8qOKixkzB76y2YJtxg99w8j7S
         YdgqYK5hqYJ50qsWcMtyfNX9qfaCeOoH3Kj4L6LEQFaUdI0h/njcZsYuLMvHro3ue0mf
         z8Fg==
X-Forwarded-Encrypted: i=1; AKwUvBw4yP2Z0TCnRuOBn0oeOs69kRMZa231LqJ0i49eo5Z60TLwqrGAGczN1FjZVTSJz4LyRqMr5XRbs1by@vger.kernel.org
X-Gm-Message-State: APuU4Z8VD1nfujRVK7oVvAhv7d0DEAr4yrj7pAYDXIJej+NqVhvpLwAu
	FbZpKVbX34TiQO53ItVrdC5sKs3cl3/k7bl2PMngBjmgkAFN4X2lZI4310rYr8bu
X-Gm-Gg: AYBFou2cVZ++maoKOcvzEVerpmUHtEYBI1OpSswtNgI6UqIhUNdVtZ2fKafgIWnlhAs
	7vbeYJnk/D2Ghk3SyaUYhdtzGeE2TLB5w1UjBwwHkDHnw75I9/fJYz4WC/VsdHcVfyvOr6lbpdX
	jJD4TXimxJQeKdHB7kWbH/iQcGG0g/KdkJ12htzADuquyCg0xfwn/O4bI9fejREWQFls7CeL2bu
	1lZ744h1Zf5GzGOXDEC4BlaWRvM25Torrw5dQ0gmIo8LskAl645ANA31+umLoDsSPE/3sdfNWSI
	dS+jNiM/4DpOTHZi3VikNDd4Qo6SzovlF2h8VQdkteQP+HPrJZZ0m9aZX/UGKKQsTGDXuBcKjht
	coNuG+Kk52K+byKKLGn0N1leNtYW8UPlREx1PUL2MVEl9715n3Dih6qqXNvhaY7MaPlhTGzOwst
	9ZdsEQ/+xi5lBpm32OQD6+41uF+N7gphakLecCWKxZfbdV0V5kJ+gjj9vknEvCUuK2vLsT/IZbJ
	wr8XR+l8h+EEaNVCksVi1GcG4n9mZAKYPXIRgzCDSQlul/8U8VO4gO+ed+CNqrwJu3lmtHt0z/H
	v0XSpij8Xgu6hJSgowJ9TBPWNij+HZSnXAyUapGri9yQH2CEHwYG4/Hduev/H5W+vbT0F/6+Z97
	qIHlgVwQ0IBGAGEhzRREwrQLMflREPygI6JCcpp1/3uzS0CoiCZReh4lMC6Pf4UyM
X-Received: by 2002:a17:90b:5645:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3ae89776880mr15161574a91.10.1793841097958;
        Wed, 04 Nov 2026 17:11:37 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm1386707a91.3.2026.11.04.17.11.37
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:11:37 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso2565927eec.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 17:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzfWLE/2QsGdG0+3bTGmnD/W7aXYcufQ1TpdYCwTIkmZ7ywWhkm4qqk8PgrOT6A8jj13xdK+C9sD547@vger.kernel.org
X-Received: by 2002:a05:7300:cc9d:b0:36d:2f0d:217d with SMTP id
 5a478bee46e88-36d2f0d26b3mr3496824eec.33.1793841096817; Wed, 04 Nov 2026
 17:11:36 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev>
 <20261104-sf19a2890-mips-v1-1-eae80820af68@telaak.dev> <20261105-stellar-viselike-e56010ed5fb6@spud>
In-Reply-To: <20261105-stellar-viselike-e56010ed5fb6@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:11:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Ao+YDt6aX8+h8dyCsEs8CK1nzLpquUErPwbyce3OB4A@mail.gmail.com>
X-Gm-Features: AclHuK_YtBOeVzlfxROlhjFtxAVCHbL5PR68tz94OCdt7Biz0baVYxdF4RY-7p4
Message-ID: <CAPY4CJ6Ao+YDt6aX8+h8dyCsEs8CK1nzLpquUErPwbyce3OB4A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mips: Add Siflower SF19A2890 based boards
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +F:   drivers/gpio/gpio-siflower.c
>
> Based on this gpio thing being here:
> pw-bot: changes-requested
> The dt part of this is fine.

Thanks. v2 will drop that line; the GPIO series will add a MAINTAINERS
entry of its own for the driver and its binding.
