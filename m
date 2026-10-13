Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA32051FCBF;
	Tue, 13 Oct 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897531; cv=none; b=a2vY994cbbKI4r4I32BktuPsdv8c0gHt8EPA/oVoWslyxhCcV/zoWZS1Jd+z/1jk9TMySbVjstzV67uMkLNb6NwOpgk0ZAGD48ZQk9Pc3g8+0+Jka9aKDYIDMMHk9VYEOLHgshKYvQ23UBeGSYjmWttuZFGo3QVQ1dTFfHH/J2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897531; c=relaxed/simple;
	bh=cgrlaubv33feaVfGkhUzznzfcyzX1nOahnlIPHN1FCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSU68XB4Hnlr2qmLznYzfcNtG5E+vPQcIVdUo4MAKDsTo7WG7B6rqCf5pfYRZENhAMOD+V/XEyy0iE9cTnvUYFLTmofRCTf0qkAxylaZvmzpRn4TWx0oE0iQTXhH9aKOnyGdUDBB60pVb5OmJ5s3OWQ+FHK5mHew8qT3BKuG4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1iBPVPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1iBPVPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236A21F00893;
	Tue, 13 Oct 2026 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897530;
	bh=JjCcRh5UZfBu26Hneuw3csGGWLVkRlYXiyQdm+TYs0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J1iBPVPg7I0c7yPXjP9QuxKyqpgaQsFHnU9X9khLoTuDCJUHWyq+TZG3AegccIGwq
	 wlnBHm2pRbyFRqAa940efcYMoGq9PD8BW+qbo06yKl8PzAH9JySx1nnTlwuyXH7sjM
	 G72pXc1d8hsaHKTqg35MOzgNpl/UKlAmfFc0dB7tUwdZ/2QJJOO5g+LZzUOE66VLMG
	 jhJYQyynFB+ot35A0DfRSrVTLEFo/3CFzO6sFz+KOdDnAPkMltOQFHQQPsHYAu8bph
	 OJGTikKe0zTkTo4PS7X949kwZ482fRRJ9viL9G6XXXBdmVr/QMeWkodcAS6kX5BY2t
	 RcjPVUNkSI6Eg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 10/53] MIPS: SGI-IP27: widen Kconfig for the Bedrock-based machines
Date: Tue, 13 Oct 2026 15:16:30 +0200
Message-ID: <9a7734dd63682d2b322c48b705414721050aa37f.1791890466.git.kaloz@kernel.org>
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

CONFIG_SGI_IP27 now also covers the Bedrock-based IP35 machines such as
Fuel and Tezro, told apart from Origin 200/2000 at runtime rather than by
a separate config symbol. Update the prompt and help text.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d7c67cebe065..b64f1a8ebf41 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -755,7 +755,7 @@ config SGI_IP22
 	  that runs on these, say Y here.
 
 config SGI_IP27
-	bool "SGI IP27 (Origin200/2000)"
+	bool "SGI IP27 (Origin200/2000) and IP35 (Fuel, Tezro)"
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_SPARSEMEM_ENABLE
 	select FW_ARC
@@ -780,9 +780,10 @@ config SGI_IP27
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

