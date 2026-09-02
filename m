Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77F4A5C56
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380309; cv=none; b=GBm9eMki61aIAgy81vy0Cu1UIQrr8UvMAlUBhjJ2xA85X2EI8tL89HN6V8CJYgla9ICenW6jE7QFl9+f+Qcghx0Hz7yVzsYxhZPMU3V6foz9dvfaZoi+hOKnj5aIBesl55oJs/si1kbPuqLuBWUITbYwsqvHyHsr93Xry84r40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380309; c=relaxed/simple;
	bh=vCwMOyKhSya1QsNSc8kio0O3YCBUNVMjPg5E/k/BEuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0+a/EnuE/u2zrQBG4EExhZnZJaoctJs3WOujq/IfIV9Jv6uj2TdwaRmAIZIn3YFoyFf2B8DvADOB+hSMHdXKyz+KiPv5rlLfRTBX7jRkmtLXy2Z7VERl1pZpWO95GEf2hEx6YsApkEoawdw4SjS/mx65gfX5RqVeZzIIJfQSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5T54Ehs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITxHFcqx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5T54Ehs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITxHFcqx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHTH71963489
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nQGNtigd/fh
	Qj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=; b=n5T54EhsFCac0SeU5D97p7M0YyQ
	OQP1d0SiagH2QmIaJgTg0EzJqAasz7GbSsSPgUw2R5IJKN5KyjDdv+DO0Rik54jE
	Bw2ZYVdQ/cPd0iB5Rya3x6gJSo0zOOi5xs+R2+lI1ZraYlDfpII2Kju77CMQhqq1
	kK2P51HgZ7pos/Fkkp4EMGCSK6kQA/B3WSACwICogt3xvn0rRFQCCjtomCESoywQ
	hdJHu110huHjIB6qTqqapo0sKyxDfgmizZ5IWbyX/yMQ0sY/FvNGJGoNx8oXqqAr
	mXJHiTmzb2USb616HCS79zAQNlYwqyhwmVHKR2UWQd2CiF/orhDCnJuwgcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4srv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:18:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7151120d6so23330435ad.3
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380305; x=1788985105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=;
        b=ITxHFcqxMt+nxUbtuIhyBzYwrf82BfahXl82oY9LVDd3Ki0kV3e9jGdAxHrRizkzKv
         t+9UdsZhJoMSpu5GFfvzeHQtFYAxhvbz67v4mFCoOahL+DwQx7YTGRPOzdlUE9vrnOzG
         8VIAW5QOB8rhsXhNblrEWlSMNdIsG7RSOZAB59y6D5DZcsdlaRQyZLeUYQ5hvfeXiyF5
         c230pkgo09YlVX89dfLfCvIHH8j4EQFn1xIxQ6/rISOBICAjYz6Zz8RQCJa+d8wT6UAR
         X31Ji2ZD2vz2rcF3rdjG8yKMLYLRv5xbaYV4xM8Kt/vFHXrMIm3ttBv7a0j864HeFaH2
         aAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380305; x=1788985105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQGNtigd/fhQj8k99E1cXDjPd48Xc/BcsE7CCfKWZIU=;
        b=fv15EQ6BPOpqdGBDi2hAnDyyrjAoJ+WP6rqvkPMY4OAigttly7qMLcyWmsJiX0gExd
         TsXLVuha3nmGGo2MbO0Bq4u7zd0PFfA6X0SgW7eRHUksujImG8DpoOyCcx31zXPnP3UA
         TDaLGkXEH8TdNlRVRxRiFws9VwFNGD5ICgHAK5swan4KmIba3Nh+fgNIBwwpPgsjDQWH
         B4uE2JICjlkxFvBx/6EIPxdGOMTOtz/N//iUDHeDWs38jym07c5T7fZupPU0FVLlXkTk
         Awa5PKmrMCVrwWChemnqLDPwSsaTWM6/z6x5aN2Z43+ksDeZm9+KXlYkpfN2FcCYtAsd
         f9hA==
X-Forwarded-Encrypted: i=1; AKwUvBzeYmP+A0eAZgHOmeD5l3hVFh8kJif5meSOtcUglvxMT3pFQF4/mjt6GYhu59+QTOkcAXTZaloqWwmx@vger.kernel.org
X-Gm-Message-State: AFuF++nu5Cg/3F5UfFqDq/wr2ne5h5HHN/ws/AWmGgzwPdWF3dYHU+I0
	Tzg1y4OxL3+kGXDZP8rMIJspn0NPth1z3Ccj2Vn7Jt0k2J1ouETJjkv+nzEk4zXmLCjv6EQOZxa
	jA1tz/1IUcbTdMrOkIoiqs7JUDA+/RqEpqEAYHviynAfmHs2PzR+CyIk7toWWyAL8
X-Gm-Gg: AYBFou2TILgtKooSVN9gTRgTtXwtroxPq+ODvWz3xsh88ECzabUqNj5bCJ/kw3DP0/z
	9HD3t8gPFi5IPzpYxxiyBWffO3JKDFJAnP88gg5Xmq9JiODZD0YO61702PBcLrt1BPaQpoGIWJX
	HpqQf0SLnf6D0D3R7GfoRSU6bRFcZjz3/xNnM+K/1cmBElXekgg114MHEf1xOWlWoYz7Gbkcf5Z
	DC3+fYnB0A8C2iiC4bmu7Ot1J/IyvbdwNBcezyNrjyboRkrK4xsKLjQywIxrLeMxZKTdhghHn+z
	HiRl+rUfJXqnzNBIKNB9U+N2hEFHjwCngivt53pdG8ezCVW18xuK54Q7S6Bjjj8R/Xc4gvlTfTa
	lyDZUQ6fd6aVRItTIfpz6MQTZ+n0=
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr78475515ad.7.1788380305419;
        Wed, 02 Sep 2026 13:18:25 -0700 (PDT)
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr78474985ad.7.1788380304847;
        Wed, 02 Sep 2026 13:18:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:24 -0700 (PDT)
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
Subject: [PATCH v2 11/11] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:40 +0530
Message-ID: <20260902201640.2024648-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5W36K+kryTNm
 yj55MO9LMQ86EjjQOuSaWTCg6AV7CFMLvmKY6Y4bsD0iM/gI4HV8T4i6LscIzh0UcNliPjMCx8X
 5oaUO3ERZVJVwCNKJwY8kpIkVDhvEivYF365kq8lXegXUm5RST1DwQmwODarD7VmKZQhf5SH9L7
 cIpZidnrQSlhI+Z6fpSW3aU563gG318MSzbEySPL+po/cPtyzlbd7JEmbUD+ungshSFlLAd97o1
 MBYqOFeh8b2v09/mu0wA/lpZjSqt+sMdLPf6K+1t/mXg+99nJgQ0juCaGn+og5poK5ObUF3TuNR
 UJYJTD6rQvBNGCvpn2NYg8OlChvbdQuqV41Q32HAVRU5UXV8berWpC1igsy3kokagZLg2u9vGQQ
 drdJC6nA7PN63Cixrxh7214GGW9fN2qCvmZV0K7vwt9OEPzpUXBVifQQaWrEQ3992VWlGWxy8+P
 HBkoHc2acFf60fiNesQ==
X-Proofpoint-ORIG-GUID: wBCIW6TSc6E3Tjn6iqAT8qvNiulM_ZI4
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a988492 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: wBCIW6TSc6E3Tjn6iqAT8qvNiulM_ZI4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX6yxSCBZA4OsZ
 a1//1s5OnYqI2FFBocNX9kjwv4sGmTXHD89RTh15GGP2GJlLBn8nynIQ2LJtygNYV1Mj50dcApr
 153fg53ce/LtZ1yH1MO6FWCGVAYb63c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.55.0

