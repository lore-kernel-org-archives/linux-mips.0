Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=81.169.146.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792956087;
	b=xo30URS4bYJUFY+HAsYYnOvBjwBR+LaWCZjDU5vS5u/ggZay05vjJkWPtkwc660cCpYT
	 VuZllhI60GsX4NoawJqer0Jvf3u6n1tYxxMAgZiijiasCw2iV30e9wJ8EaEfo7iuPcSQ4
	 XQXZTsCdJLi0DcDw5qgqtex361oRKsmZMDw13rJL2ZKr/y2cXiZYhFoV/y1SQV3VN9IAe
	 p2xKqomp0MP54w3d4dTNPWfk5dPPy87hr8/e9BmT8jOvKpYX3u+MwcuiI8rMu1zH5EnNy
	 2M/n87FoWP7aC8cEereSD0xWmUmSMuT1pdVi/Q2unX4BKSX7jRRRjlLz5/mATCMO/kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956087;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=ym7amUkoj/eAf5VsuWgJQ/VsZPGXD2axd9AY1UjnIKU=;
	b=yr0Uh8ZNO4v0Fu6uzEOZBGugpzwB88SQG0yw5CMHZqTjJutdCEou/Tu2zLQQENgbAaKq
	 Bp1fnogS/s3E+FKGAbwBljd+PbzVUO+1Kg9jd8IJddUpk2CszV52ridTICXKlLhVkpks9
	 uoEtgIePzTbVp60R8XMn6w7oZu5BKY4vr4VRComi4b5bGuXgfd4jJpQnsZABqCBr7lcy2
	 9jdd7X+wwdSM2Z3QaYU7icEmeA2A0JKs4ptD7xTSX8s6is5ipWoo8+gnrD5Iwcfaywwi5
	 KHnAGrdP6IY/K6FqgvgjPn1fb4YfHP1lvkN1igZBSnF5LkAx4Up8arb1mHNdZ1DKpRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CebhXg11;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=yjxuj4LB;
	arc=fail smtp.remote-ip=81.169.146.172
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [81.169.146.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C4E606A31F;
	Sun, 25 Oct 2026 19:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4C4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=CebhXg11;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=yjxuj4LB
ARC-Seal: i=1; a=rsa-sha256; t=1792956064; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jxVcrqdfeCM7hJ0A9EG1FFzWcw5dFzng3m7QYRBS+zQO3bphaeSLCzT0JJEP/2MoR+
    Oi5jZ0AQyuNbsJtH3J8/3LmC/6o7Z2fszF8Axvn7Fso/luljokJdnI/QUmfZuGIac81w
    AuKIDyGR1p2MW8u8wDJtOIHpl9bk0rK8oEQ2/odUhyt0EjkZOnGw6mYI/JAWOn6zruUD
    6j1uigeXKwQ8KCJAomw68fed/oSY42ljbFBsakLEoGADOkHRyn59sM4qrlGSfgM4Lk6f
    t4xQabrJPmexfs1HIOasrYS1Ih/TrDUvCAWFzyewF1sIl5ZfNjbEt9qzmDbLjFmGhzKk
    OOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956064;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ym7amUkoj/eAf5VsuWgJQ/VsZPGXD2axd9AY1UjnIKU=;
    b=JPtne6/A49Y1lW5yyvfQktBq1iTENbW7i3uPaPHFonF2IRPx8sc7JXWqXLwDnWEJba
    /axhJeEwWDIa9ydK2ItWbARe5gxYFkkvBc8HhMoy4gSkV92IE/onAvAvEoxO4KhZRw6l
    D4QieNkf9tJus7FLqghqMyyFykO0VrJn7pq4SEvT9Jt5NVXIj3BY9YNC9v4XQLc9CbEK
    IV2IzIvC3chAdim3glgSWJwsheEHWFPW8WlPlTG52K0HHWpR7ap/HbCVwax5KUzDbMu2
    xWTP87J6Y876coKr56lfoKvIgFu5W3VrwDbBx0mppD0uYzI58I8IqWB/4RbRLp2OiiZn
    PJlQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956064;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ym7amUkoj/eAf5VsuWgJQ/VsZPGXD2axd9AY1UjnIKU=;
    b=CebhXg11DYGq0X6FFdJ3W8cYOJRMw8dmDfTcf7DxwsUz0jzzDZgF7ZlqYh7rfeZ85a
    GEfHZStSKxF+dIe8ty+Rb7pvDfOyB4GbTdeHGKHQqjBjzevmpBhLe71TzhQpuW2Eiq3E
    68OCWjKwLeig8onF+hYmP/OKKoQQCBFDzFsx8IqW7mCXrZrXaUVAeWjYqktbFqEmnF1I
    KYinisu6y51RjLR6ww+KgXrZ9ktH6YBYOaYWcHkovXLDrt1SZX2e2G2TKUIlR6nZ0blT
    NNACr3hgx+VHv6NF75tl9xLzS8w+jlf81g0fiWQjrGGpjjlbBgDyckOYOoKJKOdCXBBm
    z8+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956064;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=ym7amUkoj/eAf5VsuWgJQ/VsZPGXD2axd9AY1UjnIKU=;
    b=yjxuj4LBWCmGSqQ6QSkcnGQh7jDX3E3HadAB96LLJ0+z+BnxmK7youB1fegcmf2sJx
    KQKPDAYTRsI9yjOF4dCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL3zRG
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:03 +0100 (CET)
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
Subject: [PATCH 4/6] MIPS: generic: Add MACH_INGENIC type and compatible for X1600
Date: Sun, 25 Oct 2026 20:20:53 +0100
Message-ID: <9bf853a84d24baf62d29049ad00f7bfe15e52ce1.1792956055.git.hns@goldelico.com>
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

Add support for the Ingenic/Lumissil X1600 SoC by introducing the
MACH_INGENIC_X1600 machine type.

Update the system type string mapping and add the "ingenic,x1600"
compatible string to the DT match table in the generic Ingenic board
support.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/generic/board-ingenic.c | 3 +++
 arch/mips/include/asm/bootinfo.h  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
index 1f4906875e7bc..d6b0e2523a191 100644
--- a/arch/mips/generic/board-ingenic.c
+++ b/arch/mips/generic/board-ingenic.c
@@ -34,6 +34,8 @@ static __init char *ingenic_get_system_type(unsigned long machtype)
 		return "X2000";
 	case MACH_INGENIC_X1830:
 		return "X1830";
+	case MACH_INGENIC_X1600:
+		return "X1600";
 	case MACH_INGENIC_X1000E:
 		return "X1000E";
 	case MACH_INGENIC_X1000:
@@ -146,6 +148,7 @@ static const struct of_device_id ingenic_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
 	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
 	{ .compatible = "ingenic,x1000e", .data = (void *)MACH_INGENIC_X1000E },
+	{ .compatible = "ingenic,x1600", .data = (void *)MACH_INGENIC_X1600 },
 	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
 	{ .compatible = "ingenic,x2000", .data = (void *)MACH_INGENIC_X2000 },
 	{ .compatible = "ingenic,x2000e", .data = (void *)MACH_INGENIC_X2000E },
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 2128ba9033911..2e562aa1bb198 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -81,6 +81,7 @@ enum ingenic_machine_type {
 	MACH_INGENIC_JZ4780,
 	MACH_INGENIC_X1000,
 	MACH_INGENIC_X1000E,
+	MACH_INGENIC_X1600,
 	MACH_INGENIC_X1830,
 	MACH_INGENIC_X2000,
 	MACH_INGENIC_X2000E,
-- 
2.56.0

