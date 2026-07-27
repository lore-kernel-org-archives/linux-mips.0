Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE924314BC
	for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2026 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184837; cv=none; b=aVKXnbEFABdzn1lDAsQPkMk5lmmVGzsXxF9CsSRgEG2LXMnQ6qfVnlqFK7cIb593OBkhv53WG/2l+zj8rM3lZk/ZWDYl8JXx9PsvwUSYHpNeJSno668xlAhpCX23t441PUSfI9urQMm8INvJxmrsBtR0DHuM42wXiG90urjn080=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184837; c=relaxed/simple;
	bh=N8WuSkHIr8cpGRFmrHSddr/VxgFAmae/TguOVqZaqVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7Gkrz0TMcFzuwfdUFbYbxNijZKK2DhbuJ23Zsw/OJSXv+mCb7H4BtOxzsGxT7KhGW6FVjV6ZgBoz3el4M7ku9BY7zoWgQwK75Lymj8n1X4r3YWnd4UoXnmjfLVRmE2PwjuBtP5ibPC2J8IW7NzojCVvGgPi/hiRDHFX4U0544w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=La2jJY29; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="La2jJY29"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8484f229529so2132208b3a.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2026 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184835; x=1785789635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5gaDUFMjFsf2p7Cgms6fENCmHCCMnNOp2lQps8mOFU=;
        b=La2jJY294CoP+34Ab8vO1bp+YFnGKA4IIcSurpajvcx6l30dl7c272fe/eimhJB20y
         MnwvR5n6FTmHckTI/5F97t9PbzobVuVgiGFyNk3wTD4/aUdDMzPxm5OqZRVIHjstK8VP
         uxJrjgSEb6XIb7oUNfHby4dbQhHxevow2rwaPC4svMYtMZ9y7cLjBf56Zoh3wzA9lGXY
         ZzDucaZ4lc5rneG+sOEL33SgbE7cOEnquhKRvGH9wVRso3kVjyVzftZ76rxYa7nXOEN3
         LTlVYzaHM4CghKaAXTBq+JVITGgJG1LQk1LZpgPo3UtXlepg8iDA8XcvXq0cIUCqz8hr
         K6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184835; x=1785789635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5gaDUFMjFsf2p7Cgms6fENCmHCCMnNOp2lQps8mOFU=;
        b=g33MTkaAVLDBesH9klnITjXKsHxD/w7R59PEb57dpHXFAi0N7frX92qTxYMm4OGsUX
         GjC6cOCPZY2zTUTHumgU/7unPvFX4yqLjExGsuD0sxIZl9TBhPJydAqpbRAJHfdxGTpE
         VUMbGr4sJIoWtPyyukbvsnGpGLl55+LMXSUAfWSJkPs+kZYJNCv1Iy6xIhhaIDCnO4CE
         Ii6p1kZtkdLy7zDnpH/1FW1Hr7w9J7RILmAtJcsZNwWa4V9YJxpjvB+MqwEwJlhAVSuX
         8O4jLZw4ZIeGG7f7mzwwkdqI6Vd995ZByBBlNsI76pJHC/vA6RZ+ZtHA7QMSWRphQqS2
         WEsw==
X-Forwarded-Encrypted: i=1; AHgh+RoX+Y/ILp9a2rJWA9x6aBJhdjysweBKk+aj4xlAXIH0CX9BYcZ+qeXNwtRL1AzC7uqayWG8e7WmtvAQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2x04tRuiXojrk/LFBm+K4AivUQvgnpr9orMhpviylLdogbVkM
	FRPWdpUKmLluz5jdQsQ6+dohxDYD6ZJUR7zf2jA3PY1SrdW6J9SwjIfb
X-Gm-Gg: AR+sD129URhAN/EoS4fTx8iGdsi/atdAmIJ3LzjtF/I34t3GyYm0xKWPVKMm3noEzA+
	cHQ7ZlAKrEMaD0rw5kPTVbEtN/vHomssS5huZdV1XLCbuTjdZvLSiAI74FTGEFjGbUN/ibAMo6U
	zvL/qcYBcC6MY885W1SS3ptpXOfvIXRfs1fYxQOVWjPXu4FEweCqAusc78HmtFSF8H9d3D0PcFb
	C4MmLpZK4c5enJBLZ+ej+uQQHu3v+5NZjoOHiIncdYfHjLQV9j5Uu4J+o78hCtnWbO2DNjplmxk
	gMDCzCLc4oMQt3cDDBtVcZvL3G5wI7p5udh0XFQbRUiQWklYWb69mBrXVrKswjUP6F69yTJfB8z
	tJei4oks9D8wAxbmZ9RLWZ7xMBe9na4yw5mlh6s3QoSk5iHcrNaG7qYW/c0CYIYJnGOMGIvsyF5
	nZWs72
X-Received: by 2002:a05:6a00:22c5:b0:848:2f74:d8d7 with SMTP id d2e1a72fcca58-84e595d7b61mr7910310b3a.72.1785184835278;
        Mon, 27 Jul 2026 13:40:35 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:34 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 47/64] dmaengine: loongson1-apb: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:09 -0700
Message-ID: <22694524f7cc07a687d0f1ff7957af97fa51beb4.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/loongson/loongson1-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd20ab..7fc77d8e6db3 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -552,7 +552,7 @@ static void ls1x_dma_chan_remove(struct ls1x_dma *dma)
 
 		if (chan->vc.chan.device == &dma->ddev) {
 			list_del(&chan->vc.chan.device_node);
-			tasklet_kill(&chan->vc.task);
+			dma_chan_kill_bh(&chan->vc.chan);
 		}
 	}
 }
-- 
2.43.0

