Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937085;
	b=MH4SYl4xNkq8e3+yJELZqXApOIgVeUP/RKnwMOgxqpJCplrHg6U3TPRj6St0HrDhNKXG
	 6Gxiz5zOAQq5+CEULEUcv+Fhk6waxbdMLXiIODZmKKpoASL11kYYyegbG5Vnmq4yeFxyf
	 KEIsyz3OU32z3bKTdsnAyi6BQwcyKuFo+W5MZn7GHfjdY7TCFPTJntDCrcDuAyUBUKtFj
	 92CLAQXTIg+wvRuY8jXi0bIklfnuAB9hp3AaxLQNMMUU5RrAbRXGX/S+cOzbF8uwoy4i7
	 NOv2Tsn+bYZUq5oZRcEdVPGEIaknEEGyK1zwKysmcNZCiQp3PdDlsU8Hn4NgbG3ui7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
	b=kHDGryo0rwmbrTFZ8H3HfIpJ5t4yIDCNvUQkkTLuU24nL3xPTmujfI0pGE8WCqlmLkdn
	 pxg8ZJJtgZlsY8hdaAiD67H/SeidJF3RU+IgTOb95EVcOsEuc4BPmCP4xHlFuAH0hLqBy
	 zOHADK+Vbi8x6LRnSo4h7ndE7cI9hDs9IqhjDhS1gTu5LagsHJD3nUmKLVW9Ml6p5bk4K
	 wQCyZ/zWXESKHq+W43IH9lKyr1NiUUo0JU2vgvzTYEFOi1RUchwuiW7UWYD2KFFqUG+P0
	 4CV0wWMHze/hmy5CECecm5jp5x7UzulG6bOBDIN82WsGXk9Mbef7UN0fVkMnByS9wyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="JvkyLz/Z";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30545606A322
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30545606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=JvkyLz/Z
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso22963945e9.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792937082; x=1793541882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
        b=JvkyLz/ZNZaUn5KvDlRMFowHcFjJnQwtRGtucdh9VQYbheAbLH5l83M5ujW1w0K8MG
         t/M2ycE/8cXAyROJC8vJ80SmRrO29JVPGxugVEkAAztqPVJxz0oYRBhT6N7oIRiroxbd
         pnMnWQ3UCMLFgxtDDkDMO8Ci1NRIcrBH+pheYYOhWnJiV+4A/PE72b/THGoPbVYsHu2q
         8vXAm68b4hSIY76GjyrBKtef/M8p9wIMsP2M0Y5C4ikEp/LDXcI1MlG3LTUMOmZudL7/
         xfwG3qCrQ0oWW50A3SVc6hypDeRGOQqA6AleGsmiadzHOtXL/jCSFa7b5qs91zUAL+vM
         4fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937082; x=1793541882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gf2N8Nd/TL/v9Ty3pc7g07aVuF2lX3oZKxasqQ7SD9I=;
        b=ZWqHGweP1HWTvV4e8u5XPusSG05/tmudxM9WpxYHlUAeUBOlFZ2KL9SoYntwWXrY6O
         btu2gxluiowtgzbM6K4bCNb9QW9/ldn8iRk40FzVyFNbaCL6Q+sgctPrx1V5vBS9s7yE
         dZBmSp2tsL7rd8y24LTzVMa5x/g0Apjsaornu0cDPylLxqkvTl6QBPHg/ZKvfaGMg/x9
         vtaNcnS8vPdChzJv8OyIeySJsSdY8ayHtSkKObWGaLhYk1lQT/VI4mi4TPgI+W7iohgK
         +lsBzpi7dfq1+B/RNHWd1eDdVO0jvRhx7n92o2uyDccY3TlgIabvmnkJUbQpSp5VOtkM
         CLmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIGdWNCAIdW1hnk6JQ8KItaMv4NOZp5ZNc7WT3wSde6asJZ6rbjufgVRtzEtyQeYrODf0vxZeVDZeg@vger.kernel.org
X-Gm-Message-State: AFq9FYILvN3ePtAiHowJNQNlHtOl87sH9Z/p3fCtz+/OhandcmleldvO
	7o34tetrMmXEN3T7/Wqg0SIzJ0LRi7QGyLvVFsN29vJg89oRf6/OPgphq9epzqPYCQU=
X-Gm-Gg: AYBFou1ytgcQuLcW74KQgCcbgdcmNrN/P9p9DlrpkQ37xfnbGNGyuPVG7ZdsmAGVL+f
	PIJ6kKfuZNS9ydVTvO7e7NEzc7+M21Si6ZBUnu8GMho7kAARR2+Rg37s36ly3IoyGAWZD3RKg4H
	ziRMrTseV3siyBnLIZyXKyHTCmgzNuyqZDXsiwO8B7V4RZE7aUArcY3YPAtqIk8E7flpKknk7e4
	D9SW7qYm1NLgmpbDnwtNA7f2F/U8HEWeEL+auJJU6hZiooB3s6gXUcmbrGFyiO/i3sSki2PhpGv
	UV85kB2sq5w0GOZlvlSGwLrVs53lZHfm1lMrLFoknnE/eIoXpRSSxK0px/YVTcYhPJU46/dxhCX
	Xk1MvNy/s/xASwiDpncOr1CrUHvu7JokqyK0rkdlEbeQXjkXkftu7jTNG8y/wyl77xJBzg3nmum
	qOWhOlCAv9YyoPXUA5SHJnGZLLg7/AIxY/wgX03tNZfGVH86uSowuTcb/tm/JnNQB8Tbs0l1Fv4
	wmg+48ZuYmWGOvnPsBJc+KXghPsbCKwzVlxNb6ZEPUt6+kTJJ1YZxdeKAYYxTqOcgxGQwJ7OOWp
	RslbCDYLX0rsiKLc7mIg+A9by2/ObkVj/FJTDmmvCS0yrKUTvuPDiFr58LFgwBbZJUbilM4QWQ=
	=
X-Received: by 2002:a05:600c:37cc:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4a35acaf08fmr74313465e9.24.1792937082605;
        Sun, 25 Oct 2026 07:04:42 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm112317695e9.9.2026.10.25.07.04.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 07:04:42 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH RFC 1/2] dt-bindings: mmc: ingenic: Add the X1600
Date: Sun, 25 Oct 2026 15:03:24 +0100
Message-ID: <20261025140325.73204-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025140325.73204-1-olivier@mgcrea.io>
References: <20261025140325.73204-1-olivier@mgcrea.io>
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

The X1600's MSC has the X1000's registers, so the X1000 is its fallback.
Unlike the X1000's, its MSCs have no request lines to the system DMA
controller: the driver uses their own DMA controller instead, which needs
the X1600 compatible to tell them apart.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
index bb4e0be0c893..6b26a17982f3 100644
--- a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
@@ -25,6 +25,9 @@ properties:
       - items:
           - const: ingenic,jz4770-mmc
           - const: ingenic,jz4760-mmc
+      - items:
+          - const: ingenic,x1600-mmc
+          - const: ingenic,x1000-mmc
 
   reg:
     maxItems: 1

base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
-- 
2.39.5

