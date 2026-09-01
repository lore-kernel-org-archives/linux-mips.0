Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807801E1A17
	for <linux-mips@vger.kernel.org>; Tue,  1 Sep 2026 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247324; cv=none; b=DT9iddCR8B9IC7NqpMi6Wh5jWSLyA6pvbIy7tDlaYUL6S0dfckC8v5aPRMQrke64GK7tW5ANhROPJJaxS7BB9HOBhVeEQSVaMgcFeZgOgPvxBo7hPhaGFWWvIGY+q567vxwPhQFY6WtRqz/sdaRYZscJrsEOJ/nBnTt4WQZ1dNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247324; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=py5cX5WXjyLtMEOSogElhK7IQQ2ulh7wPcaFYBDwRNQbQwuLZhPMFsb+ZIl1KUUvQGqNIfxkAKZjOOIMiejGhUO+Nz4CxOXCgojmswADY7N0welWkZ6DCg+M+ep+20WdnQGLrRgz/kUYq56Xesehhzffb7OwxnjZyLf0TpBQXDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517dc520840so47644761cf.3
        for <linux-mips@vger.kernel.org>; Tue, 01 Sep 2026 00:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247322; x=1788852122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=opLFa6Xx2xkOzeVQ1VG7J8FqDOvR12cCLZR1F45+ABlwOQjqtti4kV3R6in3zx16hA
         lTJCCF8ZtA94nZrTy49R/apF4VFABY9sYuaF1InWd62ajw5W0wUR2qmfzJEOTgmTZvbc
         FafH/4bXTFwUrXSyJ9Q/OBzXvCIUyfTXYOm1+81N7LjN66hZHUeGyrEGUz91VpmuHqNN
         zxDoObGNJoBa2VV6QGqu8qoZvatVG1Q/zTVeuIUr3a4vjR9SgQFFmg0cVghRMmz/lmgX
         aVo7biuWQr+S4oMMN+PmAqvSclWHVTinZGQG3HA4QbRtA2Pcaz+13VCmbKD2DIP71giL
         2f0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqAHK4q1i/dI39CDWJ03CqlCADzwVhp1JaIwp8/ceyzqDntKjfPu38xjb0r2e2ymjfK1nJ3MToloWlS@vger.kernel.org
X-Gm-Message-State: AFuF++nLfiOXRcIkV7hdtA0EBje7Tcr5ZZwVn2fGzCN2bpXhDt6iiinL
	v62qaQli0KWDtqgn4q3hYP1FJl+gvShZCyV3+ps8YmJqnZ03V1rrJN/wSiKKVq86
X-Gm-Gg: AR+sD11l9Mq+iHc7EKzXb6r4Gy2YC7fDe5cT3/A1iAVN7XZckhw0KgeHAxfK2a9cr+H
	/poQ3TBu19cCkAmX/fVTFYYiKg5FTXPFATUe6wxhLpnyqEOKyFHTGBt/4iRkyi7qFwX6kLLg6O8
	ZE5idUmq0z2vqn6EUeznXrNZHV7Ic0SPpHa1ej1wxAfurzf4++jzII0pM0hXm6AQMf97MUn83Hu
	9wgsHIMc6U4opMO1HCvRlMHz/ZHN8Wb7kMF077wjZJ/zYPpN126x/QvQzi+pZECCQW81UyPmd7e
	zhNzzAUiifb4j/N99q1Qe0awLIJVv/TrVIzwr9wyM19KSoOh1N+gqOkNSu2ZdWBZ7aoeOxKxvtD
	U9yALvtPKUIwyDK0wiT/04mhhJ0j5ZtbU0KY5TVQO69Q3DBSD2bj+6PyUYpg3cKnD9NHWoe3foB
	NXvxXRGpNv+UZvut1fECLYnS4WXaDqcrVe2S3e5A2Aa/WOS26xI/MsWl7qEhPubz8xAP15AdLIn
	uFsdoZAgdAZoRr4cSlQLDUmo70NTGE4gMnf
X-Received: by 2002:a05:620a:268d:b0:939:57ad:4586 with SMTP id af79cd13be357-93957ad4e5dmr17588685a.16.1788247322171;
        Tue, 01 Sep 2026 00:22:02 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740b75bsm963812285a.41.2026.09.01.00.22.01
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:22:02 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90cc372d6b2so40764456d6.3
        for <linux-mips@vger.kernel.org>; Tue, 01 Sep 2026 00:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwszrpZ0LkgYawfWcJ2ZesElimJb/Lwp5JXAnZK2IC6SdZyaHS3+MZ2rRc/rB50oFz10VkqY5i9Dir2@vger.kernel.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
