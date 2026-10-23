Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743296;
	b=tK1k6htJlyNraQmF9YF/NYg8WNt/rvj7XHkGVJv3tvpW5NqqV/4KIlIeSZGqubUc1kD5
	 iJt9AVkttEKsZdufTOaqcWmXYNJI0Q/cBouBMbtJckicLPkuGjF39IwGh1zQBN60f9Rwp
	 3TPRfsze4fIwD1FYG6/+VgMcgfBgctyV6tWke6eydcQ+vle/ckycMD4C39LinTycdZ+Zw
	 bNaUTvdmNQngM8u0w6FuL4uWu+Wm+ef973QcU592PGpA6xurBzbFg1bRNmxTN/7VYKr31
	 MF1341lrUPnYQO4LheK75gpC0GdW158oiLAHhnMMxxa4qfiu/mauZwfwo+k9wWSuX6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UGEEbQODlbgW0yPm65/XdY1OQhVeHk40cgCxWPCDAvQ=;
	b=XhIqgiqjveXJkXyUeiPb5qARzvmOvrg63VVdNvM2YVfx9E+Hc03eOxZDyoQVRdayuZhj
	 Zvc528pRwu3ffh3GdvrK7TBO6+tO9H0O1TvgoHQpLNEdYFzrVF600Q7gqKneCqkmYBJ/y
	 Ek3YqHKCDNtGqO5Llx2jiSCky2t4v4Xqd8CMVoptjuyVRTiy9B+uviLuj+sXVmcNie1ts
	 2hyW2b/XNneEfPlUNL5C4fd6LZ/gZsr70o7yXll3i0K1WBhJongliShtpq/q4Q3/M0KSM
	 TQQNIu5B20UNlGXG9ETK7tsb1NEGZOXqBRiLuwMPaqdIrNRjMLb6no/NSPARcCNdbmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=RwWSAlOZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5CF606A322
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 08:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5CF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=RwWSAlOZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so3402105e9.3
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792743294; x=1793348094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGEEbQODlbgW0yPm65/XdY1OQhVeHk40cgCxWPCDAvQ=;
        b=RwWSAlOZ0lTu+017KZB6a1UjhzgaO7n9HVMaX17iFwvj2CJyXZDUspatdQnBdBQe5k
         7OEqo9jjaTVb+z+ZZocORSeA7Ugb/UKlcGyrXJ1o+IeferTmxiNUqMCb5/yLtGasl8Qw
         rb8/0tD7iGGDO/IlC5HjMzKuc/777xosMT9jzMKaD7YSf6llXEjq9U0Q7KW2jup2HbrP
         DizD/FKCvUn5vwuHuixUeWObzTOGBo8IFvYCApRPL0vSPnzkuRixXUtkNtRiHo6R7PeH
         OThHsOypvriFvPvdzKp1lG57r27Ex4R2niXj5UWWGx5NL1/HDd++Nx1t+pAKXCbaQCUD
         IWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743294; x=1793348094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGEEbQODlbgW0yPm65/XdY1OQhVeHk40cgCxWPCDAvQ=;
        b=WSPk6RnIIc/Vu2hWh63EJDp+QUnokyc9dj9UQnks3/OCe32XWsxhfZS2d5rfqC2FEc
         iNMeWnrr8ABDOwfnwPFEfuub0zsIWb/SHPFnnQO6pir4GIB+eEHkpQCG0MEm128E6T3F
         SQSI0AHmuW97Z8D0jbQ2O0ssEPphgVgn4GJNxK5YSY/QJGjk027EnrG+TNE3h8w5Vf/G
         dwolsXJBcxwlvMa7OFF0axtyxV4nANdFK0Stww9WV2nVRgzrjhfTJCArDZctaOKNbxKh
         NIcXttmoHrrU3w+jbd9EP2ajGNJR4Tl5lD/m3MfQ0eT+sPTzIsaq8EAiowUPmS6ICnPl
         pxxg==
X-Forwarded-Encrypted: i=1; AKwUvByixBDZqUJOrhL3tZnxfdsKIkXcCELhmniDK1s1Vl3BwcgJTqK6YhV5pFak5nXpJSopt2TSH7JSrwT4@vger.kernel.org
X-Gm-Message-State: AFq9FYL31F4Hsp0DDqtrx81Xsh+3KtKVFjoQx8TPr9VXR6uFaJj591Jx
	94MvpwCvO5aVbFFj16I+pZ9/sfKpb3WJJ0T45hrV2kFnaD+e/Z/xXQUXkVbsfBsaHgg=
X-Gm-Gg: AYBFou0x8KHyrsPbxYZCqlohVeJ7ptcL14F8OEKjfzpW5EkqAabUJVfLM9UHl0g68Xq
	dG6fS6Ucj3KYsft8viVBqeiBh16cqd/fFPrP63RJQ8UTllIXyOa3dVgKfK1Sj85KFozqjzBli5Q
	yRB0aSyEdUEIkuW1D9KLhiC2GoCKWDaLpDRt3Kk1rozAAvSg+nLSzuol/iMbORm1LokRpW0fk4u
	k1K3QlGuLNyBrG84Kf9anjcx/Hel1LsZeva5/s7+VwHeQZoX75hiH+g7KA+pOv0QBUn4zaoHWDi
	h9PkMFLiGlEcArfFNskx7ihe63F+3p9WMc+KVfkMig6n+VUsJWQq6xFhQj5VxtvNWRHXy6KBKz7
	5gVzAAQr/hmdSQG0CaWCTrbhzCYq6JKy4+OZhx3cs9ueuTfAY5KBeKzHZFh2y0tvlBEWeDIycOB
	uVKw9vuYC4FovWK1xEy00U3n2DsFPNIhe9Ypyy0W0mrcaSpB1/85/SjUaJAR8Bbrbshb0Iir2D1
	RTPDq650EXXD8KFgo59H68BvuZzHRCa0dqE+sO8w81bJTKIf9oy4GSXcvRu806+IPSbFfDQJARF
	WFrNG9BQBOKa1W+Svi/hqOb7SRizM3y88w==
X-Received: by 2002:a05:600c:3e15:b0:4a1:dc8e:edc1 with SMTP id 5b1f17b1804b1-4a211b4ab4emr23850455e9.0.1792743293730;
        Fri, 23 Oct 2026 01:14:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3804450bsm3520690f8f.30.2026.10.23.01.14.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 01:14:53 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Fri, 23 Oct 2026 10:14:51 +0200
Message-ID: <20261023081452.44118-1-olivier@mgcrea.io>
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

The X1600's I2C controller is the X1000's, except for the register that
holds the SDA set-up time (see the next patch). Give it its own
compatible, with no fallback: a driver that doesn't know the X1600 would
program the wrong register.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
index b61fdc9548d8..43de2856bf0e 100644
--- a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - ingenic,jz4770-i2c
           - ingenic,x1000-i2c
+          - ingenic,x1600-i2c
       - items:
           - const: ingenic,jz4780-i2c
           - const: ingenic,jz4770-i2c

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

