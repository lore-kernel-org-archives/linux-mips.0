Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79626549368
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176524; cv=none; b=HUoLSH8UrlTfM87dFPX/zlvurWgCLuYV2lNrI6k8ron3WcCj5ORns0rw2QbgB21qsyIeL/toDtDNYWOXTg8+apOBvcJvtxUG8ziPBs0OdVZeLvhXRfkDu2qu8hysfIqlwZvDUnXZdn0DPGIo6qYL2NlkKBjiKYlY/XHIzzuDzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176524; c=relaxed/simple;
	bh=yOSLPGQGO3yWPbLimu00W99FkjfOgnOsMCR38pinqbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1MphzFCmSRRBND4QEzwLo6QEdEypcSlQ9R7ybuqtcwvrab8e0Jf5O8ywcNu6pXWeotW+dS5e8UU3bG38CZ7nqYJPobUaz0IfqraMuE5uOJmK95dudEc5lmwE78fchxyUFlvnAerKXy7SinuklEg/fac+zUkqd2mm34UhEWJa1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2mFyMRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcHBK+bE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2mFyMRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcHBK+bE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbSpB2443257
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 15:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ackf39/pZ/ObACJy5ZimHQgnJjGDnYeqr3uy9apst84=; b=F2mFyMRaIIMk63g+
	ZbEflFI8xnIbQFSmEAhUmrUUOAPWhBn2nz4S3Pw8CFAS5KqL10Q1etcsY1qXQ/il
	fQJR3s5wr3GuzxOFMwuhdW8F/BBBzHYAT+PnI6OUi/wH8zB8dZF4Pa+E0mEcYxKc
	wCpdIHhiBsCCEDSY2h6vx6quXiLRn/tRuGtUO2kftvKz9/1Ocet3cBqPk9AKSoE1
	rp2pdNGmQNjPJelyYPAE4xacHwWQiDN81vUoevNzxw0MBUGXAfNZXNQ8oZmf1HeQ
	vLaQOZW/1eXvKbhAMcMUpGuCuxNZSZkk0QZTqMRb+omjCDUs1vRX/xGtKKMpK+Q1
	fqAnGA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hgqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 15:15:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8487ce333so484552e0c.1
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176518; x=1790781318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ackf39/pZ/ObACJy5ZimHQgnJjGDnYeqr3uy9apst84=;
        b=gcHBK+bEZDYuhl+4L34rB9qPYQfRJ+AeHT0umpr+Voc9jR5HucyGszW5MjIX1yFgBt
         1ABqo4r9Hw4YXHZ0VtL9rJvqEL2dyOMdHJ6iUvVNDwJSY92W5fsQCtMR+mFeBPKsgWmt
         OkfDr/uoaVQMQT2wqk617MjPxeTQTItiruMOgg3g3MjekqiQ1HzyNtH4dVzmbUFgtp8R
         IXiz9reWt2eWokB4NeTcFasLvjtnbRgmSXRRuQ6snExcbUtZ/wLN0ZzY6pN+Wq4jFrcP
         FwWRDC2sY7RXU9l9ra1MDBoj89IT3gEPIVDzIItCC0Iq/e97idrqkC47UD8YdcxnwIv0
         X8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176518; x=1790781318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ackf39/pZ/ObACJy5ZimHQgnJjGDnYeqr3uy9apst84=;
        b=xU05c5PScZT72vaVG6wT96+FDuo8objzqmLch+FVkLQa+QkFdCBKO/X2sejeF31JoK
         gnHwqTlyAqCe4BfXrqH8UP/8Ql9y1pmAJ383nrqDCQaxnykjNOofUH/UUUHcwOtWGkB0
         4ucyXZYF1NV2JD91y8GNfrcZW9wxnpyJ8jfyCSA+1AKAHktEcqfr1UQfl8LmmDEv2wIl
         et7olCJL01oSEqxlTKuUva8P3cv8FXkaBj7WDSTVB+44BOyxhBqp1ssGmYcoZpyYlfwj
         9W71SPA5ytvj7p4Kc+QD+LIoiJ/lS1+lU6iYzy7HR08Ir5wjy4ZXykom28S2lq2kozzo
         m0eA==
X-Forwarded-Encrypted: i=1; AKwUvBwvgJXt7GXLPDHeUkvcPz797QdORn0f9NverxD77WvHReqI/RZow8vycQ+xIlkUn39ZQqSNRYybjEYi@vger.kernel.org
X-Gm-Message-State: AFuF++lN/Q8E5EzROb3KQeLN7uN6/frvlCDAAUFcfPcXNG/z7XiMsmaZ
	b5eJAzRneTya6wBrEYc7IW+RQhTx1SJokGtHr0oeO+5Uflty82Hpt34VLRAkDtv+dB28TsE5SNf
	Y3eUyXk1WQvGiUYE6lAw2GQzBQuEbkiNXMEM7lGlzNTpKTUFsxxng40k+6jLGSDp4
X-Gm-Gg: AYBFou1FNCJ1tWvgj+bxoKjSU29xBOgxOv2m7Fvmro6FlgQmDxVKJtp7nTozhjftTOb
	GJ0U+o4f2b2ci9ChImIAfxYGnDtET6Jy0nuVdUoSMk8nnXIF5ovZu8+7dd1QZ3gDptgzreDU9Dc
	GmExA2ZFT4/TXZI9FO+aQrtBxwb/gQnKtXm6d9gUALTPddfWHasbpHChjjhqFFEJwM9YOqIuKVT
	MBVkL4DjcDwAiMiHl9AM9UKzh95QVkftqpyyLNYeYm7fLX0CL372nVhDR54yMSz2AL/cJEvAFru
	D8rpxIt6/umcpU7bSDEtXgASxi4L5aNnndwa7h+fOgi7RMPc+iZkHjZAaRN/xidf6vWYSy72RqJ
	KhYWmRBMWik2/cXRMQHUOFVwJss/7
X-Received: by 2002:a05:6122:32cd:b0:5c9:c60a:e9b7 with SMTP id 71dfb90a1353d-5c9f1696499mr3415518e0c.23.1790176517859;
        Wed, 23 Sep 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:6122:32cd:b0:5c9:c60a:e9b7 with SMTP id 71dfb90a1353d-5c9f1696499mr3415445e0c.23.1790176517437;
        Wed, 23 Sep 2026 08:15:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:40 +0200
Subject: [PATCH net-next v15 6/9] net: stmmac: qcom-ethqos: update phy_mode
 to the resolved interface in mac_finish()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-6-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yOSLPGQGO3yWPbLimu00W99FkjfOgnOsMCR38pinqbE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zpbxNM69aCzkFScxDoBhjp12e0m0NCrpXu8
 pbkiaRubL6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs6QAKCRAFnS7L/zaE
 w33zEACvZovBfliutxhCI/14frOIF8EuIixeWYDT6O5U5JqPd2Y0MB0/3tK2rkBGP+dV6DMpboH
 U08i0VU1yOrgo3YNP1lmc5CeeiSFFrBrgaBdtM4GMga4FW/sg+jmCTyJ0Brp3NdPGuxNeJf1vp+
 Mg/VGzsaWWjhnulJihKsRlKjJOQ1qKPrInfG25AwlAZwQ5x0klREl+5C/xbGZspyaUqq3vVgni6
 bO4jnKtFqidMquI3jk/TEjgiHsog1PaSIhw163FNmNLj7xpgUq3rjzkD7Kb04b5FSBV/tpu13+4
 djKe6I/3xUtu7QYBa9PTW8iYe/3g14cA9/H5bkckzKGXt1j8Wm0ppSPhPJKKz5Aet/7orHxqM9r
 J6bL/klNxpHaD3giIh3rHsnO9agMK+n+pmvDw+eZL5pq4HUSX54HTrAxK8LTPj9PJisZLuUPi3c
 iGMDbvURa98c0NSYnUCa/PXoq2TQtsI4ERytFdNXZCQsqolEF8zNB6dFUtgufupmqqWIenUUU4s
 R9vkaQbdQZ4maaMKXl5DlMJ2HCGEia/4MUwKYKiLmKOE+TPcaDKmlH8KXDyliZNQvJXJQqJ/fWK
 jqt3tP0//NuWXAupjN3ZCNop7Oym3dwEwhFvHCp7zfoWVpz5JxZsym5Opqm9WL79yc+kpz9RMUM
 wE0gn559wlbaj2A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: yEiBtFapLYj_hsKIf-Mr6c5P-kfmMSeS
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3ed07 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FCP7PvUSyU9qYmcNpmEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXwYQKGogzKtpi
 cHWgPU6ma9Pjf1TwhjnX25srV38x5D496j6nkmGfWIBF0Wg8kLS880hjtqMBGYLVCQPHoYu1/Jg
 k2ediOmTJbpgOQqseP3DsXWr4FIPWUyVLRmX8PBBZ1tlHoys9H6EMKQ9KH+CVvOAM1JSfvqlhlj
 4Yo0m8kVyBHBqmHTnBPUwrAPkejuo8QiRgesWJYXMSAVs5XMvwvCT7MTov9FKWF+GjsKitNuEUo
 596n8NwJ/wt6KRH/9bGiaQDpW4lC5tB+8FUVzU03zyeXOZJykOuscw5rXNqJu/ttpPZRGRj7yDp
 /aMQfQWM18HA0jeDARsIFXXz0KnljXeKJOYKLZCloztNpawWXaZ5tV1tBnbCS5gzvQ4Mi0wyNM0
 jMBEOdta7uBGl0v0EZoQm4sqqghurqQKI3BGpMe3hICUcZRamLny4e4BmQvbEfLB2/EXbXk2L+h
 /G3179RpDKuHYq2Sr5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX6YOOTXM6PZna
 PAlbQp6kFFdWLGyFwWY87XhxF0zz7w8AHapmP7ycHgvraBxD5lCk0K0hdattWlPtYMN2gpCNjqY
 F6aCBNs0vfr/z/NjpBYtU/8tOTW1EKA=
X-Proofpoint-GUID: yEiBtFapLYj_hsKIf-Mr6c5P-kfmMSeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

ethqos->phy_mode is read by serdes_powerup() and
qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
wrapper for the correct interface. It is set once at probe from the DT
phy-mode property and never updated.

phylink resolves the actual runtime interface and passes it to the
mac_finish() callback. On platforms that only ever operate at one speed
these two values are always the same, but when the interface changes
at runtime - for example switching between SGMII and 2500BASE-X - the
stored value becomes stale. The next serdes_powerup() call, on
a subsequent link cycle, then reinitializes the SerDes to the wrong mode.

Update ethqos->phy_mode from the interface argument in
ethqos_mac_finish_serdes() so that it always reflects the last
resolved interface.

With that, we now update the phy_mode to the runtime-resolved interface,
so any subsequent resume with a 1G SGMII link skips the loopback setup
and the DMA reset hangs. To remedy this, extend the guard to include
PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 47b70b5e706f221c01f1c0ae3b1acafae6641165..e067ceee016217c49d3b3d572fd9f33e562d1a75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,
@@ -634,6 +635,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	/* The interface mode is only known once phylink has resolved it and
+	 * may change at runtime, so keep it in sync for later
+	 * serdes_powerup()/serdes_powerdown() calls.
+	 */
+	ethqos->phy_mode = interface;
+
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
 		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,

-- 
2.47.3

