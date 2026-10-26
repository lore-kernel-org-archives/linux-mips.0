Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022189;
	b=YgqsXemSt1SNlNHGjXwMuuc9Vg724ZPssZ72cFCedPF4+XNEW0LhNPr8VHm/N2RC9EAT
	 Xw7LyKYbUHDeSkH2OQLDSB5SeBFdEpeNW1aD4Mu5VGh3BtHR89t4+9GRb1VPJX4akBql2
	 jrZ7ML+2DOcIN7MHM7piHgBVhV9XuNEZJ4ZzJvaDrBdFQ7hLhvmAFxhqPxL2KI5MdhqV+
	 MsV4ALUyt9bUZGk9EyssqETJ2tcXOFPxjGntfUSzPcXH2I3YCO2NCR7ExIQcf3AcDmq3K
	 8JXPzEAdSAP1fyiKk4vvrhD/zurHUFArUJVhUS18me+sS+sXaY2y9dwMb6xxqOq/uAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022189;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=omn91hQo60CwrWkL1ph6Rrj3EfCqmsBmKr35VAcMp5E=;
	b=FGHbh0ofiffJinLiyFjiQrW8JnWaaZDXdQ8KaPLC+cJqwo+QPJTYSO3Z7VmrxNRnc46w
	 cHFDX90UtnL1xLumug6YdzC2U11f0I89hoYe2guBZI4OZ+15civ3mt8oyblaEO+lyCfzg
	 mH/XNzGc3RZRc2oy0XmXxdZGeWkRP8jNnajXU0/I4lubLnU7yMZYGaZfso+PLYEigd0nr
	 opdWAOEQ5M2Io9fiA0yPJjLcny1ySn8zbNSgR3WDIQyRipp60aHYXQXoIz+Ng4Okt5P5I
	 Cbz09b9Hgu2bQkh3mQd96QdpW4AQmC5+Exv09SPYgIMsZj5SRrgDdo2xGaq/yjDdgew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsoYcBGu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919C5606A327;
	Mon, 26 Oct 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NsoYcBGu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC001F01829;
	Mon, 26 Oct 2026 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022189;
	bh=omn91hQo60CwrWkL1ph6Rrj3EfCqmsBmKr35VAcMp5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NsoYcBGuo/dUOBOpmmngq3bnDxJLhHYWzaUqtaKy488WrzqtoJYE1y/60Gd7NgKwg
	 p4NeCBcc1f6nYvXbP6e5FlB0eueLA804wqghV9jLe88+4y2Jt9bzTDa2dPpfP9t4Bb
	 AQ65RN35mK0UtLtmnE72pqPkWdNvYo0anMNuWzXdVP7ZviFt+7aPCSivsqmOps/LVY
	 MtbRVK9OCOdssp7sw5353vBUOCQTwmpsGo/sE+FtyoLmtzTK1/tC2/Svbg95Q/YCIP
	 PS9AUuxcaN6BRMj5S26ed23pkHwG442thEut/SpgxOJuOlRP5z2TNfw74dpZlBLWp+
	 dbT88twvLrmGw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] MIPS: tlbex: Follow the boot-time R10000 LL/SC choice
Date: Mon, 26 Oct 2026 14:41:44 +0100
Message-ID: <20261026134147.15988-5-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026134147.15988-1-kaloz@kernel.org>
References: <20261026134147.15988-1-kaloz@kernel.org>
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

The TLB handlers are generated after the boot-time R10000 LL/SC
choice. Emit the branch-likely in their ll/sc loop only when the
workaround is in use.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/mm/tlbex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 69ea54bdc0c3..32ce99dc90a0 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -35,6 +35,7 @@
 #include <asm/mipsregs.h>
 #include <asm/mmu_context.h>
 #include <asm/regdef.h>
+#include <asm/r10k-llsc.h>
 #include <asm/uasm.h>
 #include <asm/setup.h>
 #include <asm/tlbex.h>
@@ -95,7 +96,7 @@ static inline int __maybe_unused bcm1250_m3_war(void)
 
 static inline int __maybe_unused r10000_llsc_war(void)
 {
-	return IS_ENABLED(CONFIG_WAR_R10000_LLSC);
+	return r10k_llsc_war;
 }
 
 static int use_bbit_insns(void)
-- 
2.47.3

