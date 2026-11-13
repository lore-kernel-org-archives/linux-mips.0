Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596923;
	b=jFoV7inMoiNq70ly+LF9dTJ5TO2TkxUtr3cZ/bqXYoYckmmw9X/ZkQ8h8bU5NBaK5e/S
	 qWBgJj+ug5oBdc8aedhd3keMcbevx6x3Z3TdzXtrR/qc9Ksd7tdsgZVwYNrH1EsSvufa0
	 M75Ky0CLktuYetx3OFIi3eeAnlA3yROV5bdItqVQ3ydPxYa+xm/8N12jiGLSqaYs48u4V
	 VscBOfMhFmSnDUQZDRfM+L4R2g9kq1lc5X11KOuLkx3AoIyTMO1TM1/x8mzSKus+K3xEP
	 RoSSjS/Ohvdao6i4HrviAiRyQXf9enYpdMbqCn83vxN87wxVj4ubQfaCVUExrjKgJXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
	b=VDlvrqWf/ikyGoYFRfeKyntjzba5zv5U1nvPri5YZYLG5XkSIxucveDEtOhDSmtnH6yq
	 grPtEAbo6wY8eh877uNHt5AifQmOVFtjx04y1Nq53/kK3SX50yxnq62Ux9uNPYs9RXtnh
	 87fmoej0qM4ql/F7ZP15PEij6eW6p4Uo4P+RDG4iYJ1q60JJzX4a0jP4zU/yVgWOdwKn/
	 7RxJbZueXBb0ATAWGxOL/vQ13secgPu/2RpmiVqmC07p7GH8dze2vxpiaZAn8QSCHVP3l
	 iTA6yVPIxxRCr89pc4reSmCohP5jAEbNYyyHGT+J8glq5RO/VVm6y5hFff43Wnc0N8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwDKDm9n;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232660A2627
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 19:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4232660A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwDKDm9n
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so3845295eec.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596922; x=1795201722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=EwDKDm9nSU/jTREYh/cxN3W6tdK7apu5/SNw9Sd8IdmwUrbor7u3aICaiXChfvL9OM
         VQycw7+qsKqg4eC90CZnMTRNUkY62Ia1g0AzusTqzDqJkEiwFzgOv/HLB946Nrhb3tRj
         s7DIXsl4bjbvz7uj6gON8JywTmnjpklHFULgI48JHqjSFlXex7kMr/nHX1qQKZqmhVmW
         GucmXILq0IZe2+Lt8woy0b7GjNUBvXnPu/ni5zSIYu5VPAkDZuYfSCXsgmZRchcH9CoT
         5MIpFADNyJaB+YsYZgQpdupPLYhj7naI4sqtwXUI0Iv00nORkHpOFwTsR2jFwlErKJAi
         gbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596922; x=1795201722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=OXDp4dbxg11vLFWl8wx6hPhBIDSM/Q0cgulDP3DfBc9kV5s78esp+xpUURVVm/HQMS
         ED8xc+vLfLqSTvFaAF7bPF6wscLhNAe8qKtmd1CGGCD1cqkp/FACBmgkg5cpIACF0d1w
         huXidDQt27EzDKnEu4GKp9iR0ufbzSXm7tPjGohkIsaiejXQhvfdzSlnNli5ALoU0nCc
         eWRJmeFuO0rZRRWdh206U7jcJlqrBqhxNtgSQJ9kCGcsePYODiFpUjF4+xkD5rRHfvgt
         JQoSFg8sAp87KWDbEith2TzNebn0A+AbvoD9BDP+Jyxg3PDZhlmCe9jr6UrAQcg1a3T9
         Onnw==
X-Gm-Message-State: APuU4Z9QC63YVgD5nOv1n1yYEZlj/KRzua3kbNJPELzixn8Y7sK/0gEC
	+ZuMZlptyq3LGcnk94spBqyNiJsAsePUc0+V89gCUFjcbncaaBaCG+CNOCozfw==
X-Gm-Gg: AYBFou0CKlLUBTFK3PgcsHzpvtasjsU2Vy7QUUZ1AVc4j5EzwehJKq0qMsfOEj+Qn2w
	8AUzrijQtwlHvoJ+UD0DVcL5YL4ZFR9vqNOiho16ZLIDhrmrV4QJNG6qUigR8g9izt/c8gmJZjc
	S5abCPWBH73jHOiii4t6U7mSBDa1efJAkZWJVStSfcaDDzvv+vteCaveWUklsW2suryxfhcDG9w
	7V+gC6GpwoHoBwI5XTMeIqI7tt0g7gDcndbK38kc2mxG/431U+BPK7sF4KV1weykCAGOSBXYUxd
	T/nCAiOHkKWnu6uzReIRbZnbSYak/X+fN2RO/Tda87I0C7dRkqCR8cRVKT+5lalHTl4u+jj76aj
	PSgUVFfZtzkZXlhyNNxDT9Bf+1YAdciV+au9SD7aZzRp48vGYm51zrAODhJ2I/+vckSvny5Z9la
	RGuk4z4JsTuPY4WguhGx8z4wkZb6lg4zSVWMS3wz+aHCrE+AB+P+rUhaaMkouO/lQ89f2zhTWY8
	lk1RHR4KGXC9J9fYsukGsO7yYlfIH4Ef57Tsb6udmZPzJRn4ninI5b9d84RXtOt4P6fs+oE6aZy
	oNS2x/XF4vbyIgDGOhcjGaOXiVsyMQ==
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4217184eec.39.1794596922321;
        Fri, 13 Nov 2026 11:08:42 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:41 -0800 (PST)
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
Subject: [PATCH v6 1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Fri, 13 Nov 2026 11:08:33 -0800
Message-ID: <20261113190836.470937-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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
