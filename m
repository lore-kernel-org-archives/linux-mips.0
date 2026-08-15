Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718201A8F84
	for <linux-mips@vger.kernel.org>; Sat, 15 Aug 2026 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837877; cv=none; b=iAzh/o3W6qh1RbRFtRbpSRiB5a0zo4+Dds38tEjYU9HasNff20VyAamPTNT15LiCpxE2t8klEFmz9zM6BojOK9oy7+catQq5txJVkFl0AbXQrdYRZcnThRiJXyvd5hZWV/CqJ4blkpScaPDXi2ktpttKRGbDqdR7E2aYjnMx3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837877; c=relaxed/simple;
	bh=cMpjkUrbci0tPuyHSAN4O3i9+OrP0VUO/+kj5yqxhI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyvUStt2j67GZiDkuLJexRnaOqBROfyG9Cir/D7Yelp38IzIxxm5WGs4CvlGQxd+07ipKQrnR0jdXLwNk/DU4VSq1l8QsjqoCBhx1tjy6TyFJhfkU9LIwNuv13vaz6UEzq3qZpvvQnSGTIstXkSpaaT2pzmoFXexOXC/z/k8oCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qR8EAsj+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qR8EAsj+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1977169f8f.2
        for <linux-mips@vger.kernel.org>; Sat, 15 Aug 2026 16:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786837874; x=1787442674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsB4ezfj3vXRiBMkAsGOHcRnSFydlij3MADQkKJEvoo=;
        b=qR8EAsj+VSWq2fffuFUjdwh/khl8yqYtPPt8yyiA0PSq0FvsvQyEESltSgHm953DE4
         yvGLVrPAP0hWu+zQwK6wckz9mtXsP0wBEkY4hG2ZieXQvo+CSisUDqdKsEOcAEeWt77A
         rxsXkpbFiEsnew52zRBKDvJvDrwqPAVFz+OX+H7uITi98jQSsBb+EyzwDTkISN8BGrBm
         KEY0GZ0f7vyBpmPfZgn7DLoftoeB/sI/UKmNQMPWBFlKd8WKtjhc7j4svb57Gh5GIG7g
         g5+42x+LQ7XDBNIQwGFOv0mGl+lt3cdrD64AS5HAnoPuTlIyrqTfkYq+bcHJgE6NfbRk
         Sdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786837874; x=1787442674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsB4ezfj3vXRiBMkAsGOHcRnSFydlij3MADQkKJEvoo=;
        b=nLSTwaom2PWr1+W3CJkJteoy2JeYyx77UYMvsJwJScEqPl4Hs+tY2hL1Nh6GF9Au7S
         tebVuLt9QohFLzQyZdBlRU90mcpTQJeGX5XiFtNDPJmvXSgWg1NxQDngo+6D1gEiMWet
         9bd+QbQxiHnPWbZUn5T8nVFNDAk2peBG46QHCmrUpNiLyoB1P9mH9C9LHTMycOUr6Z/E
         XRiMyg4XVmb60wnlU62sOy7GgZg0ZUAkWd2mDoL+D1REtGj1Qz9/Iq6PR93mWCY5AjNf
         8AFpuahaZQiWDUuV+6kfisHMCag2HthE4K02heuvsJqgEQRXFYz4BpKbh1Fsc490+0yi
         qUKw==
X-Forwarded-Encrypted: i=1; AHgh+RqsP8es2P5qFacIhYTFqc0g/nL926Io0+hPtgWSieLkak74f91JZ8qFvpS3iOC0hBU0m7oF+2G/+tZ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8LyjkEnGvqzsFjDfHkwDU3lAPp6bVkhF3onaQ5yp0xWGQ2vJm
	hyHSIlyBxlyE2fWp5d/H22d3234kKXnGswBjhzJdLmQVPJtjHjEHOrBm
X-Gm-Gg: AR+sD13ksDOIVkqJoewMy6pQXAiM5lpTylNtVRbHuaCy5iPTSdRh88ZZLcbBhJssoqC
	DuhOaQ785nFeRrH8G4iAGPJi8jp/RY2jyO5oY+6q0+kg0Xx217e+d6JADeSGXl62cmfjVWEqq9s
	lZ7mDCcR5v3oMULMvXBWKpv++G1cMH1PAkZdB5gpwiO2wtCM4YHCUAiaYuJRRzJW057l5ILkZiA
	9kbPsrhX1A6O5qeEfEbOBzt5DJloCl3E8YxLBesCkaOa4TXw67GXWPuzlDQAAAm3N68Lo1uedpj
	MtETQLuOvRnxoabEQvO1DKjMPbDfTRG98cvoTRUwiT2euHPN7ihEYeuWcCwewJuovGpnl+1FeUL
	NpBDPcMCWh2LPBSRT3aSRv3T+EqcxSolcNW57ws6jQciARO/Ndvuqy1LdEgfooCmL+mkPgtQlEh
	5vE60lU7iN4ynImHxTfouirc2JJLhfkKwy3Ux/Qt4RY0TRX2sobptVzAYPzqlLNuM4NoVXktJtz
	gLbmvh9O6Z975s/OxDHXMs99rJiqLQR4sk/cLquuLjy07rk5UJY
X-Received: by 2002:adf:e19d:0:b0:47f:fb2e:f63d with SMTP id ffacd0b85a97d-48160715bf8mr25613979f8f.9.1786837873384;
        Sat, 15 Aug 2026 16:51:13 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1fc2sm20691376f8f.20.2026.08.15.16.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 16:51:12 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: tsbogend@alpha.franken.de
Cc: arnd@arndb.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cjd@cjdns.fr,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] mips: econet: fix unmet dependencies for ECONET
Date: Sun, 16 Aug 2026 00:51:09 +0100
Message-ID: <20260815235109.666268-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ECONET selects EARLY_PRINTK_8250, SERIAL_OF_PLATFORM, and SERIAL_8250
without ensuring their dependencies, EARLY_PRINTK and TTY are met. This
causes unmet dependencies:

WARNING: unmet direct dependencies detected for SERIAL_8250
  Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
  Selected by [y]:
  - ECONET [=y]

WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
  Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
  Selected by [y]:
  - ECONET [=y]

WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
  Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
  Selected by [y]:
  - ECONET [=y]

However, in the discussion of v1 of this patch, Arnd pointed out that these
selects don't belong here in the first place. [1]
Let's remove them to resolve the unmet dependencies.

These unmet dependencies were found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 79ee1d20e37c ("mips: econet: Fix incorrect Kconfig dependencies")
Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Link: https://lore.kernel.org/all/59c5582d-6fc1-48d0-a5df-b3b6f58aa227@app.fastmail.com/ [1]

Changes since v1: remove the selects, instead of selecting more
Link to v1: https://lore.kernel.org/all/20260802161555.491549-1-julianbraha@gmail.com/
---
 arch/mips/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e2eb9627bd14..c3f69def2008 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -396,10 +396,7 @@ config ECONET
 	bool "EcoNet MIPS family"
 	select BOOT_RAW
 	select DEBUG_ZBOOT if DEBUG_KERNEL
-	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
-	select SERIAL_8250
-	select SERIAL_OF_PLATFORM
 	select SYS_SUPPORTS_BIG_ENDIAN
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_HAS_CPU_MIPS32_R2
-- 
2.55.0

