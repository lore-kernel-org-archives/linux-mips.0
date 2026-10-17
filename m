Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC13ADBA4
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255930; cv=none; b=ieNKdFxdKlV2+3wfnZ3CFoaxU8wYSJ+x5PzESVQEfk6x+ACzSbrQSlwF8E6U2jZG1gTdSbcJNVHlQnx0tN5N/BQ0CkoNk4Gd0B+l/IHWkDdn/hK6KQDLK9bh5IPWjgvgH8fGsnef0QdPaQ3mS4Ttgfue3IgWqR8SOgD0ObWV0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255930; c=relaxed/simple;
	bh=hsHiEZ0MfrTq0vKlHAdbOE/dq47CUmz0Fx7H3gCkV18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axijNbJYrv3wcY+0tNGAQf6rNKAL8IiZRnhOSqsKzkU49le0qxD+XhU4sO/Im+nzvBqTkBGjhbVstHdu+VseYW2qcnUiLpg57RpScX3+UapYis7huu5cldqwGBOZUWrA/4jwZcENXWzkvOtGYZvSjMsregxrDhIRbXvt2p5Ea2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddkdEhfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQsvcP5F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddkdEhfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQsvcP5F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA3iF635343
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9h77p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:52:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so1363992eec.1
        for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255927; x=1792860727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=cQsvcP5FpSeB5fritTBhANPiCB2fYyvoICJKi5nOUgaJLg1G7Udg0kr1jvojsoL3Nh
         s/5K5q9Tv8YmQ2Q7WEOZ515XXt46yDPBIDQ7i1Pxb6LIpeMELvCJnKXaD2FWQSfPc6cV
         y7kBGDJ8eO0ZRT2YIhvaAAmlITsIzwapbNhAGVAi+fXnBBLOMfn5B9JCCtIVX4VcANqE
         XT5eA5mT+WJA5olH8O8SmNQ+nm6z1rzD4SRjS8akBkEreDpMafsRAyeTT/8T4zPmUcb6
         RwL7wYL5XAh44h+QXu4cP4F9aX6QuuYj4ZtTwo6BcG3UbZFJhHrWyM/VnOy7wzBIcn0o
         a92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255927; x=1792860727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=l5BsogbSAECVk9dWhTCriDHeUJxVd4cZGsmHkfnnq5AO2HmFdtGBTAK8KVfF3SCVD7
         Qwluda5sSRsY/3Ro3KTnyXtkkKWpcZ3DyQgtSi9BCjRvDksmrvQWWn8qdRrGYeaFmkGn
         fuyh3PoDZG5832aT8szWK1J9GLcopNCKuX4lb3kKJOW3/+Rnw7q5aZYuQGil12e5OiXT
         MHIk9RGK13ALYISY2FMmRfdYLi4aGBuBJup05gwZGKeTIRGLHbmARglJgFqaTGQVK9mS
         lv+fbm4Q891NwK9shh79FEDkbKMbNEMy86RADMybFx+Cmmx8ZwMN9B6XWOvPXmUQOre7
         6N5w==
X-Forwarded-Encrypted: i=1; AKwUvBxQaddK4r2pLFcthU3z71snSXll9f3qXfhEfddbGZhAxwYrhpRwOUbXN5Wyd0BDdAb0tIozI3Iw6Gw7@vger.kernel.org
X-Gm-Message-State: AFq9FYLuwwgDFwyy96VsGNNErkr6kV1HIbnqK313GQJwdv2lNy+tPw8T
	n316h+YahsDlRRk/rnWdJlYkaBmdAjdPA5vFgd2rB1ol1dTOGSuZ1NGXX8lQMppRHchFc0LrQ22
	NhqXzhVg1536R9+iz3QSJbQr9OEdR95waelhE883Y9avxtHOCDCVNDwFTgMl8VtRN
X-Gm-Gg: AYBFou1Uh2Kl6lpFYmqTYD68s0PaXjTdiOifoZKJA9Fpgl2GBXRSr2hKMISxz/z73MQ
	lH9qiixNmwRak+Op5TpDYxuZK8CN9lVMy89oq474OGHDhumVOGNZRI4oJM4mjtRdH0pYOO2G2o0
	AQrym7NgC7W94HAjok3bzVj8PDoz9aOHpzZWOnc9YI7igQBwn6ylLA1O1vFz4orKQMGqVjLwVX2
	QaaiKBxB3IJaTWrorGZMDF71bglV6k5YI/ZEJ6WmrOil+ADJukIZxm44taSqBBfkMltnpIJyot8
	dkqfgmdEp/mloLMEJ+57JDjq8GpmiUUiWetZQm0zWnnHdE9ORY/7Hr3uq9gUW4O5rFXUDVTsyBL
	fYRmjV/tVIBdu
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246696eec.33.1792255927209;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
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
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfXwDiMx/f57EUR
 uyct0cZvYy/a74C1mB8qkMh2aaVNuFTwrUQiaHkwYt9ERgt3xhLbWPEbUW+t8w2iu4azVe5U8lR
 mzdLDsHxM0Y4Tc/KrJ87xbaj/AkUAQQ=
X-Proofpoint-GUID: iWfMK0IYyMQOc_VfmDiC4-yVcUmYm1VO
X-Proofpoint-ORIG-GUID: iWfMK0IYyMQOc_VfmDiC4-yVcUmYm1VO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX95lQuPtuTcWx
 tYubl7nzKQ282mrQT7PDnAYO8/pLol1CxemQFiJJlsj7VdsxRmGSUS3/HhSOJj3voZ1mDY5diOV
 wn6azmYR5jjrcKE+K0o1dCAYwZuKNZpmLYFcBV5eZ1oPG+yg35Kt8+AsNvgjvwAnbz4+m3MHeEG
 BDvSIR2/R8GnnHRuR6bEtTNK20qHmumP1nf2IV7dQDPceZhXozJbYaCCTMtpTnpk5OmTW7msKE2
 Fj1G+sVxZJ0l+5A1gtc1XuJ7ebETtxIAnm04YJ7U05mu4JqRFES7y9ZhODJvDcZDHI83MOWDtSU
 MW2OD5zblxEm+fgrmecojuv5aFURhvziapvk89slDQPBCXABaqDbCjVs9qTjwB/IBbK/sPCa8o1
 W9q+DJxIfJ0znjcEjKFLNmYs690v3fUc7GiYLCoQzYamcgUO6Yuzee+A92VCcP3JR591suLYCYD
 DWPlMDfYdlw9uJYOwmQ==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170067

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

