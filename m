Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D538377561
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380216; cv=none; b=CfpFiKxdx+oxNfnExazZHECfQWXqEIzBXWRYSacUKlBLT+TVpmnwM8zf/1h/DJ7MsPenMHRFogZWnRsLXP9WhJhMvMPnP7WcfzXuuOSBMts6WgERQUio3x1JHpSUzRJHWJr6f7cUlRB7xkevpOCPEMWZ01s7NG0lztd88eWie7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380216; c=relaxed/simple;
	bh=5hzLQzPg3Siq2sAjeVrPq1UVjrMV+4INkOiCvhmskWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTEXT/NAcWarx/etvgG6/pi3hxBgrk+/dy8aZoi+FBcp0MyjDxazC8geyQrDENEtOX4eX6HwyuM8TgxRAw6jRP4S273AtlBhIJQdNic8LnE9gGHYGzXI26wg1kB20pM/9Z9wNUcLhZHzMBZjR6RP24GvrmNS54XMzf3CbxvUrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPo3DI7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GC1Imw8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPo3DI7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GC1Imw8u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqsg31650590
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohah
	T+j6al9s=; b=WPo3DI7A9bAW4tlVrg0bqu4V+styJyUGUWS5W2JZCHN1MQPiTEi
	B/GveQ3mT/MrXBHqngiJvivPBht8vzfcWMVEe4SKqmIWxL6trNRvOAqeBCQxa9Cr
	CWxC7O6PRXcoIuZHFmx9f3HHaBfZ14Fm6UC9YMn3bMaA2GNvqkFiKTdYJzVrn8z0
	hJOGd1ybUsWB3nmQ5aLfFb0YTMEd1iqn7U0jVHt4/SGXznL8v5A7BR7nOU0B/Gyh
	gwvi2r+y7o9EnlAP8R003zg6xp9/l3tKssS7AOrIDul135GXM5UYereiVFD5t9Xu
	q6VoVNFAk528wRFtBLUFlQ4ltt5gNafAp0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4srnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:16:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so2556484a91.3
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380212; x=1788985012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=GC1Imw8u+6QmBoKKJIF/uRpuS5oqHjNvfDNEEhXqVzIIqjQjtq2pDXzT6RdX9akwvR
         cw6Xo1z7Ds/4ahgXk/3fo3stGSgJzeT0KC9dmPMsw5Y2OIGUcNlLjoFapCGvCbu2Md2v
         xDkhQcL2jfXEAn2K5sG6p3Wn9s2RslahMWcu1ASUuRK27xo9ArXHpPRG1SDOt5Iu2M2L
         hNLyZrHYx2AuK4XsATgLpLtia2xlfp1X1OsUYKZW25FlhZx1qOpoPndPzpzn2rj/qNSw
         gwoV3TPw25V0BN2lW995W/pAWO0BnWoiMT1lG69xMasc7wAGmjXrWzA6PH5fs9lDXUKN
         lVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380212; x=1788985012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=PZPBUiQTuoQm9FY9vmm+pht/NZXrtZX3wCZLb73aSdWpGd64vHcVqFVgdGSUP1GgjZ
         0olSacsLVWPZCRFw77bP+Q6wSiUMezWq5Ke1VouIWQ2jrKzd9JQT+eTLn782ksU3Hfnh
         o6OI4cQPM5beB8pyylMuEslst4kMJRP+dGN+3OKpE7A6igcO4LQJWZn0nJVK2iJ0cW/n
         g6tsvzghyR5KFUUmsq7+THguUlizi2Xmy5/d8mORVDZvSQqw8x4q2hh1fmU2MylYs+OQ
         KpmeyfTdspSjfDYIxtM/9IfyZLOPbG4S8EfZOxnBftNDRQKmlYPxP7ROsmf3CjnTUeaF
         Xy0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVRSeipZ/T+JTP15bWPnG7mFsKLaQHF/uMtKCFEUnLzGI485kTPkHKeiiulbr4d0nl9NwuOGOhz4Ti@vger.kernel.org
X-Gm-Message-State: AFuF++k11je4+4UeByaVorw6G6XOJvDbFX29qScn1bu5J9tHsCylnJfK
	2RAmpSa7GfOGkBNWGhZOCkmvY/Dst3//OyjHfKmI+LRD/70vzGI9cxaF8hZCZp4vMvCEyNtepDV
	OXstdIHNXZF4sj6Mb8QyOuzPf+FMOGBsrtZFFWnbR6bMUw+Sxn9rL3MeWAP+h33tW
X-Gm-Gg: AYBFou07bPk7h+r/0y0tZ/C1ntfvAIik0QEU2iW2jJVlSwu+XmC300toUUc4wdftkRt
	v2Xl2r36duK5tDbKEgOIwloKiS/10ioeyj4r376QDPH2zB5F85Y2MquwXZ2P5IOPmP0KWzBn+gY
	9soib5zQxprjWEle0Uyz7sBgU2Ve5moUYjin+kSVs1P+puPdg/d1ewbmBbRitsWXKnM6/1UmD0T
	Atqvi6eeO+RgQXbhyAahwVDx60/7DQsg59EMia1Q425p5YjfgkV8A6UqBFnoreNpIauK2B1+1Vp
	GkAVTTJfuNxcRMYm+OJMy932Mek5ApEn6V+F8VOS0zNXDGq0gIlVcw3SmH+8W05tYRze1E5ns3A
	nDz1SdTVjZ6z/LfCfin8Y/Y7TimM=
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11956063a91.1.1788380212414;
        Wed, 02 Sep 2026 13:16:52 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11955961a91.1.1788380211806;
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
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
Subject: [PATCH v2 0/11] drm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:29 +0530
Message-ID: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX9sUpD5gc2KAd
 ND6PUlSy6hTheL1IG+gbO2WrW9rGx2wB/fX0avGcdL+HmKvCtC5GA92epOkBmGRAR06tHzoiQ+i
 0JP7OEsOsjwWpetAT/C7LKKQGy6lP18eCUSlPRZ8tNHjDaxuaBEZOREHHsxU0E++kdtHHi0BH4k
 Ohwr3IWAoVntJAoTYmwPxZzgkRwP+eYLbrua4FN0w+VVwChJNv2P+WKJqFszir2m+mg0rJT/GE2
 48awVyj1Uvyrfd0YdxLruKebRd36Rx0jPk5q27BK/4Cw/LaBdV4+V6VanaEzcC9HIN9870XDtuB
 LkRf4poI+gZ4FNwfgZ1SLQhlu0R6kL+XAMpDUw+ATMgf1DB2Eo+cC0zM3rD8hMrqq5nM+a+CFVJ
 fPOATS9VBvTzWdabc3dulr+Zb1o+KvwOq1XmCDwxtiycK6KS5ZBuWw8vew/7YcMruEPuPnD+2ha
 SaHJLLtn09ZgGceUkVQ==
X-Proofpoint-ORIG-GUID: QgonyzseJk20YqCic-gfvlVpJAfLOJKD
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988435 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nZq82LKI3H6k8voUjgcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: QgonyzseJk20YqCic-gfvlVpJAfLOJKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX2IA/KISNPltb
 O8LdoL8cZ0iYueEwdqk6wZq/LGaFbmTprmTCTON88gSoH+abd+0EtFoMZqyyNJJ5v56Hqbd9qPD
 +X75bzLRAUwp0Jq+CrYHqf67nnB9JSo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Several DRM drivers manually manage reserved memory lifetime by pairing
of_reserved_mem_device_init() with an explicit of_reserved_mem_device_release()
in the remove or unbind path. Missing the release on any error path between
the two calls leaks the region for the lifetime of the driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
DRM drivers to use it.

Note for drivers using the component framework (hdlcd, malidp, sun4i): the
previous code called of_reserved_mem_device_release() explicitly in the
component unbind callback. After conversion, the release happens at device
removal (devm teardown) rather than at component unbind. For standard CMA
or system heap reserved memory, this is benign. Drivers relying on custom
rmem->ops with meaningful release-time side effects may need to retain an
explicit release in unbind; those cases are not known to exist for the
drivers converted here.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (11):
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()

 drivers/gpu/drm/logicvc/logicvc_drm.c             | 21 ++++++++-------------
 drivers/gpu/drm/arm/hdlcd_drv.c                   |  6 +-----
 drivers/gpu/drm/pl111/pl111_drv.c                 |  4 +---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +---
 drivers/gpu/drm/arm/malidp_drv.c                  |  4 +---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         | 13 +------------
 drivers/gpu/drm/kmb/kmb_drv.c                     | 12 ++----------
 drivers/gpu/drm/sun4i/sun4i_drv.c                 |  4 +---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c               |  4 +---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                     |  2 +-
 11 files changed, 14 insertions(+), 76 deletions(-)

--
2.34.1
