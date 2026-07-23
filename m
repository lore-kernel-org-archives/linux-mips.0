Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D49421243
	for <linux-mips@vger.kernel.org>; Thu, 23 Jul 2026 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803781; cv=none; b=Lt9juFcl5yaB/Nn+wLOcJwSfYDFGgSSRA4A+HPWvqGDx5uKZm4gNNHk6oqDtXlol+GsyqRcBoaVV3U2AbnQPgvXDvj/pAmoW8QNLZvWP9QFudBXJtfk/TVjmdTshC0w4BxzN7N4QcA8uIBJ8QfUOidTZPWFB66v5ms8K9hrKFow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803781; c=relaxed/simple;
	bh=xdY9uPn6KgVkJWuYZ6OKP54dCrjsguen+gKS6ZDco7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9u8TuHD+0oQrQeSjtrEr3YxJ05/ly28vFNHY/OYoNpOvLQBKctigNk28FZFEevXHPuswIJxrBvR5oruxfkyV5p9rQfnAJT7JjVcP4rq/FuA/ekXixhlWiSlV4+Izh2hG43MJahonBI9RQF0Ikj32eowDwZd8pDcL0hc0UYtI5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJMKY+hq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJMKY+hq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so5482715e9.2
        for <linux-mips@vger.kernel.org>; Thu, 23 Jul 2026 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784803777; x=1785408577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gVEEMjUM3d7EKZMW8/9jfYshOHGsQzhiEZK5vx8SoI=;
        b=ZJMKY+hq9bFCsnDMfnO9sWKFaxC3e06+COswXu2E0rpv6a0+f63ZjUY7GqY0Y6ilao
         qkO+Byoi0Xgz/3eKsm0CqvpC5SCpNxitjEPon4hJyNuyKv3llA6vI85JH+COB3OX5j1L
         VZPCjODBApFxOLEwIBA6F9X9/yaeCI0llFay0vovDoJFcID8l5cwH0LN44cTGhR1CNEj
         nS9oZPatHLTOCMmQoGjRpG5diEB0aPexqaixAMB2X+U1kc8a1WVo9zMkK2CqTukriF7f
         gwPRbiXmPabOUhEJ9EwEZgjhAGOvXhSYc5u+nS34oRUWCjTcBEh1HZCg0upDUhCLNUYE
         OI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803777; x=1785408577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gVEEMjUM3d7EKZMW8/9jfYshOHGsQzhiEZK5vx8SoI=;
        b=NzyaW9vggIAC1k7ang/2ecYbH+J7Vp817IJexnsHVUWRg6D7kAXbZQlv4tXz9WEZ1Z
         FyNDQJqotQXJSsPMXnoR9lwyNTLkubmMgK2G2yR3H5BPwuu1E36ELjoIDiaqSHLK0rBD
         UCKAO1aXSg2MeTvkc5ufcTBULZrqI4PLRrybBnhmWTRAAUlbPAXnVCPgTz4seso6Bljk
         3+kbaz6mvDLhqXsmAJTCQrgtVnNDl85Ub47PzMIkK0U3AlWgpKpktk8dZ/cdzJ6zbKR2
         ULGSGXGPanpLGoNYYGvDOfJYFyzlX9gZPhE3Z6sVYFbY6TmsQwwQ5lwm+q7r4siXHl2Q
         8+sQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZ1rdoIRrKl5H6XbcQsdeTw158hc3egbSOfqHJVJFJdHFLpMblLrmp2v62rRMLlHzgwQsNswWXeWtz@vger.kernel.org
X-Gm-Message-State: AOJu0YxshxQETb44nCCxahjAQcLwk4o5QmDG2YPw7zL7AbMb1bpdbMY5
	mlmwdR/JYAlfFYyb+P5LkdLeNcEh49sDOii9bb/G6bsY3OsEXP3YulEl
X-Gm-Gg: AR+sD10xi9h2jNrCt4jrFHJyuKo31t/BtUdHWnf1+Z0HFHDsPV81r8oTjzTj3gOiL16
	4dopVbj8Yjfft4ak2sbIbzcTx0JyqAT9GmuqhLvIqp9i3U4xC1SZrAQ3r/wWeb7atx/LJeKW5Pl
	WUT8MgGAzgJ5uP3Kii1DiZNVSu6jVMxzpYO8iNQdBH8bSaIpW6gBjE2sse3uwpvSKfRF3qxgyeP
	iOPc1lHS/8W6JdTDTKG33LnI2JkIIjrS5dEqs9UOm80cQ1HemqkUrNFWJScFq24Hv7YwlZ3+Fy7
	jSPr9oQOtaJTEkKt5Y4hn/h5Tp3glm3saexkHk9X5ZtAshiAGizCyS5p3lb2ACJfd8sWDEFhBtP
	r2EHUy6Un6z/+UmjcoifKy54zSDoouOS9wpdmfT+uMSkf1T7E24wYK2y7l4nkYalV+Du6RFaWPR
	bnWke9AHgeZBm2UwlXQr6zq9+nH920HPa21YJBEQwoY3RspTr2j48=
X-Received: by 2002:a05:600c:474e:b0:493:ee2b:c876 with SMTP id 5b1f17b1804b1-49573d22ee7mr33257775e9.35.1784803776968;
        Thu, 23 Jul 2026 03:49:36 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:8c8c:cf0f:2d1c:7c50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a596sm15089545f8f.4.2026.07.23.03.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:49:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: tsbogend@alpha.franken.de
Cc: arnd@arndb.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] mips: remove dead select
Date: Thu, 23 Jul 2026 11:49:33 +0100
Message-ID: <20260723104933.117413-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'select' does not work on config options in a 'choice', so the current
'select CPU_BIG_ENDIAN' does nothing (dead code).

However, ECONET already also selects SYS_SUPPORTS_BIG_ENDIAN so this
means that CPU_BIG_ENDIAN will always be set.

Let's remove the unnecessary 'select CPU_BIG_ENDIAN'.

This dead select was found by kconfirm, a static analysis tool for
Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a06f24317306..e2eb9627bd14 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -395,7 +395,6 @@ config MACH_DECSTATION
 config ECONET
 	bool "EcoNet MIPS family"
 	select BOOT_RAW
-	select CPU_BIG_ENDIAN
 	select DEBUG_ZBOOT if DEBUG_KERNEL
 	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
-- 
2.54.0

