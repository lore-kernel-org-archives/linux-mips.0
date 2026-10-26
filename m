Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013031;
	b=TS/VPa+CDsqzwpLX9SXmctWvgjl3M7Jv9+kNpaCzId9vzKWZHIh5cvHpUjTfmpRn4w8N
	 9uBzChHbesAds9EOPUTIqqcP1fpkBYiC3yJdLhX+0Tez3Jw14BAF37tPbDaI72qHm0H4Y
	 BxgFWGhLxnsumeTrSadMH21ZGcyWii2oDCI0ZOirjvDRbS7p8R7z2YTNSLq/PHIA01+2o
	 kMI9gQXONJF6hThwdfpD74mrHkqY0r6mgyd7wYe54Lf/ivlB2jsdRazVcI20XyiDhJMgI
	 Y7eEd2yVDYdRtnEzz5cYvzKXOcg37TFeLusstWu1b/DrmyCglZ2vFOUbfVJPrvpOSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
	b=K5sgOYMxdAKXK8h/DJHBKeL01v2MaMDEs/VGvbOYzQ/yNeLdTY7yngM8LVrtUoW7lSlH
	 vKun+8dm8gHmIgmcmP/tCNvSS7l2WxBo0Zr85EUChyHSyipufByUlqPBxLa0V8ZDXjjj6
	 qvHOhYy9xKtNL7pIu1MEsSZCc47rvLruHnBTQ9+B9oWxWqzCtRD6QkD2RAVs1UkBTUpJD
	 D2B4FWNw2czgVN9Sj7BeFuu1m7RQcS2wPCxk8jCFAvnZoNe3CpDYAJ7y7khNXkPzQAmSy
	 QqIU1S2igobzQ6JU7p5o+Nx2nLR/He0SFt2ex3+kjSi9ltGsi2o+7uat8lfN5Fu+U3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hTKcX/hv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1GZ9UL0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628760A3807
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6628760A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hTKcX/hv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1GZ9UL0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2sO3632933
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=; b=hTKcX/hvAbobszuB
	YPUN9EjI8lUgXGaC8M5LNILHs8TL1bq/LJVtMRCzussCz6i0U9wHqU9G99Dspll/
	x8WMfGaAUJ+nWN1dgVbMVSKshSw86xJkj4Zu+nZ7O9ZQkUmHFJpt0V1046Lwv9MT
	PKC0YSQQXkLvGehjQeXA+e8FiYRcHYLguWQD0Vg+5TVWr+8zy6AqSUPCCZxWrdoe
	9S/cpu9OQXeZKF/06S3n/R38aAD23938C1PbH9EVO3Vg4CQ0grzV60XtgWjHpCxc
	GX8dXl/enh24KBXe8QUvPpW/P36r89+zz8lLLksRgSNP2ZSIVniDzsSJCxMCPsFj
	iJXK4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf07ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 11:10:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so719921585a.3
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2026 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013030; x=1793617830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
        b=X1GZ9UL0tPuYHBBz730abjYf8ofFhTF+/urt16Ry7ytSCvOrP+tKr63PKptXMiwsBu
         4lRnHljWh+nJPgfuh2sOn91uA2LNmRp7lB8rIiU0NVgtQENBPNuALR4anC3vq8raZ/xe
         32Wxay995hDvFzLuz+L9wdRb1LgjlbFwbIPfd6g+x5AU0gvI4Pg6zfs4sD6gXEDWHdDy
         l7si1eXDh+eWumQ/uQiloJNVH+fblZLdhxu5tK9/Yx1O4HVjRQaiAeGt7a6HZ+Y0+R7D
         Tx13vtLwamrZLV0S2Y9cbdIlt2wEPLuKtsKNCkgaep+gqK2uZvwaBe6+oYnaBj4gvbmz
         KB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013030; x=1793617830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgBVubvBrzvafXQTnrX5uUX3XOFZecFzhwSw3E4Y+cA=;
        b=Ual9gXqyEO/13meze37nwtMGip9g4BaLqzoJBMAc2ddZ7tgfTnX3YHBds6/2VlBji3
         5wYCfuoNSNaTNlvC9fIFL8czb20+O7R1LFevamn4oMRWhmzQ9owtQl3j4llCI4HZlter
         RKBeX4oSWABdvaRp6FYZGnnFCFRwRN1XWKKEGSDFTLMlQ3k4ccVTpRGy4QQfdQu6AOP4
         9DbDBPhynOqQ0tR4V23UTANJ3L01g14/U+EYd9Sq1L4iu9vpwT27X3aivayRFFJou0UB
         oT4FwbU9XLwqm961nRGNJvegU+hAzEQ3rkT/8Tb+WvC50bUM4OMSwbcZmk/ZEKgfJFSW
         Jf9A==
X-Forwarded-Encrypted: i=1; AKwUvBwlZvLANcU9qvHw1vOq4sHIq2tgVEkoYVhgcJz8OU7Uu1YmJE5LrtOovT3QTjfSjWjISD9M82u9F2hG@vger.kernel.org
X-Gm-Message-State: AFq9FYLO48eGMJDMKL4KTEnNsB77nGf3y30cKyOIx/rzVXdtR69QVhN9
	zy0rdWR/k64ohv2pVpICvcMmViGt+OEgpiIQTx6qme5bcJ0KpC0QD5abASuEowe650+IVZpSXWp
	vlHeQUkxE23tEH/Kz+UlZQLHPfMMWhuB8Du+9foqidkyJHgMHjTT0l0mw8Tk49vBM
X-Gm-Gg: AYBFou1Mzh7+C8Vw6Bu7J8QDDA5wqtbsIKnKRxV/nPLli/MHxJcs6mG9s0UH8ZSXXME
	U/MoBc91SfvRvoA01+A8RWrhlxkXI7mQ6fV3HXHV400pO1M0KoGK/oTvDfjTDOkrbaLAs8Riz6T
	pAIRCl8SbXHI75x+6ppY5iQAEX4XgfxCneXZNzSgC6WzYiSaHoviQEiYOVjYeiLkXN+Jxw5bB+R
	N6cmPkvOOejJOPpJMnk+qV+oEwBivaATRp6lBHd0o1iIL1KCZKsI/XgDiXjr8qFeYj/5OJpy77D
	MSnxjF+KjokKeiEnMEejj15ZKTDPGRQ631zGFzWq82PhK3w6OF375MQN8M1ubTHYXsnrQDIITgt
	e70N1lhExEEP1i+4Jx0rN5P7XBB/HoSPY6SMiwHWO+nuOg8HMKJr30A5Sj54CqQvLUkP3u5B1Z6
	XsJ0YMLCrvjsQh
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1045527385a.33.1793013029533;
        Mon, 26 Oct 2026 04:10:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1045514085a.33.1793013028876;
        Mon, 26 Oct 2026 04:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:54 +0200
Subject: [PATCH 05/35] drm/ingenic: use devm_drm_panel_bridge_add()
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-5-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0G8nvH2jwU/GqDia9mSTmMZmW83QA7NQZAEK4aHji8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUH2B0PTBBD/iZT/eW87recaBbgn603e/96W
 SBJrH/4oE+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BwAKCRCLPIo+Aiko
 1TlMB/9HDdJGY26OzszCnJMG+XIe/mi8sSBQe6BKmfM4Dw0zRYxgcUYli+4d3Hd6z0vkmnD6VUg
 hY8k0uPIGIIJpP+tw2mKYqi7npQmbDSd/aG+qrXxjyvMN15Hj2bBFWgP5+Pb4cEGV6LptqgIo65
 y9uTDV0sHCs/SDhG8Na8tMtdh8ITqGd4b9JqIfNe+TTXNFankh4Tiw1FmGbhsuX4UXzzM7sqfyH
 GqWf9cLMnBQt6Mc7ZHhjQo4/d9l92enY+C6SZV/H6Td099rou9ZQUCRwCmOfMhNu+JAYD9bABvS
 t/uho+3UG78+0A6eAwfm6Ygm/yasQ0BrHli33I9wzRKFpmJ5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX7Mv+zDchRiO5
 aAvwfa5YLJTk5Rz+lY/z7xZ+QfXO6lKSi9B+VCMTx/qdZZWWQzpCYMsTS4o8hnhxxb1iC5hTGJx
 VRTPwDHRMSCVmWUild8g7zgNPwZht5Q=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf3526 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nww9MsHrn8xYauqU-SgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AoShNYZaFmCWiEtTgChPcI0Do4yMqZfc
X-Proofpoint-ORIG-GUID: AoShNYZaFmCWiEtTgChPcI0Do4yMqZfc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX9Ew+dNgqHS2B
 LWV4LCcNN2Pz78CjkhyhzTA7me1f9NptCNo4u6UXZ15Vj2cb7JmHLFQQy2ESWyGE8l8KJz6L93P
 TrYFUwngNNxQbq5nIMprNCncBIF8FmefDpjc13AjqWecgaA3K6MSS8cZBpxunMpamOWv0zVQWsC
 KCiEuvRi1SVjP7230lcSaoZNvOuc0Rg4X2R6nfF+WaSk/jYvHeMZtB3Lgp1Jnr9yuQ5eC0MzydK
 CALLmJn0Jfxg9tXAkhFDzUAXFlKaNfSyQOv6yb96DzIDtuaMSq7gKdEyj/e6r/3x9RcOnwEvosT
 oNzSHiB3aC89ha+wTTe98scpG5ouEQIOSju99Z6raBCerP9vin+dIIRNu+H1cuv5vgh1TcKlMMj
 Msvyfvcd9DGReJxerpyG/tF7kkZRWdMkdE4bC48FYv6CUtateJMXEOIb1GXPbSPytf7urWE0EgH
 mYl/7r68WvtymF7FmrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..cafadcd2b765 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1298,8 +1298,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		}
 
 		if (panel) {
-			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
-								 DRM_MODE_CONNECTOR_DPI);
+			bridge = devm_drm_panel_bridge_add(dev, panel);
 			drm_panel_put(panel);
 		}
 

-- 
2.47.3

