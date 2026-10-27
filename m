Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126617;
	b=N/M7unX15LQj7hwrkXSwYzNr/ZSMDJbNN9cOpOFMNR5Og9aHGlw4nzx7J5ZlfmquMVsc
	 2meChsVs2/5gMkJq4Wl5dcoAmq3xW6xbHW8ivtksIKsVnjfFd9C2KaQOjU/jtev446Nab
	 gJwQMUO42e54kHu6oMulAWt++zCQcRlAfV/OB0unJws3MHx51PBQlraMegswSax6bBoUa
	 /zX9Dbgtx/FJbI8oXanYtxPwi3YW48lBRgPAUlBRocN97xxKAyGHh9cFmhhwubChH2S6g
	 XuI1cMvkPvN8E4miGjWs9A0R7sLiAt+Z4t85fdb2bpLllQ2mFo3bAicNnXDqzHiNuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
	b=LR+FDaBSSDkxSjfHM4pux2N195JEtJ7JEsnMT9ZKwTM956yLbU8DF+jVXbRJhYX8eF8y
	 k4HR29Ip7jxWpjB6ovwMnbV+WyDbJJ9j9bVVRiAZkOkpouhomNsOgDAWXc+05kemCHmS8
	 66v4kj7ch3/XBqGQYPgI9Mr6aF1t+WhE487+2zS2AuYIjchvVsc/uJqGsqrKIOUJ7rRFU
	 3/UQTRJK7wud1o/mJRcP4odNmxqMuSBF1vAmNu/8ayTQYZqV/SkUaVN+R36I73weQEl1z
	 y36xpz5kS5qEvwSxx083AUyMLiwmDrsQymc7Be3ATd0+fGozeAe6dl7RROfHL6IChmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEzEdYSR;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB15A606A31E
	for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 18:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB15A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEzEdYSR
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843b6f8e2c7so222604a34.1
        for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126616; x=1793731416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=nEzEdYSRqizAr6UfE1w1r7/oF4eXh3fRPB5gthej+S7YpcqWPtHfHENZUmJfaOJ4CY
         sa+cFlKqcS5FUvSFB8M0PsrjJ1FQCC2YVksNH1IPCSq8jH1lYx4YXiQJ4AJIEDcCmfON
         Fv/lGfOCe+HI3wqusDJ9Dc/NFXvYexgUYGy1whARxiB6Lh6t/ln+GO4ukWS59ZghUo6c
         fZZO5gnFL7XagqPJHgHbN7S6xZYjBZxV7rzRUcDkXOt1WwnvoiclcDvWz9xL8Ld01Nre
         YO8mNIIeLh9B+s0RzzZbG3PNLdZvLzkADrseTPhTas/rtJLZ/DzMXaFzqHyUwH+F1OSP
         X5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126616; x=1793731416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=XTTPIxBLznjtN+mmwiJLu/gma93StrcRgFLF9uzTAp5H7k90mFAZhYM1tjCzYhRaJT
         F2TGlVdj8u58cIuAOJvJ077boNX+qxC1LbFBFCewOYyKxi4Gy0OP5aWiPIPD+1BMOIHv
         bCaCm9zFyV6olfwiXri85Hty0FIeEzQOGlr8sXNBpPG+tVkHwUWgMRV5IIKy/UbRFQAT
         PqlbUKJtj24hNiEt0pVRe7DC4ViUl5DnliywalxkyzL/UDJUc7aoIWv96Khu/RgMJ3n9
         2fNLBR69xpCp2mc4RZxFHKKtoglT6wzzKJFQiTzamQ96VkFJ7ErhqGwulFWuXm8pR3+p
         1aWg==
X-Forwarded-Encrypted: i=1; AKwUvBzcRsg7AlkfsrJHk8t3TVWK+ylTTLDsJl8ILyA0LtT0V28U/jBber2lbE57C0Zp+4ODWgfVLD366Fuw@vger.kernel.org
X-Gm-Message-State: AFq9FYLuAuPFj9D44TMZPAzaSCnhNCbIEhQikSkYOS1W2874l96387BR
	eumwOI9Esom+F4qhr+w2b84myhIZMySZ96eXkKFR5WEPA9JHOefhnoCy
X-Gm-Gg: AYBFou04LylqLOSLG97OAWqRnpnEt6tVlhgZ+zIvoKihEMdw0+3pXvScUWecX2Q+Ubb
	ReBFSrU4nJJ55NvQpiWPnH5SM13MczS4owlBdY5jhAKUWaDF2v78ODJYXPCh5adizFSQZq6iMbd
	anFGA/1vJ/D+Zf322ogwDWz5ePWvI/VtuYbOmya6fNtpLAl+UqYLelAY0sBLW53LAO/j0ohvOba
	qpQxwTDdsUgrlH8QaQD1ZvSOuAl5LmnuAFZbjJC0QbYVyXCU3/PV+pFCItvzCN1s7RaqYTFOMsP
	pqbpYWqzhjCiUIe898EKTzNd0+1OLGtesbtEzugOccO3tkCE3KHVR6H3idSUwzs3yOZIpWZymNi
	LLyAKegS/rAfTVedRdP3M5QdL0ZqY15jNYyJIuuEyH8A/zzJLAUlO5OD+GGhDlJgpT0rOww78V/
	wIlkTalwgar4I1L829fcQYVx2iQBus2vXWoeaypH5GdLWgO0nPsDAjzErGIS/xjdvdKwlpDcxCG
	VZOsvbwPdtihb0fDMGQo2BcwUcoaTIlKG7EPXHPjeeAUvh4TKTjcOprSijpoSbBUjvTz6niyymp
	pg+R/fofw5ku30KlGt/n8mkeRa1QdSM4xtGOx+237CpwEXKhAHRQRuTV7vDJwWS5wb1Ki2Hw12I
	+f0Sigcy3bt67pQbfhSbUTL2KOwORE5yydS+O3tb3a5/DgTQCcyvzxuoiJ5poPXVhYkqLyEu1FO
	+z/Ltg
X-Received: by 2002:a05:6830:2b2a:b0:829:9992:20e7 with SMTP id 46e09a7af769-85ab88cd029mr404051a34.30.1793126615647;
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: share virt-dma synchronization and use
 it for UART APDMA
Date: Tue, 27 Oct 2026 12:22:25 -0600
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTRLCIAwF4Ks4rI0WWm3HlfdwXFAIbVSoA7Tjz
 /Tugm5c6vJlki/vyQJ6wsB2iyfzOFGgwaVQLhdM9dJ1CKRTZqIQW14IDmFsLUWw8Qyj9BG0lRD
 uTvV+cPRAmDjwTaOasijbTV2xBF09Grq9nxyOn5yUE6qY5bzRyoDQepmYPEomuo4crj93aaOnE
 Ad/f/eceJb+qpRbQWXqmjfKoKn4vrOSLis1WJYrTeKbFD+RIpFGSzQFCtR6+03O8/wC5PmkD1s
 BAAA=
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Provide a virt-dma synchronization helper with the DMAengine callback
signature and use it in drivers whose synchronization callbacks only
convert the channel and call vchan_synchronize().

Use the shared callback for MediaTek UART APDMA so clients can wait for
completion callbacks before reusing callback state or freeing DMA
buffers. The shared helper and existing-driver conversions form the
preparatory patch, followed by the UART APDMA fix.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v3:
- Split the shared helper and existing-driver conversions into a separate
  preparatory patch, leaving the UART APDMA callback assignment in the
  second patch, as requested by Frank Li [1].
- Replace 26 equivalent driver-local synchronization wrappers with the
  shared helper in the preparatory patch.
- Link to v2: https://patch.msgid.link/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
[1] https://lore.kernel.org/r/auDOqLln9_ra__hY@lizhi-Precision-Tower-5810/

---
James Hilliard (2):
      dmaengine: virt-dma: share the DMAengine synchronization callback
      dmaengine: mediatek: uart: synchronize completion callbacks

 drivers/dma/amba-pl08x.c                       | 11 ++---------
 drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
 drivers/dma/arm-dma350.c                       |  9 +--------
 drivers/dma/bcm2835-dma.c                      |  9 +--------
 drivers/dma/dma-axi-dmac.c                     |  9 +--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
 drivers/dma/fsl-edma-main.c                    |  9 +--------
 drivers/dma/fsl-qdma.c                         |  9 +--------
 drivers/dma/hisi_dma.c                         |  9 +--------
 drivers/dma/hsu/hsu.c                          |  9 +--------
 drivers/dma/idma64.c                           |  9 +--------
 drivers/dma/img-mdc-dma.c                      |  9 +--------
 drivers/dma/k3dma.c                            |  9 +--------
 drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
 drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
 drivers/dma/mediatek/mtk-uart-apdma.c          |  1 +
 drivers/dma/milbeaut-hdmac.c                   |  7 +------
 drivers/dma/milbeaut-xdmac.c                   |  7 +------
 drivers/dma/stm32/stm32-dma.c                  |  9 +--------
 drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
 drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
 drivers/dma/tegra210-adma.c                    |  9 +--------
 drivers/dma/ti/edma.c                          | 11 ++---------
 drivers/dma/ti/omap-dma.c                      |  9 +--------
 drivers/dma/uniphier-mdmac.c                   |  7 +------
 drivers/dma/uniphier-xdmac.c                   |  7 +------
 drivers/dma/virt-dma.h                         | 15 +++++++++++++++
 28 files changed, 44 insertions(+), 205 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

