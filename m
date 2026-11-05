Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910976;
	b=PmXUDgzvOnkIvMX30xAzzBFiKllojkRYLH5ENTapYEfDGVpgHenN4IfJWXyInDxB6ncO
	 bFX4bO7wLkbW1k68SdXbjfOSzpO80WxwVCUgJVQM9BHWE8qRMLkB59Q41XIZS0Fyk5RWZ
	 lZ3XB375mdLo7WxLG83Vtz4VZHMDFGObbqJl1UV20SQGvndHPjGYzGZYtU/oKJ1dN8sNc
	 yUXv1MIQyW7SzGfTspFzhONrGAibMWUH9xZOKGKSfxnKagY37lHiAMBGknyk66SzXq/mP
	 OfkRnHC7PQpPVDPvu4JOMwgKaPpPqV9LHtnNPSyTlwnT0NmXL4XK4F9V6ama9I3Leww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910976;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
	b=J6K3qD7fWFvg7p8o2EAcS4lJNJeJc9w6bkiJo3+1lfHK560zL/jUvW1Heh2/hsxUtEzx
	 LqOMJ43YqJYJVx0DqBZHunGg9+jps0ocAyGbAQ+/TaGubRzYnEs44l/Yyw2Tfn//MQvU2
	 xsWsc4VIo0s9e25zyUN4flkyg3eabgn9xyM5yi9o71PqIS+Ssdv6amGDwtazuiIZ6Ed77
	 qYFOFYy7lQpHutGBMYYLvl+ggkRjyxQ2f2tKkjfn4K9sUNvuYV/Z8deWpkMQ32ZUd6C3g
	 kUH+EDBIGKL8rFISGjlXcZ/kg1HOvSE8UpMRm/+4WW3j4z9f6PKNBz5414osPiC8lhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD46606A32D
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD46606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1309061a91.2
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910976; x=1794515776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
        b=czxhzRawQmJU6/uNfKR68RYxXKK0QVXiPq60Gy5A5vmdRPNafehGeVQDVaYS6GFGMq
         /vuGtFm9qGCABsxZwEiuvWFvXN/p3teGnOSyiVkd/VkJtOxWxnBaM4GdDxX3d8qAc/6l
         BunZNE1QPAMMD1DDYEXNAl0IGzykCnRr9qZF0F09mQD7OzEcKRmi1jgv34PjYFQ88Ceu
         dL0rFjbjHJUpqu0qxMDIapduM1y4ontbmgimYLxsZUe6nvW/ZEySJyPIoG8k6I/JDzZj
         va68tuJNmbzNF4AWbyv86PtkTGQPluRpiIXuCeV5p2K+WxQRtje7gmtkV+jyPuhuBBbH
         rigg==
X-Forwarded-Encrypted: i=1; AKwUvBwZqlpU5QU9mEX6cOc/tz/PoG2fDf49bWvtYmofsZyXM3X6y9H5g7ont4Fw5rvL9JqB2oYEQWzLX5B5@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgVPaUFN7dxAOFZp/f34u0b+rOTnF8bfixr/K619f8vCawVXg
	ksv8qLPZRBUwS+tXcqv74erEPpNcr5Z7K93WhJYNyIFjmexM0aJiil+7nDKKglwv
X-Gm-Gg: AYBFou0NxGUEfdhv7AyM9Kl6kVqdfcw/2PFvf9gDQh9SwrgIHWGCELfQBX22+HdNsjN
	YSjjk88UxmYAiPFv7N1dwFnQlKOWx7ycXpf9iWh+W7xIczLnTNJ3XSEU0FdxUsbOCpSbf4ptgrx
	HRVunOlrfqFWRTksYxqQyYfBhXxt0XJGIizPLQ40LQE+yTIyKHxRshoftTYNBpuBdZuQ5j9fqIN
	ytPXCDYeRDF6hBvjJlzy5H3Lx80DWaOnpt1bE2LieyIVj8g7C56KUjWi0C0bbXt+OWqD8ucjS+7
	FEYss1dgWHv4eET48oFE2QlNmOpt+kiMyhoEXfWWWNtyRyt/MHt/h+eqLYga/0YInTSdx18Wjur
	Cl482qz3WEbM/JhbrW1BlEWRPQ73+vZAfW6WSU2EmzSRGzL6IvCOtgWMs37QViIq8Ffa/y53ULe
	NQKAdVIYIKzsPZZihI1u4pAdRLA6kiBU+v7EdKEF/pdK/OISlNeC9KBrYkuX8x3wFc7L32uM21u
	iV4s1zhAoePL44/kRNz6pUvgf2V3OXijNXb1sUnQiW1kyeHPUlSr7jpI4n70wqZQGHQWNVV2P65
	QTVRmypEr4ETKmLEdg9CDqOQJ6VEVkHhYI6bJCrXa1jVTsW4QZzBL4XvIpONzMPFsWNnVMGz0Zy
	nNo2VAnRKLir1/2qxp0T1EBC8pGpsG4L03et9hKQMGg8=
X-Received: by 2002:a17:90b:3c04:b0:3b0:968f:fdee with SMTP id 98e67ed59e1d1-3b0db7190d8mr151723a91.55.1793910975572;
        Thu, 05 Nov 2026 12:36:15 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09699c0fdsm4908034a91.2.2026.11.05.12.36.14
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:36:14 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so4479833eec.1
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:36:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzIiubBPn/H6AaUjNeGmI4SiboH8POiRWE8ZlPWj37WPZCVmReGcl+7soFALhRXvru/Jg3dh69xPh/M@vger.kernel.org
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id
 5a478bee46e88-36f73e72d61mr409769eec.2.1793910973768; Thu, 05 Nov 2026
 12:36:13 -0800 (PST)
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
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
In-Reply-To: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:36:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
X-Gm-Features: AclHuK_D3HUaJCQYumF5y8SooLOqbAC7H10kZ7apqTopxHnLZbvIW5XAq_-o6t4
Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Completely pointless indirection, drop these functions, just use
> readl/writel directly in the code.

Thanks, v2 will drop them and use readl() and writel() directly.
