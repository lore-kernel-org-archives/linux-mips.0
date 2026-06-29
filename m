Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02437AA81
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745138; cv=none; b=qx6JRKv+GaLY6pS3tGQLQeo6doJvMrDZU856I+unfdqyXZHYa9qinacnUkHt60JwVAn1CJk5X5+y5SIZ6zqDWRuXiHuRsEGdTCREMlFDtG7w5S332MrCHmKzzpH6wIrWP3yq5KcSGoX9fCumI1mE2OcqgT0JWGP9sxM/0NSLUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745138; c=relaxed/simple;
	bh=LAoZJqVfdU9+V8F5hBZtY//uWnuQHis0eN8ii8DLed0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/Z/YsZ9tmr4TLvcvXBNnhpdIi8JBJpB3E4h10ck/0AkYGardbF4T2Qk2Dr+14Sv7LlACYtK85KREuJCO8X2w2h0yVTreGpBSQvKWHbL9peY2ugnPw3SoZq4nn9lr4B4xdQdKq9t0Y5PwqA7wiSzulV3u19/Nl3epNaHera7lTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69dead44101so2957814eaf.3
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 07:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745136; x=1783349936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=KHl07J2RStP19GA39ukAvEe4qj7lDecoRtDvgj4s6oNg1nOAf9HxXOc8Mbi85MkBZf
         iW2zIpnXfER8kEdzM2L4Mo9xxFJfzSQI47qKo3bGBG8/OxFR1Xx4E6H/0KwLjGAfUmVD
         0EI6p7jrQT8v8Dg38mnAMcvltNt8etRb4z5Va8Ui6hTFVIUUdIcAhTC+WUi2x+MiFaE2
         lc4gTun8LfNvmbHQHLVW+HDjan/SiLeopuzDMPiIf9F84VhaGo9v2sGgj3YvSDZIFCbE
         ZNv5ohQ4f7mr6DMuF8c7dTPF1ZogzdXhEn69hTK5BoU2lAec9ZkdgIF3blehG7sBhwUM
         b5tg==
X-Forwarded-Encrypted: i=1; AFNElJ+9/WJTGIetO0bXErtQE1AqDsdQWj8fhCYvm0nG7t3kBr7eqLIW+uE4LPIJIxnmUA6jOCUl3WEtjGm1@vger.kernel.org
X-Gm-Message-State: AOJu0YzprcvB6LnWcH121Q/hfBDepMT8vSx52ox4pIxhvcfOxDu7ZaO5
	J14VbhGNPqcwUEpvBaLdA1vWvMdaEriqgPM/kFiPCeQPl8DtQ17CGS565tqcjJiZ
X-Gm-Gg: AfdE7cleSlsaGF5stmKZDVgRzFyjDe6HW/s5SF6FUq50bwYdCZxwhQ7xlEfbtiIXlbt
	/RY55gBK2fghj3CsF3mJEjX+8L+ImPJzIJpRRTAFBndzmOWj+KIOmhAufzoqIIr7ChEo4YxeCta
	X4wXCb8i5FIC/K1uNwQKv53mq5twHT0XbpGCDFBByxVkzskX57tONeo2wAVaRpBR/sJdfp/FrkB
	nK/pfSCnkjk1UsOz4GgUk2mCyKILCT87lyC7juYbubcoCU2jKlfdbhpb99nFCUPGS9wuMRHALeG
	qCkqCHI3nNr45uyCApaTRHO/SAkQ0zfGKT7KzjwJ7+YDMmPPUwu6UvH3RawhYyIQXGWvOh2s49S
	F6oH8pPGNVEeyhLfaUcZS5xhDZNemHqfrCPKNk0DZZhuLCt8H7knQ4GFf7CHuwsmbEp4Zg1dN0u
	pIsV9pjRVr2Ip+tExacl0lirAWfl8CIqZqC+Eyl0TcN1q+UahaQg==
X-Received: by 2002:a4a:e843:0:b0:6a1:3e91:dcad with SMTP id 006d021491bc7-6a1890d0ad2mr19404eaf.29.1782745136163;
        Mon, 29 Jun 2026 07:58:56 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a1414ac324sm7660911eaf.10.2026.06.29.07.58.55
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:58:55 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a0c7c4f55fso2546177eaf.2
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 07:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ91DvtYqqSVznHHygNqMM7EP4sbvBYec5RDcHYCulNqKUS1yjhIx1hDrUoJKcr2ey3+ZxTQkJfRTMVU@vger.kernel.org
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
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
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
