Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE69833E360
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741430; cv=none; b=uFnTdxGudHpp1VxMmC1di/NGc8cdp4qAlC62YxWf+poSDqKcs8UR213GIeZAVm5vcdW06C/lC68fZ3WNnIuQKv2vz3V01rO21ECr9uw6E1DILmpzqWnLl5wdmVK9J9AnpEb52SR/IKISPh9OXMwz+xA0UXtTBGy/7ykotMySV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741430; c=relaxed/simple;
	bh=UvkvBBzeyeMqgudY2G6gDFJg27JiOFKpvozKSRN3iE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DI4Y/7YYLWd6sysLsBIWKZtcquuXF5zj8yhF0eyYYxaNSW521IJBL279/waGzrkg/looTjpRcStVURkrCfD/iHdDqUub4fnCUQORWSj03gJzCu/XLInxkGFq6makD7I+J16yDYtESypVZOtCMh6+rN9U9UQs+E0n+oqB6zd3VjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-91562bf6c12so391552185a.2
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 06:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741429; x=1783346229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=pySatmaKReTAKDF5uyhw2XxRv78Oa0dBHKjCaOP/p9WL8W79EOUD6SYty6LOhNQjjG
         vc5siU0eOtnC7aC7ku1A7umoYdwn5HyELhlCpVl7YjdO6x7RD7NJYA/rIMmHovoaQtL2
         KQedeM+17shGvU4+fUWnwQWiQvzmqlhleAJGYGJIfamQHq8WEs0CJTHL+Ookt81EkxVF
         wzGVo7/FoueRc0SqlHXtlZXvNBWhPWWWFbpdIlQ5Sbj9e5Fp5nlEXUmndoAaaOjdKCHo
         d6Bqru0MZOGYR4TckQvDl8Q6BNAevCz4N3CQ4nfBiygDSqqoHgTnwscoMFv7r9MJ+1XW
         wsbg==
X-Forwarded-Encrypted: i=1; AFNElJ8seuYHrsoaMcoLbJkUmBlUgVYjWXD73oTJai208NPtgL4mwKjnlN4374dLMb/wNAbAPbCzu9imUlF8@vger.kernel.org
X-Gm-Message-State: AOJu0YyzJaIXbK5VEg0MmoORejiXPs4+b4XcxalN7yjCFRhlrwSw98Ia
	u8/5p6BFVp5VUgTNIonJ+h6E45KEcFcYn/C/cGqPWsx+jqplOF2bVecF1satYqan
X-Gm-Gg: AfdE7cllVi5+Mlez4+4YK2ZBx2+0oFi+BilgerkAyNDxAx2LWmBLkO1Knm8JwZSY2fU
	4dU+N0c9c7WVUxjV7RQMJ33vK9p64O85NJRRvrkTvQfvoi8r92OJYNsBqHzIU61EJMUWQ6UjNTJ
	7rRiweQZPzP+o1seVaGpy3JZ16s7pEOo20/UvofNp0Ygm14JjmgKHJNJDgDLhFasa6NaYGtX8y+
	w99dzkDzlG5lDI7QajHkE0usX2l1TqpVhUwAwaUnBUElJnL8/XlhX1AJorfN4SY31XI/th0OP0z
	hAQtfrI3K7cVLLsfd89BqInJ3ijxLP0jWC/hHQACPwNwmB7tzX+nbrtBPY2bxM1fr6p1w7MnlH9
	utxzFDqrAqaxTH5sBBfNwHtj+JL1VWbuARn3Bg7sSCUm4EH8fSj2NorDNddB4qfkDuEthXdissV
	yOpPnAra8VGAqkBfcZIGHA2imoRBK99AZoNNjvrruWMGLdCYOTMKb3hA==
X-Received: by 2002:ac8:7f95:0:b0:51a:8c9c:7f41 with SMTP id d75a77b69052e-51c0cb09297mr10292891cf.68.1782741428611;
        Mon, 29 Jun 2026 06:57:08 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51b0cc9csm166124341cf.31.2026.06.29.06.57.08
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:57:08 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e54f8c051so62740885a.3
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 06:57:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/meXFN4ksPT9yDELPlPx9sXXzY/w0aWDd+Ew2h+6V8zRQHEDdrgoD6NyAVC9L4mDyT/3gbQfU8k9bo@vger.kernel.org
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
