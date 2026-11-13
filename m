Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595377;
	b=rBz8ayk3lQVsdTfcQdS58lds45jRb62uLhksH/NjeELiAkNK3dZmrl9haIuY71jKR6BA
	 ynm3PnoeUiXOgmFY+2xpWlAEdOkCABR0m47nJUYPd+s7Jet9DW+NlArYpBzz4WZbAbNUA
	 80eYZaSqL52BvhX1+rwdNNNk6R30nlqOEKacUBAsuL02XmbPSf5Xe3QPyRjysjBUXsqgr
	 CIRG3pMdvyUFYKDdvrFLW3o0QBE5Irt6R2zHGhGN8ylRvqgDOe57QIiPovKkxj4JyGw9k
	 J8Y+qQ7GE/LO8pauZ9z/iIfY/iLRrXoCXM0rqMRMANlskd5LBeLZnBW6jJqY6dki2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
	b=FbYhDWf805uBsCsfRvV6a0yFJkifswXOdTtfVYNEVObu3deiYBmPaQYrBT/v+Fmdhh+d
	 My4o7CTgbjt+K3syn3hOFKZuCo2zn+3JZ/+d9v6L4O70HFj6YR24vZZQm+7+m0yUpNOnV
	 sGZPlyQDnsluhHLbMSs2J2Od/oqkGU90kuYtymlG0RSYhHHvgFDOsRVfywpBk4hg8J+3H
	 9UmhbBds1ewtOBDtOSX0WRLxaEIHFPAo1Y+P2cuhH6GNaGCZ1Sz1IepyMIe6Gvjj+gfyx
	 wqywVw0NkvwZsywQWNQ4lq+3B2J8wzwNWgZURdgA2wwNn9lgyf5dDvIP70GhqeGs7lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLUfjCmP;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F5606A66C
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 18:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1F5606A66C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLUfjCmP
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so1638019c88.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 10:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595376; x=1795200176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=JLUfjCmPNspwfncVcLCqOgrOYo48PDU/oZwv/s2ScUY2tCi7OUgYTFuEpdqXPh5MEi
         kvByBIDETbxVN8UX0f2GGLDVuaupezMITaxV0VLZceNmvLytYmA3RJLqqq/u81gpeBdX
         kuRHLkO3glN1ZVr9zUjwO7AXuvoX4K8ok1M/rE9BssGt1InXbbL9TFqHE0JgnRicS75z
         RAdWayHaQi2mysXJHs2pughOLURwVufmdoAHYqry+gSShG9xvntDYwOxBIBNj6014xVT
         KD9mjYPdyrgrxTcdOpQKbuukeg3xxS2pnL9tKI7TQLVVTP+6yYP7lrsZrQof6oAB7PG0
         y5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595376; x=1795200176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=BI3SvNAsHZuVHsbSImmCMFu0R9dAmUiw2iKEvD0d6nmnrpPYPOf4iPGmpwlQBEFi9C
         KdmLzel8llQTD/uM/rQhW+KHv5rLD33VnWIuD8Ao0qCp6RZaRZb/ZaRsTBeAUcS+6wbf
         hFKYZICjqXfKXpCQEZVcgz9RmK1nKTQntfM7FFIxYUcPhAH8odiHMdqPxXiTYQ1zcB+z
         D+IEAHx035N8DS+5v4Ni+ALLkJ1POM8HyEbh/q+i7D4TOTrZX/UkKLUeEPGE7/Tp7MS2
         zehbyY8jcO8eJ6pH/27o3dxfLC/e1ka1wnTlclijpJ3pvJnhXvDqvvmiJZpmYNMvCtsJ
         SqlQ==
X-Gm-Message-State: APuU4Z9IPQuqAwXMaKtCwBJLI1hko9Phh/ZhlRH+LKMpZlJl+FNkqLGt
	ClZUPnLEyzu7wWNtA6qOw3s0Sg4BZ+MAR6sFXXveF/UaD3t4IxNOgTL/rx6anA==
X-Gm-Gg: AYBFou18tLwo7wX3F1FORzAipAH7kEAscqjuRJX3OfWJJWVhrwsIZtllS2iOGrGz7by
	83kLvYWRLKM2VoLzZK6E9EqigVmKPO5Q49FIkvRr3iXZdtKWjCiGlXNrc+x8m5xL6Vvb7+pcgdq
	z80IVh3nwXonX99RcfhPndClBS3fVoY5ni656M8RBNqs+/OKUlXWnZ8jMpgoXawnXe8hmYaHxrg
	l53PxLbcrLcbtpVXISZJ1yEayz5qX6H5sjCOlJ20cZbBvrj/ufVsqomdYaK6nhxWScXsAmJOeqG
	qKHEsYsnB5Av7EEy6/B+aVz8QX0hMMQ/ZNGvfTCcOb5ISAIb0oJLGGxpnXQ+z/8j2RVw9tF1nha
	RQo/4s6ebdz3NgQjRe2nvapHajXvpj+/PguB7eKU57JcRgTXF4NYDCDlHCvbiB9NxZyU2EE8PkX
	AaKspZ2TWx+//M184nUagBvZx/UJeoqW8Knu6Uc8miyhrGGEZALq/p/glwR6qvH+sn/17sRTKvW
	UtoNJ5k3tS7TzY2dPlV8Rs7wL2oatvPy0ApCoq6TegKX3tDx9e3ZLkdP3+G/2GgRSLDZOgruCIS
	JsescNUT
X-Received: by 2002:a05:701b:4648:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b5031695c8mr3293113c88.47.1794595376420;
        Fri, 13 Nov 2026 10:42:56 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:55 -0800 (PST)
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
Subject: [PATCH v5 1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Fri, 13 Nov 2026 10:42:07 -0800
Message-ID: <20261113184210.470320-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
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
Changes since previous posting:
- No changes to this patch.

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
