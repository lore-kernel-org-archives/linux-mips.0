Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910770;
	b=2i5e9pQtFqzQ4jxMSu0roN4gQdQ+lLdybHOUDw1TWqCkmo9+ucZQ25Zd2ySoHsDOn8kK
	 evkIzHqB9O8LTg8rAXt5rf+6GU73aE+pbu+cozErjyUAq1WPFhholnllO1EPbSCsgHOZA
	 uRxzmIdYlVAb2cJXmkHN3E+dc7pZz32eu35d//cRoozK5t1qNwTCzDixq2SDiYGvMHy/e
	 GwDk0soxEKC5mqmr6kT804BYyJzPafHHYrypwk9XVxi9g5IfAId1hgVrMd+WsmujMfWa2
	 rOFdKdpUZWUFAoxfyzfG2TchNhvsGWROAIpIgM4LDD7HDAuIuuihHDtRmgCz7X0k1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
	b=ZuYbf8qK0+Nlg3o+6CLIokDpE8jHCmfxOLnr7e+PnwiEw0h5gvGgVIchFJkPIgMLAJQB
	 aXoaLwEMw6O5oKWF9GP9XytS/Ks9TaksFXv+yNkcFEfJ1mlmxYYBnWjKv+QoZRAyDyBLm
	 q5ljCbZQfXd9qLEzy+chKkxQWKytBS3cMpMm/dqedxUH7/rNC3M2hA6n0H0t4JPSmM8JQ
	 JpDhWIwHgWc0p2oOIdg2DLcAIciJEvegH2wXvZhNoKzWlWT0mv6nZPTP0dWmprXe7Yxlk
	 puALlEo/G3pCanP0Vx1YhOFgn3b5UuLjWAelQekL8Z5sUQEqzGOzDbqtQYtgG1kNrSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGmgdzyl;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9AE606A33B
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 20:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A9AE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGmgdzyl
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-353804b591eso4384639eec.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910769; x=1794515569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
        b=OGmgdzylBss2HmVL0wtcXd6GW+yjn8upmDIUxverqF9QvLbttFajMGBRXY0fqR9MPZ
         gb5FrW16QAc12KEiOKu3uGfG9oSK+V03BJcY80TAyO5w/Lq9GoIl6EqCNS/mGxfWmv3s
         odFZzoRMXjQHrucDfKnsoTkx5dAfjdFCaS4FlkDbA2BZm7JuLK/Y6rNmcJzOwpatAibK
         5R8F4/jugyHXPCxUm8u3FCqtjIiEX/7qUHolFHj5naTadT6g/xjedJsjbK0P1oW8tIHV
         E8TtrBgMBkekcf3r26r16onqoExxZL6aDNpaHjuO69U04ZXX77VKYG1gLlw38GdZCuAK
         OfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910769; x=1794515569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
        b=Um80ENxt6WpiQqamFSRS7Fj3sLHWHhbPTTWG1v1JcGqzq+fpAi1iEkYafZJL+YTI0o
         Kts/s01sJa1Y/IcfU65/T1VMB066D2zBo9EGQSYY/OBETEtQgdfq0RMXv7m/da1ybgvq
         7QyBl/bXJ1TBwOi86BziE5gnme2mf4L3YvQrpIUw/dkDHseJLFBjNuQybxwDvX887Fjh
         Pqpdlfsi1bSqiRD8Sxg1zFZksnS3R/QK8+OyAUq4jCXTSbvFUrDAPT3OJ5yPG1LQ67cv
         A4JzgWeUqFbdJe7H7kktxOCl9qYRsJicNCfVsszKaEUAa+CJzI99i/NDBVDuToGeDU86
         MKAw==
X-Gm-Message-State: APuU4Z8mM3wv8jBR67n9l8TC9MD2asuTsAcbrJW9KcPmZGgKjnlASWQs
	cKai+b8NEPl4gcJzIaMin6xCKdb30qn06uVldwnzR77LEKTktdyXLFDe8uszWg==
X-Gm-Gg: AYBFou2V0gEfQQbB4EF2/C+VEMj99kkjKd3pwpyf+4LZU8LF9Z35tpm8JQFbCKi5hee
	dn8Uf0ygrkxYgtUFAjoVXAXHxqpejnBt4KP1eZCvXTGR+8KgC7u9OjxlYcTK8nr1u46Ph8oGjAn
	bzGOR/zMgqc2SdvWuCb7V74jwQrpV4YXOHtioS7zxdrj6MEbuUbybCLbZCw3XKi+Xu8dRlH/IRZ
	dOFgzdYFbHiK8hrOgF+Zb0baSqSZJ2uYFOq6mOSaTPEZ3orEaurkd+ZAdvar1uMEGNk83psrDkR
	I2qKaEecWqd9RbaPK0oEBzQccxnwLKSgbyuyFl2pTbWSKS28PNZo1FEFlYumvGaZsp3/WeEpV5Y
	j1NS2pHlmwChS9EDMxyjMzraFUGWW8kL+zlIFrW4haXFhMVoBtrQcXAVdsJJW0Xc3ioIjuTkvYY
	sP0t2c+bQfY+cS3r6AoV/tdAPR9YKMp+AFK0IHi8y6gnSK3blJ219LIOYubYOctxu5ABbtd+s1P
	W0vseGRhWT7hfPqx60sbl6ed40DYNH9UkNcWYiz/c1Sma2JGMPkvjcPAryZSc/GwvawXo5sfcf9
	DT8HLrdd
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr318179eec.12.1793910768645;
        Thu, 05 Nov 2026 12:32:48 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:47 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Thu,  5 Nov 2026 12:32:40 -0800
Message-ID: <20261105203243.2292647-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
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

