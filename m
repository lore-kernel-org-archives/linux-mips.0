Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456979;
	b=uo5Zfj2gOusmP/t8WH7lSTEnzJ6RZ+aRRZ31Jz+bziPJHBJg+2ubBuDGY7nZ7s+DitIL
	 aPaD2Dsa9vVrguNpxc2cT2KAKwYTD9hHcwbpjQUQ2nh2+9UkCCTXeUvad9+ef6hY2ZBoa
	 iiBrJkWCGYzwUnwBA/4FXIhXd89as3lGAuGWSEjLPz3Kj7EXlw5+wsiEW17NHO7EFJ6nH
	 +/M6rwuRC2vBlPaG7TxQafNTpffrixxRrC0bQddy2SH+b9RjNna9YUakBaZoUWu6vFdyG
	 RgRYs+TXmwfT2+ZjQOXalQFEhoQ0FxZjBGwZ6oFa5homqmBLKXO7tTLjXxUaqbUhdMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
	b=0yJ+WcBL4+eh3mtpYAA44ZK36AoAo43NTkq1pD78FkKaUcl147VRGE+I5cz7OzyCkME/
	 OShbeFXeSFUiFAC6mdNeQ2AqIN9J28vj2+G0JhcHRB74nGxm6XZPzrqpALFnR2FqTgjUL
	 IRTB6VKVfEyG0xHTBgpXnW4LI/Q/FNNWbqqvDOMvwWcAVwXBNW/lqU5A4nYQW6Ehx+Cq+
	 qlR1rW2zjEkHZoThMebxhdKfdxCpX3qlreE85J0hEGx6tQJS2Gm6w+mNEazAlA0En+rlw
	 J4+TPDgeeXR/iJVVUK2WD0/we1PWtJarZY0QoqvaZ30MJuVVUS15IW2fMhedKa2H2GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmJGZdJg;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3D606A33D
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 04:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B3D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmJGZdJg
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37628596783so3608251eec.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456978; x=1795061778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=RmJGZdJg942OY9rPhScQBPvnVkEnUGRlsngqVgdkiF3pKXoGg2y1cYTwH4oLb8CQg2
         5N585j9GpOm7a6X5s5k+2F0qU3kMRG0Id6ymOAWHgSX9fYdQTwd7cksIITmK2Y5HXVCH
         63sRX9aIvluSZaVFvwDpVH1jBUVkYrv3HZT7LIl4X8K+9c0goL5LoyrxNSlZxGIpHstH
         u5Mx4zbi0PpsGq/6RETVOripdngpUkEHMA0Wu60KDVQHebkEwI6X6GM52/sMvAY+MHqm
         KzyvfCC3pvLX71DTrsb4OBfQAZe1Nv3lTGMyOUnCGnXQ1MSUZY/8tyjocmoE0RMOf2x7
         gI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456978; x=1795061778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=xs/C0rCZU6f/N8Id6gBNt9H8NiLyd9Fo5jODuewiknRokUOGJmDBrTrafv0FPeJpyJ
         A4PHFTX62WUSM9Sn3v9a7+qPuy66p3IO/bVSh//BJNtM723QQW5PyaCE0FTrQspub52G
         0J0BPwObX4FSag32HO8MVLZilzcIxlO1oQnHTdmL7jD9XptykWnsEeLKXzKr9yr2TIAc
         sGqbC5N+mvgcXbrVpg4hooO7BNvwAKLPpQC4JOjuE5ZT2C4UlpQTH1fj9yGRdj+22efi
         7oxbmhpVdaLmjIjCwUNU5ikOJ74YqgCjN4pIDf1/TnM2bAZ5v7wYfcmwWABYLxWmN0BA
         9XXw==
X-Gm-Message-State: APuU4Z8r4RDOonC3/GeKpOBepNAUK6QuwlqkGKzh/pFE7WviFSXQkdxC
	9F1ZgrX6eKaIS5cY/lDEacRJFvr/6y7te0rQSeryLzKLj151UViGQvvPEkCrlg==
X-Gm-Gg: AYBFou2goqZP+oGlshHcVsTjgr8lspeix8bmHO8kDjMeN4YS+W+1/6Q662G/G8IJvrv
	WupH7v2m8NhTh3gHD+f2ihP7x4wBBSWoc6Qw2zZ6W5uuYYtZYOyn5IMTKX4qxf/oVF/FMFF4RZt
	UAkt7l+U3SS+r2eUSyVGnJ1idHTiHSIpdZScN97fXgXC/BdAnETOu/GUCLSWxXjZptv+W3vPCwH
	EB182RnIQ4XVUQUkLBcUqswVUjReWrwdJkQTWQ/gPN0jqhGU6+tTT0rj3n9Sc0LhOw+cLSIl5d1
	VDeKXLSveAsO4fyA2cwgMwMgrdWkjGSWFClt1ublQJ4PqZGYA4yx4dCPsiD3ZNe1jlfPPg+BklV
	ih6XjCCHBNn5CkG3hDPlGmDTKGS7JVDcO26RMQw0BPzes+fFRA9E1yaVYhcCT6F+15bErUkZvKB
	u+JciSPcGQiz4sJLA5pZkxLFF652IxYkeZbLsHCQ2hJ7wybr5bx9HxgpUXyHaKcSqpeG6BPYI6P
	wgIaW5G4yUOqdRFfb4WOWJcVO62pxsbS7Jd7aPLWnLxAzXQgEXrzJvxmNvVkTPG3zzkxJFh88rg
	bN4X12VY
X-Received: by 2002:a05:701b:45d8:20b0:1ab:9266:f50 with SMTP id a92af1059eb24-1b3c03766d2mr4147018c88.46.1794456978493;
        Wed, 11 Nov 2026 20:16:18 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:15 -0800 (PST)
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
Subject: [PATCH v3 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Wed, 11 Nov 2026 20:14:20 -0800
Message-ID: <20261112041422.2997275-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
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

