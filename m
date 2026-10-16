Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8045C45D5FF
	for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188987; cv=none; b=hRZQBuplmNKQhpYEcPtUxmkhlosxpk9EIkduCSRjbf1bFdCDAF2yQEIT7M/nB2e3Jl99ZVzIg8DZslGuU/P0H2krDnErJiLwnJG50mIQwXlUiTtaaSAPUlRneWkfG4t39XXH5rvDSzma24/EMRu/d1lMOq4U6vFuKEvd1Us9+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188987; c=relaxed/simple;
	bh=USJi1mzL8+lPOcpSNRWr0Z3kEjLwRiOa7ngvLPjI/TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohyql7u11+1NwGrs7/AxbOJrjT9OCZH/M5BpAfMPay5066NerVM9+D7QgwStF/4bx78vzxO5YD4o8LXEEjzgoHQV34rcpz1SIwadv/EYynazukBSaHF34/zIW/pBZ8CL6qCav6pmYeLy50OtkyyyHgMAYxbpO/oA0sjEnBLeNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlvuCuPH; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlvuCuPH"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1168698eec.0
        for <linux-mips@vger.kernel.org>; Fri, 16 Oct 2026 15:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188986; x=1792793786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7D3GGnuSg0CzAtbTEwk4pCTsYfF5JzaHvUW0xerr6zc=;
        b=nlvuCuPHnWXB84FmDro+crEVYnrpf8j5LWlh3WtRm6jV/xxRQXsGdxIhF5Anf1NYPH
         qh7nO0JCxykAKpYQKw3/0OvT+aAF5OgYpBIaY72mfyHP+vC5nL6xyfvbw7oy2xXaAOWm
         Gr/bp6/Vjd1qqlbCHWBZq7nHrmmZf5mCIPqeSEDyYVso5IuZ/85ZgntDnDRNkWH4o/Z/
         hIMI9jjd8ZeKOrY563XdIwufE8b9ckY5Dd/L4zyiRoFpz+MLtOfm/rZPy2mBNk0DIh60
         smqCCgxF160QxzJAAc/HOtFKATzVr7obBPNgIdTYaqGMQvrORrSpy+2an2vjDwfi01jQ
         cu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188986; x=1792793786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7D3GGnuSg0CzAtbTEwk4pCTsYfF5JzaHvUW0xerr6zc=;
        b=OOJFBJRaXkbd8KWnPmZ+pjc2GZzh7DDqHbmtADpuSaetv/zEle9q2AUiCOyxgTcT4T
         sq4/6SX5N1+/dyJUDvKNX6wdUkvgkWHu13Vn+w+eiXzxOrRsG657Ecy21/BxIjvVh/j1
         /4t75B6ZLPlKD+TctMnH1MaQ0/oSN2P+mdr2WUA/B+poe9UVYP2VGOPmA1+FuyMZak6n
         jX6LEyI5NWeNI2SBqOEKoeblfPpykhAcxGv9Df5JDrfrGuUcknZvmSOHlDsgDsNHUc8P
         KLk/KwD2d2qAYdHNOpGIwbu2lEGgW3Mlx2od+VUQ3P0z5A+AjbYD6YSG2L8IhJhsKtLv
         bMZA==
X-Gm-Message-State: AFq9FYJSH2bsViNVIplDwLM/Uy4SOT08sKDgPYUbJy/SdiDCMSEgTV+b
	KHU0YEaK+AI9W9KNX3vwZZfdRkOEHrXEvDbzzvsoJh6SgLgKwvWt27HRif2/RBA0
X-Gm-Gg: AYBFou0FtO1cDac8BL9oSUDi3EwGCnCknJqtCUi1l804pc8h2XRSNQ2dwxFjyqK2VAS
	ke3GvvnTD/4fcokk2FuZLNSr3omMkY9TiMgIuAjBFmasrk2ofLT5+EV7uuVzHeawrTUzSdXZnmc
	vmiOoFtWe3SpNpRGWMeXLSGoSHWhm5AwfejYLWFahEsQpgE8zoAAbAqHQZagj4nkzGd+DUyRnIo
	6zocRr3Vl0R/7+F8LwxlhDkv5nOryCHeTxCaDx32rEm5w/YO9xjrCyaDGFP4YCJl0Kmd9iwkHr2
	CmA2v/YnBF7O5tWME2uj/UTG89HDND+fQFvCQX86CQX6PRq7E1TjYUcLf8elRasjIKMjFpeGF/1
	tJASKvcEZ12IKAEupx9IoHATIOXouwZUnweuAATliXLMLP2G8jQYlQHMeUoemEHjXn0YuJYH0KO
	4uE3yuJfX/8Qa0vVe9O1Yqt1rk7RwgmmgiuWs8Cza4dcbEfA2TC0wes59khPie4Ujly/QtGQ==
X-Received: by 2002:a05:7022:b057:10b0:163:8b44:902c with SMTP id a92af1059eb24-18512c37e50mr1582749c88.17.1792188985543;
        Fri, 16 Oct 2026 15:16:25 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:22 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 2/5] dt-bindings: watchdog: gpio: Describe minimum heartbeat intervals
Date: Fri, 16 Oct 2026 15:16:14 -0700
Message-ID: <20261016221617.2223004-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some GPIO-controlled watchdogs require a minimum interval between input
transitions. Add an optional hw-min-interval-ms property to describe this
constraint, allowing the watchdog core to defer early keepalives.

Also remove the 16-bit limit on hw_margin_ms. The generic GPIO driver has
no hardware register imposing this limit, and its heartbeat interval is
stored in an unsigned int. The MTX-1 watchdog has a nominal 100-second
hardware timeout and requires at least 1.6 seconds between transitions.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/watchdog/linux,wdt-gpio.yaml  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
index 499f1b7e03f9..1adbfe5e5461 100644
--- a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
+++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
@@ -36,7 +36,12 @@ properties:
     description: Maximum time to reset watchdog circuit (milliseconds).
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
-    maximum: 65535
+
+  hw-min-interval-ms:
+    description:
+      Minimum time between watchdog resets in milliseconds. If omitted, the
+      watchdog can be reset at any time. Must be less than hw_margin_ms.
+    minimum: 1
 
   always-running:
     type: boolean
@@ -64,5 +69,7 @@ examples:
         compatible = "linux,wdt-gpio";
         gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
         hw_algo = "toggle";
-        hw_margin_ms = <1600>;
+        hw_margin_ms = <100000>;
+        hw-min-interval-ms = <1600>;
+        always-running;
     };
-- 
2.53.0

