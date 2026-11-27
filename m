Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792459;
	b=LfnOQYV5eFrCo9WvbCNWY0JwR09FeMlFhSMbBhlcAx48WQvihLlREZaY+Bez+GmK1Wh0
	 7Pc4Lvd41P8D3l2tRxY6qP8pjiPCNTlP9/5eXN3V6eHh7XJBM4983otk7Z5VMkEHCOx4J
	 54xWgAKBBakYjwxNrRkdK3y7YrPnB/yWuhhhtfAout6xXMtJwwzxERdfUJ1PrrWmSDMRf
	 m0jnI5ooCbhQXGOHwEPMaPd3QuNhq+gloqeDbYVzmAZRH1aXtIupVn2UiDz9HwX494Rmt
	 xD/PZbisBU1LO80xL2n9HF4B0HL3b+O7g17jOqFfzeYiax84QHwINg5Zfxl9hqkMTYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792459;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=GpLexouKPHhlMqvz5ie6TcMRJx78hImLzoB2DvR1Llw=;
	b=CfeHg+cYc2Ll9cy5D2r8XiIekwq3WLxYQc+CmbZXjMNjLZApBP1Ju4c+R7XFuTZjA+qf
	 nO9QcpA8dMZMSIKJYbqQXnaa42JAqFSOUVC/3whWidFq5iZss7BF2Tfpj2v4/UkR+xr/b
	 K/s2EEO5ke0le538/zQ98P09JZFoXQ2IOIhIC6HJv9ePnQ3uSTiAYlImwzETewzDVbuo5
	 MvnTHzsDA87oP/BXjKhbJTNg/RWAvrpv2/SFiOs8g64w8cqaVWmZb5s+FYs2O9KecKJxv
	 qYjVc5iN8444Sxtm87DDetyjAWox0FCHNh5fcTDgvkQR1H4uV/P3U23MdSQGV5Glweg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bedUsE1D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3F1606A31C;
	Fri, 27 Nov 2026 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bedUsE1D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6ABB1F00897;
	Fri, 27 Nov 2026 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792458;
	bh=GpLexouKPHhlMqvz5ie6TcMRJx78hImLzoB2DvR1Llw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bedUsE1DktNe1hP0OzSLTI2TPvUFoCDfCIFiAIHopB8JKNBLPM4tTZbYwgnCnPnZN
	 M7ThK0diVyGK28Jd3HW2xXzm08O1oRqAbBzGrDjxIDu/6+vnJEP4a7NH+Ybwp+ikJ7
	 H/MLol6I71lxsUkw86o8IdBLtnw6zqsRL11mg15k+0xqKHbE6oxXCBTajoQ9YB3oAj
	 hthkBGIYyreDhP1Zu87lPI1F3ehCMWDOrRYC0MJeROto31/VnjpBNB4SMOnbS+8Eu0
	 6/0JuMAxnG+GJUtavAJr5fJhS0VN0adGfco1pfbohrq4pqpbqgZAI6eseleGQdGIn1
	 kMz852ZDP2mJg==
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/2] phy: Add the Siflower SF19A2890 USB 2.0 PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
References: <20261116-sf19a2890-usb-phy-v2-0-df3ce9d23f5a@telaak.dev>
Date: Fri, 27 Nov 2026 20:44:06 +0530
Message-Id: <179579244681.13164.2474249536306401170.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=mani@kernel.org;
 h=from:subject:message-id; bh=bBdLdv0Yktod6bVDElg4EDTKn4SrHzmKVulE4JmfaNk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCZ5EXc/MR1v4Y4uhL1ZDYSPWCIt8e1vAfRqI6
 UV3YjrRJO6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmeRAAKCRBVnxHm/pHO
 9UxLCACHv+qXhOOyHEmDDsi2qEW1jtZs4i2xwAYuG9jkunQuBXKZa3ZRtOZRhNkuhrdWEl70V2p
 XlGIA930zIqiu90YdnKNJZkiidxgtbHQ+mXaAmNOPcn7WBRbgpVL0l/dYMDIIJhk4CiakWkvPpg
 AgTuaZJhiWyYC5scllwm9BLGP9qkDOQJiOADIHrXMNh9L3H5mrhw4FD0MfIKNRW3DTj82sncBZW
 J03mwnfXiDS6t8q+q7yKr+JY2QAt2ibXTfWrbymuQw4f7ngNM3NYg2Y7buoBMvOWVEHB1vZEA6Z
 hnjMn7QfdaONJP9SlPcexYInIoc523ZtjiRAMnkYHiwgzZ1b
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 19:31 -0500, Joseph Telaak wrote:
> This series adds a binding and a driver for the USB 2.0 PHY of the
> Siflower SF19A2890, a MIPS SoC for home routers. The PHY takes its
> reference clock and its two resets from the USB block's clock and reset
> manager, which goes to the clk tree.
> 
> The driver is Chuanhong Guo's, from his SF19A2890 branch [1], with my
> changes noted.
> 
> The SoC support itself (MACH_SIFLOWER_MIPS) goes through the MIPS tree;
> until then the driver builds with COMPILE_TEST. The DWC2 part goes to
> the USB tree.
> 
> Tested on a GL.iNet GL-SFT1200 with the DWC2 patches. With v1 on
> v7.4-rc1, a USB stick enumerates at 480 Mb/s and reads at 5.6 MB/s
> (5.0 MB/s with the same stick on OpenWrt's 6.18 kernel), and comes back
> after unplugging and replugging it twice. v2 takes the resets with the
> bulk API, so it was run again, on OpenWrt's 6.18 kernel with the driver
> backported: the stick enumerates at 480 Mb/s after a cold and a warm
> boot and after reloading dwc2, which powers the PHY off and on, and
> comes back after a replug.
> 
> [1] https://github.com/981213/linux/commits/siflower-7.1

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


