Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67205581F8
	for <linux-mips@vger.kernel.org>; Tue,  8 Sep 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879497; cv=none; b=UEgkDqGniVw1K6ad2Jbl8CEeX/ZU4kcXm38xTGQGeVQerbKsXU7gdn/a6mb567H5MHD88RWknUZFhelJngOXWYTUZMX2xeleclq2ezb7iZvziT1O8/KNCriBY5N8TL4vnIdNw9g4hNzlNcpIYfwlk3QEGDH2NH/IbCiM35ZmiS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879497; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nr/vJJYLuR3hA3MAqa3ktgt6ltZkkxZIJisxK+rWiZ7a+AIHlzKCpkb4WGHRh9zqNGQ2N1sA6mI6Gb0HLg4cctXOJ0nkrWwlkSuerm7UdL/26DtdxnpqdeMoA8aPrYCm0CIHvESyJdLWyrmjW518/j8jq9miRapiwYuaOHJoldQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx0KeTIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2wVT0Ax; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx0KeTIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2wVT0Ax"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej9cn2770954
	for <linux-mips@vger.kernel.org>; Tue, 8 Sep 2026 14:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=Tx0KeTIt0AOxpg1Z
	EI3PzlCzkOxqx31uyixTbn5VZ2vcGP/cfKpWNggL11BX4NRpgK3vbuttK23ugi0P
	NyK6aVgGqPjJ7NsQboVYsOnhrRYuQ1NHtARXej7cmss8eLdezFM46FUs0+MjtPBk
	lq/RBD/byupgRAGykXT1bysneTIruSD7pLgaDdp0jviV5s1VXXxlknoh8jV946TY
	tG+Zyz/RU7xT3FuZZxbsCksFjbU32dy8LKZZDMV4Ek3RI/bbB7BPAOX2hEq8ErGK
	l0vmqKSFncRg9gCyJfhC5UlNZY/RrgviL65EDkjGaKQCGCXOdIRwzsTu4HMv+zr+
	mFiP2Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuj6kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 08 Sep 2026 14:58:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738b76cfe03so3801070137.2
        for <linux-mips@vger.kernel.org>; Tue, 08 Sep 2026 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879481; x=1789484281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=O2wVT0AxwK0CTVqFXMDURnYvs5NfpdquQRC0YtIgapBRL5uCYZuN5jcabI/oArvffx
         hgCgiJRDjuZ1ajOqAiNcpLdNhpxzbqmKTnp1chjaPeAh6R3GbNYLsYtLRBH5Qv7iq9HM
         7KCGPI+ZpSvwJwDC7ut45xS5Iiyb/c4Aq/jzGhZ9C3TGZxsU/nryc6v4zlAO99UFqZes
         /pF0L5ENdRFkWl7dDaebT3dHvDM+xLfkPLyzQ3MFsrAIkSWGuKoiJqOXpKEeycpbDykb
         w/1wi7z+92s/dMmMPQAmsNlwKQFc5bMrjTE4sLPCrnayBghfT72BXK2YnTOeIimzDqsU
         79mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879481; x=1789484281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=CHdo96DEWx/ooixYA1/Yr4NuMyO0CkA4+i+R0j2BEexQ9r+MgyUDGbBL3xMYqFnwNv
         WcMM39/aal6PVADZqzIkzsizYD4eCt8F0OM6dRXw6susj1jM5lLcZFh1Rr3r2bmrEvCs
         oi154alCx9B1jlCHNW/di3QSRb468S3pBeFSqLBwkpjx1mBmPuUZF6fVo1cWExvHBaQx
         8DLlntGHpM318YOGwb7A+IHsQ8LmuJZUSa8XQ5CpiMnOZ12g+JsAODK4ENS74+gd0TCJ
         zVqvTL2xwBkdS6dgAkkKuNvj6HpUiTBXnqbfpffQnamyJRr+3+pnH6cTOb4HA3JcoC0p
         NVyw==
X-Forwarded-Encrypted: i=1; AKwUvBwM/46VTmoOgGGGKUOjX7tBS22cEuJhoIDOhUoxdA2wVQWrJpTE2ze6Naoa5OPm4CD3XvMrNTQ2BS4O@vger.kernel.org
X-Gm-Message-State: AFuF++lq+XYLxoT8W5A/st8WeZg1i6Id62ZQ0hJEhD7t584s5BmGMsP+
	daJZ7RmjHl8LZ0/mlXTR+Z5nzukjBrpJoDprQK+eR/d97mDjEPxyHk954uRIq+itMQtvPqT8XXK
	ypxunpEN5LZGY/wErU++OauoLDmJHtV66+htD2XGfMjtPtFD73VHsOC8dpo502JMbC236w/q7
X-Gm-Gg: AYBFou3QTx0+veMWwGErZAZSeigBqOD0zuAnT3GnL9VnLVpg1LXy55o8LoWApzbaFd7
	3xMcJAvKuBqGoUaSfU+B38xnf3itb/0b4ybC5Km/eWtlCdrjn3pidSWN6XBBApAGm3Ej7JRBGlf
	0wMn9U+HutAen5bhZyn/CjMk1RrrkLRHVHljKuQQNozujyczlJLG5z8JRwj1C1Hb+msLHMx3ljq
	vH4a5L88459jl7XbEt9qcUcJiaTpTsQmPQHfgOGG3DGvTwUOTV0weqxbCuNkVMYxfXfpLBTbVQz
	D2D7LWSwb8sjCKrdouJBo5fRfJklkf/rw0yKfSBnF82uzwwwP6LX0QWyHdkPCl6O/nRUdDjlMVe
	XUmnFxEppTx8paeetlpnmR38b0Fro
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id ada2fe7eead31-78a4a918bdfmr12691817137.3.1788879481299;
        Tue, 08 Sep 2026 07:58:01 -0700 (PDT)
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id ada2fe7eead31-78a4a918bdfmr12691786137.3.1788879480827;
        Tue, 08 Sep 2026 07:58:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:57:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:21 +0200
Subject: [PATCH net-next v14 02/10] dt-bindings: phy: document the serdes
 PHY on sa8255p
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-2-ec212b747a7d@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJnajTItqWRiT6SMc37O+jx/iYaFaHW4w2Xx
 saScv6vyGKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiZwAKCRAFnS7L/zaE
 w++tD/0fr2YRZr6C7h4q6iPVWjh2HNSX4GV9MKYWKIYBmYFejDYaJEFc4h98X4UjI5Rw1vfad+B
 /EYWEucAMPhKHZQqcKRsmq9VqmbfcIFXrFVI8rRRuHhLp0IWaXYIIeSecT7Uu2Lbj1tDFgUII95
 juhVAMKcY2pDV4SasZOyYAKEBo49uQrVuTG74OWjZ/F0bPqy+RzfXqcnavEpTBzq/DKS0KYKsvh
 FeOll87EJdwRuJmIgANys9iKZRuag6wHKvdzv+6cJnSE2TrRlL5waOQAyiQ/Z6t6YUF/gQVJXX+
 iQZRwGUMtY7eJdwLS8X/2MZF8gMzIYh9Lct/RKik0ZNiHpTc7mc+Vs3kwj96kscXCK12u2XXMIF
 9ueQLpXb3y/gm8jDFwekh+uZ0j5ZUnUnKsDLZxuF0iVNjQFbZuJPf81dcBV4f14ddUdOpBKz8qv
 2EaOTsJ/6GqT/YBtlLSJKA74dZtPs4DDosX6jcqJ9Ujrn8+gJnhOFp5Jq32nMVYe1Qx9BKaliPM
 X8fJX1IUax5vBGTEiueUd0MyoDwfm5Ps5zAFCVrhgD9Pi06qFACTxu5z4+WIl0YDKnY0NaqjX0a
 LEYtyDlUEFpDHJUuaR5ridtl4gfyUa+f0oQOCFnR0C27C4ixRpilc3ub3jVoBu5XUvvy1Iw3DJS
 1Is5ebpQSqIVC/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa0227a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: PIYxtkyCHeq5b__08fokfAZE6jO_0BWZ
X-Proofpoint-ORIG-GUID: PIYxtkyCHeq5b__08fokfAZE6jO_0BWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX2IYyMAaBHzvD
 uxlFP7wrMSg/S2O/580dz6FOIJsX9so3PpKZ2vN5tbQHw4qTDhCPUMSmYBO7P2onRW8aDgvS0UT
 VP3luTnVNhyhYOWIDsGAND7YuOYe17Ja4CxKwWyTVvIfdEi6SpJH1RnRvCw9Xeg9TWZo9wd9JZM
 5zh9WJn89s/KeCUfsaNWj8WdnsE2Jmuk761MyTD8UGoSLay1+iOda5CAcMbBdvx1QLbZ5m1H1oF
 8G0DnaDBz2B3mhKXoscIT/J4cnxukgRI6zETC1+h4AlFQVbgiT/7vVoq9OVgDuQ/vLAcr/BEZdO
 /OwKkB2L9X4Xg+lnlFPIA2ArPq/tO4VXiD41FsNhITjalF4qyeqeEDrJqZrPPh2iA8rPDsvJqo6
 D+Ihvk+4Q2qRBvUx2BQdRv+lp9PoQDeFj5ozaJM2WqLHgYZ55Uv+O49emgykd4HkYz9qX8uz3Fv
 s4YKfAazjf9zQVgUUKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX5HnGnN/Mrfpw
 mfBDxZtT6yRdYV1I2cU0PZx6PsMI++t/UfJO0pUF2SmHcFG5Cw7Q8mCDcmewZKNRTgp7CrzkN+G
 nFDu0SgpH5RIhH4/Dlv3+1f/dXm20Gc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

