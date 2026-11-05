Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793884497;
	b=0g0pucARmpLdw3IRCeXz2osuhBGuOXBvX5sVqBuw6fPhFsFtj2/XsuryTvLhZGr79ICW
	 xsUBzkmtJr1BE3Us8bqwIeKcESkkjaQTBTGPpgHH7J6JdwJqStpbNBncMgarpKv5Pg8tv
	 ctpTdQMEFcIqN/HVW17PHkKo51rNezhuWxf7FMp1dG9pH5W9KXjZhYM0g9f44kHZ5WO46
	 wgbxMuwni5fG1zExMJA+2+Drla9uoh/MnqdNBa9HItJYFmOVlx1UtCQb1CiY7ekJGKW1/
	 ZvQo64EUQPXKcbQ0Bv+XxkVauf36O49p2PCmGCbg9d2H4QQ46rE2HMVDXa9DYqlt+pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884497;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=GiQksdeFR/nSX2v2JYhf8JRjzUbVsY29jogJxq3oHcI=;
	b=o8DZ7cFGHnqWYVjBtNMdxaJgjQK7r17Q743HVU3yOyLxe6vtE3ESSO6JNoqJ0OAd2mtq
	 ZFn0Yg4qK9McOZs2DkUrogk3GtxGZr0mrrAe4l5i4/TcdaJoklKvKfjgWPGbehYYXbzvl
	 ErJmQi8Eavq2G3OXDjjKdpkRaMb7Z0igGdVul2JnakUnMKni9Y5SX2bgczKaH8d8UQ/Y0
	 czWfK9zC3UWUszgyLiEk0LSYkf9TZCn8ukk9jnkFyYDov4i3aOFew5ldNbot7Jo9V8vGR
	 InXPN+CGJ492EU40tNF/QXZ1UFyTSu3OYfsZ3sqPrTNA7Em+CV+IxGroZqKJ/zhYFzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NwIx0qeb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999FA606A31B;
	Thu,  5 Nov 2026 13:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NwIx0qeb
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7ECF4202007;
	Thu, 05 Nov 2026 14:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793884489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiQksdeFR/nSX2v2JYhf8JRjzUbVsY29jogJxq3oHcI=;
	b=NwIx0qebySam+VAZB/sZ8AHoewiMlnJdvUSzcSnKyCjCIp6cFtT/q6s/bPQQIqCgeUXZrN
	JCScPIXI1eCeR0xAhu0+U3M8bXVra/sMtrmP7V/LD7Mqg47n0bcdX5kzNNozrdVkJdARy6
	65tWXlXK6IluxcpbVbyA1kGZjJ3DbWkhzEPXPVh9twbIJF4Uz4taO7K/aAQHksgezmsuzN
	L9ZZ6nIKQN1FgxFRob+FmfoGLoFTdYc0U4QmgzYNx1XFs8Qf2N1WAcBG1t1RNCqUbtL1xA
	bndJmKgGSiaKYgVGrWQ7obrdqouLIojrediA8eAewGyOzXVQPxJUVY/kxUA4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793884489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiQksdeFR/nSX2v2JYhf8JRjzUbVsY29jogJxq3oHcI=;
	b=YKBmZA1THUV1MZWPdgtHUs4BKRZ5cEkIktwPi/WIcGXMz0wElSXa3L1CriPdfGZyWqI1UT
	vT5NIts2JVkYlKZ1Xl2StrSWwCCEG6kWsZCOQTJbWE2g2yWDsTnMIcqqOCmz8f6d26D/3e
	qzyCKKwBAkC5QNOxmgmPj18Xph69BnxrMoQNLgrOYxkl0QlFdkIjP8Wl2uVzS4OTk6SOkJ
	q8B+DCg0GSOwObaLikvIyrC7KxT365SoL1o5cXGe4vCmM64jkQL+Oc2LILiv44VPukJkqp
	8X5/DcivdudvoR1ft7Xiq8M5n2gDRPa32b+1FQDbgRNJjWOa7sbGSBbV30MVaw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793884489; a=rsa-sha256;
	cv=none;
	b=Ea6uyhHbv7vUSVbVBpdkYpH0vz7uJhd/EBB2S+0iWRwzn+WKesEOubDSbrlkpyOaP7j42Q
	nhidZ2ULG/TJou+0sU3Mipto4is5gKLyYXdtkwbZzjjzU+x+/J8WgVbWfmUHJJUup+AIL5
	+QiSghC2bAeumwrlVQggkEIpcPJiFglK2m/ZvrAAKtNCzS5ntStlMkcog6wxYp4sfAwF61
	CE3WeCFWp9JEtkJP5Vys5/51oCyKJR/QwWS7flIm+hZPXRphQMBNFo5gFltwZ/UuDKpnzZ
	UtzQxx0TsZGGJroHim/JcX6//h5xLpxHpMoEUS9I7sVn/XCSqVT3jSzIuDuE/A==
Message-ID: <7905740841dd0f47273b63dd28ee504b6fdf8084.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] phy: siflower: Add SF19A2890 USB 2.0 PHY driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joseph@telaak.dev, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 14:14:49 +0100
In-Reply-To: <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev>
References: <20261104-sf19a2890-usb-phy-v1-0-db0cad937614@telaak.dev>
	 <20261104-sf19a2890-usb-phy-v1-2-db0cad937614@telaak.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-04 at 02:21 -0500, Joseph Telaak via B4 Relay wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> Add a driver for the USB 2.0 PHY of the Siflower SF19A2890. Powering it
> on enables its reference clock, releases its two resets and takes it
> out of sleep.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch, the SF19A2890 PHY only; reset
>  names "por" and "phy", dev_err_probe() for the resets, drop the unused
>  includes and drvdata, Kconfig dependencies and help, commit message,
>  subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  drivers/phy/Kconfig                      |   1 +
>  drivers/phy/Makefile                     |   1 +
>  drivers/phy/siflower/Kconfig             |  12 +++
>  drivers/phy/siflower/Makefile            |   2 +
>  drivers/phy/siflower/phy-sf19a2890-usb.c | 143 +++++++++++++++++++++++++=
++++++
>  5 files changed, 159 insertions(+)
>=20
[...]
> --- /dev/null
> +++ b/drivers/phy/siflower/phy-sf19a2890-usb.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#define USB_SLEEPM 0x4
> +
> +struct sf19a2890_usb_phy {
> +	struct device *dev;
> +	struct clk *phy_clk;
> +	struct reset_control *usb_phy_rst;
> +	struct reset_control *power_on_rst;

Since these two resets are always toggled together, consider using the
reset_control_bulk API for both.

regards
Philipp
