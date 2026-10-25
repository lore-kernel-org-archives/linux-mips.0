Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792956088;
	b=2hb3EPk8ew+u/xRDI3eRlLoD9Tw9CCg9Icpv/GOeigpBndXQc0ou1EaXu/nkQzqrZ3tx
	 TiMRKCeUfeACHeqFtNgba+fk7mloZlNGuLnb1boF2q6OmqPUSsZLn86j20k59zBijy1NP
	 NRkQGPycr9fEAdHeR63D9zme5sUzdpcQgxdsOTmKQkqy1VYdgsALJ4jdR02P/KK33klL7
	 NWXKBGEPIs48RHFZD0sY/C0B/NrBdn5Vyh+0D+bH9an8VR8/lBKGPiB+iUeGGONqSnbW6
	 sHnSupvvkSrJVJmcGbAZrpC7jeNstx2dQcC1bobcKpFHqrHZ5G0r7xL1IZl9Fq3jHlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956088;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=ZJpH6bbJBAkEmGIUPTjQGSC+CRNYnypVz3jKbfhgLRA=;
	b=XtEzLKiPTZbB6nxB6M9OfvbPlJSIM4Sqz6iL42V5WkBp4TF3G2aIjLrpR7OVwXQXupvi
	 a9OxLPIrxTou2JwpbgW9LrrQXn3QTnMkcCR0z3C8j2mwTjCgOYeTxajzo/tcXNFs50svt
	 J4FwphYWkuD8U/StlqkE80XwtrDGFxiZMDJiyhSttCMSfixEFhEH8mYIcR8gz0BuXxt+8
	 1CNeqP0i8/uFX/w9sz6ldv/3tWa8PjDrO8erYBI+0nFkyFVI+qI7hJza4vSmShtcshMDg
	 RVdWE8Nyn4QFRfcwagHr5c96tYcyX0xqsHNziHITyxOytVeax386bvgg7JrKqluTw2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ju4b7cs6;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WKwlRURi;
	arc=fail smtp.remote-ip=85.215.255.101
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA541606A320;
	Sun, 25 Oct 2026 19:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA541606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ju4b7cs6;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WKwlRURi
ARC-Seal: i=1; a=rsa-sha256; t=1792956065; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jMXouVDYDi3hGsNpSS/YPKlhRtinAplHh25ET7MYjUtlF/l/uG9dcoJNrpjSHUMk4g
    9TvWPq2zfG4H3xSFlbNHHxp4/1cfP/Enu08JUINQiLGp9Q4HzMCxAo8FIR1GOEOFdHGQ
    Elyk7RQikrGu5VuaiydCV1bsFBvjkHJW/k95W+w/Bh6p4r6KYQtjHyqRm2Y+wIxUEa1c
    qV5H9SwclbCB6gfKrM0iCAo4m6d2o9nnQfAdj3uW5yD8QhDWxy16Jn4tSet+/qT0RGF9
    Z52MHtPKGkIETNYU5sBu4SNy6+BhtcdHI0ekGKDfZrpXCCdW/SuGycFfqEcz8u70pDQF
    4D0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956065;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZJpH6bbJBAkEmGIUPTjQGSC+CRNYnypVz3jKbfhgLRA=;
    b=UME3styFYbKhhfbTXYiKuR3rIWXMqUY72hNHdzDx6exc/3GL2x8MqzmJ/6AdCWULGy
    DH1CoOr6ORYeIE8bOO52n2rkSMIxw2hFOOaXvuPTM+EGjVWj1bspTFsRvJ5icdPZNmke
    sRmjoyfppYoDdlVZLdaSXIIvys2F1s1JHzLGArxeknOxhM8CJTx8q8EplgY8s1jTVgC2
    kp9rjxX5cj9/FvFJvg74InpQf5E0aJl1JjaGKKjDeqPlEMBNq9y8UufDVXlM3/Wx447O
    guhn5I6+BBy0BJILU0R2ATiT+/GSOV08xq9SOaITgxY4MLWgAtD91+KQhHLemivoU5tN
    ++rw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956065;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZJpH6bbJBAkEmGIUPTjQGSC+CRNYnypVz3jKbfhgLRA=;
    b=Ju4b7cs6Z/RzbskE5iVfChLjuUmWXxDjTHyfuD1/bijr74PI1oThe31gdlIAoxfyZr
    9zWqNxrctnL1ELBlB62ZOUMbqzRC9kKte/swfVcqFUBpTDXvd8cOCWreTgJ0nrytXdoL
    a98AqeLIaWJ4zAIg13GvVciX1UV3U4UvwKgnJYT3jLB30xiK0dDuEnRlgrvYEItu/lKu
    vsZercGZnvg+Dhu6Sv/XmZkXlD/hF0g7pLl4T/34kck+hGY9wdgBrXTw8GKxtVqZdKjK
    fGDTbn9yPa3iJyOJuI2spYXf62fRSU5V8E3Z6tG6pMrzzfkRFNQSj0LZ2A6EYNstY98/
    C3cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956065;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ZJpH6bbJBAkEmGIUPTjQGSC+CRNYnypVz3jKbfhgLRA=;
    b=WKwlRURicBHk5YLVb2TvOJgZs7zEXc3s58d3fDE4IfdRjzL0WvJe9ZwpfKUrIAJ1vZ
    QSYZEmYqwlEbCrNOKtCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL4zRI
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:04 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 6/6] MIPS: Ingenic: Add Platform makefile for X1600 and X2000
Date: Sun, 25 Oct 2026 20:20:55 +0100
Message-ID: <35603febc7f146698e5cd68e87e9d20e55e629db.1792956055.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
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
Content-Type: text/plain; charset="us-ascii"

Introduce the arch/mips/ingenic/Platform file to define the default
kernel load addresses for X1600 and X2000 SoCs. Both platforms are
configured to use 0xffffffff80010000.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/ingenic/Platform | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 arch/mips/ingenic/Platform

diff --git a/arch/mips/ingenic/Platform b/arch/mips/ingenic/Platform
new file mode 100644
index 0000000000000..1334e8c143ce0
--- /dev/null
+++ b/arch/mips/ingenic/Platform
@@ -0,0 +1,2 @@
+load-$(CONFIG_MACH_X1600)	:= 0xffffffff80010000
+load-$(CONFIG_MACH_X2000)	:= 0xffffffff80010000
-- 
2.56.0

