Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126620;
	b=d2dpX3RfDcx5Anyg1f6Go5q6NwkNwZlyVdYaUsbyepTSfyKI6BvewmChjYPOM1A8mnUo
	 RnYfA6PvZDsz6BI8WDjpdRCTdoF1No1aN5YJEdccoOOG+ptrJJZ4jaB68IRl5864nS9MV
	 3otMpKxm/Wpplv4bofvn9E0PJ9v3xgllOkzapqKGZwAVD6iPE5JNJtczbx2ankzO8ktwU
	 9mRBDBaP5ByK+u2Vlm0YzJIgAyMrANQ13I6b9Lr/93r8A9Gc6U3htRrR0XzL4BVGDmuQm
	 4473+znxvZkxLpE1MVA2fks7b8gyYMDwXym14pYdfeIuu8kHkv+OXrBR1/bX85LlZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
	b=F5i3e83qk+OzvNjLlzhifWaB64BV9/w0jIzgBiX3yDjjb8lc5RTubuxejL2rMDA74enn
	 7f77UvV7D80zwQItmBkHFSSzd7PjBK2RZJ4K4AFGZTSZgEloJC6htz6Z+eBLU5Gz/cDCw
	 cOPLugxzOTAqjwP4INgkk3xMHfdUwPp+P1+bt+72/4dpmAK2++nfSTnv4d/vhPbJks8aq
	 Er0gNEI8/jzG3MjQiFtXDeN8pxVR3HlYVVdA7kUOLg9c+SSpRmyhrgcDfGO3wZxxeqybu
	 JxOSwAd4XnQ5zmebluTwATjBEzvpsrkWx7uTu8I39SSAFd+WaMvJR1Kp5DrIw8mJsBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD27606A331
	for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 18:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD27606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-854b6e2e41fso76857a34.3
        for <linux-mips@vger.kernel.org>; Tue, 27 Oct 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126619; x=1793731419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=oD4jcY1ckBrn+CHRQVBS4t7Gqd7I3QR1HDTTSxzsfsCSxcWeyJQThuiiRWuYZ4Fge4
         6hldgR44OA9FSOV+KLpiLU3F2F3r7GcerlTxGQaozu+0P3YB2/AmtvR8xJEd+SRU0er1
         NJ/F0wbZrHse2TmHLy3S6Su/JuOGAC6+zvDSOw2aemAmXLMvc3Qe3MjzfgTS3e292ybr
         nG8k9a2OtoVVGLohrW1vZWMs8k5ud+6L9TuhyQtsfPZtcEBPgAlPONovF3UV2vk9dkLY
         Eph1ZHn3cV2DKozFt5a76nNT6OiqerhHlwyPTU35ZgNydHsTDEnNHtAiHwDG/5d1acGP
         cD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126619; x=1793731419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=0ANAbrATRvECOff5lBTnvo/vCPWBEuuEMVcBkadBJQ80CYZfEeZBevzAYkxnFVPzGa
         O5RewLQSwN3SCcQEgNJQxR4t/Ao9IGDuBFKPNBHV9uJUDuXHD15nI2eG1OJKMacv68ih
         MLGvRKZgBD+fcbykIDehoEPoVs+aZc/5BdD7xAdm7liGgl9bYFj97ws2WiBjA8OAgOYx
         NIZSOODi+ReLhNQc7/+isYiHQ+BKEMf9QxKtNpye85ip9ouZQ0wsHuMOJKy/zjxkWCiH
         //qGDlBWf6qG4myPu4/Bpwyv4M+Ra5TevXlJWgNzppnTaVpOuHBiSWdiFNlBIaveUJ72
         hT5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTBkylW4S4LTu/Jri+DBZaL9WeLuh9aef8uC3FO75JaVq+Q3VbfOTY2ymGv7MW7ED3cnqZiOp2PjLN@vger.kernel.org
X-Gm-Message-State: AFq9FYJQoCYbI+JpbqiYPn6gKvCqnCgDIMs3IdDmUvE/P2r7ycLBtCz4
	GsgvhuWgHRqXHfvwTzq+E+y9KS2E9BS7DfgJrIZxFTR6APDtQn0qWmzx
X-Gm-Gg: AYBFou3IIy97hEwZs91Z8N5PkMC6TsxQWNfTKAHRExJEYMM94TtBIsD6Wze8R+SKD6p
	xyP5yczToZAPZDt/aZmhwdhhu0hcb3YCdVlVdWHEdtgWS1MGzhuZqjhlcH7LijT6Av9qq/r9gGV
	jIoUSMSO7wxTwtc3mnN3ZPXri71xi2Xrz3bUhvMO64FceWKsAn5KDXmt8M2Nzd5RMWZ/OxrurOc
	mkJIe7M+iNImoeLqO/QfkRBVrD0010nQi5xOVzuQFG5zneTajS5vwVV1MlkGgRRTPrArWtxue0r
	nb+NX7ZQnrZPkDIfjHNXF62txL2ffvNFHIPB9lYGnzNGxYuAh0SP5kbG9vAkBtPFIKsuOwiSst2
	7roPN9kYMt7uba7WpDy42eFRG+9unQW+Rc2z/NyJTN0T0r6it6QhXnmcSXydGlIdbbvwizZ4HsB
	4N/lH+tEP/sZ38sQP2C8Em873FxjQhWjqkcIdQe1CWKMuoM7QjVKuhWDqaah/0Qds5UuRzbdd+A
	qzoxhgVdvHDiQYIm2ki73v30jn53ia0Qm0ub7xAl7pPZ5FyuY08JZUYMQHpvcmV2MlTrbURsdrW
	7Hhm0f51ERjnTVvFIff24s1BSqJFWc3CfrKO8yld9IIrewzDFVUXT+NIm68ZcJHZ9xCyaGoCPyL
	J/IMY1rSL+HOJuUAUPo/rnkdOkmPSvjGMVM/thB+GQaXd6YNewJSgrV17YdnczwP14gk8307bxA
	xUUS8=
X-Received: by 2002:a05:6830:230f:b0:814:57a9:4243 with SMTP id 46e09a7af769-85abdb098e0mr329067a34.17.1793126618937;
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 12:22:27 -0600
Subject: [PATCH v3 2/2] dmaengine: mediatek: uart: synchronize completion
 callbacks
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
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
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

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Use vchan_dma_synchronize() as the UART APDMA device_synchronize callback
so clients can wait for completion callbacks before reusing callback
state or freeing DMA buffers. Keep the callback wait separate from
device_terminate_all so it can run without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

-- 
2.53.0

