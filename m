Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110213;
	b=r83sm4/s+aW8kmMeNc25k9dS70raoKcg7VFbtpwLOFr/BVhgdas+htX+Jm9x0HoM5Y44
	 KDYcQCd8No/3ZLdY2PxRouxg+Z1ng3NjNTFv4Gq9aykD8ad64AJ5RRmpv79oFAHSAfk7J
	 kYVJUuy4TTxhX1hoR9Z3hNBB9V8F8lPuPtRWAR2/NER6WKlRPa/h+5KP7rR0aTdNzs6qH
	 sh0VU5dl3M1Gj3ZnvC7h+/32yJAQ1KjIx7Pb0O7Y2zNylj185jnK45QPMLMfq6tjmi7D+
	 UUu5jvZDROAi9HZWm8v06FukMl0yW1OUuXRH9mSuf9tC67psmN6+Wi+TffUMcfzBzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AlaJ2kXmyX2ex9cqiNhx4W/LysSwxrxfAi2UJAeREB0=;
	b=xJV7xM6yAqNOlNOp4JYBVITXnFQVP5qGqBIa4rTCRCjIgnatTSAPqbSoS/oZ2ZN6ht3W
	 re7Q+3knfElE3uChV7cKhzUGe+kldyrFlC26QhtZOfUCXy1F7ezr0sjbWfc+oS6gaKQA2
	 YnaieVotIxvEZugxuYI2j/2e6xEC0XHfeRarrI36cRH/bxDCtaZ1gaggR1g74QSKjOen1
	 V0ZjF8CkQATz1IDZFNe5KdCRXMzwPdjKza5M3HVgV/s3XUUJvYREr0WyglvIp+40+MYbU
	 0D0IZPfM3I2KBSMv5NxxyMsDdGfDbBl6b3RYFNOzApIt05cezMi6EnIp2BTjg9CuUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKg8VGfq;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF85606A32A
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 17:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF85606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKg8VGfq
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3535777eec.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 09:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110212; x=1795715012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlaJ2kXmyX2ex9cqiNhx4W/LysSwxrxfAi2UJAeREB0=;
        b=LKg8VGfqbatQQpF7mJuYKhBbVEl/RG+budEVnkIFnCekWhc/aWXCCtS8TgkaLlHyoK
         pqSXW0mqPx5eJv3LlClcoy+9hPNioKdgPB9xbPTzGkpJX44DKECtRqqiaFXZUykepjQ0
         wetosojnGbZrsfG4/c/8jcrJkBoaGqF2bSjYb8qKYds6LuDSvrVXWwmhsdDyPECROoVR
         468p3l2JuMAByHSpVzwRzkt3qGosiRydP2fyEVlg22Em2AHdndhaxdBwt90bWds19DrJ
         vPV+de3zhz0rUg05flQ4gcloNE+Phs34votyaPQ+Jr85JtolIg/nU0jk43FzD1h9ptRj
         6Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110212; x=1795715012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlaJ2kXmyX2ex9cqiNhx4W/LysSwxrxfAi2UJAeREB0=;
        b=mr5RRsZZQJy+85UX3us8z+3bqzzFqB3N9WfvG7meKV46O+cFk8md9/FAWUUtHdRycq
         cAJjCUxZgTZ8x4seDXbaYlnun5GqmWMCJtzePIEgFmoqqjxTWJAzVeKH2zimKD27RzPQ
         LLRzWYQrPeFQm8jqROSMRnRj6Ey36IPHDwqpj3GRKrGgxPXU6mhNtYrlWYMF82MR0T1a
         EkwMoBEXfQz8HV+BEjFlsJlboeXvBRrFtPy4JsIYX7Y6b2Q2HQO++QgwR3Agv/dkhCU6
         1v8fsRerc7AnFWz1lvvf6GtkIJ7wrMDghnvGuAbOq3bWPZjrQTppHs+DXJZ3WZh1Qdzc
         PJLg==
X-Gm-Message-State: APuU4Z+gYM9LwUg8XuClkMsHhHZ9XA7OGOYWLaIs7ofq6P538Tq6yWVZ
	O73jQhuMT2O414/FjDIXycgvsCMYRztEEQD7tLPCIcbaz6QJe5ehBm72uXQeTA==
X-Gm-Gg: AZFdTZfDx+4wPMz9/EOSqN2odmmF0P2sQAAjis9CUl21iS4C4nd13QbqCy6DLvNbOyR
	ExeLIkXq40GNmydrc9CIQGiEHHADDe+ixw4R2EwZUt8wfubrekpRbglXtmC2l+KYlduqAOZbvKq
	BhW6FVJU0q1OSiQ43VM7ttsTubvIkhOPOnA9WEcPlCm/bEsWWkAMLkA436mPjW+q+S012hpc/IK
	z36JVZ3Dxm0mcaOad8BBERYNlIttqOJ+SAJoeuIRxqhVGY8wUbGWbjTU1BbE+yvw8Q8Ijg6sGZu
	4v6JQdJwRUCknn0L5lN2oOzppmkG8moRm2wdtTwUs5DjDvO81NQe0GBkrRggKXdS1gDvmq/D0Fo
	LlTCLIG8QYIAcHVQN7IMQEpgUMuJz809DKawyx+BsDmiToQadknw/bSKJs65FYg5VMuO2SuCOHX
	ObpZlbbGl0dCO4y3DHR5w6+dxhScNbWMwwDD3ZOD1bT+91vwjkuLPWZjFYHSNuAfUW8CLYKc/iJ
	WIDPvrHHuEQR5HWdHvSRG7fooKc+zyq4eYZ6vQ0dNaoBgnDNLIwkGpPm/JjQOjMzyFfr8C2IM3j
	+8FQgUZck0CEGOdjq864ciLwGo+atBo=
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr57542eec.36.1795110211655;
        Thu, 19 Nov 2026 09:43:31 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm378097eec.26.2026.11.19.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:43:31 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] fixup! MIPS: SiByte: Fix missing function prototypes
Date: Thu, 19 Nov 2026 09:43:18 -0800
Message-ID: <20261119174327.220291-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Adopt Maciej's suggestion of moving sb1250_m3_workaround_needed() to
asm/bugs.h and have that file be included to provide the definition for
that function. The previous style of using IS_ENABLED() for
bcm1250_m3_war() is also restored.

Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/bugs.h          |  1 +
 arch/mips/include/asm/sibyte/sb1250.h |  1 -
 arch/mips/mm/tlbex.c                  | 10 +++-------
 arch/mips/sibyte/sb1250/setup.c       |  1 +
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index 84be74afcb9a..04d159d4cb21 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -17,6 +17,7 @@ extern void check_bugs64_early(void);
 
 extern void check_bugs32(void);
 extern void check_bugs64(void);
+extern int sb1250_m3_workaround_needed(void);
 
 static inline int r4k_daddiu_bug(void)
 {
diff --git a/arch/mips/include/asm/sibyte/sb1250.h b/arch/mips/include/asm/sibyte/sb1250.h
index ff97e77d4fe7..1186a8b21b36 100644
--- a/arch/mips/include/asm/sibyte/sb1250.h
+++ b/arch/mips/include/asm/sibyte/sb1250.h
@@ -38,7 +38,6 @@ void sb1_cache_error(void);
 void check_bus_watcher(void);
 #endif
 
-int sb1250_m3_workaround_needed(void);
 void sb1250_setup(void);
 void sb1250_clockevent_init(void);
 void sb1250_clocksource_init(void);
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 03a9b03c3d3a..deaee3a3572e 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -37,9 +37,7 @@
 #include <asm/regdef.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
-#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
-#include <asm/sibyte/sb1250.h>
-#endif
+#include <asm/bugs.h>
 #include <asm/tlbex.h>
 
 static int mips_xpa_disabled;
@@ -89,11 +87,9 @@ static inline int r4k_250MHZhwbug(void)
 
 static inline int __maybe_unused bcm1250_m3_war(void)
 {
-#ifdef CONFIG_SB1_PASS_2_WORKAROUNDS
-	return sb1250_m3_workaround_needed();
-#else
+	if (IS_ENABLED(CONFIG_SB1_PASS_2_WORKAROUNDS))
+		return sb1250_m3_workaround_needed();
 	return 0;
-#endif
 }
 
 static inline int __maybe_unused r10000_llsc_war(void)
diff --git a/arch/mips/sibyte/sb1250/setup.c b/arch/mips/sibyte/sb1250/setup.c
index 644b19038848..26d0197ab4b4 100644
--- a/arch/mips/sibyte/sb1250/setup.c
+++ b/arch/mips/sibyte/sb1250/setup.c
@@ -9,6 +9,7 @@
 #include <linux/string.h>
 
 #include <asm/bootinfo.h>
+#include <asm/bugs.h>
 #include <asm/cpu.h>
 #include <asm/mipsregs.h>
 #include <asm/io.h>
-- 
2.53.0

