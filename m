Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742998;
	b=0YZ/10cT9Ckl5tlk9CVPw6PchbIMzREQPyd6695ONmEwraExeGhvZECuAdbG072or9iy
	 iIMT03zJcyDjJCB/bP423a4KGrPnJY3eIpMC8bs8TG0bph++U/AHpCN6MM8qPffHxeFk/
	 mwnG6i+AqF6AAGlzHMBcYAvV8qmoXBZF/ILjbmKYqvJV7rVZlBkakjQ+xSttK/4w0b4Js
	 +2QNWm4wxT/ixJdOWrGAJvZQ7wthKcrfr/II3gc5gNpru5E/vaN1wBz521v+XTSoijr5v
	 7sr5CXrtiEnNmiYBRGoSqmG2qXYp6wGsrwSZZYOgR6VUPFXVDteNih/e0vaUyWWk/9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PydVMHArz0TUuVCof4/KPrJGkSdN7KAo4OoEVIb5fy8=;
	b=R3aGc/UAbwPXRj4zNAoLT6zdsDjnH/blBzCv8B3Y6QckUXL8m9cl21eg+mA+JK/lPr6S
	 FLTtQkuLiO81k/i4KV8e7EFh9n6g+aqDntUk9v6OEZLR7zDkLoKUAnlSs23USEGfDuz30
	 jt5axfRgXsk0TVKSGb0PcjlwrBpE8Dkeau3nNwF/BEvDt9TOUtyhcLE44/r6SpesejrhF
	 x4QUocRtChNN2rNf6hM1sJ7jOmGjk5vvghcO+LOFZdoNz/XsANCDugK/ziFAhizaJBBvA
	 +3Nn+y6J3XmuUHwLP97tEfs9cIcDbVeZZLAYuqVyetHqdl8jlozg3qnbl+uw27Zspow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="kXE9su/X";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD7D606A31B
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 08:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kXE9su/X
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so4688935e9.3
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792742995; x=1793347795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PydVMHArz0TUuVCof4/KPrJGkSdN7KAo4OoEVIb5fy8=;
        b=kXE9su/XrilHaMKHCZIVTSdlDgafpj4k8kcjJWY97ikZ6FAKv8qH/jtWzp+Uv6eGiy
         G1cJGlVl6/XQpDeWDN9vHzYUzXzKM4zZlRcKCAvcz4pquWFVY2cFjMUGExIoZllY6XyH
         BVyfkcu2JSiFuSq1KcSAs5frWzt5QQRYvG4goHN4LzhTNc9YKMrbSkRBASZBwkmM7/Zx
         bvH6hk5WznqLWYmqUlW/8LBf55c6LEbGe4YHsQDRHhxhVd8vr3jI9/NTQ+XOFo7ULSNS
         PHGoCtvALIZEvKYcq6IZ7ncDbvIdmP6iJNSIM4HbWlV7ldcVXWYVZLljeItOkYCmsPux
         /hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742995; x=1793347795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PydVMHArz0TUuVCof4/KPrJGkSdN7KAo4OoEVIb5fy8=;
        b=JJoZiDun6+aU37YE6RNSrzgikdFrm/trszohe+iiNu8TgQn9+7w9zBNqR9MG/bhKqc
         32FTeXrAaSYmtARk5nrRKfpyPBAWp5TtMyvxfgwzgZZdJvkC5CvAdbkF0U9pEMQxYPAz
         sv+Gr/Ed0cj+xKFEyTT0mA4TjrWpbFv4md8SeDqUYsA8LN3O+p7UZjCSqMEgjiAevL2U
         fXgGVBkj0msJiSl1NJ29Awae4Nv60rAx2on3nA5sRqGuU1lFopTfBfqV69L3aSQhquqV
         rIXgCmkAmlpMs/K/fpBqm1nT2IZ0no8nQDkf+bdeV3012SASCNanv48v907SydST5pNK
         Q6iQ==
X-Forwarded-Encrypted: i=1; AKwUvBypEo9LKk6YJpbSYsDvJDC+j93YJyN7B3wePN8xgVc613PaF58fpS1+m6vRPL+1pHksJDNN/8NcEqSO@vger.kernel.org
X-Gm-Message-State: AFq9FYKoevm9W4XeSjk6Rg0tcfbl/Xju0KbH1gaxJjlzaMvOEzRGQ2wR
	nVtc8e+c56CGcMdR7saKHs+SiYJ/1P8MC2xHBqOHEkrFoYZKXfZMUVBUEqKwKsy8PH8=
X-Gm-Gg: AYBFou1Ilfoq+qTCq8D4eRhcrXJ/zX6nwLoYmmoSUZVcsiMqcu54BQ2JhHkVO214ygc
	NzR6CeRV2zyKirMubfbc1Uj0yDryE+tEFtBDc7YnbuuK7zwdhf9XidVURX4EmRR3CGXnjKx5kTn
	ol+jOh0/mcNyQKQR1QV0lGMgukjNQ39q/PTDbLjcO9g+k0Lyj8n8Wm+66aV4xf13VLhju6VvSef
	D/WXUXcMdqCnNBUlXq534Om02m30RCdqzDDVI8Ea6qgKTl7Fpr6u4GUQ57Rlt31JD2zzXa7YyXn
	gg2oa3UYelJYDbG4E8hSfcb24qi5E3JgPb0uOwDdh42TRXkVLjMGl35J/ynosBlj6uEsEOYTB4I
	wvrgISn4KeU5bPpWhPApq6l+Te4MwQhoozT6661ZGQr12jHG+jR7oI0n+TtNd5K+/bh/UgVjIfn
	eKvGoMN8UEoUBD+6YSMGrwa8cV+XSm+lykJYmVuAJ6ODUybVFpyRsj7TEUEXS4kJ6YCsE69ytev
	2Rxy/4fWDyk8yeFJcyQ4WgsMjNENkJNocjcd4xT8HBQhowPItNUWJHhUoZwZQuIi0rQrMCsF0Hm
	oIBte2HvFAvpxt/oFq224Lygsa/Fwr4qcg==
X-Received: by 2002:a05:600c:608c:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4a2167acd9bmr9976075e9.21.1792742995238;
        Fri, 23 Oct 2026 01:09:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2153c1b7csm18493655e9.1.2026.10.23.01.09.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:09:54 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Vinod Koul <vkoul@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: dma-jz4780: Fix NULL dereference in tx_status after terminate
Date: Fri, 23 Oct 2026 10:09:53 +0200
Message-ID: <20261023080953.16963-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jz4780_dma_terminate_all() sets jzchan->desc to NULL. The cookie of a
cyclic transfer never completes, so a later jz4780_dma_tx_status() call
with that cookie finds no descriptor on the channel's lists, takes the
else branch and reads jzchan->desc->vdesc.tx.cookie through the NULL
pointer.

The driver has always allowed this, but it only shows once something
calls tx_status() on a terminated cyclic channel, as
snd_dmaengine_pcm_sync_stop() does since commit 88e98af9f4b5 ("ALSA:
pcm_dmaengine: Don't synchronize DMA channel when DMA is paused").
Closing a playback stream then oopses:

  epc : jz4780_dma_tx_status+0x184/0x210
  Call Trace:
  [<8048e104>] jz4780_dma_tx_status+0x184/0x210
  [<805804d8>] snd_dmaengine_pcm_sync_stop+0x4c/0x94
  [<8058f068>] snd_soc_pcm_component_sync_stop+0x80/0xc0
  [<805775b8>] do_hw_free+0x20/0x6c
  [<80577650>] snd_pcm_release_substream+0x4c/0x9c
  [<805781ac>] snd_pcm_release+0x48/0x9c

Only compare the cookie with the current descriptor's when there is one.

Fixes: d894fc6046fe ("dmaengine: jz4780: add driver for the Ingenic JZ4780 DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Apologies to the stable list: two copies of this patch reached it earlier
today from test sends, with the Cc trailer still in place. Please ignore
those. This is the real submission, and it is the same patch.

Seen on an Ingenic X1600 (HiBy R1, compatible "ingenic,x1830-dma" as
fallback) on v7.3; the code is shared by all the SoCs this driver
supports. The patch is build-tested on 734bef548a96 (v7.3-7363).

 drivers/dma/dma-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 6070dfdb7114..7f827be502f1 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -658,7 +658,7 @@ static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
 		/* On the issued list, so hasn't been processed yet */
 		residue = jz4780_dma_desc_residue(jzchan,
 					to_jz4780_dma_desc(vdesc), 0);
-	} else if (cookie == jzchan->desc->vdesc.tx.cookie) {
+	} else if (jzchan->desc && cookie == jzchan->desc->vdesc.tx.cookie) {
 		residue = jz4780_dma_desc_residue(jzchan, jzchan->desc,
 					jzchan->curr_hwdesc + 1);
 	}

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

