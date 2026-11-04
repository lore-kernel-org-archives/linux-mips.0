Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830957;
	b=twDhPD4l5BdEOgcXL49eZCAXweMYy0vR1nJ510h209+d0Bfv5PN/ZPYKN/JdFJ3OExVp
	 3+3ihR/4Z490Xsmh56lNbs0g7zK1qD+vKVXukzLwMKcC0AdtR9I1JfUkcfxDm7lv9KX9+
	 4VJlSvUL/G3V8nAw4dNr6EYaTJI7PPdaLypJIIjSI30TFQWDyoz6T7jctLG6B+suFbznL
	 WiNlDB3Y0Ik0gh+RfYrNA2zPLjcKqba0V9u0PBtC56SP009p5sBl+bSKSIJmPFzmpD50P
	 Ru/XhHZZbtGkHZ6ItrGRB/CrpLKVy4ODgjJt+6g1+AW8nEnl/odg0qIf8ZBVoiNMk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830957;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
	b=cZnKWzvVIGRonAJdXZnFmodgmh0RPltppXzh/vUGnWekT/9svIvlG46Kma/qXfJZsAMN
	 z9rClBmrFdHf/tXBrpkSP8hxhbKVqlK+dnxt++exSNX114TFOJw9zu8lKSUVQaZgbV7Xu
	 Ft8SyWhz2lj/z3uF7jkIMdzIXcnC33jTdrn+bD1PchRtN/HC3bsf8p0mRTgk/2n9dQWwe
	 QxWPmvw1oz/L97/X7P1EHVBoD+GMmij6WxO73o5mTzPKYrK9EFfHMoaL/TshX/tS/5yS7
	 eZeO0/iGtcgtFgSH3CHRkCynGgIiZFsu6AAoWgM+KO6N13JmnazOI75BZdNepsGwDvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4D606A87C
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 22:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C4D606A87C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53dbe9b8d6eso57208b6e.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 14:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830956; x=1794435756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
        b=BWfnPtBIsnfBp0Q2fydeTFNt+uV3/lYqCPLZ5M27DZib2RgXzEEeOON5fowWAjqCeE
         cPHJ7gz9Dpp3wRDgraAZlUh5CFirngFbd71Bm0fAyI4XcX33f/sIjwUYIscBI6tg0zNz
         mLq3DaO5HmiV8fjP2Dlozw9WStKAKMzAN0ybLKyWcZu8d+gJZPB74b+sEKkapfJUTqJK
         tMSDk2dqPcpcpfAElbF/db/dBHPcZTQnuVd/wBP+pfgRYRqfZykRP7lq3q9QCWUKVIXk
         WK/XlCQiXzdAVpFlbxVo+JkegeBIJnx6rs+25krWB0dJuCHGItuMRZXrgDy/BdfoX0ie
         IPWQ==
X-Forwarded-Encrypted: i=1; AKwUvBya8mlW52auRIZ7FC7QS4PDJCvygWa8w8kFntXOwKDL7YYHZiV9xr2eAaR1BiwSWmFZOPhTksJYl4No@vger.kernel.org
X-Gm-Message-State: APuU4Z/gp17HnxAm5U3Vm1vSvVJy5QhVlbElsvHV6KE/C8kFP3u9HnmU
	uXavdwBOld1q24t/yx4DelcA++mU+LT0va/j3oIPzuflCqrJAkUki+aAL3GdJSc2
X-Gm-Gg: AYBFou0DIS4xd3GnxsfnZFsiMCB4fvF0vxNfYuIUf1NBDrZ5GNb86RuC3Vz6j5QyJaW
	vwXR25Pb9wNH68bnvQKTwckvrj0DsRpcXPyVBCQ9gLTnMsPyiYiA+dq8OhL6PEXwv2uzysd8F1i
	P1Zw7wCXTTM11leWrGQt8zw8wf7GqW7bfPVFvOD8EiaKmXbxHGsNCAu2NKiozI2s3IrMX+L7N0C
	+S+sj8TmiaU9IovmOLiQAFigSy+QxfbwXk113cx2TiiQ8nMtEVlowTNYnToiXow0S5R4TE4uVrf
	ndguHwzo9Y4dG70n31wbCCuWj9X1PTOGUONRdZyjk3QBHTeuSsfDc5iyjCfvsDK5Q7YVZ+zeHDw
	Ij0oGp5BiRAzU03rdCXZzxJcVga1/YnV8TKBFf+S79Nhvb4STDfFDHYARvonyAMkd6R2Jc5xsUc
	FvzVbD9U+E5C9tQwwQUjmPiwuUeeG10RI0kTb7SchN4iRQGV7yg1VQrrt+3hizhtTzo+/9sRge/
	Zi3nC9+G/1ZvXKbclkGt2NPya6xr4URf1sAKJwxH+Gx11vzKoHRV3cMoF9sggdWqpV5hBQqmN8p
	R0h7m6u10XUacQotrHGDYjgSQihr7lAVg06BGZzUevzd4N6S5V+uJKjbzLFKhrtpsoFEnKv3iGm
	/lXUaaM4cPV31ZMNWUHkP9nzn9rY1nuyJBGPvsKy3
X-Received: by 2002:a05:6808:1508:b0:550:6056:aa66 with SMTP id 5614622812f47-567be40757amr514460b6e.16.1793830956316;
        Wed, 04 Nov 2026 14:22:36 -0800 (PST)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdc42dsm2773077b6e.14.2026.11.04.14.22.34
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:22:35 -0800 (PST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46556b9e02cso52084fac.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 14:22:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw8BxRaL6/5D6Vdnh6kbQNDLsmGrwyFUiUlDA6XE/8jnUBjFpwYcTAgDVFypAPUBq76GEn67u+c09Ie@vger.kernel.org
X-Received: by 2002:a05:693c:80da:b0:368:2c6d:ddfe with SMTP id
 5a478bee46e88-36de5f6f030mr1017112eec.9.1793830585474; Wed, 04 Nov 2026
 14:16:25 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
In-Reply-To: <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:16:14 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
X-Gm-Features: AclHuK9-UnITn3qNlxFDVEt7-zpIej_-hzEuMRZnZQ7mZri5SrN5fWqpIt5XJGI
Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Please add minimum, and multipleOf.
>
> I've not looked at the code yet, but default: 0 would also be good.

Will do: minimum 0, multipleOf 55 and default 0.

> These values are odd. The RGMII standard says 2ns is required. Where
> is the rest coming from.

They are the values the vendor bootloader programs, and I checked them
against the hardware. Sweeping each delay over its 256 steps at
1000 Mb/s, TX works from 0 to about 2.8 ns and RX from 0 to about
1.5 ns; 935 and 550 ps sit inside both windows, and a 2 ns RX delay in
the MAC fails.

The rest of the skew is not programmed anywhere: the switch's PCDU
register for this port reads back 0, and with the MAC's delays at 0 as
well the link still passes traffic. So it comes from the board routing
or the chips themselves, which I can't separate from software.

If you'd rather see this described another way in the DT, I'm happy to
change it for v2.

> Does this mean there is a switch on the other end? Maybe look at what
> the switch is doing for RGMII delays.

Yes, a MaxLinear GSW150 on its CPU port, with phy-mode "rgmii-id" and no
*-internal-delay-ps. As above, its delays read back as 0.
