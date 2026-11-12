Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509150;
	b=xIbOCB8YT4vosr1/QLDbfU4nesbhV+WLNxNPRVkTH0cFzIMaPk1pGncOrrCx6sKgDHZ1
	 Pm49rMIvJ6LvYA7gQo3J/PuKiHfZRu+d/JFbBai7BZ6npjWkzL80JJpTr4lgUjxs95Mi9
	 WjnZWzIo9GlN6l4vG/gjSwWXeYAJE9yLVCpEuZJgx/Ep80Liko6IF7czoEB+9ohqBY1jf
	 tCUUWwNwhDDwbpld/t9mYCosTGdS7BwlWqqX+tVKndhU+kDnKxFiVqQnhn/BQOcYWdpCM
	 1xzh0eaAOuaco7nu3Pz6FU9MmJmUKC48NLHdqjgdM64z5kskrxTTwujw4c1gOl4N86w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
	b=YyW15KKgZxfCOEoM0CegraUp2j9sUybEe4B9gDnVofEXwst36ZlFmwi9kHJ+IBOROzIj
	 EOZ+RRU2jwfwAstMfTMf0DkhQi51wX5hDu8mAlUu8eIXWyLU6f4VtrTpg633UorEjapG5
	 0KQ0U6/voVfOIe3UKPex3tfnCEVjjMYozORy/ce0CwONxna4rXMyv6bNamqzjMTDHWYBY
	 3x2p5BGzQ9gcsPltO5vG9fb747/twa+XQ0lLDHWEmscRJy7IXWK7oCoDz1h5PrMupoYCR
	 M8F2ffGlSq4JmPYS9k3CxWWcxRtaIzoClGw3dK2sw8RdSq8ZsEEeh+2J0+vjRuJcOWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvqCJG4s;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CC606A33D
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 18:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B8CC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvqCJG4s
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so253748eec.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 10:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509149; x=1795113949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=tvqCJG4sadbpnO9DnV+uFosM78XxQbI81mrM9a+WHoU2qGeXvav0WbusoVQ6AnJpYj
         tZd/x4021EFc285UdhOKNe06ZSJi8txJuYz+iANhdPUat88400IL3CNIQotARvfES6NW
         Xd0gE5Imo8+N21hsoZJnXanCSCSrPvUJLWdLo4UpR4tp3qyu/CX+nfDV1R6iUrde4tdU
         6Q5cQtl8j6sngNzYfyeeW7QcO8Hn4RXclW2JVOgz3wpyumLZjbD6G3BcUkIkL+moEKOV
         xkUV0ozBi2XNL+QLf/EtSLKqXyJ9F96PcSaHiSd396HX2MyoK6sJJIWLdncNDXW7VihA
         TC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509149; x=1795113949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=MQBW9C2mBVV6zQTwCyjy7AraXdLHOYIuQz2xlIX4WHFp84WhOSQfYIgM+5+wqbBnjy
         cbSB+VgthZ7DrbB6bHsSlgIQqGgsleul3bPqawqOzk5QdvDauGdQp5+PFlImHHNVTA0B
         BRyQzYWTkHP8b9wuSU8o/xIS4V48gK8q9fLgha9d7Ihk2aPw6YDDrUkPzGPyspKVjpPU
         VY7UdRpUx2NtBJVemZJbVYrKDmBr7jk2dJW7pW2wwFJpZOqEqaH7ho2u7Y7N4OYx1Tic
         PdpuiCokDt7aunn9AbnDTgVdg1GN+W/Sc2o+i/70q1B/dlPFRe57iQWUD9GRVdcv/Nt5
         lTJQ==
X-Gm-Message-State: APuU4Z9mBOidtV+EuGrnjA5GU4FG1sBGqXjODN+BK8Hg2bi6QPmBda2U
	ATucSQoeCEz10J6VdspKYiMtJjFF4dCDan35W1M1jZy67XXVTRf7lbiFynwCnQ==
X-Gm-Gg: AYBFou3/UkTrLUZKNuW4XN2uJljOk5Fxc7w13SwgU2OtaJrVzL37fzPSFoFtiS0pY5r
	khF2CQsOJcqyfvC/KipW8mOOBkV9AWrPfiYGuxAbGTOQjVkRKYcLLarmLNGQvAzDM4b003ThPlC
	aaAMIW4V6YQbizbBQ7Z4zl9opKza5TAJjW7hinEu1cYDrOzTjW/83wQVRGFDWZw6n2o9tmj7Qun
	R7L6ybMANE/egiCWNmYZM1TL0aL6mozmfi8OqNVXFJNocWFuEk6V8+wrhUEaKrH9yVfs8Yi+1/b
	ZDJF9AgtMMvK5gW8MWztZx3nKJ1Pg+iAcsHSgpbRX+Y7tihMRYLjPrvyCWj3QrOQurqMdtSHy6I
	ZDZ0kSwKWSGnywloKjGKeFb4ycDvHulTpJaOl5qSsCfRhb/pGFRnhgqGq1/MKMc4K9x1RGQhcEb
	CRt+1yyIX6kLjufPEjib/jk2jtHUGfkP96fHBDImc5U8MQk8fTpHZsrBkJG4zmTvsWt6p6JOdBO
	bmR4g1cEVUHHk8OpCyDDF7CPWtKtebC/VG6HqZZzhLXrBKQuHc+Q5fg3KwC6e8c5gJey3vsxd0O
	jIeVbJtw
X-Received: by 2002:a05:7300:d181:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37967cde7c5mr17495eec.20.1794509148932;
        Thu, 12 Nov 2026 10:45:48 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:48 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	stable@vger.kernel.org,
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
Subject: [PATCH v4 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Thu, 12 Nov 2026 10:44:39 -0800
Message-ID: <20261112184441.3724150-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112184441.3724150-1-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
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

CC: stable@vger.kernel.org
Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..1809f8859c7e 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,8 +242,8 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
-				 !(lcr & LCR_SCPUS), 10, timeout);
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
+					   !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
 		return retval;
-- 
2.53.0

