Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9275336DA14
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380224; cv=none; b=Ll9PhRRZIMPfBKAinDIAIPM3Mnjibb7rjZBKfn3n+RMt4EvCWGYNO3Da2c2D4YZ9a4A5o+Oh3cJbqdE6o9+ujgm8XEJ10x+pAekngrnqtfPrmr5XgUTK9aWDvQ59hprhcdV98tXqbsJi+VrTTNw2jVkrIDrlShUsSLkWfXkaFh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380224; c=relaxed/simple;
	bh=cHMxNGmj/98vRoQHbpOwRpNqylCQwBoL0GeUiGdn0BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTOyPjGNW91Y7TB/mGXICACQRWAzyd5+bc/FH8I+SLYlccMTEUQF+VF0ptJUNlMqHba00BXJp00Lt0PZped+Rd4OB0kxaIzmTxHMRZxI/ANlZwQ5tnwTDnoPpxB4ZZ7Dg2SoP5rnz6SgowOk29D/+/nJRKZ1bTnNMYQxAS2N4d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvbVC+q9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qo/FwYg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvbVC+q9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qo/FwYg9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr35M1714452
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AzXtSV/WWty
	dTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=; b=CvbVC+q9kQRRtFSCnNcyzsAX5tj
	yTWXuwhhl+7w/PCwuugp+uPc+vbrzE7anfZtzqn3uf46kLo72QjQf86fmd1F4AHh
	YZz5UIP4/Sl0EbR391MOBU/DWnz+wNtMd2+J6UiEf06DeZJ9UcSFFesMDBHrLTuo
	nyo+CJtNOEw4++m2/oAxc2OmlDoocqY5bhZkHlq6VkXFFqQrcYA3RFW8MxWkdwy5
	u4Daiw3zhz6A0Wd1VQbtsPS+efAub9dHQaYctpfIgSP8G4jPWB0Umbn3Ul2wHZvW
	Cnp59SwGnFPZwPQ09iNce1ycNwr4B7tBac3ES/O25zXm9HWjJ9tn9m4Zt7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce9ww5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:17:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so2192386a91.1
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380221; x=1788985021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzXtSV/WWtydTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=;
        b=Qo/FwYg9bQUk0sfCwhBLMfqhhgj5SO8gYChaJlfm5Ye4ka28plmA3TgLB0EiNhRvGa
         eAJfhFXfe2bLHWSc/cqkygObEUHsFPh0VcuZyOj4unssgEp9bbTn24TDo42DQxFwzEir
         FwPqifWz+3aQ/AfAlOl8D3n34KuHFi1bGItTFtWKXjmJbidvztjf7YDD25vwd1WVroqv
         dMa4B6PcWkiuxYiIwhhOnvm4YlmYl9PI1d0sA0qfBoj920jVfjUMYj9QNJ2kf2s0GYGx
         ahHT4HnqblBKC892Vc9yLeffN2jBHk1+aFuEVh/RPGOv0/6CsUyn6Pxc8wV6Q5d1jlBf
         fgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380221; x=1788985021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzXtSV/WWtydTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=;
        b=nNvWar/Bzrdalbudnha4OVG6XYOGZsHHVuppRRwmFwOW0XhuKp7aGZlv3lKN2TNCir
         2fFFEx/WxUkY812HFxoK79pc9+r3EMCVY6suYhbww8KKKDUbHYlt6yGpnT48EIyD/of/
         mtq2Ft6eYJaGc9MrAqiKRhvYeRlrEWdK7pfWk/27DVA1lUHGLHv7kJ9P5k7fCuIIX9CN
         VL2s2jIjpWJCSSgDEmMRjLLcbQsRzXOKSR0dKNtBvtUxwGqSa3zfijLyZAealejTKMC3
         UTIjssd0pa6Eu8O0FwSwGTC++oWqOZwG0NbH0ZdDX4GnxQG3ZJv7CLTpw/73+wCF7lz7
         jRxg==
X-Forwarded-Encrypted: i=1; AKwUvBxO9WiOSCPtU+X/l+3Grj22KLkhfKsg5Vsh+iMXBImipNVuY3tulmA0il3T0Xqwy1O6XpMZCC01TdX8@vger.kernel.org
X-Gm-Message-State: AFuF++ntkRvRBYJOXweaozWF83zwlU5Z6CN++RDVbpmn6XsszSA85SF5
	YU5c8vq46waLTDIJEkT3Gml2vcIJskOQL3Nt3+KxLgCfvKu5j+0tyX/2Djk6ng2NBqwZ26S0CSW
	thscsYnTtSi/1jeKMOtdBV2sx8maUdu0T9k4EE4EBI+4s13wb7TRbfoBlQ+qY8R/E
X-Gm-Gg: AYBFou34fqnWDttphIqqx57mfYQ+3R9DjLUdvDn1+VwFPUoYdI435lrEhn6noZt7jUf
	phvhpYE4anrhe0lBh+CpNIfEsLHNUxPRSDlGlUBqSzySDlzZ4nwKZoFhrnCvqsSP98ulDByG1eu
	DVd4sv35tebjGZLlo36qY8MZAVxBFQziOIVpeCICphN+PXiQr55TGD6UJbymON1hv/tRzj2rr8N
	7A39Pf9i9i5n9yBB1i7NvQV8dT8fK+Yu85Lei31vk81AqFGCVQvL4ajcAlWoMLPeOfewvg3YK4B
	JdW6qGEGSKWv9Nktn5Tvna6+zIFqJLD095qa9AG13RBrSTA3lFkq8EWeNrq71G2AkDy1yf4bgMb
	qBcNhcu143bAc+6+3BmaklNEJdqU=
X-Received: by 2002:a17:90b:3907:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39aee066e04mr8860759a91.14.1788380220865;
        Wed, 02 Sep 2026 13:17:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3907:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39aee066e04mr8860691a91.14.1788380220414;
        Wed, 02 Sep 2026 13:17:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:59 -0700 (PDT)
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
Subject: [PATCH v2 1/11] drm: logicvc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:30 +0530
Message-ID: <20260902201640.2024648-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXz1+xqSI2qQs7
 cuviC+QYNgjLrnXpC4Btoe0dp7I5xJPGpiZ8mJATgQVqjCwvxc0Qz+ggAwAFGs0UIrmACpzCzAG
 doVkC/ew+FYY1XQb7tcpP2vEKFRANmzk+e8vnxU++IK+mlfPkygPUes4QdtuT8tt9ZzHI9TDrIm
 a/micWZAmX4en1y8hK1u9O4TSi0oTRpjFacYLgphVKgOlC/qLcANYDMvjU59SJ7FhI6X1+UVQjC
 IxhnDwkX4vos8mPqtKrUxechZOxQbyMud9ANYqrzRcC/GW8LI6f8NmCdoKFa0lhzmE2kGKBSYNR
 6ANSEYGcjZNfclTlV9/83+FpNtf8tPc7iz6rc7wWaxbajV2KODTTSqWoKERznVImfuc8RtioAKj
 9dqTUnNYFjpFFmBxLlzLm/fmhd6YQGhH9S64X+x8iWO79SjSvTmJfXufJ/sk76rlKHs5HeMCwo5
 7uNSqYTB0uF/PIRPIQw==
X-Proofpoint-ORIG-GUID: nc8BLL5qvxYhpnQv39JFKvVdDMqB2Xqb
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a98843d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ReI0EElcLHst8dYcsfAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: nc8BLL5qvxYhpnQv39JFKvVdDMqB2Xqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXy7Q49JI8PxMU
 msbgAwbPfDB6V1ki+Ec57R1UV5cqYXkxZh99ikx8faY4J5uABj/qk7Eag1dIKcKJEN3GsyHxQdf
 9kAN2I4/1x0ZXd72VBnYJ9cRRGECI1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Replace all error paths that jumped to error_reserved_mem: with
error_early: since the manual cleanup label is no longer needed, and
remove the explicit of_reserved_mem_device_release() call in the remove
function.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..d6dbe52ff0a9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Failed to init memory region\n");
 		goto error_early;
@@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		ret = of_address_to_resource(of_node, 0, &res);
 		if (ret) {
 			dev_err(dev, "Failed to get resource from address\n");
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		base = devm_ioremap_resource(dev, &res);
 		if (IS_ERR(base)) {
 			dev_err(dev, "Failed to map I/O base\n");
 			ret = PTR_ERR(base);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		logicvc_drm_regmap_config.max_register = resource_size(&res) -
@@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "Failed to create regmap for I/O\n");
 			ret = PTR_ERR(regmap);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
 				     struct logicvc_drm, drm_dev);
 	if (IS_ERR(logicvc)) {
 		ret = PTR_ERR(logicvc);
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	platform_set_drvdata(pdev, logicvc);
@@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	caps = logicvc_drm_caps_match(logicvc);
 	if (!caps) {
 		ret = -EINVAL;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc->caps = caps;
@@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	ret = logicvc_clocks_prepare(logicvc);
 	if (ret) {
 		drm_err(drm_dev, "Failed to prepare clocks\n");
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
@@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 error_clocks:
 	logicvc_clocks_unprepare(logicvc);
 
-error_reserved_mem:
-	of_reserved_mem_device_release(dev);
-
 error_early:
 	return ret;
 }
@@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static void logicvc_drm_shutdown(struct platform_device *pdev)
-- 
2.55.0

