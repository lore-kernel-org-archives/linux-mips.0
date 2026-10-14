Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2D4FDE69
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981445; cv=none; b=Hvg30Z+I4K49glCb9movREYQz56xyKIemaeOkOp7mbGoTNlgzvQMPXngITF676uFNLDzVsg0vVXMauTmWhCM7M2QoZlbnaFeOZ807jfjKH5rjl77Ag/T4KarAOjkCaGrt9nqu+DNjEGQkf0DUR1JLCGEAHgLieUEjdhoWtn7hzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981445; c=relaxed/simple;
	bh=NZAxb9MK43O2wa2aiDj23ZEiKR9RAVihBgD6wcTqioI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Phvx9uIgeH7Lt1o0oH7Nf5RpbIwUW6MgOxOwVOx7ETfs2knR8qKS7akKmT7fSqD+URUar2u6IouO5948jn59/NsJXHamE8jeYDSK0/lSpuUBgz1OWmRzYn1EX4JpnMUNjUBtXceoTFM+WJ9piv7fxiUVj5JdhUE6AmMT9UFqD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9VnAWmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlXUBCoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9VnAWmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlXUBCoU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8lAPQ3000921
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 12:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAzjDYNamaa3ACvOjRHKRLOW7XP98fJpPmxyMJ5R2h0=; b=F9VnAWmw8teizddj
	LBAi8AsK8KJ7BDjdxWhBl1pm3d8+Juj4G/nena0MJzCGOZI42WquGV9G0vkIyJSA
	fvo7YLszSs6NRo5sXjGJl3Sn1ZVK4sFdgThAwS6zwwwnrbXuxmqW9SZ37aypQ3/Q
	0OkHPJmKvzeR3yMDYbdnkjWuS/sGh6xymvZo7HOyZ2eVLoLZrIuCUjE8YQqvp4fm
	wBdmFpDcRqVMrT1ZwEPaVkIQJ3ZggJMXHp8dvf/4a9nkMt/FPxkfLHGLkgeXzWkH
	61v2zw6kmk47ZL4ojU4sVph1100a8Th68LkmoFthQWMzGkMozHdbePY5jDl15xdr
	zHyccw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeuxc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 12:37:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9195c59ac8cso129294396d6.0
        for <linux-mips@vger.kernel.org>; Wed, 14 Oct 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981442; x=1792586242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAzjDYNamaa3ACvOjRHKRLOW7XP98fJpPmxyMJ5R2h0=;
        b=dlXUBCoUO8u2YsWVO+DPgf6YSvoQ++lpQSnOPFRoonkyG6bDLlXucoKgLylXZSeBR7
         3Rq1GBHHJmI/w38PAWjqCDixq14ew898hD5+q/gNFzgi7otU2MoINQn45CJZtNwPqmAY
         BkKmlo6EaJ15VBvzalp/KvlR6HvccZ5degbAfa1U0tLgk83WMqH2kmVGDDCM842r1uiU
         Y7+6/nNVjNLVUCFuAE4RQS2YOtyjbnwkv/77ZPtVy/cFcVsKUczIydDuoy6oio46/mYL
         3LzNLiP7xEa0m6x04btjFj1UOkx6uyzB/Msadv3uea4vCuxm56tMxaIDGKUo0clsl+Bp
         gosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981442; x=1792586242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAzjDYNamaa3ACvOjRHKRLOW7XP98fJpPmxyMJ5R2h0=;
        b=SEORnTX31n/6xt1ID/v901rl01DFwoKhgngNr8pRiL/E9dNbmqhX5LI3pjmX1y17Dx
         onNqC890bqTBVhwtz4KB+RtWyKDiA9souCeNXEsepnXE+PRISSjG1DiiKhVVG4NljuRc
         QC7BYcIzNu8Dw+qKOCKyIkKS8eK2q8poIwXYcKRGBrSu4VEaWuo6H03q7Vhtc1VPqvbv
         /X4AM86Sc0k70j7fLQ7oWym6nDGhnb5M42fsHv2vckTabmVlutYAyxL7HlbDJKCV+2sV
         vB3B/xQvGAYDKN8Ze3wXHl4whyVTCmX0avlo85N4iVGwMM0TdnV3oJl2m37JgKzboCHq
         ByqA==
X-Forwarded-Encrypted: i=1; AKwUvBxl2DUvoeSOHG6sdi8n+QmFxKbOwu1qV0h7yGPwKEKfLAE2ktPktcNShzpdNSO9QxiCRsZfkQHWKXgT@vger.kernel.org
X-Gm-Message-State: AFq9FYJXvVICzrKKeGyj1oQdTxI4e7YrwshtEtU/TkQ6DWiZUaOzG1S5
	NjdUwP+41EANj1Qgyuj2vOBwdJoSLtn9fjUaxbznz3z064Npwq9K9km18RFvw4D5XKV6i/xHToV
	CLDZHCf/ldQI7BOOZ86fi8xrZXJslT+gthJQiamFcjv+xxJ0n5pdqNqS8TAG33ngW
X-Gm-Gg: AYBFou2AqsTXssronZafIKieXWdgkVSIialWjOb7xw9eyDuqHUmpQrBUHA3BwB7kMBC
	rlJWc7CXFcYgvFbLlc5POLLsXNUJABK2zyVw+0MXnAPcLPwCwSm1XAR3Ldov9mZSSZO5FF4tB/j
	wivc3ikqVBadY+t47w7OTBkkRF3nOikgSKiqr2e+6BfY3oTTLyswwFy02Jka64c8AupAiMeLlej
	SSnjSAgl07TADp6L6qlnbzggqkR0j52Q9lzsYr1IM46C/7ffFDRYr92SltyZH0Tvwo+kESxzKni
	CCI9tbQX++erwQKzY5M3W9TpLu1B3Hg1u1vWVxS3evjt79mOrnGPlY/crz/ltkV7k+zVvR3Una/
	25IrNj+R91Va7OhCuGRJrLrlG+I+Q
X-Received: by 2002:a05:620a:a0d2:20b0:93e:c12c:fbc3 with SMTP id af79cd13be357-93ec12d08b4mr1718230385a.80.1791981442204;
        Wed, 14 Oct 2026 05:37:22 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d2:20b0:93e:c12c:fbc3 with SMTP id af79cd13be357-93ec12d08b4mr1718223885a.80.1791981441505;
        Wed, 14 Oct 2026 05:37:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:44 +0200
Subject: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NZAxb9MK43O2wa2aiDj23ZEiKR9RAVihBgD6wcTqioI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dq0Zvsjdv0r+UH1RTZk+xo3PmAYIDeAPN2E
 TDZo6tkzHOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93agAKCRAFnS7L/zaE
 w4IyD/9DJPXkhz5MqqgMDev686ljyN6tBlY8ZWbnZuVhfixY62045lCO1EZ3f5jvhFWv6O1/wtC
 wvRP1Grbg9Jy9VS2elo3KN2kTRlldUnvIXU+nGDWE+FT39yTXp08BUXPVH2Iqcn7spnoIubr8rJ
 m6WN815GME9Z1m6OTuGFhBScp2oE79onUyuVtXcXp4Yrbm61wEVt6M+XV8LBmIwS71xOvkG+xjV
 Ok7Hl3ceVOft9xjqH4aP3mYHSHIDwhk35CYLsP1PhK0zsBWya6s9+CJBIrhPU0cA73aYSf6G2Na
 m7SxrQyY/kTjnd51aa4uOiYRxjgELXdtuqO51++CcGODiyVUJWeLCVkVCCoW2ZxhO01yUZMGgDl
 XNHuL8WQKOm089W9rFbE/P+zomV7KsnKVGaBuWE4EbmE7VoG9Xk2uk721EIK6V4GncGeFpDe8Pm
 AVaX+itiLOoWIl0JmcTZAaHES3cxogTpHa5CgJdKg+4ZoolwSr4EEGkQu7wsYmmFC0EPyoxdCCQ
 qflgS/tw+2p9C3/2BY1TKlfodcFroOGtgfvEvpzlvbSeK3keUmnntRKU3F1TX5QtSDhvS5IgzXc
 swJpVWtUA72bb/dUu81L7pxkqNi5tHxL6HgO46f7ap40p/+CpSHCbzScNeSNwFUQvWCQMb/bE4k
 ZdcW1bOynzELXyA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: T4mNR_5B9PsH0Rqbte4U3_ZuqhVSoWmP
X-Proofpoint-GUID: T4mNR_5B9PsH0Rqbte4U3_ZuqhVSoWmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX6+N/BG4l7d6N
 +M9xx4q0NoKFes6eXsZCiKd/xClbubfRzpiq+BxakPMApPyuyKyhhSk30LrOpns+UZt5wN3SvYq
 5dkSMFqg8UYWWW2UxW7lvljxMBCrtVsE+U0J4WgpZ1Yy0yOSImPDjY5DvTYC9hjRZEWWsVAn1QU
 WqsVI7yPUDxrV27iTng5aZCc3zQH3oEWw1n1YJ8SQYdXDbuoAtN8s2coTl4txayJt0q6k+O/13+
 eqc3R8871xefNYPld/A2eCWQt1elVq4AiPlx224aZn13fDh4A32zrdDALflsMLlW/ZV/N53FQpJ
 OHl9q48Om/y6qH6i+Rv8QHRzoOAoQ9tAh83qzzhakBkAVEQHC+RHiS6GGFhx8cWi4qmnZuHp9j4
 ZT3fz757UwAkCqZMWN+zXVGJsbCCUZX3aoQJ2kUppfKB+Fyo2pLjUVArPEK5sTpV1sX25rSiRoE
 aoSiw8JUsW4rG3D7ErQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX2FJMsDNc/Smo
 6jljOBj0053pXtEll4+rzGYg0JEZw35ONslM4NnGKFQq4sliD2tJ87OBVSHuj/e1akj7PWIw2yG
 gphSqQhItOKVv6dcGlsEtfs/7gG61t8=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf7783 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=fhsz3KazkzAS9s_vSxIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140050

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f7cc46d86591a220a183529a8f89456f9153385d..f840ba4c02df616410759f49af8dc8fa0635987d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -753,11 +748,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -794,7 +785,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3

