Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011250;
	b=SRNQAzjfrwyr5heu8Yie5JRB0d/BTluhiBnZGzgapSIaczA/kDisqXuO2+i9yGDArDzw
	 JgL6vz5NbueiSp/a0stMV6NUJ9De7l5DzerwZFJ/mETX7u8NBi9Gi/etEYf54u/u4PQsa
	 /5aR2VPD208++P8HAA/v0qu/8IjNSxVJW7A3GrlTGpOVmm1gbzP6Cy1dX38UZP1yptrtM
	 hbuxXiqFVyzgTIFmokXxuxVMde+53mePt/8rPCskSzVoIIwu//+uTsNFao/t9sWy/ym+a
	 Bqq0BlB19LhVZj8ex6O5LJBfFhYD50zC5pWunmyrH4kXju3k6JW37zO+0ttDilKe3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011250;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
	b=h8GXye/M4fP6pH4bniXieJDGYalTeU3i3vSW9jFft2nccZxgIZAIL3ZCyzqQZ7nnaIHG
	 HjpvLbS1fMyB6cbADW6Zm/TzBRWrjzI9fAbS25ECrid890JekBqjV5dv1SpCp6G/7JkWT
	 PNX7qcMhMbhPp+bAwfx+q+a9KUCKl3/eu8GnI4Vd5PE3RhCN55EERiKN6gJ0fobv/xWe+
	 tBkKRT/xmvPTRSyOyhB6siHp1/e93wDv35zqAClcH4eSmB/hjLKbb/MhFly9THg6fKbuK
	 2tpAqNi3qjfF9wp1B2jVmemZuSHr3Z/oRuT7Fw98AXeiPCf1XwGBtDh3Ncca8VDyPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NiHuWL40;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzZBVusC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33250606A32C
	for <linux-mips@vger.kernel.org>; Sat,  7 Nov 2026 00:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33250606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NiHuWL40;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzZBVusC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
	b=NiHuWL40Di6gMCiQJjRXxpcluaIy2AvGzZ/zGt72FvRd6wnigMlk3V7oMW6S3O9+2HZII6
	1qv+FplDomG0VBx9KWAc3CL1fQ16JUW5IfVB+/Hv5aozAVK0xyeF29fN45QHu1q8Rak8zK
	Qvq4ZrMkJ3Q8jh69+1yRprwLF0i4JW8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-1qbpApN7OO6CyoCpmGp-rg-1; Fri, 06 Nov 2026 19:27:27 -0500
X-MC-Unique: 1qbpApN7OO6CyoCpmGp-rg-1
X-Mimecast-MFC-AGG-ID: 1qbpApN7OO6CyoCpmGp-rg_1794011246
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso204178085a.3
        for <linux-mips@vger.kernel.org>; Fri, 06 Nov 2026 16:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011246; x=1794616046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
        b=VzZBVusCaIfSJo9m2kCp9VBm7UYuZWBp+NOOYlJjmmWnoD5eAEPS2DIhO+i13wbOCY
         EEnpouyLBsOH96PbYXaNHIRa8cqSqo6YQA4pl9I9yJa118p1ebQvz+u38M1XR8VOTLIM
         zTB/auLnx/AroCnxF4cMjEhvTZ0pHnJCWbF1wJXTRqmhTkH6cjxLEbDdPII/vRuwd9ol
         PPT8tiEjpROBYccWTGJYE8wRvjeIjMFI4iOtK2ik3Zfc6FqmLtIVLEKmIcQ476VORDei
         ZyfbxsV7tnTzD5YL8LfrXwR+baDPSKhi2EBADLca9X/WzjjWu/lesDlkyLPf24yv20G2
         j0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011246; x=1794616046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
        b=QqZ+RvcpGgwVUs5RxdY0cubbAyeu7+MUoq3OwhybSCffn1boNPLyGtELcj5+U8Tm0s
         avWPnUyIkOXvcYm1hhNlNtwBXUGwGAJxUV0c4akzfU/FPkKC3Zeo7Y7AJwea/GACe2ap
         FkQwPFGbqYKEq2n96xpQoZR5BPXwRO0FbH+bSE6Q7T5PMVibBs5Xhrg/BzYFpzm537Kl
         PnXbaS2u3rOLrF8a+3qx8Gr0k0HNLazTRb5TxAFLMKaST09lDNq4V3P2G3BJcIfNiSar
         rE4TdB6m073WgoqGE1r2zZJUOhmkRL1o/jsUAZumudKBPm9Kv+FD4EnfnzPjvj3ZbX8f
         M4JA==
X-Gm-Message-State: APuU4Z8qcc41xwDzK/AkZ6uErdhTwkBhrLH6zQ5hmTvOUmOkc0WmNsJ2
	yw9sUx8M5PA+iImlLVDIZxKHSg8O94DBPzBieRex2YXvk5yjzaqKyU7u3tmjc7gxCprhmUjkIGf
	gLsOHYUjFeJR6sowf03DwdOhy5QZ7Rwpa3Ge/2SwywL0OQQsgINni5+Fi5qfsH5E=
X-Gm-Gg: AYBFou1PK9XhEk3+nRAW07oYeuxWoUbwBMtFKCy1aYubzZ3SBazdMLsU1Tf6eRcIjZ5
	w0L6Ok5bb8uD0xFBIKz+2T2pMdZV1VqwNgmPWJGlUaDN3l6btnbBvoy1NQByxHstLY7edUPFBV5
	A1pFpzJg0Lsq0btwxuSCYgMD39z5eonMRUyhZwsgGCDVW05ofmgkgw+YaZk3kXzvdauJAWuMeoT
	ZSnXAJK4NorQyJOyWOBDxnmx63kf84j1QaDwx8PhmicFmV2IZuPRTC4jAv35ug1z1//ymbWa2S0
	BKBge2x7g6GFT/r/IeZuNQ7SX5276eRw0WFuaG/tp5JqUcnAUY9yPGbJDVf16Hn6UbyATPmMix+
	YzynqaWLDU/q0f4vXlQxHyR8kUbOfwju3Z1NypbMOo6Dk0N3HrCPoUE6BWcwrhD4YkROVedlpvZ
	dNGleAY7KszWKC06gH
X-Received: by 2002:a05:620a:448b:b0:93f:2aa8:c549 with SMTP id af79cd13be357-945f34d7959mr663754485a.24.1794011246423;
        Fri, 06 Nov 2026 16:27:26 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:93f:2aa8:c549 with SMTP id af79cd13be357-945f34d7959mr663752285a.24.1794011245960;
        Fri, 06 Nov 2026 16:27:25 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] pinctrl: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:27:11 -0500
Message-Id: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3YLMvOSSohzd4tKk4spiXWMzwyQjo0STJEMDcyWgpoKi1LTMCrC
 B0bEQPlBlVmpyCcgUpdpaABlM8alyAAAA
X-Change-ID: 20261106-pinctrl-subsys-361b22a4b107
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=kDTf9y+UELPGx2xKi0yx9abs7XbPUZFUrGvvsIFq3xk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWS8zkz9FG+99P0aIWcxOf2iTfV/omf/rJTnNKg4s
 HrjYr+lHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyEz5CR4YhvbvWW+7wt17a9
 Ps5X883+oftzg5tb7ANmLF1StleC+zojw3rTg9s+/2XKuveeN/aHclh7dXVs91ymL4zpv29zKoV
 dZwAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      pinctrl: ingenic: convert to subsys_platform_driver_probe()
      pinctrl: intel: convert to subsys_platform_driver()

 drivers/pinctrl/intel/pinctrl-broxton.c      | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cedarfork.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-denverton.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-geminilake.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-merrifield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-moorefield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 12 +-----------
 drivers/pinctrl/pinctrl-ingenic.c            |  8 ++------
 10 files changed, 11 insertions(+), 105 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-pinctrl-subsys-361b22a4b107

Best regards,
--  
Brian Masney <bmasney@redhat.com>

