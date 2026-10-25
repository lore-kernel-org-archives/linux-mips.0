Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918007;
	b=ZkmkfXjnNKrwj6b8MMAsLkaY9rcmvkt3wZwuZwYOVNvCqWgn21p2vLSW4TWLB2mcrwU1
	 kkmpEzY565BCztdlEvCjomAeUFJGHFx/cE0vx0v4TIBBwM+lVo9Y+xtM7WBgRdTPk9ASD
	 CxYcNRC18oOeJVcOMw5BGKR08ayFiBgi9QLZTKk6nCvBUnphDPu4flrt6P8cg3W5/GIpL
	 9mY4Cog58m6MdWjob47IYNzSruJ+plR4VvNX2FFB1VXnMajFoOVIOj93P83hJkhy8+Lnl
	 Vwxt7IuSK8Ji/Y+HY0qLay3+AOk8o/iJbd28TloLT8m+7HQPycP3kn2c3mW8liZJxIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
	b=fUUR3CMAAmXvxj5WZTNgrvPpT4r7tN9ccFEXZsShrBPImUwviA0Od6OdEN66jUk8NB4a
	 RrSjsV1FFIM0RV3hPm6nTgM17UDrdLceZadB3ZM86cnXjGBfY8uQXjtLE55o/Ps+Q3BBA
	 WZAbUmCeHGG4bsOHjGnmY0ZtG/wSSiN3HyAr3Z501yncXnj9LOGrY6Z6GvDkxOQJOiMM9
	 iLdJ/uuXTc+6P1hWevMdhG9VWlD7NuXHJ1Ni5rHvOondCndkJ27cBOsxtvHnK6M1MDMS0
	 sVxzUmDnGRk89ncYfGUN+RiUWbdvLSvfQaAo26Zgoim3OHKRwLub3fU5aRnU1hkczng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sacsCAWC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FEA606A320
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 08:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79FEA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=sacsCAWC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso21671695e9.1
        for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 01:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918005; x=1793522805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
        b=sacsCAWCmrTu09sFa9ikOphxuUASQYHVKM4+sRpN3oU2QRipbZ2KT7R5klNZ5NVSpn
         EYF5PG3vg855Hpev/RvIRupc+rfVEAop1PtZf3N6dLpU/awS6cMRWyb5kX5ze9FLkXez
         /cl7HIK7KKreXDACoIh/vIHGt+861Gq8/SJxYtxH6tDT8K+4K1mGRjaT19l2kyPzuBXB
         8fYRtE/ENWgC2UL75Tjivj2lakzHDNUKTC+zfGGZXs/a1A5RrutEubIuqHhCXlbXNpT8
         /UWaI/frABxR2jsybSGBrdzxNo1MseEPckhm9FS910fnwZWfNR5IMMi7iZpXEjqvOoF+
         RH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918005; x=1793522805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZJtOePkQrLq8/ateRl4kiNkEI0jrsHtDIwcRKpyDC4=;
        b=CWVaRII73ukPuQORDRYAfFnD/8+OFzH4L6FDA7K8ZZD/YLqYmbHARWP3GwinJbRCGH
         KuDO6daSeud2Re1iRcTdq0kL6C4xiT6Yra6TGSckagfiNfAuzhsfRfbx7h9cR4bcA+sQ
         bodxSS3xzJUtGdyiB6jDbA3/wtB2LCUnlM6djz+W8Fy2JlqKKm2dkcjO+UJsqebD0aVn
         HtiYp35a/hkD1ovQh5eKd5CkWsF24e+Sylk4o9DsaTm+Csb33LqdWYqR17XhXmfJlCt5
         2jNrT+2E0loFhLJvEK5aQnPGH+02pr6NgXQb6ODhQswBOasxhGcyy6nML6pi5XE6gmaS
         fBqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU6Z02osSK17jZ9nAOuG1rINGuPHfyvWk0ONXlDkwUPN0fkAI/gma2ngSBeCO+lB9ejnSEgBwAoQrd@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Gf+ixC40ZKZmzuj5nKsrjzpCgTBq5e4i1BZq45QqcXyRAara
	BvwquDWnV0Nskrt2CngtFdkq0msu71nnZVaEiRYdHgoH63EZIfnllu7B167YoNLy0Mk=
X-Gm-Gg: AYBFou3aNzuo9zfDg0JCj9vmfZ3eKLJf6dIKmaWjeLy2KzxLKEqdWZuzAXzYqvV0vP4
	MjCIWLAOIW/hhOLfIrpXgFLG1vhke6iXwauR5qKY+8va+sZjsrS5gc1g1SQuPjbUElGPeqeC94e
	UNuKK5d5dDq1ZRDwzDMl+/VC1HrqBMoavCs/CBjWGAdW5U6f4Iz09tii1wEQzIfSL6KP7jD0TMO
	ImwzzO0HdvoP3l5r5gk3f0XLSNRCV1fGxi+EntKddemvwBCff0uhg5B05LGNdUB4ibLSkz94GFd
	DF0E9g8sD6caAQ6BDgS/sIvC8xexrsGnbaFoN6zilaNiTARn74B5rtNRyNxeWmfuFVym9U8PTCj
	RUCUIRu24AhuVJspAGiMEKD1lieakqU5K7yUM8U3oi3Fq8fpzqX9pqYrtYHX4OHO8giPdxURWHu
	EUt4WsVJapZmLTXadpLw2jDTtDXUobOju8UAi2FPTd76L6lTi+3i/TMsrQKIt6kYBNYV0PvRlrb
	iyro8RBvrz55UTczHXahEwRYUwg33CFb8L05jSg5hh9JrldUqvk7EOPQU0BZHZuritvIO+bLwro
	ZJdvPitK5qT+J5RPFATdMSTakTqzoMq68TGhezKBHfvqnaA1PD57iXsdXH/zKjlxw0ILLKs4XA=
	=
X-Received: by 2002:a05:600c:524c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4a35ac8c0fdmr68412805e9.7.1792918004829;
        Sun, 25 Oct 2026 01:46:44 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:44 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 0/2] pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:41 +0100
Message-ID: <20261025084643.93167-1-olivier@mgcrea.io>
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

The Ingenic X1600 has a PWM controller of its own, separate from the TCU
timers that pwm-jz4740 drives on the earlier Ingenic SoCs. This adds its
binding and a driver built on the waveform callbacks.

Tested on a HiBy R1 (X1600), whose backlight is channel 0, through
pwm-backlight: brightness 1, 25, 50, 60 and 100% give the expected high and
low counts, 0 and 100% switch the channel off at the right idle level,
and an inversed 250 us of 1 ms on channel 1 reads back as INL 0, LOW
9375 then HIGH 28125 with the clock divided by 8. PWM_DEBUG stayed
silent.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time.

Olivier Louvignes (2):
  dt-bindings: pwm: Add the Ingenic X1600 PWM controller
  pwm: Add a driver for the Ingenic X1600 PWM controller

 .../bindings/pwm/ingenic,x1600-pwm.yaml       |  47 ++++
 MAINTAINERS                                   |   6 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ingenic-x1600.c               | 260 ++++++++++++++++++
 5 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ingenic-x1600.c


base-commit: 00e917df050d79ac26ec700717680ad6421d2808
-- 
2.54.0

