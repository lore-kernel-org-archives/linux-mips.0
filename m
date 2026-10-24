Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792818995;
	b=g1l9cZzAbENy/uxW1nXeROhh8jbCtA3Gg7LliUpqQIE//7wRpAENAb6RWSFA2IYhlh1t
	 9zxqj1Wk3J3XX+FjVGVp4PlgosQ9DwGFDBnTmbl9r8egyDozQ/Rj1JJZCSSoIHjn0Y8xw
	 EOF54GPU0k+I5zOVIBXWADmF6EZeKGbqsjJXAROcSMOsLzXKFwrFREP056lHggvmNyxM3
	 PqrIljW4zi+Lscg/WXXnoF/TrlGbxkRJSMfi0Ky6Ig+fPt5hLSpjhTmZXvct5R6z9x4CH
	 s36rBOVIvXolKNw9U9DTI/znMlKrFxO55+KFG/qRGU6tnq19Nf2oB3eFbmri64b42Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
	b=PhqEK7s3RfaJ/cZWe8B8Du6LtTyg1IgV4bLBmpqi8R/C8RdZrRVuSdfThku2HCXYvULI
	 cBw6GwUZp4UqGyHQ8xp03G1WIol2QYfJqhocQLSueDrLj7NtIAtJ31/ArMKgKiASY9ACj
	 06Apt0XBWPVgUy2zcis31TTLNB+L1ZVyiTp/cYeduGuQbeozWCKTAqEK++yLEPcaw++Dy
	 hBLgfFIHxHjJi0xocRJ684Uh8VlhGVYxfXyqjbPI/WkofcqiWB818oWWeEPkgmt3XtoGL
	 j61+hNJt2JC2k6mQSzVgsdZS6iKtcJMhmE/amTRV8FeEy9K/bGDo82B4irE9G45RhbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zpb9xE3h;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D70606A31E
	for <linux-mips@vger.kernel.org>; Sat, 24 Oct 2026 05:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Zpb9xE3h
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso13598585e9.1
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792818992; x=1793423792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
        b=Zpb9xE3hXNHuQ91xzOw8KF/MyOVXXGXvlmMaJHXkCFR1YRFO12S5FFNknzg2rWNz2F
         OGL2FEA1Cw7SZkQTMtjqF/a/5OwBTMC2E9ejXgl5qmRvp3+TTbHK2IXKr+789NaBnPvz
         Gu9YEza4izl6a/89OK9iTLn7/Jg0yOCl3+yMTgv77b2OgtcorSjGO5f5qoP2KoUOovMf
         72HP+M7hGdqorY3fLEseqhH8pJKpjR5bYkCwmabJPAOPalSZr7mguhggUdJPmUj+X5uM
         cr9PmgGydfXqgWymBYKn4+PhNd75n4uJF2U9X+VBwjdhQAKYg6B2Fu3ccq9FKaNmNzgH
         T1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792818992; x=1793423792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+/gnD5T4Kmt2Ygw6Q5XDsq45pHCg8xCx1/EjyDNaxE=;
        b=aAWGCj78ETTCC+5iuImDBSDTYmJdBclTgxACC8Z2RagZMlIeal+bjevl4UDQfrjz+q
         +yjtuOm38xJGDzzxhFkBHkbNUpmIOxrlVq/hiZ0wL6ct27sDZR6vjY6eRbjw1mVvTW4V
         hmLvNw+YP6LsJUqSBuK+YMH9/bYkKBigfBdzNklgHXvQoDIbuQ1/1Dpy21sOn5PU6y5M
         bQI9MwrJyyN5oOuW+6ZIgpva5/YLJTKPM9IBYNZ6Zo8Um6oq4/TsLHNRoBkV+Y6ixurm
         rMEah733Z0uNrbJaneBB5fU1roHfSh64m/MVq+4/ZwHeL5MqrpIRaGqGtoORsKuuOuHH
         jWNA==
X-Forwarded-Encrypted: i=1; AKwUvBx8iMmbtA9ex1UNKedOCTKskqGYRbYC+iByI00/KqIHdS9Txr9nKJA6Ez0w4n+MgJNIgSsleQXiWb0Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLylXe6wkzswnLSvdt/ucODMZthLZ4ID/HpkEYC10kNc6WmXRlS
	8k155lxEIzctf0FjSwXqn74FChha1wI9IYU0L2Ug3aLi+P/h0PMHO3v5C7QTFNOpM4Q=
X-Gm-Gg: AYBFou1Mr9UNCUT7C0G3v9XxB3Qj6clq6tH2E78Ty/S7w3iW1KbgeHJOnM4itXvx8hB
	ioKXhOyMHua2QplgW1gifJToT3CQ7UyIOikc+2L1zL2/KZQaHswvJ+g1OwNG2Kl6xokwKSpoZjM
	E0c5D95ymKiHvQPXTee6zxfFQSeCByS/3M5WkcQrPDPDyEsAZPeMBYdRLdFTUiygaDIis0WZEnM
	KsTTl/UfUyAjud0LQq6xtoHC70fFjxf1cQ8u3j+JZIIn+Olfo+SAPQI7rrGLuLmHLpRrBqqRwf5
	0gBT4xeSEXBO81v8xKf9ojl9RADJDIUyktZLjzwSE8GDYkZdq989Ef2ywIBK7NY8yVeWUdYYgKS
	yLAqTTeDg6Xk/g7DTewNQCIRhGTIrXvXH8e8DMuUwkbgtAH4efS1TMebHg5eHEjSbGWq81B3rB9
	90YEA+fcBhP9upQjjhUcDQI2OGP79MR5RX70TL1uljxJ3n/39UHc9MKhW9TLcGB3qkVjaZGvK4K
	Xg0hJUXzZmRnPUZt74u4XhbRsdY1f4tpujGIo9/vxKkD4zoI3pq0CBr8vyzP4tetBucf3cdrtI1
	ulqh0Pviw2g=
X-Received: by 2002:a05:600c:a104:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a35c675a4bmr4907615e9.12.1792818992114;
        Fri, 23 Oct 2026 22:16:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e9aasm27604415e9.5.2026.10.23.22.16.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 22:16:31 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: serial: ingenic: Add the X1600
Date: Sat, 24 Oct 2026 07:15:14 +0200
Message-ID: <20261024051515.55639-1-olivier@mgcrea.io>
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

The X1600's UARTs have the X1000's registers as far as the 8250 core
uses them, but the driver has to tell them apart to set their bit clock
count. Add ingenic,x1600-uart, with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..635342d43ddb 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: ingenic,jz4725b-uart
           - const: ingenic,jz4740-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart

base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
-- 
2.39.5

