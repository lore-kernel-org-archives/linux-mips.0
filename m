Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285103;
	b=IJVRO96JHQJnH4l5Laix9qHgBoQuTf0Zb6NwtYihXYErjAVnEyDodIsjHvUldSlDSW6d
	 KtZEYfslVDFzsjlR3tm7ZzxpFJkLMq/S/5eWYfaIIWYle1scveni/uTN+Wpvk/qaG5DmR
	 RY78AdrH/fGikx7ZvyIzu/ObfoBIgiL4/ygANOX9/eQAncBWpoNYgnfIUNaV1EcifJmE2
	 Zhw0HwGlkOrO/ofvaeYwlVzP3VMDa7EkiyZf6dGwY/m9gSx3NAIoqyReXtA7j1poBsEc4
	 nMIwWQLprkIrFUWYpexkLvh0QQCB0VPiAmxFMZdO+7qarPGnsl7gTrnWSiFFmXcG4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
	b=qnVwqP1hqR3yPgV6lyzXwY+FCRmnp6jKJk1CbATLZGPjt5aYxl6KVbFPtj8IsGTB5jJ5
	 VdqyMiLAOVpxKCMAk7J7N+2x/t9aSsIgW/tzc7e7uUMCJtBtuCbesncDuwJUL6S78XvxB
	 Awd7zLNDrteGpqvMMeLH+APkDX6INSHfQ/ECAJUBZ7gugGOCV2K+H8Sv2UL4pBDF5RI2k
	 I9neTeYx7lYB3leV6zWAwkodPlN0JFhjqVBtegi3A9/Yk0Syz6jQeWNwScA3+/JSt5hyr
	 OQt4sxXgkum8Wp5G06LyOBkxjze16PWsgom5RGYldYSM/z4bQ2seRTgji1s0QlhtqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBDLkMGE;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD569606A32A
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 04:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD569606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBDLkMGE
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2801650eec.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 20:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285102; x=1794889902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
        b=jBDLkMGEiDBhFC1CIgcwJTC7ITQrTgcQC8+F6btEqq9jzX4wL++sytXmcrTwqjF7rw
         G5KsbbSO2RB39VxpEb8ngouHVGGpf1BFFhdAhokCKKoQHCBVEnuNQnrecpPpWLlEcA+1
         hkKMkB1dTRwlgNNa+oq+C7nxqP6HJOd6zryzBNdh4SHVF95S09ZDDqQx4AqRicHOAAZV
         XwIGhwYHedxFaeAaKeOJoULgbdTUcaHP2NibCWg7U0yhuXoi9UwCCs1TF0ifz0VGT2KX
         uPgrrHObBfnZggK2S3vbmu4Mgr4PEmvj4vCFaeRuXIAzdG+WBLW/EUVdmyDC6ZZIBf6S
         iJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285102; x=1794889902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwxD/kp0MCQ652BLhqihyWShn3kE3wujbUgCK3EzeE4=;
        b=0BahrFYPrTxxM5CmBxRbJapZl+5sZptFvytv3Ml0cDtMPsnCOawsErTnEhXyu435rm
         tNsORUnmeiUbsqRu/fdT0NkQmfYoxhQM+iGSxFXbG1g4K6R0PGJfo5DIPc180nEU0QpK
         Sf1jNaORTekVmDdXsflWrqlILZuxSGiOXaZb6/1WYHkGALf4zSTTGq5uz4j1cY/vPjR6
         q7FCe8C2b8VSqv63hyDQGIZkl/QiAwNp0Mx0F5sIG/7lai0wle698igBpHt9DyYmhOa0
         JiSne4q1I+a52fUEHMSYIlikd6iyIBK2kMUTM4/ZhkyCuCsdpBUqGf7aEUscygP8JikX
         I7lA==
X-Gm-Message-State: APuU4Z9nlJ8zyWDHRHH0G8jW4z2Pvq5ZQe1TQQ8JZWPgx/LAmlTB6nmw
	owJHsUMklYkRol3WwmInYNy7f1ZERmqW6j8CY9xWNHzVF1IvQf8BUEqjCpqSAA==
X-Gm-Gg: AYBFou09g0PS6e2ICZSUt+MllEpLC9ndZg4WJwMchklaZESbg9EAF5d4KGqFRdX6qto
	7GvTRYhw57fkeI6uM4dcBGoTIHfKhQBlv4mBAAO3+TQsdDbymXndVsG8jYyeGUfs/klwrU+Q7UR
	5TAfLVAOcCwlCwbmD9joBRQf35xxgL1HwiWAzYk8W3IKwsg0LVUZygGjImzIa6i7U87uqpVkUh7
	A3poBMuUJwzxax/4nElEz8tGngbwVPDrLKE0igOoqj5T8Pj9WBMhXaK0nx+sOmcmtAjunea6Fgd
	SlJ6aJdBfSnn0G/HKdpjX9vqquvKF9HmYxclSW1Mv9wvsjswuBL1LMNjqrP2lyK/9dK2PNNRsbT
	QKof//F4WxSUlMXo7p0PaQawOTvxpfnM+dffyTyOartBudtSabpTC83NsAtVGE7T5nEJSjC2xrc
	9B/YZh+uu11geOK1cFHf5Y2vY8NKHZ1vj/wjcuC83Q0JPudWMn32/BiFqnhCZjyc1fcMmNGSdFG
	FkUi+fsZK0fU1tWri3E6YT6BW7ymYJ9KcvxLtMCo2lyemw6aofXmSSm7Ldr7R+WaFgbkzVOn2zT
	AQFCYXfgXA==
X-Received: by 2002:a05:7300:8815:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3751c53685amr2202305eec.4.1794285101599;
        Mon, 09 Nov 2026 20:31:41 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:40 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v2 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Mon,  9 Nov 2026 20:31:31 -0800
Message-ID: <20261110043131.1985993-4-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
-- 
2.53.0

