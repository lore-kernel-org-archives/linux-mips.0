Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910773;
	b=znHIQzyk3uWaIKq4fXFBalXd7hRF3QrMbdqSNZl1oFV9CCdLVP5a622oPpkhr2kurUMs
	 fhdcsf293jxU35YoiIaLGcmegukYlmRi3blwgLOx/XAcAurGrtyW4lCN2La11qw+Xl4B5
	 /yKHeb76+EtWeyEU+owaCzJlOO5thY990gFA6r8/QcQ5lDYe/FM2ikaRpAXoGQ98bBlQr
	 NDeWCjS0T36TtDEponyoArMVImz349Fj2J2rdvxy9zE9UTKeECkX4ODz4fa1Mrpvn12rh
	 fr2qpc6C6KSumoKcdGMMa0Ftr74t9hyG87IQ9lRE7OWn8r8Q5vIZbqJ5fuFGtx1he2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
	b=giI1qdOdxP8S5XmBHTPe2cS8Yuy4y73rGFu2lJR012/H9ooZc9vFPZMLjp4pjuvpXnEz
	 vNg9K2RdlLQJ0mlt9QBSYOWwMgZ2H30Q6Gh4s6fn0upPI3ccQpeVRKPCDxIDQRP2DCStZ
	 ke1CK+WxsxRKLh2vTOLUd6q1gRL6omfUxsHAuFQB2RD8XjVh/3IdqDSHFuKsyGFVIAV7s
	 kJXWBB1wP/YrnVN/RHO/roXvgXJaS4fTu13IPpy9k1dQpK3Uh8HbiDCMmfUnbIGajgL7h
	 Dvf39niQ33IyvQWgCC6LR9FxgInh1GXmZwnwPcIclV34hnthP5Fl8BRtYBN/JEs8y5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbfReCaR;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2187F606A334
	for <linux-mips@vger.kernel.org>; Thu,  5 Nov 2026 20:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2187F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbfReCaR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso3143506eec.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Nov 2026 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910767; x=1794515567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
        b=CbfReCaR2ox7msv4AJ+5IvKVxHvt7xkkGjz4AN3ksoA/F/C0jG0H8EY77tTpQ0g5CZ
         tUE2XHB0GSv1rHmE9fquea9vp6kx1iDMVBOEr5k5o4NOzNGI7kj+Au5QoHHcKDrSV17V
         U2HSz7rLAVl8PIhE+24Cf/bot01Ab0ciACiavrXgbWgNPXISvJauopLPbrNSgPUZYz3d
         MdaJJyhlYWGIiEAWLw+gQC3UvQr30N+DNF/SElDvrKxjcMGLYee98mgO7QgIwvY+rlFm
         T1TEt2W46CA0+ERiKrv74KKG/EH9hNyXnrh6kE9iZ9GGX9nfFndMWzX8wEQC8ylDgiFf
         diQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910767; x=1794515567;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RHnOXVW5gLhU8/6hqpC+igJ5vKbBKVncZKaS2VIdJ0=;
        b=1I8ucCbXU32+rZKcGeg9DJsHbjOoVl0GMz1tjDNfgX6HiwLExShbdDYjzW3uTZGCa8
         fqNXRsXsnV2gje2K52TEmZQBexIRIhV1KYgN9Thmol6/o3r0En8mb78PZaRnIIogHTMx
         Pc3YmS/17K4f4ySAtzTEcHZp5HxDjsDA3K8TqdzaczN1PbcYajAvnWSd3U/xu8BqrOe5
         4Ic5dE1SR0c4VL+Hu6tpGpn49IzHUlTXNEdJL0yGcnl2HDRiW77ogtkR1lO+T/FbT5KB
         XWZvY6NAuOmoVrkQLNUBsh+WWRCdLnl2kFzkV9zsGeTYsOxDXusxt6dgD4waAkF4yswH
         RANg==
X-Gm-Message-State: APuU4Z8SUDf+Vq0l50kg4sD9i4hWD1ryPYt6ZS/GxSy3YUku11zBlw5+
	JhShAUQeU8VVl7ycY8R84RwfpAhTT6p3rgb0l3xjnm/XEYus6/rn0BoXpqZbUQ==
X-Gm-Gg: AYBFou204+ZAzJiYg9NQvCRMMqezNQM7RL19mzn/6113ufdMKL1/ikzpKJgswwfOy42
	y0wUxtC4dAveGfXsDklT8YpzL/jordRJQVaxPFl2II3Aa9x/KCyq5iJcSIgGap5ONqasMYw1tgo
	GS17Hre2z0a/GpYIlpCHrisYWRA2ZdJFS16T/YZak5gSgQtT+9fN+CuSxIlvnk1VInnMmHFVpDn
	7/8iXYt0iJ1ZCsGkV7WJn6ZnhdVuusp5pn/BS8ACj8hwSsfqqNIoJlaP7p3Nmf9Rta2TdgJ6pqW
	XMocR9BZO3i/ayl49gXDLt/8tt8shRRLZhuYTtVdqwKk7oaL5+pKE56/zV6ozQuRqaXxHs38tcZ
	XbwN1CmHlw7xdmCoIPRK0qbho5GBFDlpw2K4H112Ui1sKnGm+XSvmM0J4uh8LDJg6lz4tCqvojI
	81GoTYHxb3bURAVzkhJloy8/w36ZCTdkMg5cl2JcfqZARgbURZZrknznEkf3hKzON80HcxtrOXT
	VK9kT55vFUpc8HSwPyRydIgjtZf+NR72GBkChOIwFZOja6O/K7QJIfSLZGIzmsRmltCl+0YHmiH
	jPz522xf
X-Received: by 2002:a05:7301:4145:b0:36e:20ee:b297 with SMTP id 5a478bee46e88-36f752549f1mr304325eec.6.1793910767172;
        Thu, 05 Nov 2026 12:32:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:46 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 0/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu,  5 Nov 2026 12:32:39 -0800
Message-ID: <20261105203243.2292647-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This patch series resurrects SMP support for the CI20 board. This was
submitted back in 2020 by Zhou Yanjie.

Florian Fainelli (1):
  clk: ingenic: Poll JZ4780 CPU1 power status atomically

周琰杰 (Zhou Yanjie) (2):
  MIPS: Ingenic: Add JZ4780 SMP support to the generic platform
  MIPS: CI20: Enable SMP with two CPUs

 MAINTAINERS                           |   1 +
 arch/mips/configs/ci20_defconfig      |   2 +
 arch/mips/generic/Makefile            |   1 +
 arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
 arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
 arch/mips/generic/ingenic-smp.h       |  20 +++
 arch/mips/generic/init.c              |   4 +
 arch/mips/ingenic/Kconfig             |   6 +
 arch/mips/kernel/idle.c               |  25 ++-
 drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
 10 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/generic/ingenic-smp-entry.S
 create mode 100644 arch/mips/generic/ingenic-smp.c
 create mode 100644 arch/mips/generic/ingenic-smp.h

-- 
2.53.0

