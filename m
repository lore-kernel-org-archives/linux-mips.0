Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BFE372EF1
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 14:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742052; cv=none; b=tXeRMDhlc6TG19hcnvFFF5lj0QHAm6QYmUGvt10YliodD2zAkHz21OXXAq9I7Hd1iwDp533d4xe8qq77MsvG8CcgrnsbXOFOeVP36Pr/gvq4MDZenZmobm4D5n6f0vcUMzHEiTBWfMFy+yR9XNu1TdWO5s35wwiWyi15jhKgwAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742052; c=relaxed/simple;
	bh=dEBpbC87537LBBTTmXAr8CNI2ZwT6yEisCHDxbF5LnA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=km2mxJFTAZ3xfxAMCw8E4HNhM2jXbOvXRy7wgLV96HB9pEGPAOAlJVWxfeFjD+LVoYbkw6Lqrvv8/beFhbLeHBl3rUSUdroqNjdqFAW3DvMEmWy/XjNbD/x4rEHk4kOUaHNxHI0+8yOTcpR0A6XyQFbJZdf2CZzib1RWn4ZONiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdJgbGTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdJgbGTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166951F00ACA
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782742050;
	bh=bbeOSfk9uz1Wrt6J5wAea4CxiJx++/6lvqEjtpLfRco=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WdJgbGTuii88TFEbu6XpTlHIdAbM0xcN6YjUJQNtsS5QZsweE06dn2SWSTdr13D0g
	 cDrsusjeeaUBCimeiqTSvi/JeSiW9AvQkX/i5ua3pgxXsZCwAFb3CIBmkFlcjrkZT3
	 WxbCtvKerMUrNoL6ZT6mTGetEEJdTN52F+3OEcp6VUHr8oc/v6pd+DkzaqNbBXxBZA
	 Ld517NmZ9/iIB3qfK/4FP1OCHdb2Rkgwddzfy6RLgP+atqTMDKqOOsDnjXz2TzmohL
	 x3TvIUD56kSkRMRCMUlifT+c1/Ck/brCKHJOFU6gJ74LZtHxWG4NXK6rUQ23KkWcRX
	 mGc+ywabfwJrA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39ae3c76e24so17950921fa.2
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 07:07:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpuF3N75ItI+a4iosjQI44Ti5GNEhU8R8KdJ0kK2fQsnMTZn7jXOujdQMos0ok9ABULdlFbShRyRM8R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24BLfA8rJhUj3InRhlDICzhiX08G030Zeey82XnH5FJX+XYNI
	seUVbvaIVPUeS7tvlDTN9zeS1+8qx9A5O3M9nBdXa42zoNN3TarsPfJA7kPMGQX6ASqh2YAOZEG
	8hUSm0ppjfGOOEBqKknOaWhYbw5tOLR17Grav4sTrFA==
X-Received: by 2002:a05:651c:146c:b0:396:5d0a:765a with SMTP id
 38308e7fff4ca-39acb8ffa66mr33873361fa.21.1782742048596; Mon, 29 Jun 2026
 07:07:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:07:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:07:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com> <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Date: Mon, 29 Jun 2026 07:07:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
X-Gm-Features: AVVi8CfgGr0R3g5nrNxVwL-t6-jaKI4wsgAKUpj-c_HwbEC7_gerPUuikt96dHI
Message-ID: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> Thanks for your patch!
>
> On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
>> This is essentially the same hardware as sa8775p rev3 but the PHY is
>> managed by firmware over SCMI.
>
> So why can't it be reuse the DT bindings, and be compatible with
> qcom,sa8775p-dwmac-sgmii-phy?
>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
>
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: serdes
>
>> +examples:
>> +  - |
>> +    phy@8901000 {
>> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
>> +        reg = <0x08901000 0xe10>;
>> +        #phy-cells = <0>;
>> +        power-domains = <&scmi7_dvfs 0>;
>> +        power-domain-names = "serdes";
>
> Ah, this uses power-domains, while the existing bindings for
> qcom,sa8775p-dwmac-sgmii-phy use a clock.
> I guess the clock is the correct hardware description?
>
> Adding to my list of examples for backing a hardware-to-SCMI remapping
> driver...
>

Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
driver instead of the MAC driver where it was previously. Instead of cramming
both HLOS and firmware handling into the same driver, I figured it makes more
sense to have a dedicated, cleaner driver as the two share very little code (if
any).

Bart
