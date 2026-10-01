Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778048F83C;
	Thu,  1 Oct 2026 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871213; cv=none; b=pjY1KSrCB8u8peEptSEpOVk1pehbgwa+csk4eyZaA82/fBewN7gmgBmU/g5p9/2NHjxg4WOf4PZhzf15xkDC8an7UZGctW3UbZ1PXDGamtQvI2J3x2bUfNIM8/wXiuh5D43NV9ODZaDwkb5lhV7pxKVwX5sSIFo3WxUsdQXnV9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871213; c=relaxed/simple;
	bh=4W3pTcVgYMqpv8j4cpuixLm9Ru8+ENegfQ8zSxuv7vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/qYrrUe3heUoDkEaSMRPCFO/pFYcw5wdrrYNebJR6YtmjZoP+UL2F2m5UflVCWaiWM1VYZ7B1aYKQxaNMiBj7BqB8BqI0Rn5aUVqLlFKPO8ZBZYXV1JIFRQgybbpHE5JyhZmHcPJfdcUYSTnQ3F/c28Vdww/XVR94nWNwu/JlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRlX0atA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRlX0atA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271ED1F000FF;
	Thu,  1 Oct 2026 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871212;
	bh=BIfgpQReYP6KjCNcPJHj8JOkUxH3b9b7suJ+Bq7Gr0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GRlX0atA7tOObJGE4LiiYfoTcWgZntJn8yXU25/d4hTEUq+9qNFlHneNYHA0fh8Mk
	 9bIPlylU3+AbInjbJEBO9wjFWKP07+WhkRpByLfr4AJY8Ixwtnb4UyoJTS7TgEtEwh
	 Hjnw/RxLrvCBaYoMQvHX/GqKHzcTptn73TtHwv47TaweNLGF9BJqedCwqy4rnSHcgx
	 vLImdj380oJHxRzQs5wEechPD0COoyyhkNuV9WCUxi3gxr1JwIqvscVBeS04z6yGyF
	 WZCrEwr5gLeTkM9YsUo9bXy86iMnX9cR1K5UNqi3cCALQJnZY/cg75sSs+bMGwfwiN
	 7K1JwY92fqqAA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/38] MIPS: SGI-IP27: widen Kconfig for the Bedrock-based machines
Date: Thu,  1 Oct 2026 18:11:40 +0200
Message-ID: <4fc16d1274a57ba882209f0bdbae416e88e0e852.1790857966.git.kaloz@kernel.org>
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

CONFIG_SGI_IP27 now also covers the Bedrock-based IP35 machines such as
Fuel and Tezro, told apart from Origin 200/2000 at runtime rather than by
a separate config symbol. Update the prompt and help text.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e2eb9627bd14..eb291fa7fd08 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -757,7 +757,7 @@ config SGI_IP22
 	  that runs on these, say Y here.
 
 config SGI_IP27
-	bool "SGI IP27 (Origin200/2000)"
+	bool "SGI IP27 (Origin200/2000) and IP35 (Fuel, Tezro)"
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_SPARSEMEM_ENABLE
 	select FW_ARC
@@ -782,9 +782,10 @@ config SGI_IP27
 	select MIPS_L1_CACHE_SHIFT_7
 	select NUMA
 	help
-	  This are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
-	  workstations.  To compile a Linux kernel that runs on these, say Y
-	  here.
+	  These are the SGI Origin 200, Origin 2000 and Onyx 2 Graphics
+	  workstations, and the IP35 machines built around the Bedrock hub
+	  ASIC, such as Fuel and Tezro.  To compile a Linux kernel that runs
+	  on these, say Y here.
 
 config SGI_IP28
 	bool "SGI IP28 (Indigo2 R10k)"
-- 
2.47.3

