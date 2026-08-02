Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E53BD657
	for <linux-mips@vger.kernel.org>; Sun,  2 Aug 2026 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687362; cv=none; b=hrFj0n16p99y+FswJBUCcpDzXcC4jHGEWAXG0u+j3jc/qVRD43R0cafFvgTq4z652SELJKLCdCm4w4cWratEsc/vu0V3q7hnY5Lu7o1LiWTVLYSB5A7edIGQz7XrxU48nv+VaUoR4/1tfCzJ69MGAGZSzu54C8n6UkSWR3LJzPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687362; c=relaxed/simple;
	bh=WfRoc6v3czRNxg94labwFTw3D61yby2hcsecUaBotZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvpbyd6XKv15zB6kRWm65ASV3tOSKlemLbjDE/NgzmcaW07gqWnXw+gdKRZnNXPxJ2VUERu6Z9hygBHvZpGQt5Pm3vVYD5DyEtAdJrUNlVbkDsRkx5MDATPdFQ5Ho0jrOEYkoS3Wov++Jj6JxPqeTUI9GUNA3ZMJccVlT+oTCnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9o6sM28; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9o6sM28"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2388436f8f.1
        for <linux-mips@vger.kernel.org>; Sun, 02 Aug 2026 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785687358; x=1786292158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsWsqJSYNu+nGBbsEHXJn10RAgGDCZDGN7/rkn02DF4=;
        b=H9o6sM28/BwMfg5hIK1b4xRkB2KV7xS3eoDVrWz8axXcmb2/sBUiPB9Vv5b60qHek8
         eLwtqJ354Odz+5PMCLRQYXTWHG8HicPQDK04gPbAx22aTt0hDBVWIlmvKxHmcYcXG48d
         Prn4PwP2j79L5/CIzPU1KDwTZg/GkmvK9gqWWFU1WVXGi6rAjEc94URZISCHyLrrxNUT
         VVfM8ahz0eYIMKFrbE5iCXAB8bUeuDM5uFgockvqwvFxypgXeGWxX5zXmtBSs3bIKwBZ
         ylB//YPmjDiLsy38x1oY9Vwwy8/J4ByuSfKsA2+V5wkUc7yjZMwrzii7ku9FAAiR1Q95
         b21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785687358; x=1786292158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsWsqJSYNu+nGBbsEHXJn10RAgGDCZDGN7/rkn02DF4=;
        b=SwzOFizRRWNFd0R43gx/8eMASmT5S/5UApEzI9Ec/KDfdjWH+q7gScKLC8D2OofXZt
         7b0iDYS2SWIRXLlSiAILPyzeo/LOFBUcvXohNsO8meuoqOfbZW5W/ozDRBS+UmkO2Mja
         FxFP+5SGvY9Yfi/65UiQZMR5YujMMaCdQ42bxF8EOGLtYRbUR7gPm/e/6Xhfq8v5DICQ
         HLG2x7aAwcsibL5OsMEvkDEwC4MTO/iOJd4/6ND263FvCKRo+dIMDW0cZWKzwLZ+baDD
         TzjTRPDuTKuc+xC1V7pmY1ee5EXJOWUBHWKLce+IITL8puXZ1yGxcdg9JAiMEmzB0IH9
         UOXg==
X-Forwarded-Encrypted: i=1; AHgh+RoI5wiwMtWK77E2FOP73Dito4OwNyyYPsbGZE7KWBFncORWVEtcy2+vgt4Wxf/8wYQk0MCUo5Xl1iw0@vger.kernel.org
X-Gm-Message-State: AOJu0YyvFW5eSGdw2GDFpcpbx59D9E7coFlO4i11rlkpzcCSeUWGI6r/
	8Jnw9D6ks6qh+Qs1TTzLlZJOdC0+M+dKYka+4hYR5Jgdo82UGlT96LT9
X-Gm-Gg: AR+sD117Y168rQswBsvf/WEuaPuAObQ3ZMmb7ymUVBHzm311v54uAWnMHvbOiHZvOO5
	2CJGHv/5mSxLilQhZEYKBpVmlYrDImGkOQyaY2qcLDV7kOqR7JtITbsJwLbmUJMeLWUTR1UV2+/
	F0MO4Z8JTh3Z01Frbypp3cvUaNMxRQE/c8gpS+zQp2U9sbFXiLg1r1LWxOST7tw3cv+YqdlCkUU
	dQ5mpp7ysI6hb1+diRf/8lC4DUxsYAYS+G2YwjUZ0eLZqqSfA5vUJKN5UXaAWHzkcd/D7yO5iF0
	EmXtwGwCSPGHvBba8jRLyryFFTgaIuvNEpYH0i6I25RJHgW+TjTP8U2QzCOBJTodtohN+y+p+C1
	LlXkRVs5KUPsYkQRd/PJdLH7OhKR03vxwXaG65nZ71v1PIJu8Yjfm8VL10bFRw04QHPthLmrPOm
	h/LK8CgDPdlGXQXWzOkbbpBaRawhSmDISUJk34//slv5CeUOUpwVYzg36C+9EHo03Bb3BWMPeqh
	WGhE9OOsX90fzdGCf1a4GLHiIEnw0O5wcP/lB2Hi+MMYoWqJTc0
X-Received: by 2002:a05:6000:25ca:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47fd72a8379mr17129735f8f.14.1785687358212;
        Sun, 02 Aug 2026 09:15:58 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm24335650f8f.37.2026.08.02.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 09:15:57 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: tsbogend@alpha.franken.de
Cc: arnd@arndb.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cjd@cjdns.fr,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] mips: econet: fix unmet dependencies for ECONET
Date: Sun,  2 Aug 2026 17:15:55 +0100
Message-ID: <20260802161555.491549-1-julianbraha@gmail.com>
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

Let's select the necessary dependencies, TTY and EARLY_PRINTK, as other
similar architecture options do.

These unmet dependencies were found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 79ee1d20e37c ("mips: econet: Fix incorrect Kconfig dependencies")
Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a06f24317306..2423a6050088 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -397,8 +397,10 @@ config ECONET
 	select BOOT_RAW
 	select CPU_BIG_ENDIAN
 	select DEBUG_ZBOOT if DEBUG_KERNEL
+	select EARLY_PRINTK
 	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
+	select TTY
 	select SERIAL_8250
 	select SERIAL_OF_PLATFORM
 	select SYS_SUPPORTS_BIG_ENDIAN
-- 
2.55.0

