Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EC31DF980
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380240; cv=none; b=RKfae3o/QDUEWn5dNiHLIEklHsA4drcDxn8bJocKvnfRKGmmJ/8fZy/yNeJzgdb5Q69oQQGGboLJNCnH3LdHBGh7UJXx39Kq0qCtX3+AVpdZIm6lLYhqAxP9kQ0MVkFQiEwr4URqaOjPiumkn3u0oYVh77M/QT0bTSR5Xc1SPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380240; c=relaxed/simple;
	bh=J5fU6hQOqgYnobNq0y67Kn6rZ5FR9aF1CDB13ndNBPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRwaVKFcW3SlJzjW/Y8T9TWb0pGem2JBnrzxkcpCNGQXn4q6WJ9/ra1/R4v4Z6wVhX8qBpd+2vqk7HAElisMDnOBv6MrUKf1lBvUOib6vpftWJm8rgB9uhQ/xVqSCqRRdCIj70hjFd7jwxLacrbzMSgtAqAShjsYD+NwMrdc/X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0sYz4CC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3uNsoIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0sYz4CC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3uNsoIg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH5DM2581011
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lDnpS9AG8B
	MnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=; b=a0sYz4CCAZERJ5cvQgZ067dKOaN
	q3zsMGdWtgW4siEJGM7JhH5S27ck/eEvpze57SsRdLn6TIb6EYfN4QDUd0EgoQ47
	hCyZGr6sDbJ7x0sKo2J5FjWKamDlSx8J1AfHtG13YKSYWtdxi8lr8kdNCA37Mrn7
	ffVtMIw9RXL7cpU0LXHWe8Y2v1Hng0Cw8YAniRAajGPRp4mAkHO15m2C94aUICNL
	VtHZwWDy3QkuVzs9vQCqcXewaaRtyixuRjgqgrCtOI+jCbl0UhLpkfLp1PykMbjL
	qokITfmOkJByT5TuP8bH+8444POICdhc+B1vucMlN5DsaaxXwT4RQuCrmzQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cagxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:17:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2192716a91.1
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380238; x=1788985038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=a3uNsoIgMhp/hIUK4cdVb8mOzyu0SgHCWR72k86nnCnPzjDHZp3pxhUmYCF/9dgFBs
         xUwsz1y0Pv03JLs+siJubLx68nx9inYKC3ZWTWp7pFtzwwVgnPr4okvHMNHHmdRIwqFW
         mGyEJYnT5vTXeG01rGu8WOJzjaTOefun9CNcIG/diw3AkYHcmTX+NYZ6edULmc0olWDP
         XLiodG6IKnztnW+Yy0BCLcbgKbQeLJJX0ye/tm8bbQZTWvydVlDomE3MCeaHAPjJq8YA
         wakEksiSmN7jrDR857NkXEMjMwTrG+zSyEUHfMzFIsM0MQABBkN2Hx93OHGivhK9tLAa
         OBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380238; x=1788985038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=a9JVBfqbhZ5dsBj6NHjVxLQLv3cwwsGL0RN1ADraTAvJyCfiMoM+HZiJI1CSzC2YEX
         3uTEUKvMlLmgAqN8bsyBqCvMaAKBaI7ZXAJ1qjvXbTWfDZiNnOo/fim7K/JB607E0g4Z
         qSqCc2/3qymLf87jex7ltzxjMnQ5bpHlxB4emBmPk4I1iYwx7sjtql0bIcvixpR0ZkA4
         pYmhYvSaFD8ls1z9/FJ5B7re7P18i9XYOZH/c9UrABMBG4AW/g96ol7xP1J197JRrrFk
         Ja9q3eEkPvUZN0lBM1eGtqaMiMbqzRYD+RH1kU76m56Da8dtX1nPnrZT+JCCoWmVRUNi
         W7vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmU0MzExuOOq7YOju6ukGb8xOTya0wHttP8Eb5EegQv4s0Kd1CQBPf3ADadk4C7Y5sebe6Jzn5UtBO@vger.kernel.org
X-Gm-Message-State: AFuF++mpXl8FUwkRwBZIk/zngalX/gDA5jeNG+aMjV0Om62jz4lcvfqr
	LBAJe/0cFFSBjQhB0qFYFW23sbW9qa1jR/yIDnh2wdd7LN6omm90tqhGmUhg/5G4QmVqDL97nN6
	HoZ0uoKB3UddDCFEUwwBLmUEU0KOQj0n1iT/gc4h9MQOC6cHd8z2dSVf7s/KDLo0x
X-Gm-Gg: AYBFou3vyHRI30z07ygudSqldmnWk0lrdt56Lj2GWm5fTuQdStv/CJxfvkJDUjqNJI0
	ceVrYYhDhNbjy/3VN25WtTmhs++zHA91knJw9KnDO1Olt5aJD9gKWPxBn0zZqEWFDxfuxTekHLd
	bS+9W2ubacjKJ+wKtIMfWeE03MJp6i3VjM/119BxB226f/i9+fW/zXRaHehluv+p+F5icGZoHhi
	pONcuFYd1Bgojf8xegBXWEtDRKYFwESmtVmK89uoUrWWv+lrOb4ISaOy+ure8VjiwKG8F9btXNE
	mL7PXrotSNpi/376BPR9Omgwq824++GPz0dL6CRhVXb0OIJlb1nGBfzuwZmXZUGOZgoYR5PMFq0
	uGG9QlhNC3SznxrMXl8m+tv+9tsw=
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378949a91.25.1788380237645;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378858a91.25.1788380237159;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:16 -0700 (PDT)
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
Subject: [PATCH v2 3/11] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:32 +0530
Message-ID: <20260902201640.2024648-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX+jMBmq4042SJ
 riw1Vwei8Ro9fZCs0ejSFTbR/zNpVy+HstLq869sO8cCDlM2q/puUttcKR/UtnRz8HPuIVvZtmt
 gT3TIw5auvbVTn4o6H/L00to5MfPT0I=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a98844e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=cxSrDiPXJhrM2elx99wA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: tCT1q80w5kIiXh3Kw1GEWbVAITDYM2st
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX/4XBsao9BAOH
 gUky8iBsW++mcN0GUPkqV24dSsffpLUgE8s1K4okDxcF2MU0ecaW+U+Pj9z7pchLqNoacryESac
 TO+Pj7G3IqWtZLwkAKCw7E7EMeFPw8FdTK31l2vJ+4Xm2i00wSnoJrsN77F+F9/yhGX0SL6SWfa
 5C3np02fnuiQQeuThFkpvPpJNokS1xIsZQuoMeR74EUlRi699z43YSFMihMxUufc17dHyERnHMB
 Dq3QfFAMYw+cabBYaztDHGiuAnW0jkJA80sakWSe4NEm2Ke3wA16bNbGNf0tCDEjb0lzeMzjTE9
 Mhh5XTreNWweFL1JOCPMwLV76gffyIUMBUcdhtheSMMJdz2oeOXakrD5N89psuPfGnJtCJO/cCU
 VebiQlF6LdIlmhfWdJ0Jxo84P6rl5waCZLqmQ4fmUc6nm7GURySrPY27wbIrY3gBRhIXX0w1UtJ
 nJOIj8KOcr2q407+NiQ==
X-Proofpoint-ORIG-GUID: tCT1q80w5kIiXh3Kw1GEWbVAITDYM2st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 8ec659b3c08e..a07b17261961 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -255,7 +255,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -314,7 +314,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -330,7 +329,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.55.0

