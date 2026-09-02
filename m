Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0C377561
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380250; cv=none; b=tbfnGppi0vDbeqZXLzY681tKKgZ4fuv6H+5Q05h6j+RkAKJbCPi5xNmpP7e6rv90pGvnR8fTjSD/l9eVjwFxywkdQQ17GM8r5MTIVTBCL1hgjNJz8IkG0do1ymUeYzTJaJ6BeX9f6qC2PAlJlzaQFNLjKtvuK04pjW1Q2lbgHRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380250; c=relaxed/simple;
	bh=Nox2+Biob1IFc4ylb+sWvoF3fbrjOJ6ecXJO1gYItxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPJhyIvUDJLvFl1MqvOcc0Xb9CtrUIWu3pkH30wZtjRI78VDqDfbdIAvvs/FB/LClm6cGRhJLORLZf6zHNSFhynpag4Q39pfCSAhcWaGiJAq52Ty7wz51pJA67G5VPprJwYtSDCgx7pC8Nt1qgbv2xpMTfxvEDkQPXdnlg1JMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHASjO9n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlD/NoED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHASjO9n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlD/NoED"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHKwl2797345
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+W6tpccLyWv
	9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=; b=cHASjO9nJpDVndRqPqR+0ZBZe5y
	S5gqMEV2gnPj4s3n6BEV7NXgRHhdxo2t0J8shBsPe84l25uRRQorpCDeYPC6YnSC
	OKft0Zbq2yoHiHs58iPdkdcmhbsRlnMhwhCK6oxRoW38JR/QJC+pBGyumeR96CuL
	eKNmh88z2yaKScZqwLyJ4LQFBMLCggSJLOZjPef0vdX5LM0qiJrez8p52ZABeQ4m
	fH9g0Es37j/K5/wBfk5+csMuAx+ftxFpWvhK3647Iizdm4lZLTNWKEtdJr3OxbGA
	ohXjXcbEau00q26eI9i2SFV5O3n3QlU5c+RrvTAgZrmy0HdwOiQpjGX4dmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9q9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:17:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so2009418a91.2
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380247; x=1788985047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=QlD/NoED12bFQw1rYxaTntiURZTPTkFqCxT5w+Eiy9N6knklV/lreTcq6Zv9t+ziQC
         LNtrYAsIC2C6/roNRuSSzFdQqOwdEt8vhVTaAyF8D1GIyzx2C+0+SRVHqv/4iACoDJWi
         CWw42WBKURIcPN9NcW4RhjQa9a/3dWxa490rOkeffCx17nqiJ7F4NFHiZ4DuwRRkqJF3
         IgMMLALR3FtjaO5HCWFHMcF1RfplGS0sJo/5V03iJnpFhFSsbacZPJGwKUId28edhhM/
         8Oseo5N/fZXlS7/0O6Cyy8Pi7/+eycTFRUGP2A7VAePtgy+p1feSXQ7MUPCzfn2nUfcM
         WnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380247; x=1788985047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W6tpccLyWv9ClYrckcY6BlDCEvf2HSTQJWRxk+QBXg=;
        b=Th7MV2zHHHmfFHIxDcCfBrZgKTbzgsujl3EJJfWFPra2x7X7/MMxF9xSrwJgDSiQb4
         qHW/w3Odf6Bb786X3cyoZ4sLpZHFGSRyVzagrvs+Qm/GzuhWE00fTdd7uFUNNoc7KLAS
         826kaL6OU4hR1Yut4iICAH27E8OhX3DWe+kZuaeSy8mIrra17DttVhTKzp2gKVmMAPHe
         LPPEU1BtbXat5T+e+p1uC9x1cp+OJ8k8cM5dH+JhdqFQQcmt2Bwm8pr7t7QKXmUMUWzk
         1hYc5PgCbmjcGrw2BL8CizcvYTjmdlNBAIZMIsDaKprUKuAq/8zQwpW56sYoOFQM//e/
         s9qA==
X-Forwarded-Encrypted: i=1; AKwUvBwK3gIomLlB293gNZ7vGWACPhts343aOXoB9lqaA96EHUg0aXItMJVqMLRAbYha7zdlNdMgqwBjIzyj@vger.kernel.org
X-Gm-Message-State: AFuF++lEMsqP4T+G6YjBWug0GAt1Hm0PKDLF++BVPpgkR9VmAGbMxhuE
	dtR91+3vGD+BxJTcCk3Yf8EvsP4DccT3vZtjslWrzGzGV71wufXLNJwHiYR6dWncWlxvKy5I6R2
	51u0mWB+bI4Cqp8y8sF9RCgrtl6W6PdUkHOBuZRaZqcnacs6BZUiCFgRVzKqLBlml
X-Gm-Gg: AYBFou2UQ4Y5NvTrl14U1S/GCw9cUm7gAPmbgeWDndyU5b3t2mz5QpCg8w8Sh9aZyl2
	JSMoXmatMfTNOX59y8TyUdnqKPFkrM5844h4xoaH0/ucqKW2r2vW6lbjrDWPtatav7bhqUsxfDO
	2/v0MbEFH6qr0MVJ3VvM0VuBW3UjI+YqvAQ8Mg/dLs4Jkd5FjF/LPT7vb/1nnoYqAJgDM7qkrOL
	gUWQ2n87cXtcjo9vet3UwJqWiS9HldPxm23GLppb9l0RSuH58VFA+Mtdv3/YeMLFOy34YamXNap
	7EEM9dDbx48ubwQP82CVNzm4Cldf5KsJkNjA5WmY71mzkWKz89hNbgEAHxs3iLUuVCIkXcvl7Mv
	Q4hXg7LDYYKJW61C8/9J1FjFOPP0=
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465801a91.5.1788380246183;
        Wed, 02 Sep 2026 13:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr11465704a91.5.1788380245604;
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/11] drm: komeda: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:33 +0530
Message-ID: <20260902201640.2024648-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mMDwCSGhI-QubBRyLxDApQYbyosbF94w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX1btSFSozxhcu
 vVpSgmgqtscXiWCi6utfkVEeXJUGd6ySysuxuz7tOQF/I3yl81U6AtoCcejeOsOUVIFUYHWuLbH
 Zo5mqBzCryZ1LEB0+7GhtYIFQUwxPLe8hxWlndqbWkOMOdwM2tIQLEFLm71hWd+OzOeT+h3VIe3
 nzbe7dATGQAOyW6rm+xq2jpGBU4Qhom0SuWTKrIFTEL5A70xoBivaR4iwNr6/eHnJfdSKgqh19v
 ylCcl5L9P7xSKL1O2x4w9hWFYtx2g0dNJ2YqHsRPEYG/OAVupZfyESHHPom9PLpTqA4kaNPesG/
 K4GHTQZ3ADYdbrx/U0kn38RQHXkZ451bamlGtDCbfND3jdRNE1mvX5PapA8Gv7Bsp0ETLg5n1Ev
 n+BnoMaZ0difW1f1kwhRHI0y4/JzMCGY9/AaHTKQ1fNzcTT8CKzy0Ed+NvR/OrsXrmfc3Okd8aS
 piycSaeYu3Coa4296/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXz3882O0Lnw0N
 VKZxv4WiPKWVekjWnu+RUzbmxbyZUiUh8iTpHwG+fALNKdS0FDRNXrmWICDiqSwrgtdHFb7fhCB
 LGKBkaoLgqLrHaHnP89ltmnuQxnvWWg=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988457 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=8sfNmL5Et35J21XlSqYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: mMDwCSGhI-QubBRyLxDApQYbyosbF94w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 9aad1d1d28ec..8016f5a68cba 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -145,7 +145,7 @@ static int komeda_parse_dt(struct device *dev, struct komeda_dev *mdev)
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -292,8 +292,6 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	mdev->n_pipelines = 0;
 
-	of_reserved_mem_device_release(dev);
-
 	if (funcs && funcs->cleanup)
 		funcs->cleanup(mdev);
 
-- 
2.55.0

