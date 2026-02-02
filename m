Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F15433E7;
	Mon,  2 Feb 2026 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770005792; cv=pass; b=erIpjYjoRgylpMSzn72tB86uJNVumySkn3zXVHIBHhhB5NOfiSKIqkd9et5kekmpEiq7iseMw2QXZ2V+w5I+VoKeWtXUDXFOVjxnWvUjQQ5Zw4ErLNGo2Y484IYHE49iVu+yoPS+SzwxHQvn5w3FyRi+UK00uaZ7QJBdSbHqgfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770005792; c=relaxed/simple;
	bh=ZWjXvtXJmavEPme1yhEkAdrivjvl0QF7pH/d0u/djK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRpropyqMkpi2gXErXW9EEMPLvG8f2gzu7IAXAtN9ffmLcfvVSMM47UH3L1S9xAcq2vhmmbye+1tdF0aZk5K4frvFOzXF0T1ZkYJwdPygOuoTlEgdRiqGqO13u9QSIJXdxEFAKvUuPmGTdAWKo4biQ3DHxqnUlHG6lexTIbCK6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=GFAGfaAx; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="GFAGfaAx"
ARC-Seal: i=1; a=rsa-sha256; t=1770005783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PcwNxhuY8RDhI7qUYv0n3iHcI7zd55zqSN9KnoPlTSASvzVKUdmS9dzyWFKf1W5DszSBdXJofMEzfZw3KIGOryheDnQopa5TV0g7MFPGg3D/lx6wVWPzXI+1sKtA0N6QwnuLIuoBWSCG5Hv8LKksu0EqgGsChL+7w5lu/25sLDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770005783; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vnTBD4I5pByH/16LTOjh7TLZjXm9Qw7CMDBFwZlX5cE=; 
	b=MvBCSAtnNC1DF5A12aysOm2l5mxaQn7FpJLeZuQoOA0JJ13BmH9yyOOINuXFfFaXxtY0cEGFFlMKPeZyo1njqu4USUfmujwqC4qokM0G2eO5vYV5KZQDQaJyfeaVExjYMDyOJ//0uoNe9QZyHv4G3IiWHUFz/F/nKBtQDmnlehc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770005783;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vnTBD4I5pByH/16LTOjh7TLZjXm9Qw7CMDBFwZlX5cE=;
	b=GFAGfaAxkLj9OJg1RQBjDxdq8Fmdi6hQHC0vdD/2CURfOPDiWZKVZ9TOd/XXzaR+
	ge0O+9KdSNsoBIzTGCN5K5v7hgf1SYc4DghXo9xCRSmaXUHMpbXnCwUJu0eaOJAXI2D
	dMgyRQohD3x+peifXMdsuz7eUkrxRuFtEnjwDtLs=
Received: by mx.zohomail.com with SMTPS id 1770005780475652.7393839545148;
	Sun, 1 Feb 2026 20:16:20 -0800 (PST)
From: Yao Zi <me@ziyao.cc>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Yao Zi <me@ziyao.cc>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Date: Mon,  2 Feb 2026 04:16:10 +0000
Message-ID: <20260202041610.61389-1-me@ziyao.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

R_MIPS_PC32 is a GNU extension, its definition is available in glibc
only since 2.39 (released in 2024), and not available in musl libc yet.
Provide our own definition for R_MIPS_PC32 and use it if necessary to
fix relocs tool building on musl and older glibc systems.

Fixes: ff79d31eb536 ("mips: Add support for PC32 relocations in vmlinux")
Signed-off-by: Yao Zi <me@ziyao.cc>
---
 arch/mips/boot/tools/relocs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/tools/relocs.h b/arch/mips/boot/tools/relocs.h
index 607ff0103064..942981d9ce73 100644
--- a/arch/mips/boot/tools/relocs.h
+++ b/arch/mips/boot/tools/relocs.h
@@ -29,6 +29,13 @@ void die(char *fmt, ...);
 #define R_MIPS_PC26_S2		61
 #endif
 
+/*
+ * GNU extension that available in glibc only since 2023, not available on musl.
+ */
+#ifndef R_MIPS_PC32
+#define R_MIPS_PC32		248
+#endif
+
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
 enum symtype {
-- 
2.52.0

