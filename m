Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B2155C1CA
	for <linux-mips@vger.kernel.org>; Tue,  8 Sep 2026 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879510; cv=none; b=kdJ4tx0Uz44hAuptsFhaiB1VcByUiaOZdal45AP6h2g/n1q0pj2jGX8EHzSMZi9k3SrTbOPyw0FE+eFlTkWow2lKoRrby+HLrPwhqWJxsGMen0ztY0UIaAObGOaWtjooPgK01r361N8bDAKcRg5xCvuwZGyOrLx1NlGKuPMlpb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879510; c=relaxed/simple;
	bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUkcvtfPr2uUMXdDvfsz5V80LilzcQsVlGS5bJ4RSbjFduh8opgRQiukQWbdEkqRSqZjtrWpgnd/RVUlORtwbe7J/92y3V2L7spPrL8AZygNmjBwaRmesiawt/GnZRE2+F/iB+Ripku0Ha+UVd+aIfKio+AfXkDtAgVMJdMqnz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owMTvjhe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAj3qnZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owMTvjhe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAj3qnZF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Eivwf3298166
	for <linux-mips@vger.kernel.org>; Tue, 8 Sep 2026 14:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=; b=owMTvjhep613AUYi
	4aYU2+30nMpcnpwJO5Rfep6JNhv4IcadNAWpS6ouRx4yDyrjf7QjLPv7rEyeTgqR
	pkL9wP2yLl90OATvPstL1HAn7ND2AjnYh8YVosI2nkop3fIrIcop4eT/L3x3qHsr
	QZlfcaHDLqpY9Oq5HSqTJpt56roGtDoNLtaqlZPZP/FFrSW14C4l/0XdUzpbE5LI
	fzNtGi01D9R+FypsogxfPd8wqyoiLwxOWXAyZAOqCZA8OJKo6KgtN2qs5HI68FI8
	JW3OVZyhHFM3zBBvDXvMVzSCiQg8dyEm41TgMo1wm51Z+SNp5lshyAEsq2/X0+zb
	el0aSQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjhkj0wwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 08 Sep 2026 14:58:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7563011591bso506811137.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Sep 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879500; x=1789484300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=aAj3qnZFGUbLMqeRVQajcVsYq4bRzZ4mgN213pO8+7JeiUj1gSDJVgrR1Ebj7+yJ8c
         qW6QSkvuEnBsH6d9D8Auu6Wsqz09ker7v6HzaArpZAZGzJZhsp8Jn97cxvmg/MQtNpZA
         XIz1t7afD2W9R3Q1CrkaifINwKb3w55JM9WLoMXhcJxuVYzu3goa0ekcIeG3ExH+yHMi
         RiNZzFOam8Z2YH60Iq9o/7FtusJJJma9oms/kYgeb8mtYTqzLD2W9Rg1YTDwsX7UwqJ7
         UrjlHDaJoPv0ftRowX+s5+iahiy3zLX36XlOpoJzhHUs4JKw2k9H3WuDKO+nr4z0pqDh
         y/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879500; x=1789484300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=huNZ7pOFobBk6YhLIzgoXGmf9BTIlD64OIx21xlr6Dk1g2UVbsKdZFcio5YT6gKs6u
         HfQXaI4NCrbzV2MUD15DiJTMW1LwEkYUCvR9iPNvQq20skswaLInMAHCVGLrWlW+OWxC
         EGBAGRoN7vlVtzArs4IURVfn19PdnrkxtB8S7BGsFNiMFjw7RRtAGhCwo7ecNAYt8gJx
         nvS5mI3MDIwVM3zbeQTeXukecSBw9NUlA4EufGo7DnW4NOHJZC+ScYVYpr+Xaf1RXjeF
         OHgsISz8ApK0Er6UaIhCQA75RDUtdB1u2LGd7dCpWQjA+8OkLXdNNApB7mLREzlgv55O
         yATA==
X-Forwarded-Encrypted: i=1; AKwUvBwUafghJj8H1Y52BGyBVA5GG4DpDCCE92K22ygJPtXDhmXW6+4bPaA7nqLLrltJ8yH0SVPMJkHh/0ln@vger.kernel.org
X-Gm-Message-State: AFuF++lB6iLeuqmQSnwuM58dJv0AbTA3gs+/pQYpJ61DqdGB3InBBJMB
	1FM4Yp/HGK1nYcuxL2jqgkGS0g6Y6Y+LJqMnem/KLnlEPIPdgsPBdVwL0YkkqXFtBjukUMwaNcD
	yzsjKwECqLDS+BrvxLfMjaEdyTHPFLfAuGZFxjO6UmoEphI6rLG/RnEuVtDUUor/s
X-Gm-Gg: AYBFou23SH1+LVMXzARf6DVUeJI7s3Rxa6ZH6DkHtTKZ5lOD7QpIHtK1Wx/np56u1ZP
	MwUZmkYa8tXcI5S0WFBx7FIYMmpo4tfA9dZowQre8EiqBkGfigTfBXDW5xt4ztuBtWI1rntLbe+
	i/dYDZrxS8wr+CTRpf4+wU3AGzWza8P1GHDkTu5cED/7vhrkMvsTxme3arIJAExJRUHus11TO0Q
	ZLL5Md9cXw15zwnhKLcfckOZRxwjCkMZ0O2dVR8n+8PRNy5ThqqLVB9Lu4GvoHv9m9Qoew5TJzr
	OHdn9eKkPNLKsl81yGC8kGuX9Ji5a6EByHdd9egqlsAw5KtYKTDHDTEheZIAKPLQPrgpmjlE9M2
	W2cjxWnL8KOwmPIaKHQGakeXhKngy
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637185137.13.1788879499701;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637151137.13.1788879499260;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:26 +0200
Subject: [PATCH net-next v14 07/10] net: stmmac: qcom-ethqos: fix SGMII
 loopback not set on resume after speed change
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJtPEfTx4lMAuscmYS50twwqIkudyRPZJ+SL
 07thj6YQuGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibQAKCRAFnS7L/zaE
 w7QzD/4wAkPdm1bk0HVl/ZJF/wSwT+FFKyLR7R6zsVVdqSLVbG98nFldIWBBhPCoHhWaa/nKYQ7
 ghiB/rKnjn1NjO607l+C6hKGRIjHhhIQeFTmfH6tkPTUDMYkoj5tNCLhclHbnI47ZcdcDGwFHQH
 DstjQXudubsIwU81fFgL54Mi6jMYquXGdb233Q6PBWFa7wNd5tnmhtYDwA60Ko43AHhHUJLMA+Y
 +t8bRqMav1PwRLp9XW6yLafq5BA3uW+VwmeciVdQHu3hIjWaOKOgzjdpcqRXpwyV7ptfQ3PdXdS
 LvJcTgA9f+1yXNRI0yCdULY+M4Iseb2LqdMy0XCWpnetbRvSjzJEH2OCR3Eu0siJfUwGVZmmlMF
 HjcMDh1hJuQwJ7Ej+iVTYo3K3KfTB81LP6BtA2WdDxvGSZSDKICJuAuK4z+hdtX3Ozrbsr0vx1D
 D+sRfyd1DP/QwVh0aGfKZmcUWS/zk5Tb/ZUJFx84TvCDXGRgH0tzsyT5elumuHqG1eDYa5GNtcS
 cTAGeh/iUjkMo61N5mshpV+kqCyOpFPh9RWH342EmuMli3GbOhyBCiWA3HD6Kun0XJSxeV4KsVO
 Gz7t4kA9KKjWTOBIGV3ASkOeawOEoSYwCODprNyTMVYyHIqN4Vh9SqwGDUauxzjecZQ9rWXBLTI
 iIAtQtTgM4Fw7hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXw/YxcDNyDbgl
 YgzFmwOPHMEAfoYAFX8nbKLOjxzpVQeSELmUMHRDFnKISBp5WbQl2WShf2+7RR//Z18Xz5Uj5ZW
 l8tnZtY7ujxjrsaD5W5YHRiptkJiOjM=
X-Proofpoint-GUID: zkOKCX7xHMYgikYm-YcRJP_gYyderyCn
X-Authority-Analysis: v=2.4 cv=VYjH+lp9 c=1 sm=1 tr=0 ts=6aa0228c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: zkOKCX7xHMYgikYm-YcRJP_gYyderyCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXzB20gPWeN+DL
 tSkqVAbyfjjrSB2BNDkqacTBBVSLOReOd6y1VyFKwdQeYrLy8bw/3SoDYuTex6dDkAFogpIvZ+P
 wgBjasJ7Q0EXUVvZEiO1Cxvn1FhZSpv7Vcm9EwR7phjx2yL1EhMNLvg+0UHZGH+Ho2QZ+yvyqYR
 NhgGnrMn6tVikvTck8n8qc3nfQCxq+cDAN4wn3ySFJ5RwHDSChYPNsfTkNyLzn/ZjfWw1KJWmhk
 19GUBVKN+Tml+7R/dagy+LI5QuMWxV03NPfYEhImorf4hoPOdtklGrPq2qQX4CZTMWkVnVJT9vy
 v8WdH0VFVNWCzJpaDcCaznB0OousEoKhmcN9LqTjJierHuztdA9qsx5zqqeGOScXPFDoWtbFA8m
 rBaGUbR5v+tx7yNinCr4UOwRS+Un/gVdgA8JCkwMQ7k9yjabJ2guu1fC+Bxk5iFeDOqLW3+Qi+T
 hFj0o4pLNpuCe/132eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fd7414a50eb4e7d4d5adad7e93d49a55500c7f32..e067ceee016217c49d3b3d572fd9f33e562d1a75 100644
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

-- 
2.47.3

