Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007DB4FECCF
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981448; cv=none; b=g9FefQPB2t2LGAfvRvFNNog/PQMFzARRiomhxuO+oeA0VYcBJBLLMDKzWtUdPzKRmYpZms0FeLhqASKvL5cc6O5f4VhdS1UgliGfv0eYEdyHgIt9F/2rQih0tk4TIwN+N3/xqyzzIotsiaPhCozks8HCHkZc9aWuEX/QvYU/M5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981448; c=relaxed/simple;
	bh=eBhW6NiH0dLJUuS6XtgR4HFRCy/t65zBV4o+elbw8VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bf57A+YEOd6sdiIpNfQ7jVnVSqoR38hTsnmXNHFpxp5gzPjIrLHLVV2f6jTDciqD2zHH6CX1E5/GHfgOr71Rv+YPUvinUIbuFXiGG+poc4FaMCHfbY1G6EApSAOBcmXTmjoY5ZP84D9QxXCSEWS9BViRVxvTGtB/+X9rA622bgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxI80CRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jr/7/yjy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxI80CRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jr/7/yjy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9pj252222109
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 12:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGNblflxPu6Xycp4I5R8du3Y9bvog7OVz4R7ljSPhKM=; b=AxI80CRscpketcJc
	Yv0Pd1KjmJMvxVeqkrIodaIyTvTc/nauw3YLuid3DObt+6dx3I2EfHTH8VugDd26
	oS4u6NvUpJ5+VVy3A2NicEl7G9UUxXIoH5pby0I+PDRdBBNBhOt/iLHxi72I3P0w
	+lFqga/RgutiV7FI5F6RB+wp6mQGv6uEq9Ka2AHkoYuh2zbYlQJ8fYeUJzeCVAw9
	Vv+JX/9mAlprAfgyus8eK7v+76hZKpqGYKaADvLaQtzAxbCID9yXYdvMH6Ej7YNr
	Y8OxHLhG0z0sXefm3a0fYRun4c7zGFeED6TfBGpNs6W37IDP6i8CIQ2ySXwre84G
	nLXbwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbm6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 12:37:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so1248408785a.0
        for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981445; x=1792586245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGNblflxPu6Xycp4I5R8du3Y9bvog7OVz4R7ljSPhKM=;
        b=jr/7/yjybJpqcTO+5bYJY+PsE6A7v2oxPgMqM7yNN9rkHi5b3ldH8P0XRJf3xSSzIW
         c4t6xOWhWXPupIwWqqZkhHT8H9LyKY7vnD52G2L3cKNCyicC21mi6DQ5GBTkxSGy1oGP
         CBQo6l2Z4Wq/2wv8/xiakLjtlS5ZR876tGLvtXv1lMg3r0K05nXePRc8hR79+OI5B2Jv
         AhhWvZsrsrEjJ6IUd3sKiQSFIUsofmeQiqjDIRh8f5HkQV2gcQ0FSd3on7x0NDXEDIxa
         UJpmXzuHoDAjz1+TpcUCm3BeqqRx0Drw9bNgZJxMNbtlYx9ItMTyA/NOtH9h6m2FHNn3
         n50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981445; x=1792586245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGNblflxPu6Xycp4I5R8du3Y9bvog7OVz4R7ljSPhKM=;
        b=NhGNxHHVZne39oIWvTR4GSccUbXQemoUcAXDrqdrefGHtBTLlNXWbp4i/SH6FGN4ue
         saC98j9Gw8rZ8MwJbvEgyQKPGkggvGtfJH6vMaxrLU4tioe4WfBBjNdFyJYifuiDS9WD
         LGZWwRcPPaefg9hiM0pw/YK9rPOJTM8UhsPEnPWLMgY4Nb0CsYkuWcOOGuV33jIm5+eM
         4EiuqA33jy9nLJ+MN/Zwt1i8EvFRFQnryqJNrN+rXRKocdy4kKhxgtBf/+01NIcxDIXB
         er4pWjnD5Zwxs7S+KX2yWNP022upiH94dGV0bRmgi1HdaqqKWOUOcMhSv1qn+X1NsOM0
         uw1A==
X-Forwarded-Encrypted: i=1; AKwUvBxcaS6tnu5ja0nHEqqptjb4yNRuPf/jd1w23UERU6h1BPK0yyJaSIl/2bhWu57T+WXgjXmmnbA+F3PL@vger.kernel.org
X-Gm-Message-State: AFq9FYKTTyQ11V0A+QXfQAR+oOxcOlF7HZYeHHkhc8C/lYv15CcKKzJ1
	ksc2A0Kv7GikbEQvDs5DVMJ9qfJwkE5IzCU1pkVia4cghA3kQU4f2KhGDyddJmeKaYVBmI6cFRC
	hA2nlwX0VaBDPUN4e6OOeUNlODPCdXrD5Hr+J/b2RGf0z3wfeT6+YekdBqdbHaslQ
X-Gm-Gg: AYBFou0skrgA8k7HN0S7W1iFPR81nTyT4NXLJrJY03/ahr3ans7Gix4unF60r43D7em
	S0Tz5RhIeDxe0KGhYqyhbCYJIKfnRM1QSCgJyYzNy8lSaFjUNYuY7Wg/X48LwrqGsmqbMDc8cjx
	anyTcm7EOcvQ/w4j6WuxzhH+QyE9oECWF9X+eI8OOIgdqrDC3Tzoc3/a60T6Qt+vLNaqqmx14LP
	7dSq2jgQwWu7GpOl6OTp25c6t/tYNuSw2l2K2K+OopX0iT/4XhiTKnZKLA3Cm9ig+0rOPYAGkrj
	5busNYLuOXaBuPp8vLQhLpZcSiekG13vsl4SbGHixVmoCQAYgrw3qgestlCsi3Xc6eE+SVI/cny
	s/txbKpTegVYmrll/ojce/v6/Fu2a
X-Received: by 2002:a05:620a:4556:b0:93e:bdeb:f067 with SMTP id af79cd13be357-93ee10415cemr1563773585a.48.1791981444648;
        Wed, 14 Oct 2026 05:37:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:93e:bdeb:f067 with SMTP id af79cd13be357-93ee10415cemr1563766485a.48.1791981444088;
        Wed, 14 Oct 2026 05:37:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:45 +0200
Subject: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7508;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eBhW6NiH0dLJUuS6XtgR4HFRCy/t65zBV4o+elbw8VU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3drVW8ItO1qoGaK52KZl1kc1uVLNssfrXnx1
 vPy2p1f3x6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93awAKCRAFnS7L/zaE
 w/dID/40Ip9nzqL1UTNjG7S19Fd4LX3WM/5Yh46nzZbhk5WMxxYlc3gnDgPCt/vSs2HLyrZKSOh
 i4ASDWLXIqGjTyp5gOTXGcm/ksBEndNpbWStZEpVTr8X2uxTUZrtGdzURLrnItKH1O/mkxDLzyP
 hNP1+5+Ze6sp0Hmo1pG8p68NQsLv1T1tmRF4ctpggz7LRjBR1YC4zEmaS5wTJOD5FxzC4dlRMfI
 eDcTn/nGEtrE+Xv2V1kS0KRXYp9LfFuTt/nDkLFLoPtLSBWNGInYg3KGx0rI4QYuWWyuyAeyJv+
 mUBq31IkfZOAGRSDau4TuKfVLuU+Ev4D2pUxsj9znfAZHcMtgTHVJetci77/Tn+nqlVOHmp6RYB
 YK+sfbQo3C+8/gs0ue176DQOr8TNXqAtnnbg1wTyL6jaBEHhnaHzwb1XDkLCWb+4SdlN7TwByEN
 1nybMeCG2IEEARb8MqulFKfALuGUrUjEUKnxspbq5wZVpORwsESAOH3OrFkRBbUK2O/C0MeyGz3
 LeE3cw989dFy89eoBdtEL/f+pZxtKYRYtmqfZ2eBbxOeI/c0VV+X2iRUyfvmqtsCwUMWWIm17WL
 m1ptUMbNeqLtwg3CcbFuce3Y2FEcmJNHzPfwLMmYQ2yv8q4Xec4g2R2aVhHbmeM5YyU9jrIcVLb
 JF69vAD29jvLihw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX9gEjivBEkK5n
 LxozeVGienErOhM4Oe8jrXJeOiURA22oCruEqynserpeNUAPcY54qlINOQSN8XuyMFpsHk9Qshg
 eVE0yDG4PKpDz3/r/z/P6xI0RcoAbjVP5fttyzwk34Enz1Z1rpz76GWuU1WvppyAnje9IYZp3Bi
 qL5Yk+gAteXmVfCrMCRx8fkRJQIC6AKmbTkjbtQT9WNC7LULJInXmjoSeiet6oInNXEGzakAfXP
 FS4RsSLAzRbVq6Q1qUN4mrRUlJUqvwPo6bAztk7nrkBB4QVgw+5VeSpTEwwxcQDwIAEaiXn5vwD
 N5ofjY1FubPsMVjAMl+uqlD9fHX7ysUyadecX2Hlirh+cOpUPjYyab0fMcrp1yR6g33R9tbdx33
 Cvg925VStc1Atf9MDipxCMEgUPrtmEJOeAp3NwZZHPm0NNilS7kTZ7boPV2il1vqAqg/qKIz/XP
 18wfG1IBX7QvpQ8Ailw==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf7786 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX2qaozq0uWmgO
 97ScObdrIiJWyubvBU7BApAeTrMckqFcRg6AYuCV338l9oSZS8LpswFJ7XpMxfGqpWsZG3z2aLB
 l1ZgMijodVu0ADeQz7wwokigg0jLyo4=
X-Proofpoint-ORIG-GUID: 4_QvK-Auyl9L8A_Gu1UQVM5SE3fzCQz5
X-Proofpoint-GUID: 4_QvK-Auyl9L8A_Gu1UQVM5SE3fzCQz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140050

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 94 ++++++++++++++++------
 1 file changed, 68 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f840ba4c02df616410759f49af8dc8fa0635987d..4e9c534fb240f0e08695282bb66cf6134415cc71 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -200,6 +205,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -214,6 +222,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -230,6 +239,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -262,6 +272,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -297,6 +308,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -695,6 +707,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -716,23 +780,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -742,24 +803,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -768,12 +818,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
 	/* The clocks are controlled by firmware, so we don't know for certain
 	 * what clock rate is being used. Hardware documentation mentions that
 	 * the AHB slave clock will be in the range of 50 to 100MHz, which
@@ -781,8 +825,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3

