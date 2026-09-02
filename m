Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9C421F0F
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380292; cv=none; b=mkB5+LPYYZKlFKM3Xru3Nn3hRRvvXQwyh78NvmSVzyZ5xZlcPlSnYyxyJafs3WMcxNDgauXCA1LmyGqR5P8dHj4zZLq9/nMzBocZ+hTo+to9sK1LB05R3jRfyaFfiIUG1ydxI0aZhsoTDCGEUn3VAoCtVG+tF9Cv1AWldCpYjW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380292; c=relaxed/simple;
	bh=tu2KryeovncNxz0Q7S57/L3IkDxCbPfu04qaMvAxHkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9WYyLnsKqba8A7Q9rkM0uywn+Dgmt2VU4Y+TWjucaFoRXG7V9Mqt2kDPXSU7GFw4vM1M+LqBwpFQc9nIFHBNvh5ee2bxLJEOPhYeHNBPWI02OhtiECPR2eMbTZREBVbqGEXeINNYjhpyZSzleW2+72Uv/TjZAaCuWeoNWhU+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1mAbS1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYjuHIxf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1mAbS1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYjuHIxf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH9FN1962645
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1oZVnfNKBlF
	giLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=; b=j1mAbS1WwfUQzBqYP4YaGonJ+T4
	V6thqxNqjhIzlgurylVjTlfyJZSSx1MPoTQW+WhdcuCa671cADb5o4lEppbNkINg
	TtkwmDTl/CqQnuLj5+fhseH5ZAKcISvU19C3g+b+wmJossW1jTj4R/jJUU6LlSpT
	DynUEriHFzK7gm5Zf6v535ockse4QpLNoVFuzoMNfEseuW1jQbYOg4w42n6YtYtI
	qulXr/KcFR0lGSJlAv/bSjvIviKn2nbcjixPH+BTYJIjD2IoDPycDXWUY/bZcJhk
	M4Hdd6KE3FnU45yCKveXXDWsxiO+ZgXjOcw5u2VwllK623xZ0443Sk9K3fA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sru3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:18:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so19113865ad.3
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380288; x=1788985088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=;
        b=SYjuHIxf/m2jLyX7Iv7JgdJGsKC9jukXBsNkGJfamxN5ng8bT4miXJt5YvJcR4nUu8
         bUSNQQSgZjxzdlL1YQDlbL6CORIUjjmfktoZL83nEhPAPvTzvRtNm3wblbCY6MCQOKil
         wRkOygLYY6FPPOb0RhI6zNB3wo313oWhTD3t0ryWUTfWPHVfsA9cw+Y6vhkk2DzySH3E
         tz7TXHUSaMw6cFjb3Evi4qFf3FHQZQJwwCubZRWToM0cFi0bSa0TXwR8nrICEetwkn6s
         3hUInGqVaWWObO755mi1rqCcUekHXjly0p/5PtghtjImS0CI63sAWj75tl2MKIbNWxp/
         1JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380288; x=1788985088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oZVnfNKBlFgiLoC1iu2FLkuJ+ivoENKb0cGsDY70+s=;
        b=q83l8Ne4Cd5lqGQDY4aQH9zV0MRLx0jVFkHB9fmSN0WFk2ctNnOKy/Wrnq8CUUrSc6
         ILZO3eqc+OpGA5gpqT3hcke+ZOaQ5w67c19B5OWO/KfEwndHlBkLJY9V1mVJr6d1HjBv
         nnDKwP7d4EOdpG17NhnLUnt+oxho8bXYFdHZ1+l65aaIODxGcQt3Wgc4qXAyocKcUye+
         zWxUJLgoqsWGJijRvYn3J+pJSKE9Oibyl+ixHYd/lphGmbKUZ0lo0/JRF81Qwp7pqO8c
         apcSUfuEeeXrIg66abFCtbuojijc/dyN+fkfXFk6LJCkGO/teCaMHR4c0QhJt0cycDOc
         rL7A==
X-Forwarded-Encrypted: i=1; AKwUvBxsbaBwHj35tuPivohdH8B6EgfX+aKT0ObBPjc0aWZLxr0evigI0lfSVT1mMcgkKGHcupUp2md1KIqk@vger.kernel.org
X-Gm-Message-State: AFuF++n1NmomNJ1v7HcHCgFJJYPrQPGjB88mYN9voOdG8OVjCmCWZdt2
	5qwL92MRA9sMteE5UdVOPof/H2Dqvw3KtBGSzed9/3Q096SliftBoh0iPlgPtV4TjE15ygvtY8E
	9U7ELibdKlbebyO7RYdCNYZvi5/venGEG+Sxvyq1pA2CSqWVCqosUfmLTa9NZDqSH
X-Gm-Gg: AYBFou0GK8oNXg5W56T0Z65wRyorg241kRX4IrcbNBsRm2Kn9+Gcvt0mPVJwYAPlu6B
	mseqT6/IlSV90O74FarGJJp9l/k3WV/OdDI3iE32QXzOSIOOdj4PQc7U5gDO4NVFb7FPPXXmVMp
	LrVPknIRTSC7gh7X/PhIysziWm6g9yGLsahmhll36VfeHzMuvB3leWL4dmabg/DR0bw5YQgFh1+
	TQMZyzbf9q3Cj1UCwIm44rIbm8BF3+aT2T6KtJkJA2YTrkNGUHmGbO+GP1jPv8sVV7pkUYSbZw7
	W8oNPSH3i9EOxQKBFMoPc9b9tUZm3BneqxYSH4cGXYQzCKDxa5SNpaKZKLO2YSB5A4aPY4tVClu
	F5wbuWjO3YwIIT+NbY9md2aZVsWI=
X-Received: by 2002:a17:903:9cc:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2daef813b09mr84025235ad.21.1788380288474;
        Wed, 02 Sep 2026 13:18:08 -0700 (PDT)
X-Received: by 2002:a17:903:9cc:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2daef813b09mr84024465ad.21.1788380287974;
        Wed, 02 Sep 2026 13:18:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:07 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 9/11] drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:38 +0530
Message-ID: <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4LASIPSHgPCw
 dJqZOsBpL6YlBAmvtfbZLbrxzsIEx47xD4r1Xr2NFgbFFwsQCMhQWyMNGDbc2Ou6bdNQ99P/HVt
 hkbhwG69mzUZLSmTnlCaoF2nFJiJqzPHZl0gGxQNbt+RdxQ6NYR6mjREDVwfOyQfIV018KaIkVH
 zpaIhCzDYQHz/t0x+cOdecQmh/kDD977NoyAMg2wcR5YoimJUfwY8i+/36I759E6KCQi3vxcrNX
 ir7vR69uzysmuf9uK5SlqbbpYwWNyzjaehEoOHnuHap6+fEP6UCKQlmLuMxkl0CGXQHTanCM4FU
 2Y7JwKSt0O90w/3JmUqx+wQZnrbiwvRe4+LxV5FmKxdZ5G6W/ftKQqid/gfyd0OYyTCgUHDKFdw
 gR+ORVWK6W+BKegrVCgMUEbS4gS3v/1r7gCqSL+UGp9lCj31FDkNTmZs6DKeDZFw6mQJe5p6IjM
 DTI1lFym1778Ofp0qUA==
X-Proofpoint-ORIG-GUID: DquAmnwlKWglwqUsu_Q9ou017keHi4pn
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988481 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=QbF1duAvIEq2M5YqX_oA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: DquAmnwlKWglwqUsu_Q9ou017keHi4pn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX/nMiqY/tIBWK
 D9lPWS7if3lddRYZdkMpPlgsDBb2PFug7ouRnEdUoJ2oAsKGA93JW67d1Rg40osJ0NB8Tjk8r7C
 3ow8bgnYElftjGjpTLEGwkkDBIh58EU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 53ab1a2a5aaf..e93a7a299b52 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	/* Try the reserved memory. Proceed if there's none. */
-	of_reserved_mem_device_init(&pdev->dev);
+	devm_of_reserved_mem_device_init(&pdev->dev);
 
 	ret = zynqmp_dpsub_init_clocks(dpsub);
 	if (ret < 0)
@@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
 	return ret;
@@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(dpsub->apb_clk);
-	of_reserved_mem_device_release(&pdev->dev);
 
 	if (!dpsub->drm)
 		zynqmp_dpsub_release(dpsub);
-- 
2.55.0

