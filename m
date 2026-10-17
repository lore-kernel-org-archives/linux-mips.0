Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622463A48C2
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254904; cv=none; b=AqUgUQSL9xiIf3/kDLpE8H4Mg0TXwpCHKduJklXP7HgN/CCV0aMqpKlT+ghwxPYW6b6StqgbqZvf/yuiIbUXPUUVl89h7a0ZrKM1ykNqJ5HRs2aqPFy6jzJwPLZ3gxJYiKOUpAXu2wC7Ksz1AM7IUzu/D5AOH2eDiLiCHsU102g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254904; c=relaxed/simple;
	bh=3/TD6n+QNpfWoQyOgUqAMw5vaTdMgXTKy7qCbfhhy1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPFGU8Bz/ZpVW8GAaMRdwGfz2DGbWOm3YkiHvkJw6/I6sTpiobP65gAvIZjxJ0LVPslcd9pzLKhM5itHOXwgMSNL3twhMceItz2eMlwU0NOedUlbqyCewUHBJslSNn1Vv/E2K1ah2poHfOE/euqaUhWHynQMh6qFztSHjOKkvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvbhEerp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQaZuwKM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvbhEerp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQaZuwKM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGAbq62599367
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8Exf5uWUb9cZkvT1EFUDPQ1
	TTQV69aXO+M/fGf49Pw=; b=SvbhEerpHza+8SdmQLIHmI2tzCGBloUXBXclwzhH
	3zvmJVOB8xwyS3hhxJYTNNiBUKV0XY8PSqCFVNpgzc6CSSWCLvfPtkFeAkh9XIK1
	xP0T0+G1nwM3GWS7HSfRWAo/8PcMnsmd7shqnuEJ3rpDIoglzHyWZguFMOBASYUQ
	xSZvhnsNiP058el1npRPaibWiTLs12fbApd83r4HIqKT8fCMA72QZOq1uwE3l8N7
	UFCDy0DUt44epTi+3yVj932X9a0ROrwhjoNKlti0uhJoGJp9p+GEAT/QwlAJKX30
	ztQqKDxqmquratQ7dPnl35V6MTTEyo6UTZRB8hrvMHd/Fg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfsn3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 16:35:00 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so3798106c88.1
        for <linux-mips@vger.kernel.org>; Sat, 17 Oct 2026 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792254900; x=1792859700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=YQaZuwKMJ0dCeSfKU7jRr69HI3KrEOW6uV8VXHB69Bikt7n7pqhaJofjW5zr71ijS8
         5m0QXLwq3Dq8ym5iNJEi5EGNCvj2NcxiY/rmjprfcTd7JrIx0UveLt/9DdZYXctpjCFD
         gWD+82MmaSEo/TPAs1FdP4nQ4+3m4z2ZGv79TYXxEWAKve6Md9+YyMYlpPffA9W+Og2F
         hiyb3cdNeJNcnk5WZXHUK4oFZlvXpakObfA8mrPqrhS7qVkkqHTNayuOF/Ol07q8l4a3
         nPIQYzU6Vd095HOOEyzs+5PqZKm6jwkcDqhLfr/0suEjvyo2CiYNoewg+LFFJmridN6Z
         h7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792254900; x=1792859700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=yqy66KqUerR7U9ja1DBk05sxA1GL/NPTN9IGGJlt6sbl2TVh0Nb3qV3sNYXsjpHIvy
         A49EbQ74DTr/WKo236f0bnTsKopdRfRzdtY+8Zpa3bVsAZIxb2hdAFvgRE9jdlS56hAj
         PjcUpoRVtM/N2+WZnQJ+N4sMaGjbuLr4i/2B6mPUf/rbhASF+7X1XgvhvKJMeYrd1HMx
         bwaI+tsaYTEaVIq51WH18FChySjapO3VYdIQbPrqz2WMoujTV+Kc69LgDu4vQUVEDUE6
         RbX7oAlO/eVMVFSFOhKskQod/gHsRdR296ZWPbGKd0U/o6LUpTqMTAl5t25KAC/6vDuM
         RIDA==
X-Forwarded-Encrypted: i=1; AKwUvBwYWTsdOs4NtcIOSf5eM5lpm2TcLLcliHyq+7IQPGoj8ZUptnpQxh6qtwt7y1ypjAr0Jr49ivRS59dA@vger.kernel.org
X-Gm-Message-State: AFq9FYIKKTvghJUwQh+MBNJ64+izyMkJHOi/Cb0JdIMezqpkpA6/LHoC
	NkDvPg79ZQfjV3VYWvLLeyIesmLj2QZTy1dCyCliwa76VLyE+SqtnA2BZ6rETgeEQCykpMrlAVN
	jA5z8VCtTM4dfm/59+2Ku/vW8vFDF7mvDUyyRhDXxOtFHIxPHpBbSZ8L/gk0qPi9C
X-Gm-Gg: AYBFou0DnLsQ6Z5rL/FgfnhXy3KmSng1YG4k0zFsg4mv7coX3IJgj6kKc1atwYcwT4S
	NIMNBVkqh2wbahNXgiG7DJVy+ZlNIftWq/46oYZmJElGVT5Y9Ad0VJMqz80reg1Jk5tKVnDCUZw
	seckr4ZXrol3KqeO0ZiP3vGiZWkrqPulxomc0ldVa8hN2k1NPfsO+HhgzEfLNEJVy/xtCmI34wK
	IS/LgRVizn7Z4hnPUU+OJVjEa6k8EwVG1Wn6TxhLD6ZHYGFD5tpwoeADU5jc9FkyhNI2/S+7Z4c
	ERPo9S2UDqjaT8VE8BWEi3GgTS6hXroJ2KQF3t6wXVw4TnjnUinC5rTiivoCjq4CLdoXAiY/oU2
	vGJenJsoCVMTd
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814768c88.29.1792254899680;
        Sat, 17 Oct 2026 09:34:59 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814714c88.29.1792254898926;
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm21415852eec.20.2026.10.17.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:04:43 +0530
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
Subject: Re: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Message-ID: <atOjo+X7y3WniiT3@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX62/w3x4Gw/Vx
 rxv5hmqnG5BmgMG+UiyuKJ9xItjCzuAy+iqiP3L9z0cykovlqUk4ifM//S3aZpEmHS9kRNHfCzB
 je0gVe1V5ImklRgGHv7dNn9h1vKFNIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX6BW1Kats8uGm
 tjdyxov2ye4m+L/RfOmtG/iO1iVXz1bU68k3mZWlIGCcBSZUpekl5mAyYgpbVIg2rrmJ9B7i4MW
 HChDz1ImLqnJDMuSPv+OvhN/N7UBzWOLNbKJAhlIPY86wbzkXTX7FtKWDIONwAOOXpPUJNCW16e
 mmwMeHzHSj00rJpnoPnohJIVJu9EHopeb+1651CW1w3s5HZYt28eRx7Ew8vjR3fzNhZG9XS/CvI
 eICef00ptyWMS8aUdBj3qZMuJq+BjPZA9A7sg5LrGDfhxwzwhv0O/pHh2JemoGvLXDs8o0/o3kD
 +Y9pHXVg6v8M0fihm/L3Zq87de6eX7xiFCxWQBkNbw2XY7GLm63OL8yC8XhBKZ3JrgtjTiR9bjP
 PMAioDxCe/rlsZiLpXQVqCHKmWHpJN1MbIRTuxj6Eji2840+fcaoD3GYvaOrNF3N9oD9Wk/W6vt
 mauGPPsAwFT0rhNqfEg==
X-Proofpoint-ORIG-GUID: uoZcM_V6es6LSQjEg9vqG-F_fRJakE04
X-Proofpoint-GUID: uoZcM_V6es6LSQjEg9vqG-F_fRJakE04
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad3a3b4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6xCJM4BY7YgkIKmfACwA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066

On Wed, Oct 14, 2026 at 02:36:42PM +0200, Bartosz Golaszewski wrote:
> Call phy_set_mode_ext() before phy_power_on() in
> qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
> SCMI systems this is required for the PHY driver to select the right
> performance level - which translates to the link speed. This is done
> ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

As mentioned in the commit message, this should be harmless for existing
non-SCMI systems and I did not see any issues while testing this series on
IQ 9075 EVK, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

