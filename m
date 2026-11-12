Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509155;
	b=IHsJspBlF1sWsapgqK+00SC2dHuxj1KOkgoORKIQpyXRlzTQZ0a2b1Oo6LEE6pURu/7K
	 YLSyAFglmOIm1CokA2BNT9BtEYPyjvGDY/e2MDii4e/wYsVytcD7pTye1kaaiUiymDPyL
	 njps3CpU4bjhXkZNXjsGv3EoDWLpqnkaafZz6UXp2VKHpfojnJaxyVbBNPTfPpIy91tBD
	 lQBxRqCYJjvCey9BoiVzEERFnOQqRZUiACGyNYnMCTtYJ2b90LzqfWkXu+g3WC2fy7N90
	 5bfRSON5YmCV4VKph8PpZxYy1Rvwde+Y5XJh+Y1iKSCPHcf4Mp1jkfm6audiSU8BU9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
	b=WzKByMAPpZ4V5fBp0nwZF0O1D0gP7UjJuuYaa6I3AzjBgxgqRyQV7rU7xCqxe6qdCtHx
	 ks0QBm9/31gFDC2mWV2oZ+D38u79yclNdCSUZxMu9Kfym/PZH3JuSFxsIku8dvBqCJAof
	 f+nqwJTBpyZXb2LMS29GTf0jUiW+BUvS2UPjL9WDa3a8yRJl99hIxwReUCKDByeepbpGH
	 PxYodkGYswUcIaajcAn8SNYDi78XDjkBqPsY5wzWawJFICMJblXj7p29IFzQ0RGhuFaFr
	 wHslrw1zUuiclmVmfK9dxxxOebW7wmLLyiBHYU7/EdtrQe5vcCn6Lh9afGhP7wHE1xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kB+t9uox;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CDA606A880
	for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57CDA606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kB+t9uox
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3791619605cso386518eec.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509153; x=1795113953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=kB+t9uox/Lo365p9L1SC/s5gJVbFEwu1GOKo+8BeQH3MU67XG02PxoSWJvsD36Uo1D
         Cb2OmVFqzBRiWx2v7LV2cfIWeTG/rK7SyU0BN4V/Ky9G7Vsr0D1Dqccbe1/QAWY/8jQp
         MjxDAlUDqwlADUco0XWOm+FEHQRfhV8PSs/EVFkGd49PIvAvZtQeFT5qRwDnGKvhx0sY
         K9p3ju7oJw1iIgtwVia6zlTmpiVB9EwnDisbcZc+AZMUy9EIQjH6/+ueTxbXvpevQ/xo
         k5CZ5otpSHojdbA4519AopS8nZ3RyfisMpZKKXi7mqUsWmhuquCIHF3hQE1paxUN4jAR
         BS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509153; x=1795113953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=CoxotgcfQhcd7r/nPqR2Db1PziGUHJS2VR1+D/2HJpfCBKI+u7PssytKOw0b7WW6Vp
         dwdLg9ENaQgPVev3VsYOdium9IQ3sYo0ENvJo82I6sjKCMFnTV55r9QYuv+xVEAbwXoj
         GL65i6PXXN6Zd6tITSp4CaeeRIy/zWPd5Cdk2JppHbGkriA9nYYsrcam/9tfzjSXnpEl
         n43leOLs4znt9tuSbbqVCQtseoUpx73YSDD7fmYNgv29pKJEBBsgoPaQbwOmfWJLgOs3
         Hj65O2RDoFY6HNcLz52pqMrI4hbEy/oLfHHx7jCglZOG15Kttjd7KZefJOemaurUbWIs
         McZQ==
X-Gm-Message-State: APuU4Z9xS5iBmcP0HkQayWeZwdxHE/SaKtaE+3mn1llGmqp4OsT54y63
	EehMU2Zksgoilxcs2NeWz7RXITj9yt/PqmmVogkr4rMtnHhwYLbJX557OpP5zg==
X-Gm-Gg: AYBFou0IYn83tRPpmUieeUoTZwEI0zfbuyqOOaC1dIfyYqp4a4D1ve5zOgVse++w7IA
	4jAd2k67TRVGnsW65zKhaL3gvhcjlldndgpfl/gf0LBNk49+uPydScQrRF3CLS05KawA7osC/HJ
	/LhaMiWQmF+j841BcRxUx67qKTKi2KTn7xvBqOS5E2glEMt4y6AsOWkPhLDECjbAGhsmAUEwvDR
	oGWfBNXI7SA2dlc/iPPH+ilGNiYevIotcXWsAL8Svs9X5MnGGOK9YqbuYgscQG+T2AlyK2kJUU2
	9ooB5aohoeijPSFtYAxVMPuNEOKXudmbi6nCKpeZZc33zA9JOuvPzz9Se7RUWf5MhbeSrsfw3wh
	qiEV9OnRh5PNxy0VhQpZzDmepXF95RIsqTcNCm3mTUXXJG2Mjf4Hju54FVmjkMjQbG+26Asst34
	vkSlxp3L1sPxSsu8NvdNRWOpDBiibKh2K/uIcDb8Y8/wZ7kGbjgaoFJBc/MGc7JcLuEZxkFcQUD
	Ao2++3gIpfNEL2nEKd737DHepKtI52WRzHwnZMttIXVs1wWM7QH+FQyPR6oM+X8ovv1zzqFyJpq
	HuFbGpPn8tTO76JwIP0iG/0gFcdj3w==
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr40367eec.8.1794509153074;
        Thu, 12 Nov 2026 10:45:53 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:51 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v4 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu, 12 Nov 2026 10:44:41 -0800
Message-ID: <20261112184441.3724150-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112184441.3724150-1-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
-- 
2.53.0

