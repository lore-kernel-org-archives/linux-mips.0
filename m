Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5665D51DE1B;
	Tue, 13 Oct 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897524; cv=none; b=ahTiuBAX+bqV70tokfyU7rdjuFJ559f/3+vgEKz8H6HbhkdJeVUEBie1NKOuwKe8Xca2ZtarhnHy9ghk0K7GNP3F0SnPtN9yViBRJT/DdnJIToJ+1+gKvOIPUzbQdDmtCbo7h8P1kK0MSbNLbY3Zhqtf2BHVfYUL0j2a6btaGSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897524; c=relaxed/simple;
	bh=5sYEcFOz7zHsLvfSx6IFtHI0dSFNFIYlozlPRF4SANo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoQO0D7UdZjYG3vqpStCYnbJkynrGnry4qleZV+VwYeo05XcHwy9UhFvYSADYPgw1/xtTP4gT35Jv4BtJSre/3oHrZ89DLnXwrjP62b4rJ0Y4gKGyjjp/tgXlJOvLo15hExf7SnUTSJSyGyjzQ8ScGwYTZuGKUnBCvv6aHyR3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9DhBA4E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9DhBA4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9231F00893;
	Tue, 13 Oct 2026 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897523;
	bh=nO5zp9Bx1tsDURv0h0GM42QYZYPg1chbmHID4OosDXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b9DhBA4EH9lqOh1d/Mhh4eb7pt8yK+dj68AUKJN2bhxsY6/wrphxlhmVXADv/6Xii
	 ZliqXjrrw0rNeaJ2oblFexjpWZqJjTU7kyKEgF7jBYV5ND+bvYmubi0T+7vkxkAtlW
	 24WH0/BgIUg0DlN5SxsqkcskjLKEiRlWO9Tsg0KAvvqQkCYKcDXtaekH2vVTOxUOqr
	 EmFHA2qL+C8YHUJmePVDgzULLAMauIQLeKXa2sCbqoYLFE6jEQhWwIeg5L3NXXKIwG
	 bL5lm9V0ro0IhCQJ3s8w6GKMCblGMGCwkJ7T+VfmYTzwUdrvLlkdqHUjYC6+yYhani
	 TF09icwAmlETQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 06/53] MIPS: Xtalk: guard the widget identification table from assembly
Date: Tue, 13 Oct 2026 15:16:26 +0200
Message-ID: <ede0585e1fb9d89aad89c626caa28a5b98b72f42.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only the constant definitions in this header are usable from assembly;
the widget identification table and the struct it is built from are not.
Put those behind __ASSEMBLER__ so the header can be included from an
assembly file.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/xtalk/xwidget.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/xtalk/xwidget.h b/arch/mips/include/asm/xtalk/xwidget.h
index efcfe4494576..6dae5d9628f7 100644
--- a/arch/mips/include/asm/xtalk/xwidget.h
+++ b/arch/mips/include/asm/xtalk/xwidget.h
@@ -112,6 +112,7 @@
 #define WIDGET_XBRDG_PART_NUM	0xd002
 #define WIDGET_NULL_PART_NUM	-1
 
+#ifndef __ASSEMBLER__
 /* For Xtalk Widget identification */
 struct widget_ident {
 	u32 mfgr;
@@ -195,6 +196,7 @@ static const struct widget_ident __initconst widget_idents[] = {
 		{NULL},
 	}
 };
+#endif /* !__ASSEMBLER__ */
 
 /*
  * according to the crosstalk spec, only 32-bits access to the widget
-- 
2.47.3

