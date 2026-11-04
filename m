Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779368;
	b=mKhf5L+VoimuxWoc7Zv4IFX1WSDZByBfAZTSypSNLwTQwAgSDdqi/+HtIFslXKJ8/ksv
	 CQhGGQED1kQTnOHY6nPh58H0/jqErkK1OuIEfmd5z9Ep8rg3XO+dbBn6BTjBp+p35SRdx
	 tmh6jigaxPE9sIkuh8HjvmH1bwJnIuYhpT9nTlU4A02BrqF6muVkAVvaDWt0wR6nbPh1o
	 G3k/UOl3U/dQ9gNgr7oCf3pEIm8teRDE3hHPtaKXgPv0K0E/llc5M4htgjcgGMiWb3E5k
	 ZmJDR23n0vCmzP8KqEdvR/RKqDzeC+Z08kc+1gEVWjp0XEF+h9gcZS/jDYkWZBvsc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779368;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
	b=PeDlKSR1xEmQR/OmCpN6Dy4vVWppWeAFqp6OqnlsNN7/oSp3iuhTOKQpQpWHZVx2xQK1
	 q5HZi5B1IRs1k5fK6YNUSxL0TGN1x1/12y0x8KNtJY8/I1Onq9vxBF4i8KQxT9KtXcHZ0
	 a8IOnnwbL5gMQ+nigp1HHM9QkKIxFTOs5jhaazD3s/4Fq/f5TPCvsn67CO4Oc6d0cBEVs
	 eSDh1d4YwOgc9SCYhMF/d6Nc0feZPQB248v2MkvQ8ZCZaTb+WpdwFVsUYhfgU8FP/yt9K
	 CGyN8Wsr1WK6YuLVPDFEMutL+dMIuRwovOI4Xuw1j3VvhNoMXeYyfrtciB1txCkDErQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FA2606A31B
	for <linux-mips@vger.kernel.org>; Wed,  4 Nov 2026 08:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FA2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso187917a12.1
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779367; x=1794384167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
        b=R0VQ/koktNErdHLC+bgc9qQ/eCVJ7TdgyKFMuZM7fHXsLG8RQ0MzsZHXizHpnMuYo5
         Ogpp5+jQSx45EDbDU2nQOrnSv30t5jzJHpcn7Uj+XjmUw2afN/9IdIkHhFj3hkc4zcPD
         PiH18F+YrjEyue8BQS0d4r3CXOfFzKugacz/NGrYxF5qHAk6MVw19vpfm14HZ9QDgvK4
         9QCd/zfewnYB1JU4wbDgF2vNRB9/ThB9cYoGWc/9tN0oRNQkkoplP1Y3g5KeZxk0N5cA
         huasCE+QqCwzGsknbPh+TFC4L024Xz28/VFtDEQc20csOrMSl86B2gH9fILG7iO7NdCS
         6WTw==
X-Forwarded-Encrypted: i=1; AKwUvBxIq3isQ6OhLzhCHNyTrZ929nCxvof2+876zqFcNtYFi9ENZiD2DI2rOW37ysiCR1t1OBJHsEvVpocH@vger.kernel.org
X-Gm-Message-State: APuU4Z+XsHb1ePaiu1NrPhTT3n5pCoYxbS+DYOsNxPwTI0jXa9wEx30K
	hRyxUKEeD4O3JlJOPueCuXygCcj0t8pKTLDuBqVtiNYHxxS095txS4vtWYXR/Vc4
X-Gm-Gg: AYBFou35bPfr9z3G10MPZuA/v+u8dvI4brHFzkVBB9Q4vWuHMFjxSMagItOLAwxR5n3
	7IyaZXqzJbdkaMJJ5SFaUG9C9AS5Rg51MiKlEBqxM6DJWrjme7sC3pkiYlaM8GP27BR+mquxvTI
	KfxYngPvXyqF7xyLYX8jTrZXZSzOuaFQLzyS0iHv2Brbp5tezLfezFm3WFrcFjMVSkMoXPBj8wO
	y//tDWE7dOWES4DrIyjpir3JilXAWQUjvdTaSB59Yz51ynlW2JkmjZ9zeZGGfYGH7l+HGv+MuLE
	Wc8+s1LSBiQFDwNBnUMvaRnw1sKf/2gXsmfTbUsapLhkQy/9vBDGddkhCDfmSO7WzLkjtpGf5t9
	6bLYN//75iSuPUomgy3t8RxTxPQbt5Jj9tguwgTLAU2eJ0h4jl4lZGGtTWstjnoyhAJpoW9uIMg
	2AtvnUoQ6yOi6YXsciuC5ANNQd1rNgQBRMfpSEApOryOVNneaAXII7/k8q1VZgpgG83baxRCzIE
	chlRFVX+nDNKctY6rJkMwxB7uo0LkFvb55J475TwKBWalIfBkW7vDCeqAwDvOPqonEaTytOE2J7
	CsFNkRmVUm3C8+cmppAqUs/mKQuSwZMypt3+cYy9/KxJeHs7XJCpjvuVUpejiAewQhzoG8U2wB3
	enZdIkEIuqeWU/OomnWmSSViJm9roxCEfFeM05WcdmVI=
X-Received: by 2002:a17:90b:1845:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3ae8976dcfcmr12157410a91.43.1793779367152;
        Wed, 04 Nov 2026 00:02:47 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e1d3esm8147427a91.3.2026.11.04.00.02.46
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:02:46 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso693454eec.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Nov 2026 00:02:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy6NWR4g+AYof3gt5GExPNbhz44BDGmU/lXBztxvuMNH5bwf71TmmZO/cVFE/BavQM9oIKzIyymnBH2@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:369:faa2:1fb2 with SMTP id
 5a478bee46e88-36a4236a650mr23219527eec.8.1793779365508; Wed, 04 Nov 2026
 00:02:45 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev> <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
In-Reply-To: <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:02:34 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
X-Gm-Features: AclHuK8VH8JEq69kYaCOOBuUsCrdovmtS3uWzk_R-GaR7GJ1IVUq8iGvFERmNvs
Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: Add the Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/4/26 08:53, Maxime Chevallier wrote:
>> The MAINTAINERS entry that covers these files comes with the MIPS series
>> "MIPS: Add support for the Siflower SF19A2890"; this series applies on
>> its own. That entry is also why checkpatch's question about updating
>> MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.

Makes sense, v2 will add a MAINTAINERS entry for the glue and its
binding.

>> - the MAC address from the factory partition, and ethtool reporting the
>>   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?

The OpenWrt driver this is based on set STMMAC_FLAG_HAS_INTEGRATED_PCS,
because the core reports a PCS whose link status doesn't work in RGMII
mode. stmmac now only uses the integrated PCS for SGMII and the flag is
gone, so the glue needs nothing for it. That line was only meant to say
the link is reported correctly without it; I'll word it better in v2.

On Wed, Nov 4, 2026 at 2:59=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi Joseph,
>
> On 11/4/26 08:22, Joseph Telaak via B4 Relay wrote:
> > The Siflower SF19A2890, a MIPS SoC for home routers, has a DesignWare
> > GMAC 3.73a. Its interface type and RGMII clock delays are set in a
> > small configuration block next to its clock and reset manager. This
> > series adds a binding and the glue.
> >
> > The glue is based on Chuanhong Guo's driver, which read the RGMII delay=
s
> > from a factory flash cell in the delay line's own units and always
> > applied them. Here the delays come from rx-internal-delay-ps and
> > tx-internal-delay-ps and are applied only when those are present. The
> > interface type is set through set_phy_intf_sel.
> >
> > The delay line's step is not documented, so I measured it: sweeping
> > each delay register over 0-255 with the link at 1000 Mb/s, the working
> > windows repeat every 145 steps (TX) and 144.5 steps (RX), which is one
> > 8 ns period of the 125 MHz RGMII clock. So a step is about 55 ps. The
> > TX eye is about 3.1 ns wide and the RX eye about 1.75 ns; the delays th=
e
> > bootloader programs, 17 and 10 steps (935 and 550 ps), sit inside both.
> >
> > On the GL.iNet GL-SFT1200 the GMAC is the CPU port of a MaxLinear GSW15=
0
> > switch over RGMII with no delays on the board; the GMAC adds both.
> >
> > The MAINTAINERS entry that covers these files comes with the MIPS serie=
s
> > "MIPS: Add support for the Siflower SF19A2890"; this series applies on
> > its own. That entry is also why checkpatch's question about updating
> > MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.
>
> >
> > Tested on a GL-SFT1200 with the GSW150 driver:
> > - each of WAN, LAN 1 and LAN 2 links at 1000 Mb/s full duplex and
> >   passes iperf3 both ways (160-205 Mb/s out, 262-273 Mb/s in, well
> >   under line rate; I have not looked into where the limit is);
> > - 10 GB each way through LAN 1, after which every CRC, alignment,
> >   error, drop, overflow and underflow counter on eth0 and lan1 is 0;
> > - 50 link down/up cycles, after which the link and traffic recover;
> > - the MAC address from the factory partition, and ethtool reporting the
> >   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?
>
> Besides that, nice and simple glue, thanks ! :)
>
> Maxime
>
> >
> > ---
> > Joseph Telaak (2):
> >       dt-bindings: net: Add Siflower SF19A2890 GMAC
> >       net: stmmac: Add Siflower SF19A2890 glue
> >
> >  .../bindings/net/siflower,sf19a2890-gmac.yaml      | 110 +++++++++++++=
+
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-sf19a2890.c  | 158 +++++++++++++=
++++++++
> >  5 files changed, 281 insertions(+)
> > ---
> > base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
> > change-id: 20261102-sf19a2890-gmac-4fb4808f869c
> >
> > Best regards,
> > --
> > Joseph Telaak <joseph@telaak.dev>
>
>
