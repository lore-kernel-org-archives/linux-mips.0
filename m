Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A73FFF8E
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732569; cv=none; b=RTJwqe4bdhFVXN2sBioPLPZdcdkz4hFgjCjETxBctxF2VNOE5jnku76SOyQkZwZt3q52jnv5bfmy1ZPzcBpKFMj10JU8Z88k/WcBIDZPNroy4PblZdu3KfxMICE53TMlA5sR5M9yUlwBQUTUabt62OypejJkN42UI8jOLvPrJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732569; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDe8kvOJ3NwfWOjbc3kQXlwDTdh1+p20Ndg5t3oorHmjERpEYF9whPAtbPsu0nQqARh82aiMuojDFtVgOgo1mAoiyjWJwuiX975RbUHKlXolFuycWQLXdNGTXL9wHx+A7GWuTC0sLAI678i8FoKZaVG/twie5ZE2BQicSAp1abo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7fmsNYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcXd1p2c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7fmsNYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcXd1p2c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATJWd2656106
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=B7fmsNYRL8aorCjh
	GkGtC15NuXFLrM4H5JOnAeJZRw4ftYA3jmzaIPdv5tLcXoW3w9ni09DVmLePuMCj
	MCsX+7wJP89eJIOZvk6wKaeLxVpixcWzjkwuqLkmksY3Bh7DytOgz88ZtRwu2OLU
	qmIxW/7IU5P+U0dKfbmMJH3PVd/jQIXXWHdtGc+Gn2lWkHWcVW0Tlq6TJE8Hqx2b
	Y8Hb39FxYdMAGHxxiApziNKhbRsn10Xx/Vmp7Xvj+cYfYYbRQxE6O5JxSVHLCW82
	HoDuLdqBAUCeagHW/5UyHXnxKK8Cfbsk+6x7lYFVNnq0bPOh4r2urwD1lWpAQ31P
	KcN7Fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gj24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d3261c5cso668909985a.3
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732566; x=1783337366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=OcXd1p2ceRsmrKd71wF1PLpv6oHY2lXXFj7W4KA1DIPM2GADlu6mPJY5AJzUt5yjLM
         AGB47lsbOKdqrG/wPi8I4yip/BSrqyFsFYASkNSwEV2TsMyU6FavBygXGaJBbihJfZzD
         jaCkk9uYleBue+dJJkz0tisGP/KpkT6AKEBf+E4nz+8/AkKdkRobXyOXUx4opXAJWx6S
         kzc0YEXG79iLvpvpXL88FRcoCHuB4gnPAd3HuzZ7oc7ywbS/dNZqTzCkR886MBHDxK5t
         xGLTYd9sRDYVpxAGjHwvbTitWTFmsFF/5pLJfuLm67tryV49x+8C/E6DH4iTWC1K55zM
         OcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732566; x=1783337366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=ebWLlpwWzaxLzaMz2iSHR4BXp+tZ1UdXlTVwtbj65elY2/36fuXJTm5woRcfAIaZO6
         6ObcmNtmJG7ziLcNc8YSLOGfo5LtHpTTFcmra+thl/241F2rqWXj6pQiyXnq9i7z2sNK
         3rPZDOezmbck9XS9BHDxAi++rW4c226e1Sm75fe7tP/jmYajbgIj1pBxjo6WW25oVvGm
         uXA+UquFaTo0P6eW6CVBdSGHcIvAFnqYtOXhwRZcUpFhDyPlLK7PuLjUwJ3W5A9nvLPy
         gMPuP9WRo9bXrEHqNxWcg6ayfWl/r4gj0b8Ii4APNETJpt7oWBLP5HKZ4qn+VYycIl6M
         K9iA==
X-Forwarded-Encrypted: i=1; AFNElJ+vCqXCL4i1vuQ4Txv0t7pyK6rLvTFM36X6ji4JM+Q25NNSWpcKVARtz+qGmtB3qFISVFpupsvM4AzA@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOgsWSCEq1HTrOOv0d2Esyc+WWUuQtkh95QXQw3MGIw2/ab1u
	NErpI2wf37QcQMAWqq+L/gCrsoADChOX0HVFBwtsUHW3+Mou6leZ8B4gaBQ4aDS4TTeKy1xJvG5
	kQyME3rS0fq0Jrac37xBDhv7Pr1Ife8F5IKWkzicpDl7yN08BAarDshkojGDIx0/Y
X-Gm-Gg: AfdE7clr4kDA/wRCv2A+YFaelemotXUVV4pmzNO3cE7Au6HyNvFo3za54kaLXyXOkIe
	UvSUjrjFlz505n3FJrsoL0KbzJxGbM5EeGEycIpSZQrM2DYYTu50ztoYVMOXkAubulko6yizgH5
	OaU6dQ82xkgz7bP88qHK/QiYR9jzBtaZwwmDbVqqnHu/wGi4TDxHfKFUmNqIWOsrlZlJ+NkKAo3
	LBYiHG9BojF3kLGzcmrgzSfglWIm0OprA6kcc7k6lTaySAGMJHPA+5nkEODYeOVt5bqSJzu7JwG
	GUNQYTU+CNbYCXAAVDAGwiDh+7yjdgCcAAl8HPSeFG6ZbZFa0IcP1HtXsqzpBD+9B64YGRPuGFM
	lI8o2rESciWAjmEufR4ymumNB9bJjlTThnrCsI8jo
X-Received: by 2002:a05:620a:46a1:b0:92e:472a:2a75 with SMTP id af79cd13be357-92e472a2e26mr761064585a.61.1782732566237;
        Mon, 29 Jun 2026 04:29:26 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:92e:472a:2a75 with SMTP id af79cd13be357-92e472a2e26mr761057385a.61.1782732565749;
        Mon, 29 Jun 2026 04:29:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:50 +0200
Subject: [PATCH net-next v11 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-4-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcAXYEHjo3nW5lXrEftFSP5te1iX5MUJv9q/
 rn9qnJOMKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXAAAKCRAFnS7L/zaE
 wxjzEACZof4MzE5R3AkLo4cdj47nM5c1BmYSvHzKkCHEBen5ThUyVXeDwIwWWblDb9RzJ3y+MLf
 o6oOtrRCBgzHhzIqbHMC8RY56b7Obnpy1liOpYkCXnAoXb6GQIsJOrt2U1uSD0oKANwf7nPzoqL
 OhsmiZfiThdMb8fyV5Uru6/3xaEgp17hCR/aNEhzHtDia7fcIC3r+wIGY1DBbu/Wp/jAu6pkOP+
 CzmnB9+VgEd3M2bqJXsVBck09gVcta+NALXRXu9s9uQcUcHxZ+GXz8kcfv/BkCvefJqXmNlZnrx
 hZHHGxhX2fc2XIobJ6+i56BbO4zGF4ju/pDPL3p/seCOySbXKLximZFUh9EfCKuSW72NgtcoSrC
 sP1C4LfvmWtH6SEwVZS9IwmGHjZ7L7474PXH+4zAq9UV72yW4CTIBxIfy8rYJrT6MjNXYYc5lut
 a//itO77gs5NIRlfmPXEjerOAOcgjX2NdtQLxXIkzK4JLftEBKC2Tq/QxziC3FOoqyL3e3c1IAA
 TBAiTx19G/dHyvRs2d5Ivud6gTiPAzPYmfSqhzheia1ryr4Xh7tfnNT4fDp+JaPeGmm3UwUkTPB
 Jrg8+FwsGLQYmxAKa70+0+gtmRNxyZh3idSJWOb8k8TJdI4CzOQx33u7dp4J/K+nGHNeNNaZhjk
 XzHNQpKFk6JR90w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX6qqYAIMzqWBX
 AjmX61kAj/NXypGsQ1cQBwbOZOwantdoGxxsWeN2cwvwbQNlxU4So0fLroEEreS0l2C2r2vDLbe
 p17EFLT5a6coggqPoeFAm2kCizleMMrvd9dpO3DeERJXELYkPhn4Mv/du+FFVwl5vgoFUF4t2rR
 synorAOu40vh5AghL+Z/tmJts0c0SOP9y5CJVguFX8L1IVsKdrF4JY+Jk0T+h9d+5emecNLJpeX
 egAAhXf3pdijdlpwtIJw2X4NAL/S0G42ZicXtEGKcz8LYworL2i3DglGSzKgwJQ0589O9h+HcHM
 gL/pGRnOLYl9zcpLP1yyy9leQR174RTwYGv+NpbxH+EPiPeN8zM2CbzTcBJ4zdb4OiAh3KCTFza
 zIbKY/Xs/C7I4Sa5X9NWu5rQ39kJNTyPdhcKwMdwFCe5Deb2zmoSa1WCWwhs5yC+dsGu6HM8hNJ
 RlQZRB//lNc8PFxtitQ==
X-Proofpoint-GUID: J0XKazSwBUFDwix2S4n6DNQCim4vT-M1
X-Proofpoint-ORIG-GUID: J0XKazSwBUFDwix2S4n6DNQCim4vT-M1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX0Jc1z6ycNe4X
 0CHcWj5E1wEc+AysbSwqVw7SNFkRrxyBNNURS39uzx5YQYNkCmgu75iBvMDd573CyHIf0jslSCG
 lMkK/c17C4CLqoqk1/mqxg5aB9/L5Zo=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a425716 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

