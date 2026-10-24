Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819079;
	b=1AozDlfKTCoVkBoAIX65gl3ZzWyLc7CydpMtapMswjnMeT2wnRfad7GIUMRQNx4mRdx9
	 gizZW3zInYRmTo7D1DCaSnizHOksTLeGqeOkqwKly+KOuUGvuLaECK4sL0cSUGLvBOVVF
	 T398x8dbyt6AdqhMmKbmvqyoCmEzmjkDCAh3v8oqGG7EdtatNIQjqqhHq1jcV2oMoTrX5
	 ZI87njSwS9gTkJHZgLLx4Qh5Qln3TM8o0aRclE+D/YVI/ovkfscrpQAWjoPGPA15IZMk1
	 WdLzn7l4zl1nBYJdoaAWFX5pkzu+QigokzbC+J2LLz6b8fvjsenR6XKx0cKW6K3u8Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R5RTMRDgBHbdaHQQjXNxkkrON+mCCRdxQpHSQ4eueTI=;
	b=HhCz6xarDfLeBIutd/dYChvk8Hm1lAXiW9Y85VI09SIQNMFykSJHpRqZ/HABFYxQj9Hk
	 XTzE6y49ok6u6uOg9Jcj+14BV+gKHE/3iV3p4j9bdv9WRcOB6o/R7Wx4xnO97hVuKyYb4
	 5pqhkfyIw/FMWqE/4CwrAerym6zImlk1zVz9xaV9bmCwd9L9wdC38EPd4goFc0YB30iZS
	 JPbBqgfszYDBt3Y8BLMfhjRLmNwnogLXM3G8/wDhLi2J/NQ9fW5UXLqfkr6slNTltil4P
	 rZJBEQxJOCdP0zmPLdZeVCyua6xApIqWHypydwMo1vsugpgrRMXpvvfT+jNFxV16cFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0bMKtieo;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F377606A31A
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 05:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F377606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=0bMKtieo
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b042c0759so966047f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 22:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792819076; x=1793423876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5RTMRDgBHbdaHQQjXNxkkrON+mCCRdxQpHSQ4eueTI=;
        b=0bMKtieouAfS3uwa1jldQkSuAxsN7La3/muoj/f5t0+64kropOJau13OsOZqHvK6Pj
         6M/bqTbCXN0qUN3Wx1uw9oCaOMsMh7C5oJxw7Xe1Wd+TAU84C9PgVWGl7Mz/DgmKCG5Y
         4hRwMYeMR7sfdH7JRdepEV/nc+ADDz2+yGGoz02scyM1WX70rxhBIQ6QVIsuG/99d084
         QcRAiMIM3NIwK4iiKAcU8egx4XBX2JV3okws92FyakXmxO5U/+xvataBTzoUk2F/6Pmi
         CLpP5OwE+kpZgDJL6mi5EN7HXqvUyIWhPeEqIxuEyPAu0DVIwSqwGwxb/zVXdkrGViga
         /nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819076; x=1793423876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5RTMRDgBHbdaHQQjXNxkkrON+mCCRdxQpHSQ4eueTI=;
        b=n1OlRsQZF5Kp23JQqd4+L4zehuuba3hJ/a9al0gcH7cnYNf3JoI+h7DMgrBqUvQOR5
         DIbCQLIWAsMJ2GWA1t8xNN/vi6SQ8yT0DnotafJrLMHtRQzDWSOcRchddvEIPr6ZPgOO
         gvTesjZ5NCNvIu35qS0itwf0VRTUQiUAGbvILgS2ZarLAqbwQAlWp688VAkDCWFb31ae
         v7Io/jVPv8a/LMFSIrA2Pong9bZncyhJ7RXWtAM7Ajl+Hcuowrn1yQl1FOXcF+mmdwx+
         +hynde2GaRLH7Ez00e693bKB9qC/tNanf6MxvUD2MqvOstJ2pX5uBSt0ypHHGNoAQ/l2
         EEvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMZ45sgYxbu+erizmCPZ4dQrcZZJGgQPiJNWBkIqpTA/Nvb2hxxRDFyAxRmTxK3Eok1coXJzKk7jsn@vger.kernel.org
X-Gm-Message-State: AFq9FYI8vDF7Ai+O0A7v2sCEsnjt8I60rhCx2mTTij5jOF5aRQJ0ZrZF
	OpnbUooIv83jDZpSY01omNln44KNz+Epsgbj0h5oXnT1kKyxCaSTxbbJNzGJRWI7Tj8=
X-Gm-Gg: AYBFou0grdbu4YXXSvadW3L26uT7K1Tjhb50waiH+nkhCXjnZsCba/8FIHsjy32jB+f
	MnrlBiJe8lZVqLswf+rLu1+/Qhlr+x2G535X83pXOkIxvu91kiFv6doOeUst8hnpRWCL6Xq7icI
	2fO1m8CkqYebHMoJ44uOObS8cf3tENIOoZyeeGis9njQipuuHJhkA5cBRKzNkdak+nrrb79Sxep
	cKVf5fTrwRutYg80etEdVF6MUELAmsaQjdYfhfnsmiPVaHC7DsM+P2x1+cP44vZ66F+WQ7Knu6o
	vO7ySkXC4D6IlBo4NT+g9sfD0mHbkdghKzLpGN9WVOd038Oarhdb307LFTw+PlxIhVXipkz2iJj
	xxea+a9nZH6xukpxZdvWBZw4hgWxzJpywhhRYCbXn3hzlKjbMe9QMiQ55zPMEKj52aN9ZFo1irB
	/nDDbLvZiZFSQjr9sVpPbRRgmV1qDZxoSH4aWlqCrKaz5BLYwMH1fT7NVAkGHqvrZbw+FlxxEl2
	6fJDu06Nk3DWlTu9RJy11AnjPngdB/tjWYn7YYqlRYBJNdJsCCow871Npo4QECBfPqNn8+b0VOr
	isqKkPFKNfk=
X-Received: by 2002:adf:f7c9:0:b0:48d:bafc:a409 with SMTP id ffacd0b85a97d-48e3eb8fb51mr1030940f8f.26.1792819075998;
        Fri, 23 Oct 2026 22:17:55 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm1914646f8f.41.2026.10.23.22.17.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:17:55 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] pinctrl: ingenic: Add the X1600's 32 kHz clock output
Date: Sat, 24 Oct 2026 07:16:39 +0200
Message-ID: <20261024051639.67806-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

PC26's function 0 puts out the RTC's 32 kHz clock. The vendor device
tree calls that pin setting "rtc32k-enable" (function 5 is its
"rtc32k-disable"). Add an "rtc32k" group and function for it.

Used on a HiBy R1, whose Bluetooth chip takes it as its sleep clock: on
a cold boot without it the chip does not answer its reset, with it the
chip comes up. The clock on the pin was not measured.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1aa6a6dc1209..ac6e2a152bdd 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2452,6 +2452,7 @@ static int x1600_pwm_pwm6_b20_pins[] = { 0x34, };
 static int x1600_pwm_pwm7_b10_pins[] = { 0x2a, };
 static int x1600_pwm_pwm7_b21_pins[] = { 0x35, };
 
+static int x1600_rtc32k_pins[] = { 0x5a, };
 static int x1600_mac_pins[] = {
 	0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
 };
@@ -2511,6 +2512,7 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("pwm7-b10", x1600_pwm_pwm7_b10, 1),
 	INGENIC_PIN_GROUP("pwm7-b21", x1600_pwm_pwm7_b21, 2),
 	INGENIC_PIN_GROUP("mac", x1600_mac, 1),
+	INGENIC_PIN_GROUP("rtc32k", x1600_rtc32k, 0),
 };
 
 static const char * const x1600_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
@@ -2557,6 +2559,7 @@ static const char * const x1600_pwm6_groups[] = { "pwm6-b9", "pwm6-b20", };
 static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
 
 static const char * const x1600_mac_groups[] = { "mac", };
+static const char * const x1600_rtc32k_groups[] = { "rtc32k", };
 
 static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
@@ -2581,6 +2584,7 @@ static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
 	INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
 	INGENIC_PIN_FUNCTION("mac", x1600_mac),
+	INGENIC_PIN_FUNCTION("rtc32k", x1600_rtc32k),
 };
 
 static const struct ingenic_chip_info x1600_chip_info = {

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.39.5

