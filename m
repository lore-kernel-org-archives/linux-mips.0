Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285098;
	b=hv16hPKPP63XGUPXbAlUzC6zMpk9EU9WCuJJEXh0l4wncU8wn/UYcoWoym4kayd11+q0
	 lA9atel5tmQ9gVOcYzqmnhRmE4oMjrxwEerogZDdhvcZC25JECw1dY8Y7F5zAZVrkI2CK
	 NiXGlXlNI/EaejMNqhSSsoA33MeqFD48wUdVdJdd8NqwL8SwrB0X/lph1F08ySLLgWlRn
	 VLijM6CK4Bq6pyZ8XRqUwMFJjbmV2vsb9KUGXctR8JdRUaQ4DTi/upMe1BPOnWRJFa4jU
	 KTJURaUx39y+38wn/Uuha+4+bm+4BLNiQP7VJpsMR6svCTPguVhHA1eYlxmM6A9jhJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
	b=pirdeIVOG+uoLX19coJ2K7XYJNy02qc8o81K61oA18Qh/Y/6EIcYRuAL3+LYdmgtezbi
	 RrjtMjJLCdOrASyNP/iF0EnvlV86Z+VnX1I08R84Q+whFB8uAjvmatB4xAZ+w9L/TkDCp
	 QWH+DxE4P9REVNpyC3b21oJqmj7Sj3h2VuE98rSGKRDJN7lQFU3k3jf/lxNFyKcjchPI/
	 0NNdqb5LwyAlLejrzrXU6PcbIrUyMF7s8MlwOEFmS1xV4sAzjI9za+VtFMYcSo3zhJKjW
	 FXcnxkrtYl3dVoTDSVk1MrV0WBJv7QkEC/OBT0r/5PIFFPBnRPSW6hIFIQPFw8vnMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr+UlU0Y;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AA606A330
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 04:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786AA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr+UlU0Y
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3183271eec.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285098; x=1794889898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
        b=Cr+UlU0YsbuBiK+1U8LGqZRzrg1WNx1QTf46Xfbo0OhrVBJ6QtuPbhqW4PYWL0C4Xs
         nf0SEfw3rq/0f/Jd+4TaTHMzV7Pdeu4XXuXwGGWcocIHFJEtzoQu2vTT6/CZ0Axr8dMe
         phUx8BIQn1Xqz5dGoU3e5DE6utanDaKJ9AqaNNY0UtyUtjDfZrvuMTN29tKIpcZNa43T
         KFQZK5rFQZPQOVw3DPAFUSSiKnKHMfNvPAfVdV+95wqHR2v7KGMu9z7KGMGQ8X1RsYhs
         ff9w5u5g7cBLj3+tIaX+kGtTFU+b0ikcdKGa8AYIg4ckgW2Bi0o9v93Qmq3Msu7VU6T2
         b4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285098; x=1794889898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
        b=etxxx9b3owBcz+778puU3rN0MsbDvHxFBas3gB9AxlXrCe5tsSEc4JnPrXP/30yXkb
         plpMvtqba6fyBi+gOUbLlHk2etACton1ZAumDdP6BlljJ0vpVN23AEKeYItEIw1mcbpO
         ciMV4j6j6joc3yVr8vI7aEx2sHfxG4iZu7UaxItamrpeyLm8lF8uuHJS3H65OgIgCqxA
         d76KVxgCAMB/ibNS2NSnQoOIjU2dGk87lbrxAgYf2t7QGPaM9DL8O5W6o6cY4kd2jrb4
         eQsA/jdDou60xJgRKV1Npui39k5NUnmCMLDB+SSpUOZ1Pi2ivCPc0uKtBsr8pJ6wQR0R
         +ayQ==
X-Gm-Message-State: APuU4Z/VzcoyDfQuDIUWLC4kYDmkxh6ORmD/YQRvrMingBVOJVnllMe9
	Ml38Nc42+OnlIal526CxugQIbAW0PRqmjpQE18YEY7fbQc60aK3fE5lzmO8zZg==
X-Gm-Gg: AYBFou0OrF4x42QxzR0f/0vZVqZqNDo7SnC/umCo+9gYm+a8VAos4KvkAVyc3FH/o/Q
	n4GPVLiGNzSLkF/AuPu63/cUigWE5iXiqpHw/fqT3yEOJyIX5ibTgnRWDbjRwiZ86xcGvxRbykL
	1GHx1eMFA1I62kbzPIGNYE7vTnuTfv+c20gOEalHKjb37U5os4lFivYgVSWb3oJIoT/ylorqqt5
	OG77g5gk/DDPPkR4ohYqa3Jl/XIHojbY+1kEgbjx5jyB+PdkxjSPHrJdjf/rFg0PAFSC4l662QX
	8ryXJDMOyDcCmvKjRJCIF0quBSgcagN6mNdb+yR0YE8ctUrljWMaO6dvD6rW4PvLESW2gyG/fQx
	S3inxypvjU/J2H60JO7b6TS2mEy5S8QBcU6aY1MqoKvYCTO3VYf3HRTwHPvX28Qhbdgcte/fh/w
	624loyhOIcA1vZn2P/RKkKzkg/G+4HsjxyDU/2ytjgIWS4H8WIM+6smhNki/etGuWwR1uee6KSK
	I/MO4UTMCfkTYh9MMmXT3NzIQHwaRhRu03HyBqqdCNxPUW42v94bRkuFJr6DlxNIc3UpM8gARt/
	GufIG6mt
X-Received: by 2002:a05:7300:7f21:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-3751f55f6f7mr1851301eec.22.1794285097632;
        Mon, 09 Nov 2026 20:31:37 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:37 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Mon,  9 Nov 2026 20:31:29 -0800
Message-ID: <20261110043131.1985993-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110043131.1985993-1-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
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

The CPU1 clock enable callback runs under the clock framework's spinlock
with interrupts disabled. Its readl_poll_timeout() can sleep between
reads, which is invalid in this context when SMP powers up CPU1.

Use readl_poll_timeout_atomic() with the existing interval and timeout.
This is a prerequisite for the JZ4780 SMP bring-up path. The original
CPU1 clock implementation by Zhou Yanjie is already upstream.

Cross-built for CI20; the subsequent SMP-enabled image brought up both
CPU cores. Development and validation used Codex assistance.

Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..f5983033583a 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
 				 !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
-- 
2.53.0

