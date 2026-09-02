Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455A4AC173
	for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380301; cv=none; b=NXMD6wxguDlp3Vi4tajOvxwj2wsW1doH0V80zFtyvT1fbUdhqHbLO/r2JXUwbPhFSF0cg8/6l+X5EoCsXTim3yBpvsEZ0LKhsmDLEu/pqsowZtjw3vJBgAbFEDZofUHRonkJqKxdp91sQlehl88wbf1lxRkz/057UpSfq+P48+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380301; c=relaxed/simple;
	bh=rCMWHNOA5HoO5RmOOcczDfLSmfIqCDDHYRNI56qgYo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtwlhN43flQBOIE7XGKkfIZ8xL9E9bKurlKHPUiuAB49ZjWXrh61Sy40BA0FNcw8psjHNfIByJQxn//MmKPlRYXgP1YAau3nrJI9jtj3Aofpy6neSDiObN0ogz2uOMezQgcUD6CmOsUPhS37T9sxvtJHKkftoD/hWUqf3KIVH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4/xxysH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ig4gmjhI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4/xxysH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ig4gmjhI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHCWb2796917
	for <linux-mips@vger.kernel.org>; Wed, 2 Sep 2026 20:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c6HQDZCYEIM
	syPfEAWg93U0OzA1bvoHTLf63dEO3qvM=; b=D4/xxysHu6h5JqhAcumyeOuS3B8
	W8HHU0fAh48XcC6p1FWpCc2Nbh86TBNshywT7oaRRWlnNNGj16e5t8MJkIl0qkg3
	QlE0KLApseLXQGMF/TkpZph7x6/qwS3VGBhQ1yQaaay0gsb5lbWSfZKY5MwXlzPO
	SWK+FZWTmf61Vr2egMo37bFGQmD2M08uWW4WJWts/XSXmNiEpoWQj29wYB3AnRMG
	oerW2EcPR842lQMgQNkheGBnvx4wVE9HKfFPSaEy2lHtx4dN+TadUgisT0+mDKZf
	MpZfNS0m23xfe+zQsYROXrYO9VBk7cxQv3AEwOItzm7SU2pEAXWFA+pi+RA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9qhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 20:18:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2198567a91.2
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2026 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380297; x=1788985097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=;
        b=Ig4gmjhIBtsQ185vn+NbsY+xXSiuIf3+WmT+2nkRkJnSUjPQYstGpoBu9Vs2645Djc
         DHP6zATOdDkAgn61c+H6M/aetiFz/4sVw+y0x/Ezw26ltm0QZHp2iRSggZ0viazYVq3i
         gisT8g4Fnf+2GWxWLFYawRsPmYEj1doBY1s82TTI3fsNFCVgl2ZOKvhqyHbLQAt9OaN6
         aHn5ynfEqVi8Slx2AEnrerx5BG/o8X6zEjI9Li/am4zQE6zcjbuBUp/to0UqosDw2g31
         i46j+bNK0rwuOXkJwjIq82pAM0jDx39O8xoBhsdssnUB3cdWLN5LMCbbMHsVlm4ikC9m
         5EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380297; x=1788985097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6HQDZCYEIMsyPfEAWg93U0OzA1bvoHTLf63dEO3qvM=;
        b=P8H7aGixFAA74Wd2N+/5h8BPhZYp/6U4/szQzlJoK0OeFqDa/cA01SHhoFz8eKCVZ5
         tetHAM4ro6g2pcSMKqfqHaFpcvRb77SjOpcLuPkzya9ne6vEA1wEWUOc+MlXuRNwh2o8
         725J3G3EsA52ApTox678lDGems4DIzG/OluS4IiAO06ed92EYI6h9iGmnXm7KEdS+kBK
         sBRYp+N1g+erLhn/qsnwwtwOpwKcvOKKBNB34emfrhnwloaB2W2kE/2AFV6Gh/txqzLC
         0HRfmKwslRT1TUg0euHV9VK0fRIZ9FA1N+Wiw9JcijfPXIuaFMOUXi4j6SaJJu1siAId
         LOLg==
X-Forwarded-Encrypted: i=1; AKwUvBxywEkARl6zUQQBX2Z+c9q8l1BfnXSc8jlP8T4RYzOpsMYcth+l3arjZnOMue6IVWDeNYC5xONffT0I@vger.kernel.org
X-Gm-Message-State: AFuF++l/a8JSpO24eVRCLetPZ4yyiYshDcOARn9yiQp3BfEjZmTVTnT/
	YbWMBllHid4hq4ot0qk6uzvqMhwgJc6wrqtvR1Bbf3wZE7bKBcK8V9z3gbmHHfynnQCrukPxzGQ
	YOSKbagW/ZS5BtCeWmT1HiPc0t+7dLIQtktv13mBcIuin3/Lh9/osYwlhkfHhOJVN
X-Gm-Gg: AYBFou2bCVzckGZfWS62CWL6j3/dLRNatN7ap7ODcq3HoeLQB/muDvxoEX9J4CZHIMR
	rwxnVV1Y6Xx38PcmoQpJaDskb1f0fBNQecZUAFHhfQGFvMIuV7zaiJxB69Eq1R3yh6yvFCt41VI
	0nOJQJQEuI7EwEdTkq1eftz/KJ46xrHlCVBNIMumEeaRTr7dodXACW8/6XVmgC6v15SOpjOYA3c
	a859OtoCPBX/HocOS1min24TDkcSbowuheTyUSLtmGK9kWNoBkL0hxsIf9cTEOLn7poL1kL5cun
	L510DqzWZkd2xOPJ2Kwj9mgR5T+yAE3ekwaUk3zFyfxp0M1yVHjaFaG855OMJn/nHu0VFZoiHTD
	c5/TnCCKln+HW3uMMWRgfVBpw7MY=
X-Received: by 2002:a17:90b:33c4:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39aee178de8mr9152923a91.21.1788380296962;
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
X-Received: by 2002:a17:90b:33c4:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39aee178de8mr9152869a91.21.1788380296440;
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:18:16 -0700 (PDT)
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
Subject: [PATCH v2 10/11] drm: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:39 +0530
Message-ID: <20260902201640.2024648-11-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2spJXgpRvsPQX_SAokzkS_nNjMM9JNAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX23IDOId52elp
 9VZxBDoFGrFolGnokqyrCoBTjfTpqQ+bjIfz+2qIa1Dp/OXSPuyTKxqn2+EPJPp78C3BAaoUMuZ
 wRwOM/YSSltaz9QyP+G2uqjPj3Djwwfs6biVbNhyK7p2RGhsHKhhXuMv8Hai3Jg1+TKX/OuVrDG
 vm0xY8/rCbLAGyitlZzhTZXM/+ShbkyS80IvpwrGSvvRAc/pRnXchEMcP8AorOtHsYXwbU/FeXA
 oj2cOgWzBxnIaQyaHJNRYIi030AAv2D2q3zBFDQHhkVfkck4U2Hms/UGihM20w3noVxeux8vWjb
 rPjbRJVkknBlKZpbjGK8zkcgeMV6w2f7zIGbdktH8OwgrMsm7trU61GAABAC+UKC/fbWJOjEuWq
 xuF+Cqxw2aG4sPKx90XsoU+00HusDf3QMQZZ16qg7Y63F2sRjiW5nEjRcRI51UNmYHEZGTb1yTC
 3wjXW2+B5ILe+CmpRgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX9hFZdPU9KuJm
 pJWrabrlemc9DQ4EBljfV6zyIkt7oGVDQGfNiVzLWsEX1glyjtEnr+xE/4aZSmddFfNvaUfXXvT
 UFulW5Z8RXRf3FsH7EpebeoZz1TCJsQ=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98848a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 2spJXgpRvsPQX_SAokzkS_nNjMM9JNAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a1f0..2c7e54fc35d9 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -168,7 +168,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 		}
 	}
 
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"failed to initialize reserved mem: %d\n", ret);
-- 
2.55.0

