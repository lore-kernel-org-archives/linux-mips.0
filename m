Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955804;
	b=XJ4hXtwnjjfeuVU+NnZYqD6g6wBT1UPz8+oHLcddGdotYfc00eHSIcKY3ccFi/vjJCNo
	 chwxqnWYNso5NjBqG1veQv9Hwh0MuxuDsJjD4eKE9JUTtGdFuCPIrY+Vc/iqJkxZdxUM5
	 TXMqdgCzRqUBqcdJHIsyMKJ/kFxNjBY1+hcYgaKO4gIdP0Kq15ZaW3CHP8k0MFQovuDIA
	 q6pkDGlNIJ66/XAWcqYQIYt68gg1zeFTzqIFjKe4b2D1fei7kW+w541s+NhtW7Vwj+20S
	 DTdsy6Yg6m+7FLgNIXF2NpqvIW/+4HPQMlXxNJMDo9E13IuMy1Z4lnpx/uqAn2Zd+tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
	b=KffK5xFmoJxFZvRw4ob6aVyaX32YEQwbtRKgZm4+BNJ9YzMiMalXdt2c9C2q31QlwzLI
	 fK9PB43XZne6KiDJjIVVpaFKojKYDugSlPYEFHt9qHt9v36icrHooLZF9Ajo9Dett59v8
	 UVME67/qaXewVIIGuEH9V6RooNT5axO/zwmHW5SFLn0oi9ODnZVXfQtWxbEpv1IdwVXqf
	 gbTv7cK+yeREGICG6CCoKjD6ZyH6wnpKzW+aRD1pIKcf+VfkQCESatTfN6F+rSrOi6O+F
	 W/pWWFBiZh7MP3lFuD/f8Zj3Ja3dYgpwaioPF32TV6+YiScjC3HxDkVYPh7ZOf9T8pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q0Fs9hwa;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FA606A32C
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4FA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Q0Fs9hwa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so17044805e9.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792955802; x=1793560602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=Q0Fs9hwak670CqLDxPzzKRJKIZaYW6JUgI1yNvBjffOCRYqcnBbMwQCX2US2gfxfMP
         p4Y7vkImrqLb3aQI5cv4CsAMqChcB1144RY/vvbcLoke3UCCW7Xr5tc8+UNjjxLvZeja
         Neygjqt4Zdd1VbWy9i95C5gnHegqh4RvrQPoFjEpORM11n5rwdiY4K3wz67SG8layh67
         O67+v3EEvgrlSQKuPIKU/XWKh/545aE5vmcEC88tCZQTOc6gLl7jBBwEKAFhzc3ddCgS
         0zq1JzdIFqL0gVWnoMTbI0yl6D9abB71OqOTs/L6XOj7CErnAI3LfWoPmJMl2f+1mMNg
         WuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955802; x=1793560602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eUvvq6t18C5RgJIwzh9hbYdswBGCIE7/yO5zUERv48=;
        b=pZB5IHm7bKIxZ4UN4VZEj9vZedcXJxQJh/ZjcZvf53ou6GfM3W7ykDDrvQMDlhVzbw
         HVuDWizROVX0L4R/Hq+3PcqdI3ije9ajYx8AEkZJqAHqd9Y8OCN/aewvHqk5oKnKr3a7
         8wM/NeCThuLVktLZGLcMi2QQDhTC0aEPoCJnApSQ9X3j/z0ChAphY1t0GdO+7peHEiP2
         Rx5tnQXnDrnKiuoxjbtJ3zle39SLQzkYA53Le0xPFob4EWGoxYiJyP9S7GsplVp+5gyZ
         GeZnPrmMbdAn+TlDLjjOUK5J0TpPhHAcJrpsFo9aEG3IDnC0zoiHdJHlYmCSVjSc0VDG
         I8aw==
X-Forwarded-Encrypted: i=1; AKwUvByYr8ceWaUThRwL7QMEP0QYGf+vEFL261U1fSIlBEoT6s4IE9TMuTJ7rjFQU8zE+FBBgnAV8lXscuyb@vger.kernel.org
X-Gm-Message-State: AFq9FYIFNf70fubc3ZSQVhDfYDniL00ehnEiqj42xtfzHTZrZnkdfRte
	VbezbxxeyyGnW9BF9muP+lUu1XzEeHVYlu/jqUVfi3+5UbQ+SPnhwmqCPyyKrAQUTBo=
X-Gm-Gg: AYBFou3GlEyYuMtbE1Y9iv0txRKWMeAAO8yPALZgPkB0/mdSTCPqLui4eHWv+8tYqa0
	qx4nBmgiXKb1mcKOWBmSSGjcssQkKsXojKRKr6uNdvXVsAIMN3uEwgFsUSVj/sw0tJhjNk7pcrK
	xsEaX4Nw2UwXiwhef9Iyk0Awf7BPoZWdbf/0BNdVdnJPZt1+MPhurqQ64TKsP3PcbYf/K9Y4Na9
	T9sZzM2bTRwFrp4gwP03zm1FuoTfTYv/SivjY9zOY8IJRuRugYWeSQSjfVE3rbXWzXirkBnfJFf
	zx/J8KqBmHUVUlpNHtezA3c1RW8ugYJtYfAv263WWzcLiq/RHcdhvvTndnelJSduzWW8jnw4cMD
	n5Qjwvd23Y0OIWB7kjQEPt8gYWaLEY/vXYsGj6lnZaec2IyL5Ng9OKmpE/fSDUSSX2M4X5k2fKn
	iBN9vtjphKOI1gpAfWJJY+JZ1RvRC477Pm2qXwWu2XjaUSd1WpC1wqWVxIZylCIDja4rr8Wl1MD
	him46h7NIGPtXD/r/dLtE0p3e4oS6qfCOWSfTIIEty68qMqTHZJXFDeo8y5nFf/rpoNp7Hf5UZO
	W0hJyvK1vsdoOIA=
X-Received: by 2002:a05:600c:a08:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a35aeab300mr99622825e9.15.1792955801817;
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm144560865e9.11.2026.10.25.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:16:41 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Sun, 25 Oct 2026 20:16:36 +0100
Message-ID: <20261025191640.13592-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025191640.13592-1-olivier@mgcrea.io>
References: <20261025191640.13592-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..b5bb11c20471 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -722,6 +722,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

