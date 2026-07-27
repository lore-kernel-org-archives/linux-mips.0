Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB842BE9E
	for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2026 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184821; cv=none; b=eRewMassX/oWbDgjiRzu22aXB0884lk0DBcSN06JSxjGGHabXnmgx+/yfA03yh+1BkX5tNAx4VQRC3OyvPeuxEJMo/606MQWulSKerKUmvTFax/RF7OvhPHTeyvxdZt/aX+/The9+VfnK+NkYJzISwnz7wHQeuLErePCPNbIw5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184821; c=relaxed/simple;
	bh=V7Xul7ooKLgvf694e5PTc4qdXeVv4+U6UnPlZb8Vfe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgdbB9OENJeKXucubNEtqWIYbhn4ZHAlverMdsFrvqYuWqPOkpceqerLuLXlKcTphJN/POctRMPTphnZqUwYuAuqf4LUEJf0afzEHrTB425iOe4t60yG57INCQZiMCu0vorduo0bRyzFwOYSEkCkrH+RL1M0P/yeyM+M/M+gZTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxV1qT2l; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxV1qT2l"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485b358552so3308948b3a.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2026 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184819; x=1785789619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpu2Ah/hFKBhqJymNutw+ExxazTLV5F3H21ckK1936g=;
        b=sxV1qT2lynQ1AkNXu5Y5U2J0wR6ARjYh334HwmWrMIw9SW9/XBYfS1pMT7j9KQXpll
         SDwLzUzu33ZH4FXwShA7uA7YjZM5wm/up9bo3vZ9eAyZ9vKE2a2Azv4jj0gUwnyB5IXY
         F/ea5/MYV6DFTdD9vYHrK3Nty2+zwcpkRegR6S685tsEOPWYlUSxn8KSzqD/+vEVjnQS
         0OYwavg2M3eN0cS90VFIIUr8v4+rFxa6kiJObIqyBcyaTp0/SabqTKvPfhfimW6tdWzT
         MSKzZglGSHevNAtdX58pFsYJb+vSU+cbs3LDhXKfY3T6reRsVQWz4oeg4bhSqai8WpUs
         KG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184819; x=1785789619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dpu2Ah/hFKBhqJymNutw+ExxazTLV5F3H21ckK1936g=;
        b=M/J7Gyjqy90IQJJ9gBKPAO5Emo0cWQO+1GM5zg4hVEq5gtlqP6ICod5ZTNyld/nCeH
         axQmKC6GcrC6zy0SAyH48uLU75TGmrBSsyqxmoDdy8z5dfJGV1tXisvw7Rw2fk9exXDX
         rIxfkU1P/WbpgFnxv8CoL/XpjwYjzXrG8+FYYvJelb28ni0S3GqcDbm6n8J0f1OlRdfu
         d3Wwe8uEDtJ74BPC2HpWH3x/tby1TEwrcgPX+jV/2a1+3UBGI00dNMlMIivSiYz356rL
         b2dwkUxWfXVqBeUWKUoeFX7TiqIs2ukJwraJ+krq3xhUqocDgmosYM96GnOpGKzXthNE
         eZbg==
X-Forwarded-Encrypted: i=1; AHgh+Rqiwf7PdnJdFwtPlKGBnyQZ3zrCTpBSmaCTqzf9RkWCmog0xpBKQjcm/AWm9kRO4DfnwAAPWhysLMVI@vger.kernel.org
X-Gm-Message-State: AOJu0YwRBSdKh7bB0PNbEaNJV5wXxBGP8hNksU1G0Fz2l3bPfypyQ3KB
	+qm9nngyVh1oqXNwhQumOY+sDB1ABjmnZ8X+z2jfO9p/ZecL6YrKqDUV
X-Gm-Gg: AR+sD12ItVsGGXQfvwc/LVPX5BNBWvBlhCy3G8tsaiI0RV8bI5hwKMtoonoeko3tpJ3
	A2H27KyZBRA+sYy0btTM9w6ZzFvY4UkUwpG+Cbd4ynbgQWG1gwO/iECK9y977g7B7wZWQyQwcQp
	0yd5j2BFHXL7Q2DSRNVPHbTMBqR6lOOCqc5oy5qBNbJHfEeQ05tUFjg0AAqQ4t8kWWLi8bHztaC
	E/sEpr5PEfsRgXa62P4K2ydOxUeHsiuvMr5MspH/BnpnbUxZz/s8eEiF95hLx+8PIMCcq1FsLoz
	d/WRhqrOPRAPAicUcTQ3kw2dpDJm48xP8LeguZ08Zn1ytIo1k0Q+srlMpd1HDAa7qr+yFO1PPox
	Gs9s/ose/rgDIot+8B9p4fA4Ih4348daiVEsfecaUiISxdfJlAuYs5i7BdK9xE5ZOdLPDDVaGkA
	TkqFkcg1+LqCwlp6I=
X-Received: by 2002:a05:6a00:9a3:b0:84c:539e:a355 with SMTP id d2e1a72fcca58-84e8d12951dmr858956b3a.74.1785184819158;
        Mon, 27 Jul 2026 13:40:19 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:18 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 42/64] dmaengine: jz4780: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:04 -0700
Message-ID: <95741599738bb33731b9a1148fa2c7045a2fbdb2.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/dma-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 6070dfdb7114..45c1096563e3 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -1019,7 +1019,7 @@ static void jz4780_dma_remove(struct platform_device *pdev)
 	free_irq(jzdma->irq, jzdma);
 
 	for (i = 0; i < jzdma->soc_data->nb_channels; i++)
-		tasklet_kill(&jzdma->chan[i].vchan.task);
+		dma_chan_kill_bh(&jzdma->chan[i].vchan.chan);
 }
 
 static const struct jz4780_dma_soc_data jz4740_dma_soc_data = {
-- 
2.43.0

