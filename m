Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C403C945A;
	Thu,  1 Oct 2026 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871206; cv=none; b=HxmdtRZYEgbYwr0QTmGxC9l0eKpVYKoISYmv/cko4cwyyiGmPNmF+uFETpUE6InLirJFGaW5A7ZldkkL4Rus7a+P/1oUrDckjuuIWyXt3JDGdihbMarEZwG0F8HGdKjNprirqDd+q44ZRGOcnrg05IatwZPuptW8uqa6+HKxMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871206; c=relaxed/simple;
	bh=5sYEcFOz7zHsLvfSx6IFtHI0dSFNFIYlozlPRF4SANo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXcs5/R6tmqp2XiDwkz7uguS24r0WZIX96WXDEbE3qO80Iole76uISaXP3eMm9ZqfVDpaoMPhjiuLOMK+tfnNnYKnGR+MntD3gtN/ODR4CTZTLe0ocF/x/n+hk9O0RZZ0A8ldKJZ05as9yIjZ0Zby/wDNl5uKursIM0pEYJVkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/AfBF2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/AfBF2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2491F00898;
	Thu,  1 Oct 2026 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871205;
	bh=nO5zp9Bx1tsDURv0h0GM42QYZYPg1chbmHID4OosDXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e/AfBF2z9tRfiin2Vqc1CRvdARSeJ/BpaVb1ej9Zy3Pa2RsIF6w6l3ARra8/XtZUZ
	 zVAQrHLAqd2U97leLajUre5kPzU9gRUTIWxC0OJHMWHWmISgS7oouy3nm+2a52czgY
	 iEV5arsldXD2TWNQgLuQMB+GaWftRFSpGLeMPQZ7oAxxZ+SW7wGjTnG/AaAt4zSd6q
	 7ZjGbewYf0HKwRf5wPZHfV7JYKg0AEo+dpvpyjnaqOLob1O70qxUPoos6HWQ8JZSgg
	 1XnpabAnCAqEf5Ej+rYThjhJnYH79gcJcU4sJkCy8adIsLW4but72Y8qkzGjuTIenf
	 MUyf70RRMH6iQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/38] MIPS: Xtalk: guard the widget identification table from assembly
Date: Thu,  1 Oct 2026 18:11:36 +0200
Message-ID: <6b5203f0e4fa89718655b74990952fb5cf83c4ab.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
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

