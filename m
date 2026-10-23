Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768815;
	b=ECQNjqely3i38JdBKj3396HAjoeyHqxCnIhR/+nx44OPODGrVEbNi3jhyA7WOK7elGC5
	 t4US5m7ReTy21hqX/hcLqP2rH0fKd81bCJq6MeGH7r4s6oHOwCgIM30YsKr66VstYx/Vy
	 RKquakS7MOUPlEvsh6YYn6RfQYGZzdnD0eYQsgB7blD7xt28ua6yqP0ljHMk9YPFTdbTa
	 cMHUdNsGjlaXR7kjVaa3FZhkgdQxhkW/Tef2jE1bzxBZL1dfK4kUgFyCcGrAXmB7mRSnu
	 Xhg3LXumr7z9CBN0D+OQUhK7Wykb0u2QWuPufT4UGyW8YDIFOKHZEH23O0R71lpxRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
	b=GtuL4i27JoLlUYuxRaMMfnL5FVDIvpf/UqaDcCi7vDE8/hVyMbKPTV2ReSBE6Jdq+///
	 wR8n/9xsLNyqBJmp3qf2InPaOjjgu5ZmWZ4ggpBWgwDeKZAKUOee8k8NfZOGcVqx01Idl
	 7sR9sIb9Eb9noDz9WZd923Oy3UT6oCkE2NV85vXOMX1ppnErOJhEjJKF26J34AZl//qE5
	 IPOvmop577SB/FdoIna3MZ07nq1hu20ShuMh0M9ZEr7Ji02Cjo6RWGmJm8R8va/FR74U5
	 hT/vfZkHjSvNPLu4lBM8gLkRCxglbE8vQVXPCp2Ye5JrOb37V1LRzDHeAYbYcXg6HeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jdhlR+lA;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F2606A31D
	for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 15:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080F2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=jdhlR+lA
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so8944915e9.0
        for <linux-mips@vger.kernel.org>; Fri, 23 Oct 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792768813; x=1793373613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
        b=jdhlR+lAO7IDozcJvsMqFxmnm5Kt2++1YaEJ8/YCU2ez/29XM72x5C+baH4L4ooaWc
         g9In6dGBnUFVkSvPwnJMyPuzEL8ZtoF5x6Njczf+b/EUnrjpV1Q/140BEchX45FuK5ed
         188b9CMM6T4Q3sv+XwUYm41vij4jDLKv8kqCqQTdQwvJ5EJvbpyrdXMp1g2DddzRpaB8
         cjqqe6Shxaag/YOpkdekQ+QU+7yEKkbC+6qhoIhjMNOu26Yz0GVDxLqyOZZUnjZCpbJ+
         NKJQUsPiMKBGtXD4CYveFWD88fiEKHzoqgMmqm6O/rkA1OU3QF1F4egrAPeXgHlcGBtn
         MOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768813; x=1793373613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJuZYhGzc9bJ2iUoM+nb3+fAyF+q3KvA6Y/qH0NIzKI=;
        b=Exypt+T5cimBpND9/ni+pEJrzx6GEipebkYLObV99/6JfVY88YXumuahLsf7Ms/0l0
         cfCbuYw9JHgrO/I6kkodLzmMPWYQy7kNh7zKqRZC5dA8vmv5/P6KGD/V0dr4tV55jArk
         H43NAZH162Ts81V85iAyM9xn/Paf4P4fWspnaTNPWLeNDazfO6a2OAfKUzjktu/5U26d
         reIJ1cwMU+atZCTLyA04zU4GlFq1dOKUWlq5Thd0Puu/Q9WSBCMrnMYAqq1o266rMCde
         +l4iLSueyUAQDAFxC1kPm51JoVLfPHxVSsS4bCLMoYMIqJTqw3g7hcMB4u1zIZkxulLS
         qlzw==
X-Forwarded-Encrypted: i=1; AKwUvByv8eZXi+MLmZrV3n//ZXA6SDtu7QGVH67hhnp6kmfQTueqqYhMXwKXJBBkQFRXmFxyyWhYhRrBzF86@vger.kernel.org
X-Gm-Message-State: AFq9FYIK4d2bzmA5mdoVLOVBZ6vjA0TauKkT6pd9eErsFBfuaSxz7nY6
	mY6HABt/Kd+Ss6zVK6Tijo/hH2EVowSd7WP7XnfCXasfVwmq/r+vwbcnOndqohs4ISM=
X-Gm-Gg: AYBFou1Rccpmoi2xOvMN7DZ1gjlnEHyMQaf4lOPdv0omvKanOebCHX2QalqP4ICFEG+
	SUdDmZ7TNpZ5Y/uoi7Btnm2HTRuROPsL9tjrdunaE3ZgG8it7Ea4PGk+Q6cNGP6SKjVJptb/OYA
	+rVFnpIX28HsNazbokWDQyNO2/rENsO2upQPHbCQsNiorvoEUaak0sqNey5EEI4YsFAT/Nbigsr
	YJd35ED9wBhzVJ4/YcvV/gkd1Vh6g+ecH/3lrlhdcleKyuZiM0aU1ic7xNjFEL8VEWJEChhPl5k
	RTDiSgOYRl8nvn9ExsQ4Gq3ggaYlnqw7ACCQDz1rmi979a/Z26T+sTR6YvooWLcHAA2OXNIBBew
	+W5L1yDkGwwGnJBkFHd5qWtsW9QRdEX/26Bu5q2SVzl545EIXVbndKh+YwTv9u4FUPuiP9rc1FR
	ev9O2TwQ6r3ntw+cZ2iei4uSz2yZCwgwoPCUSdxNwzcnQBVbX+nWiiz1Zll/M+wnfV82rhR3hND
	/4kzptRkM1AYY2ApQf0Lzlpo48ULOi9GkRZi0/E4JjtOSHNjOPhtWkFIRDuAuJ2pHTO5Rdo3jwB
	E81oBTyUzzs=
X-Received: by 2002:a05:600c:8b41:b0:4a1:e9c2:6c84 with SMTP id 5b1f17b1804b1-4a211efe1f2mr42623705e9.18.1792768813197;
        Fri, 23 Oct 2026 08:20:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a9062d50sm11683025e9.2.2026.10.23.08.20.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:20:12 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Fri, 23 Oct 2026 17:20:10 +0200
Message-ID: <20261023152011.85407-1-olivier@mgcrea.io>
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

The X1600's AIC is the X1000's, but its bit clock divider register
differs (see the next patch). Give it its own compatible, with no
fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2: none, resent with 2/2.

 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d15c000f14e1..9ca75fb80f45 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -24,6 +24,7 @@ properties:
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
           - ingenic,x1000-i2s
+          - ingenic,x1600-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

