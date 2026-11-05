Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840953;
	b=A6EmEt58OWNNXuiNQPtAH5MGMqQw1nnYNOROux83Hv0YqnWI/iOaKGFiAw9dGuBKwg+2
	 NdxyRB/uCUuu7eu19hv9w+SjJCOIk2plVXjZLlRSuUcGeSCiq0BE/ZVVfRa/GbuTva5n+
	 WwqW/Cu9aA2ZhNoCXDbfNm/jrEFv3lzNdwKWVFprqGaVVta9/4kKIMpe5dmICsLntgHU7
	 eU2yxpK2FHtHu2wT2yIcSEyXnU53XzIPBBMoH7zOsn0VQ5mPcLj5HKL8lbd9IgMNakKap
	 BXe8njJOjdcbaLPPS7Vj8IREbkw5mFThv5WwXgU6hkHyXQtSIE8lHdZuFMkmkN2LT1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840953;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
	b=ekkNth+F7dxU4AqNRZfQ03NS+QtwzOVh6OwaqqjXGstVVjACrkMx5Ap3mfKsGuw84a44
	 GCzxPUTTmRpQRHj4IB75pu3mCP2VZGMMaFczaXSBDRtnMLJ2ibLfL+qG46XjbwPuLP+DH
	 LYJavbQWKTOvZ4k3Di4VsBWVnnWsFba1zX4yXEcYKh4GDmXj3/k1/hyooPsgx0EL2mEKs
	 5NZ4A9Jj03ZTP1TiuVXy0czTBQFTYLyxJfqylkhZW4NQ92OVYmzJrXTGyinHeu00hlbH5
	 h25gUotO9W0ZpYvYQg9eAJp2uDq+4xPwQfKZjdTIgjxxmbZa5WRu/5xe2j0Nni5sM2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F2606A326
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 01:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed2b4348fcso225895ad.2
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 17:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840952; x=1794445752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
        b=IG7S2ECIGi3iCDAzkmBwp1eOoyaXkd9Kr4aTxFrLjjpxkwjPDV+FB8VFR8foXDTWW7
         y2LZl9sogPfzF4wiaCFR1xDLdyCFIJcNA2Xd9Bzg755XYImfZZxDiLemt3KUEs8xKm64
         Z6XzbpGQ9nffIUj6cCX7XmjOFh1DxrZyrpN8y1pLjuTWHqIXcBc0Sft5Vy1hR3nfRUaO
         Ycq01ieFk0pC41anIpa3Q0n9IlzbPqPNwRVDGBBk5x0elJxTdbg45BZQhZROPOPQT5C3
         KmK104ReeQHre9wIzebJjxeoaAQ4/3gWgr5Cn9LYK9/mhjv5Ges/sbKQhXfIAOAztf/n
         KeYg==
X-Forwarded-Encrypted: i=1; AKwUvBxL43c0dNxq6LmrDB61pBoJdV2TozlHOXWNQa4/pHtgWpqvO4kQqRf0/molSMDrQafkieoMgI6jamlk@vger.kernel.org
X-Gm-Message-State: APuU4Z9qaf+OVgY6McsVcyQwKvST+ESCHn/4YUXl8zLMSa4HzXOQNrrk
	ZIfIyQyHybb4fTCUztnvvNVNSBIS6by6AKytUqbWVM26kzTGrGipqOQIHnkvdrLi
X-Gm-Gg: AYBFou0GwQoIfrgYtpPyZSMcSrNuTHJ4kZWcjfS0siv2NePahhOOGJlyiSZWiLL1QZZ
	9Dy54oTEnMfdEn/WeG/yrDdK0CYtGL8j8VEENETClipf1n87VF7jInVi8U9Dy5ESxIq5KlvEdKz
	UF4E6pyDRJSZXqmR+Mi3uVQa2j9YPpiPAyd0+YmrfPCstAlWNeVSFFkhfGQ58/8IjvuP0qNX0s0
	n3/+39qa+HFNIwVoJ5QEN9brmZkerfKMrCkddCONae7wGJzXXvAdfa2lKFa3PCRkPzxsv7ZwqGd
	Orb29s0Ipr9DRQQ/oPRoZ7EOAZaPsjnFpwRo5ONGxaqB7kSErh+AhDIVnklXcHX01iqD8ak9g4g
	mLkP9jdeyEem2nSMJYprbi0QYul5jUcXfPr8OrhZm+sQfGJ/JIlUKaUnqXXwwYVP6fY8W6C3HvB
	lDkxmk0xexim0cs7tkPlAMnJL7U5aLSOZ5LHCReQ0eb8tO8OPBqdL4zGUHJ093Mc9YrAoe4hveC
	c/kwlENMt6/a9s9mbKUVhACbfYE5675HcO2A7AG85co4vWKtE4sCCvSbi9UNq5Ixz9r/Gis2dbG
	PIMAYSY13m9xByXMYFqHQ1hBKlc45Mpc+0cVLIbjsRzrSzJVLLdm8FfR6qVUlRvdesfpQM+Vwkl
	mV9za65iAfr3yE+TfOLzYZhJ4TyLuXOJ7ZhIY2x8eLOQ=
X-Received: by 2002:a17:903:26c6:b0:2e9:734c:5025 with SMTP id d9443c01a7336-2eb36426d16mr156523895ad.21.1793840952357;
        Wed, 04 Nov 2026 17:09:12 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0919b739sm11859255ad.59.2026.11.04.17.09.11
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:09:11 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so2543733eec.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 17:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzJxxW0R2yxyDJKH0mSN3pQAVE/vRyfwQqAugC9jchUmqJsgKB8LKYumcRYdCBkcbwmpa5h5HVTWyQ9@vger.kernel.org
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id
 5a478bee46e88-36a42417707mr24317606eec.30.1793840950169; Wed, 04 Nov 2026
 17:09:10 -0800 (PST)
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
In-Reply-To: <20261104-remote-festive-1e6d807ef014@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:08:57 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
X-Gm-Features: AclHuK_2FUPcxo1PWKolFGMOegNvDHrx-kpQJpfPG4duyjujJtN05LYWI2fgwq8
Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
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

> This binding looks like things that we often see that are actually
> incorrect models of the devices in question - things that should be a
> syscon but not implemented as one. I'd like to see what the actual dts
> for this device looks like before signing off (or really even reviewing
> this at all). Given how the clocks look, it is probably accurate but I
> wanna be sure.

The dts is a separate series I'm holding until the bindings settle. In
it, each manager is a node like this one:

uart_crm: clock-controller@19e24c00 {
compatible = "siflower,sf19a2890-uart-crm";
reg = <0x19e24c00 0x10>;
clocks = <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
<&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
<&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
#clock-cells = <1>;
#reset-cells = <1>;
};

with twelve of them, at 0x19e04400 (gmac), 0x19e08000 (wlan24),
0x19e08800 (rf), 0x19e0c000 (usb), 0x19e0c400 (wlan5), 0x19e24400 (i2c),
0x19e24800 (spi), 0x19e24c00 (uart), 0x19e25400 (pwm), 0x19e25800
(timer), 0x19e25c00 (wdt) and 0x19e2b400 (gpio).

You may well be right. I dumped the first 256 bytes of each block from
U-Boot: all twelve have the same four registers at 0x0-0xc (reset, clock
gate, one I have no documentation for, and bus output enable), and five
have more past that: the GMAC's interface and RGMII delay registers at
0x40-0x4c, the USB PHY's at 0x40-0x8c, one register at 0x50 in each WLAN
block, and two at 0x48 in the SPI block. So each block looks like a
small system controller for its peripheral, with the clock and reset
manager at its start.

If that should be one syscon node per block, providing the clocks and
resets and holding the peripheral's control registers, I'll restructure
the binding, the GMAC glue and the USB PHY that way. I can also post the
dts series now if that helps.
