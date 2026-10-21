Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549211;
	b=i9xBa+dxzZyPEyhBQFBfnlimcTeI55miGMsX3mCarEB8DgkBFmCEhYA69Xvg6EvxaUuf
	 yCNvZ6q11eVleS5oyF0jQVfxOsjRVv3QB5tpvdbGIgm2Utn62FO6IDyzdAKvj9vyjyIM2
	 kYWHLju3CWHTAtCIgD1fntceA58atBCSb8zlh6skeJ3xvewxxWkAeoY0wk6m4LXSA0tcf
	 WvJHSErU6frGRFXWOChhYURq9y3ZH9DpcDGIU3tlhT+QtOleAK9EnzUbanSIyYCXfLQo2
	 5TcYmvUg6s6JpthnKAe+EFVcwRh0D9x9Ed5Au8l7pce964Y/kQWqtzkNqWoCeMD3HNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549211;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=CPwgKGW+9+HgEnPqxnA55xboDkaUxoq5NKTXtZj/nJE=;
	b=qSpqf2mCSgSrhwYtbrDxeTqmy8TGjBYhvWkfQNifw2DAodqMaV5uVpjIem2QlZsrBW++
	 E8pLg2KoObaEexlqqtCHUiijNjo8HTqFtNMfc/eUmCYqtNscdlmTxOhLSVlD8610EUMPo
	 oTkzoBCgunbbGhTt47+uX7BbITVTq4rB8oA1r3rs/aIL/aj9V6wbpVzlSJVt9Qy7tsRm/
	 Vov0aNanMJoSoEJFxqEym/VVl8NvCYmT0Sk7dwnGI3dnLcB8QdnP50Jpb3OqfBe3vIcQ2
	 V8/Asuc9/ViYZvUT46rXJ/7yrTt0XRGQxgk4Ri5ZkEkiNsr0cVA7LvwPCWPVfT/lh7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYaa27a+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41433606A31E;
	Wed, 21 Oct 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NYaa27a+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC5E1F000CA;
	Wed, 21 Oct 2026 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792549211;
	bh=CPwgKGW+9+HgEnPqxnA55xboDkaUxoq5NKTXtZj/nJE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NYaa27a+E7gei+Ol9psKdfXfiAU6OpungqJR76z1KeeQFEFjyBLQ7xIxVzxWnluTL
	 lv3N7b/TqCO/EiJdxHVaCU/fcS6BXhoq6fF14VrgR+8ZHJNQf46BZXs2+XZrUw9yu2
	 /5Dr1WnBxhlBBstrX1xZ2aF6ul1B9XIocoPHlvkMtCSnKmDJeRAtjl0UvhLiY7ZJYp
	 3UJd9MC0EZ19gJ/B5qErRGgDAFgHjiX+qs3qfbAw2AxYBptLmuv9JTlDFdtBnYRi2t
	 k1Q1LqBg+wMQ3NJei12Fvm2YJG37ykFf7fVyuZSUo5hlj3OGXZY/EK4OAQNR3gnpqp
	 SiLeJk2xQV++w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F146D3809A0D;
	Wed, 21 Oct 2026 02:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v16 0/7] net: stmmac: qcom-ethqos: add support
 for
 SCMI power domains
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179254920980.330607.14638814196996636300.git-patchwork-notify@kernel.org>
Date: Wed, 21 Oct 2026 02:20:09 +0000
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com,
 s32@nxp.com, mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, edumazet@kernel.org,
 radu@rendec.net, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org, sashiko-bot@kernel.org,
 martin.blumenstingl@googlemail.com, krzysztof.kozlowski@oss.qualcomm.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Oct 2026 14:36:39 +0200 you wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> [...]

Here is the summary with links:
  - [net-next,v16,1/7] net: stmmac: dwmac4: don't program the 1us tick counter without a CSR clock
    https://git.kernel.org/netdev/net-next/c/d09d7b8e86e5
  - [net-next,v16,2/7] dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
    https://git.kernel.org/netdev/net-next/c/534198a05d92
  - [net-next,v16,3/7] net: stmmac: qcom-ethqos: set serdes mode before powerup
    https://git.kernel.org/netdev/net-next/c/7af44cb9e447
  - [net-next,v16,4/7] net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
    https://git.kernel.org/netdev/net-next/c/05b3ea7346e3
  - [net-next,v16,5/7] net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
    https://git.kernel.org/netdev/net-next/c/92719abd6378
  - [net-next,v16,6/7] net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
    https://git.kernel.org/netdev/net-next/c/acf1e3db9151
  - [net-next,v16,7/7] net: stmmac: qcom-ethqos: add support for sa8255p
    https://git.kernel.org/netdev/net-next/c/bb3183e1c938

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


