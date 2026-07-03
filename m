Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70DD3290C8
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107689; cv=none; b=N5Qc/C0v8YkYHyvwdKcXaFg5UfSDR2CHelgQBvNvlJPCThRkzhN0xQKrqoDINfAabNp2Edmxc+YsiiCuUPi6ezI1h5f+fyugg+aepNAYkXE4QEpfTXbTncUcuqNLZrKXOy83eWHLMuABK/KtTL8LuZuUn/ipMgNwZHA3UwUQusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107689; c=relaxed/simple;
	bh=TXNTREvaGC/jZ8A/tJSBrcPg0+JUVpdj2AGCKR3ba9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M83J6zIJqCyGTZWjk+P32RujRurwiPFdRxhib2LhetWYW0uE2SoLkrH1TQxRhXbgImSVNA9Rbnly8Ja+xZCGeWCBZ9vXEKsOozB61E965YikqnCmBt4NUf0t6d4/TAXvwLJLO/LYaMAmu/6wxEAAxVoBm4Lvr/VfVYhW+l7MtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDm5wsiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ny7mS+9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDm5wsiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ny7mS+9R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiEjP683605
	for <linux-mips@vger.kernel.org>; Fri, 3 Jul 2026 19:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iMva+1PZ1+K
	dQNeTwrqYOxfRk7+6bOU700RhvaCTUnI=; b=GDm5wsiLQ2TMvz973C+7bjcmlR+
	KGiJp336Y4oOTICwBdUWMVqI146VpcWF6oH7l76OWtFhwQr/KC5Zs9E8CvG9J7Kv
	ghE5vT6lPIQaV3lb9//L6Y16OAJRpWdlXWygrH0x16FdDhVXJ6kE44kz/Z1ZCaPJ
	hhl03lmmTzIpMfqywvxTc/MkGVPxMgdFzcQsj9e+Ow4Q19hKKQpCdYr4vstuLfN5
	nFuUJpQSD/qPK2d7c2OTxO/zefd1KvlVaVXKOCYcganHPsX8mha4UUsMTkmcYIvJ
	oWbjPlo3Oz2VXqGEBrs0OQWWevT4vm0EG6eaNXNQU4rdU4R44hcOITOVEqg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5brve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 19:41:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8894570b58so643373a12.3
        for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107687; x=1783712487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMva+1PZ1+KdQNeTwrqYOxfRk7+6bOU700RhvaCTUnI=;
        b=Ny7mS+9RnzWIxLJJ32PsSfG5kr2qeOB3BwTjDLddj6OinObsM3kVDYfg2/z2k4M5U9
         /xtPCzfaEN8pfC7zGmzlk3hCAZhcr5K9oG8SnDvmNuvncELhq1/CJnvKk6QLT5B094E8
         jnnYVXxU9zmj7GGMhXFVNH/SDRq65Dk51A20T5eVZuvjK+cCF6Uc64ye6heI4uQhYBbd
         vmKffEUXzYIG/op9lWqdpiTbUrhhtgMRqYvir8YV6RZ9tnpZNgA2pYr+VkNSef/x29v/
         smkVUpP7B8k4/gq+JIiNwknC+XlpPCmovajemHImJIczjGHa0sla09Jvbqfcn77OGzM9
         6D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107687; x=1783712487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMva+1PZ1+KdQNeTwrqYOxfRk7+6bOU700RhvaCTUnI=;
        b=Anu2RuPIUKy7Z5b+GkGlg5NAtnv2FzBOpsQc531JisxxZGu2LtTnWI7FGldyKrgYse
         0ysxKUqjYGCGRfEfCZ9aDFZH0gARaeF2iY69tc9JSAIUOErQ16QRxlxlHXA5Wn/0WEVX
         B9iGhf9kPWfuoeBdO6hhP/vOUEQwPQLQOqZYSlkH8gbPMd0DUmGc9g3gycXrMKu9hR9L
         KNBrPzjcFjaZqsTB9ijfY7SJoyvXLKbmAaUBvkiVuMQ+CR49LtwyWG3mCljdI0jMQuYZ
         PLhCma9zx2/SMGC6CGItlo0YOJ9PmFVMzDmZnnNUZ2qXARMySjIryv/KXs0JR6H8jE+Y
         fjhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4ifwesMw1GD5IxkeIGO8ztUWGn8OOou8QEP24AmnK+ao14Ab7WwaPVddYHioWFnNQJsV0dQF3bTix@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4tUWZUfRVuKhk7+ECIGeJMReQRhae6M1eHl71fS7h+WmxXDG
	7L86pC86nlA2eotLYEXEV6Ah/WEiOaWu+xC6LzBBvkghSrD5GYFsNAfvEmVgkIXPVfcUsj74ib5
	RHuZHWIb+VqexJmnDvg7T6LLnNUJeOhuFQfV0y65cIgPHv++5K2UaCqCs8+sstQlu
X-Gm-Gg: AfdE7cnGhJXnKN3UCAdWYuh7gR+uSsoz4v6gk6hV3r7xyJhVNT4g3XmsVGQwqcznVDD
	8R5W5008nZmXlbklesdgN/v06EYGy7X5/Jugg+1an1mfsT1PO0gTm6TS2GHMvg/e0ULjqNUHC9Y
	CPwKKlL1zDIqi1OQsFBX1SsOxawofQhQOoj7yHkaGvGOreTsUEh8K1+wotwByg75Q82KFI9nkk2
	tPuW2xbrIkJOWf6L19WZ9cwG++N8q6z4L106I3ZC6piNDBEvXIQ84DhgMUcejMTKPaQJL7TBtNq
	bTs89mW5ujT777DWyqzsn8couuP36QqCUrBGOSkKjAViIqAdBkeXjpvrvLYlYdzU4DoLcO5upZu
	iQEl4V48h+G9vyX7rZOEF1auJ4eRia5zU0FNwnQ==
X-Received: by 2002:a05:6a21:10e:b0:3bf:bc9a:db16 with SMTP id adf61e73a8af0-3c03e1ff210mr802314637.11.1783107686247;
        Fri, 03 Jul 2026 12:41:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:10e:b0:3bf:bc9a:db16 with SMTP id adf61e73a8af0-3c03e1ff210mr802255637.11.1783107685626;
        Fri, 03 Jul 2026 12:41:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
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
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 05/42] remoteproc: keystone: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:18 +0530
Message-ID: <20260703193855.110619-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX3AyIJah4VI8r
 /6F7fd9N8Vgd9Qk1/sO2Kxptvv3hiXYgnLmrwkTaCi5Si7RezHbjAlWf2s4+tgDBWiagvlC6ES+
 GK9J7iCSZjmaOipY0USQpebiBp5wJCg=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481067 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eZD8004roD30yaJJyL0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: fTqMSqSK9vZkaLxBawIs_CsjE4R-_7pu
X-Proofpoint-GUID: fTqMSqSK9vZkaLxBawIs_CsjE4R-_7pu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX8TajRWUnUJi0
 j8oyutcD4oxbAY474KxgQ1DANG4tkCfQR4oI5iFZbhZp0P+dDoqEJH9BZns6IztefyJIaeYNX8t
 LCg2T1iYsA/DCJmNTo6jiwCNQ2XCbGIlAFVfTT3fI/QpZHmFYeXcIMjnFIAee02+mXi+QcCuKGB
 Sm3+PGxl6v8eW+rxXeBA8jDxcuiH9cd2fdTqcPf58arEhUBIDZ+lJrXBMsOPi29kwK62pQ3Vckc
 Te+m7Q3Mp9LOe1yHhDPsd5VAND/tjK8nWjjt18EDPNEgM9k8k4C7dxNb6DVH1Ey5WyzqjKHqBw5
 VcAh0Wzs9zABc9v4fISwfm2WxDJmgwQZypgmes7XRpDts14LsMuceipSV/vRDMmYNt6KLf3kILU
 Xrv2l7/t80p8fbD2kRNasgY7BeN0BO0jmmYOD2btEO2//cypiebEe1pXMkN+MMIhcOiBk8HLc0C
 /OXhaKjYhvdb6mgBXLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030198

Replace the hand-rolled keystone_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 83763d640c4e..7834a50da209 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -330,13 +330,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
-static void keystone_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static void keystone_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -426,14 +419,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "device does not have specific CMA pool\n");
-	} else {
-		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
-		if (ret)
-			return ret;
-	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
-- 
2.53.0

