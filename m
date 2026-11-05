Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839186;
	b=jebCme3p0/8+VtXsp0RLTwFxYlwz0Qrdff+QvFfykf2GHueKtVFhsNeDJfWTM8L+fAu9
	 F7sJouUCvdKi3p6WL8I3apKYpX5GzZ220+pFO7PqQEoZSCmBe6b0gTV+BDcbulW5YgMor
	 S1vMGeFEnZqBUlVlntfNOFYScZVOYEG283ZC5cLmUBsmVNsNCn36JY26RQaTfaKm/DGsR
	 UT8PlpJz2oDKoyJyjcrbJZaoVUgiJWc9T8EZi/uiA+MHSKWCzwrs1CUzoC1LK+Y/fi+Q8
	 sOmC1Gu09ZXi6Bbt2nN0X66oWlmF4dPTdPkh0680qJWSAlvlheSwlfqgbcN4KApUODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839186;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GxOPm+285zQy6VsOAo+zo6AXQiUSUYodxFXi8M2wfms=;
	b=ZNNZBpnlitjJxCBJ4lcI3G3e/0vA/uhGcPTk924XQrsTgHMA7z800MikDYTOjoX9aLyU
	 oy4RvYjytCYy6IkZU8FayfFoQZGTsDd+Jatv0tbl46DyRivPyMt3BFduH2bl1/sV1089o
	 3YDNYmZ0wvNXHPnQRZyZ7t8rXktUTb9zCvjPkso3pt3yTTDe2FmYJrvITtT6aIHnvZ/sG
	 GY1eZF23wNLkYi2ZDYB4ArDa2QBb3ZmBg/GReDpGJh/O9fuxP+a3JMslcPkuoAsW5eMk0
	 Esjr0GEL/NS3BvUXqt0lWLZ7eiWQViBgHSuNgNipcCh1G78vonJJ861mMak0dfdsWhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B5606A33A
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 00:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336B5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1018465a91.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 16:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839185; x=1794443985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GxOPm+285zQy6VsOAo+zo6AXQiUSUYodxFXi8M2wfms=;
        b=0q3XcZy3GLxVBXQVFrx/Wi1mVGUbA9AYHOBLcAdwiY/a8J+8/C/+NcPCUqc7GpLm4C
         AdUC8S5MTLN0s6SNMA5Ub8fGvWRdLkPx0buVGGHZF+H27YZd8VfYA7xrAhGBbjQTGlkv
         +e5X2mdO8m6n+afIxTCigCFetAD/RhT7UEDPnnBoOPSf13YDC5Bl4CCAWInHOWxINbn/
         gQrZwpwXYqMsDo9+9aB9nbDywnk6MwfzPHUrzTq2lYT4P0djnEVfdcJbiMK6amWbj1/t
         Qm/ulBNAaZwJKDPoQiBeAXNiYpqK10bOlXir8CFmRjx+3MmM+snLUFaLRZNDV/Z5MK/+
         zpmA==
X-Forwarded-Encrypted: i=1; AKwUvBwMeaDUSkW8Gjn9Vs8lDLZVoCAk4g5hBvRBR6A0KXYkFK0n7fjuNcBzS6HL4mE1bIOTKaUNFAhnfNkQ@vger.kernel.org
X-Gm-Message-State: APuU4Z8+nT8iAOipGEOKsfB2bqoFrHhHLVUdQC4IdV1QcpZqj/maCQlR
	MOVseHG55jpH91oVWJWsDwBzlyYIhr/VkzhgcdtiDdlRkyDIpdnHwFg1R0MAyhuS
X-Gm-Gg: AYBFou3sNbncSISHNdEA47COfzWXJfuzUA5wkTrPH+yYr/6kZPofSqGsq3ZCz2jdJCt
	DQI8W/nOlf9iCt4f1eUEAJy6COugNIl1/W3afiHHxfKQiYgEObfVD05ssrXEimTgLwd7onxhUh7
	WmnddrYTmaZC3R70Vz/DfDbMYmjVpnkwDxPsxRLgYnMNyYKShi/xvZ/0dW0HiMpZ8VDDveVPW2N
	x7AdoJPMNecCaY1v3ye0a9X/fwAtKtH0A0ZKnqLt3hCx6sHqWNKfQiMIS/6Qg9fHMwovq9hgYBy
	cYxOwOJWOt9D4a/NnPHsSDBYSPMG7/sngmmNQxtU8kL64DxhmxEdQWnQ+/V4IIP4Xj0lxS00cP+
	NaOEqczeZZIya70dfB2/IVhTX5NvMidJuRUHsR3zdKmSotYQHbdjlmh5gomVF4EtLv9DZGGy5mM
	d+stw+qp1bNKMe19itC1rZ1OAEczYJq6c5Sq7BuBuv9alu+WZg9UmQtc73VMThc+5ouPFAmFEwS
	BAhmi07fN27cK/qLdUmZrZP+CQ9UFVk6aAas4BOocW5/OYK1an+3Hp/vLlSi6u/BG5kQYPOw24y
	hXroAXbyt8/vd1kVmyq06zQFbRnkwezNRt0ZpSNbdeZ7auj7StBxMyMaRuIZB/bxw0yZCaD3q+u
	LXTbqvO3E/WjWifu8YnIsRc0njP3nzL8dQ5zOUxjwS+5PXg==
X-Received: by 2002:a17:90a:e7d2:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3ae895743d0mr15940880a91.7.1793839185520;
        Wed, 04 Nov 2026 16:39:45 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb467f7978sm1618502a12.9.2026.11.04.16.39.44
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:39:44 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35c76e9614aso1735947eec.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 16:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwIKfEfP/TXujzUjbvr2RRGLEZsWgepeWnQ2Xt66eMW4cuLiDoY0WwRsn0rZGEqtbdh3wB3k85nqtFw@vger.kernel.org
X-Received: by 2002:a05:7300:7f95:b0:35d:eafd:5737 with SMTP id
 5a478bee46e88-36a423bec77mr38131346eec.22.1793839183442; Wed, 04 Nov 2026
 16:39:43 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
 <20261104-sf19a2890-usb-phy-v1-1-db0cad937614@telaak.dev> <20261104-unscented-armory-4dc756ab95cb@spud>
In-Reply-To: <20261104-unscented-armory-4dc756ab95cb@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:39:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
X-Gm-Features: AclHuK9Sx3shGebCfLzax5r8eL6ok4wMG4whrKpB9TRpvY4T3TEbHPr-vy2WL-g
Message-ID: <CAPY4CJ5g+e4iu8p5s+Vf7XmEjB9cYX9xYyzHd0Fz8GEbmFm4hw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Siflower SF19A2890 USB 2.0 PHY
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +        reg = <0x19e0c040 0x60>;
>
> That's a weird offset and size.
> What lies in the regions around this device?

It sits in the 1 KiB from 0x19e0c000 up to the next block at
0x19e0c400. At 0x0, 0x4 and 0xc are the reset, clock gate and bus output
enable registers of the USB clock and reset manager, which the clk
series describes as siflower,sf19a2890-usb-crm; 0x8 holds a value I
have no documentation for. The OpenWrt port gives the PHY 0x40-0x9f,
and its driver only uses 0x44, the PHY's sleep control. Read from
U-Boot, registers between 0x40 and 0x8f hold non-zero values I have no
documentation for either, and the rest reads as 0. The GMAC's
configuration registers sit the same way, at 0x40 past its clock and
reset manager at 0x19e04400.

If you'd prefer one node for the whole region, providing the clocks,
resets and the PHY, I'll restructure it that way for v2.
