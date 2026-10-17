Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88FB3AE198
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255171; cv=none; b=lF3w0rRSSdDiOp/dVcdYU82F4hEe9qGNPoUSN4FoGOEVnJDSEkoQU1+aD1QjcTZ3lbFHkyQy6g41Awu9M8R1ZkwsE7xWAFG5DRVvExmHRJ5+GxtJzzHFb3iZSXBQ/o2zai05Xfu56TE/8OqYGoutDsMx/ZG9z2zuLLTArfdS5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255171; c=relaxed/simple;
	bh=VjJXPVvJ28GFo5oaYh5V0N4OmfzYXgOo11M2D9Ou1Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaPlv/662VrPQy/rUP68T3l6M2gm93zs6u6xn5o+FbxxCkVKmmX6/D53aEqn/ibQaXE6EGc4bumJKQG5gg5X4jU74dqOuVoFo79nhPQs6imxr1Hm3BcithiazDeNwnKGk15Is9b6mWjpNwUoHZZCihzzNHs5MvUe4ybRDyK+BXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqcI3njC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaSvvfce; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqcI3njC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaSvvfce"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA1j71332737
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnsng9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so2936000eec.1
        for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255168; x=1792859968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=SaSvvfceXYmvCRkB1Hsft7Hfa2rtKp/OFb5/8k61c6Ny9xnY2K0z1fhXfR2dynAXla
         sEfTL/x8SvDpUrzg7W9c/usmuEzk/4/HkaJ4CI7P7QJNF7Za0qOcb8KK16ChRr7gsaht
         Ezthx3PtrBf9HWTfUfmdOmZz9M2EcylWAiXLPlM0+UHrgR18DdxWIlCnNjFCM+/TryX0
         AV0l2IWcAxGi6WySnx1kzFiZPe/9tll0IeXg1LuynNvxiKrct/K3cckK05P8H1L87hHf
         ZjHNMaNFd3wy6DyipPGH5oGx9pneMBui1E3yL/cCMWmJwdnNUaWU5hJVNrQr1DT3rGPq
         c4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255168; x=1792859968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=Swlv1NCKKqEExrCAVPdY3/aZ/tXbMAyc423cj2i4RoXFiYotfMqc6etN1EkvG546Fx
         jx4yZkYw1HX4ILp1YgMXucTE8X/4KAT94FHc/DuLUaICGLsdRWbMNjUF97FJG8lP5nQN
         BJTk5hqBsgb793BDM6TEuUK2XDXBLAnOPSqGN85HL0UMBjxChBFXkBSClgiFmfTIgzZQ
         HeuCYBBrqujJh3Z9F7wFLtSlkBkHaYPVqPzD6zJj/UbBKCFoCzwTbNpgDNgmmfpLhm1j
         84KvBh1u5k9q5uzdiMgeo1DN/AUg5FTnGui6iTwvAKi5CN+UaTwUKBI9sBhutta6FokF
         0ZJw==
X-Forwarded-Encrypted: i=1; AKwUvByxFQ4JX/cEXx7bLa5mKI6Usi1eI0fvbnBD/kwBRRKxBOwxK1q1WaA/IwwiKq+lMcBKhoA+4B5lATwG@vger.kernel.org
X-Gm-Message-State: AFq9FYJkix00idAQGjuiPfJwsxG4yMMplfSo066gpudPcwt9FeHYfiiM
	5HNygjBqkWQZ32Sy4PwhRjJiWHZSjfdWvaw378sMaWUuVitetvtJOXdJkjQeDbkHic81VV8LSYN
	d5oG01iYtZXKhsE4dHVHyTiWxYdQx40mAbyMhnjltogY7Vi0Tml6TyE7/Ho8DJrad
X-Gm-Gg: AYBFou1qo8vDPL7yhc2UotFV9BuXd05LMfhUvgAKbCkJVyjkfR8qO7LRYiiY9iKB+FR
	jN/4GFBKi0VBVbNmBXh+O34hxxZ4ueppjiv36Dm1aG0lBFJy2iYSv5fIX33mi/ZYLgeZMxwb3MG
	IgygP7tTeAIIAoSv3frPACwQBWq4Z+AT3wfo3UZIWhrUcztkRFFocYjkMScDX9YswfgdxNr14WF
	V9TtLu8yEFtgzK/LL2NFPEeFqS9dpC/UYUfErskBr3Pg3JTSOWsEfVow+Lua3tIZUEbVzkaq7c4
	1lUXzsAbGjAZ7+mW10qLCrRGLwvaeGSpROd2xQboSwfIa0nOWgbfC6HlFP3fSMQoVPfx1/yIVBA
	kMZ1ZQhWTKcq+
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629975eec.32.1792255167415;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: B7QBnUi1eLYIwHDvz9TliXpI-AkPSysH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX4wEBMlMZ/UAl
 KPIZKnXAXVfM1m1wTlQCevERGtWjrX1figrYqJXiFPV/1URF9J2aeFofQ5zXZhMEAr49Kh0awuY
 DOOw+Y32vjn3J3saWvjr3ppAp1+T4+I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX0JMX1PutE23R
 L3R+CTRcL0pibN5VHFgvShNggs0UuxbOTbqgvobL3p38bXba2erB6S4i1ml2MHtMh+PgfSfEfE9
 yeMhz3okzjYdqkGJchIGRHRKTib7WuW3ErmH7VvDNEr+leqozXcZukSky0CI8TYWyZD9z6QP2J2
 D5HgOF/MOLws4qJTys2V2wwe6sj0+PGmzftCx/dtAwYWhG3Zms/Qz+s5ORFxoN4QFWAG2XTAtwf
 MNkV2SPQFViY3g75FZaMH506DtK2SvWsglCKHPvn8SpLRMgwCDQMFVFg/sfLLFSyQPCdGyXQRUU
 Q9mz1G56opvpE1z5PpWDyOWitrwhsQUO45cBzfOFWosur/uV4L17TwHbZ3bPxPGQZBYK1H3+ajz
 kokK4hNwyhGR4EWCHlvhXg/igVfL38Nc48OTaA/7Adxq1wMXR9rkIRE5QlF0xGdYNaGYXrUTWTi
 6JHykdfUCJTKVwoMbUA==
X-Proofpoint-ORIG-GUID: B7QBnUi1eLYIwHDvz9TliXpI-AkPSysH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

