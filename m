Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E33EDE40
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815060; cv=none; b=CYHvtmce3urZLxG0k5p8X4ikg7TI73hZhtTc2cyi9rn8pzE3tOkN1ypMdR87fNklxhWUYGJJD39Tie8igfd0Ey4o2YlP7pRcQfkfsCrL+iMgBrCBZ25rIpxS9gYJMR4/EID+tdz76YPotS2UTKlxCvht+4V0y214zKSc483JSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815060; c=relaxed/simple;
	bh=QB+yFg75hqQqe4KF7RxRn4SKV1v/JdxFtb5/52LHcYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3WA770ly62z3XjavgXT4UKgIgJyKsyo+Bow9VuHD+wZFMpodJAZsiOdEs9/1iQgdKi+2tmcaSssnOcWlYMyPR4qH622kJktQYmWeOp/NoV+5lyvpSB7y+jUKOt4UNow6hQ/mlJUcvXvfx2gRSKFEY94hmviol/i1CC4xcNB9Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3996c9eeebeso35219561fa.1
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815058; x=1783419858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+1GiMffsMJvBdu44BU50jfVnBubjZ5dimn//DJ5+Rg=;
        b=slosZ6Ti1GyMsud/N+4nT+ozC99bExmfzncNULJbynsDNMksI92VuLciXsaL/jaW5P
         74QdU6DMP7Iwd1tU9ElX+4HjDVcs7JhQSR5CYuTrHaOGWjN3GNObdcG3KA1DrXlmn7j4
         iamiE03fz7PQxgTpD4q+W9XVR7Zy066f+yYTCEKDpfpY5HznepoTXk4DDto+fs54eZs6
         Z2gYmapBnAkS53Rleds2Iz47Xxh3osOxYVcccGs25OUm9et9YCw/YQGoetqXOGSvWAkp
         BXsaxwtNLyJi9CGbSYHhPyHXLxKfyG5eY/cZ/JsRxaJ6FTagXi+AjJDyS8NVM9+iu+gs
         cHig==
X-Forwarded-Encrypted: i=1; AHgh+Ror/w2IdL5ekeaJo2h6tsWMYjsvSujl5XsGtO/iFu2HN29vzmMr4FTbYxR6Blaej+AC/dvv25fFisZH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+9pZTN4i+0o+2GfnggIARz6+/vegCKQFAIjUwKNloMMPFw9Mq
	scn5LnQMowE4kOig2C3x73UQF78GyXnQ8PIBYMA7i5zCn1Abx2yHkT5lkTKgyPf/aPE=
X-Gm-Gg: AfdE7cmquyjV/NDDdicrGelwPBa/saXoar5mzaT4HS0k38mfx/DnnBHQgq2/bxLyH49
	zcq+SaodZQGU45ly6XClh8XZgSiW2Su+VOHvMm5mx9qxEAj467PlhVur/SNoBxHZ+cvs/bMK0Me
	jBt+ORh9hGfYTEfgBYgHiFc/c9LUUZmtrb8niCH/oTBW46M7l8rutEMYLE1nFagxF023KZloo+s
	TC3Oh7qwb6kvvaIB7PGu/dDX1WSpNT4OMMTQHv3JqwUOxG6pWmIgfssidqkDZ7IJ0IlL7s98U2v
	SSN0PZ7UAR9uwDtm9WgkkMCj/vGQ4cufreuLAd/h4Z8+YnXUZ47xoWEyv1iJfas8S4mWP8ZMGtk
	ROPyQFQoVr+0XbLp9AWMe8rPbdw7fmyH8Oybmtljx4PcdprpkxrJehiwvokT/x6zg0TrC4Tsu2+
	H9A3pW+XgidHQS4Nqno7zTtcRx+hsbYoxysTm0aDD+8fMFZPwH41ausw==
X-Received: by 2002:a05:6512:6187:b0:5ae:bf48:3560 with SMTP id 2adb3069b0e04-5aebf4836d0mr465886e87.49.1782815057554;
        Tue, 30 Jun 2026 03:24:17 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe344ef8sm448464e87.31.2026.06.30.03.24.17
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:24:17 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39af6402933so29662231fa.2
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 03:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpOtxFv0i9LZ4mWwuOJizDXbgshO1BHZnMzm2l1M3FzZdtgPxCdicqFcurPlWyaGShWwuHX9nucLmmD@vger.kernel.org
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1292708a12.21.1782814728107; Tue, 30 Jun 2026
 03:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 12:18:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
X-Gm-Features: AVVi8CfDZI-66BCdudtb8k9h_4xIWUPsPqj5BKaSPsoCDQPTdsJgDTc_K9d7_9w
Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Mon, 29 Jun 2026 at 18:54, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, Jun 29, 2026 at 4:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wro=
te:
> > > On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> > > <geert@linux-m68k.org> said:
> > > > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > > >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p plat=
forms.
> > > >> This is essentially the same hardware as sa8775p rev3 but the PHY =
is
> > > >> managed by firmware over SCMI.
> > > >
> > > > So why can't it be reuse the DT bindings, and be compatible with
> > > > qcom,sa8775p-dwmac-sgmii-phy?
> > > >
> > > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualco=
mm.com>
> > > >
> > > >> --- /dev/null
> > > >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgm=
ii-phy.yaml
> > > >
> > > >> +  power-domains:
> > > >> +    maxItems: 1
> > > >> +
> > > >> +  power-domain-names:
> > > >> +    items:
> > > >> +      - const: serdes
> > > >
> > > >> +examples:
> > > >> +  - |
> > > >> +    phy@8901000 {
> > > >> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> > > >> +        reg =3D <0x08901000 0xe10>;
> > > >> +        #phy-cells =3D <0>;
> > > >> +        power-domains =3D <&scmi7_dvfs 0>;
> > > >> +        power-domain-names =3D "serdes";
> > > >
> > > > Ah, this uses power-domains, while the existing bindings for
> > > > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > > > I guess the clock is the correct hardware description?
> > > >
> > > > Adding to my list of examples for backing a hardware-to-SCMI remapp=
ing
> > > > driver...
> > > >
> > >
> > > Russell King asked me to put the PHY logic for SCMI pm domains into t=
he PHY
> > > driver instead of the MAC driver where it was previously. Instead of =
cramming
> > > both HLOS and firmware handling into the same driver, I figured it ma=
kes more
> > > sense to have a dedicated, cleaner driver as the two share very littl=
e code (if
> > > any).
> >
> > I think you are mixing up DT bindings and driver implementation?
>
> Ah indeed, but the bindings don't share a lot of content either.

That's the (maintenance) problem: it is essentially the same hardware,
but the DT bindings (and driver) are different. Does this scale?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
