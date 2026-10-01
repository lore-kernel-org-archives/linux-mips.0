Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9D949E151;
	Thu,  1 Oct 2026 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871215; cv=none; b=FG6RrMy6/u/deTMdiYNGfPGXBTOhHlUXUuj2i6ROfx6Y9922JEwFVPz002v4e4pYA/PGrs/s6kaMol93iJNIX2V/U/B1XfKVpjWWPwZQInpTSkjtpEGgIn3t8uD4+AcHFBSWV2h48EqMyjS9z+PY2gCUFUmoVaLwgWbvA8Tqlao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871215; c=relaxed/simple;
	bh=t2DzBV5qCeWG8x4yE7qVxeg2cZ6qIeToyE6MNg6E8MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdxzusFa8m8REG0u3HrGPnjXlS+X/nZtb7E/fCavl9qrK+ceQDBBKBdefRvabkQUJyhXhJxD7kHebAQ4qlogrg7fSqkvht/rkxvctrARDMRe6ZE0xBhlwimrd1hWpVseocufcfxQLi4usrks5568XiuNMmnWKzVSGiGytnVyw2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nui2CPkC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nui2CPkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF56A1F00898;
	Thu,  1 Oct 2026 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871214;
	bh=0O/DKwOCZ39vSgMW4Jthk69Pl6CLLQvj8NV92aSGb5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nui2CPkCQdEInoYcpF+DWM9YwJB08c+TN37hjng1JIK9OWvEsfZxspw6W5LSSvqi0
	 xqbscX7MACsUteYtQl6Nr0eEHTRWbwQDnpjPfDDWLrnv8Xe0MKD2XaYYFprBjglrG0
	 178jCJBC133jO4fsyQ+iNeuHtkrnPpbtLHZRFZ3fm24krBRwDi1eR1yoomK3Xi3ToQ
	 pA4QAE/q4MKyC1PZ1ofiSJJjuGadULe5bthV3QIX03S2dNuV0iRFz7dcQmtHWAiCX2
	 bLSBCG/exUeb77UAHUm6xDqWyk5DRKMm5zBozyRIjNtWGOYmQXbQ4eMFGUNrDGHawI
	 wPynvC85yLdDQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/38] MIPS: SGI-IP27: fold the dead SN1 arm out of klconfig.h
Date: Thu,  1 Oct 2026 18:11:41 +0200
Message-ID: <e587404696ba4aaa4c9cc8006c104b12eec3934b.1790857966.git.kaloz@kernel.org>
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

klconfig.h's CONFIG_SGI_IP35 branch is unreachable: that symbol is
never selected, and the branch names headers that do not exist in
this tree. Fold its shared includes into the CONFIG_SGI_IP27 branch
and drop the unreachable rest.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/klconfig.h | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/mips/include/asm/sn/klconfig.h b/arch/mips/include/asm/sn/klconfig.h
index 3d1670b3e052..433d2d05aba3 100644
--- a/arch/mips/include/asm/sn/klconfig.h
+++ b/arch/mips/include/asm/sn/klconfig.h
@@ -40,26 +40,11 @@
 //#include <sys/graph.h>
 //#include <sys/xtalk/xbow.h>
 
-#elif defined(CONFIG_SGI_IP35)
-
-#include <asm/sn/sn1/addrs.h>
-#include <sys/sn/router.h>
-#include <sys/graph.h>
-#include <asm/xtalk/xbow.h>
-
-#endif /* !CONFIG_SGI_IP27 && !CONFIG_SGI_IP35 */
-
-#if defined(CONFIG_SGI_IP27) || defined(CONFIG_SGI_IP35)
 #include <asm/sn/agent.h>
 #include <asm/fw/arc/types.h>
 #include <asm/fw/arc/hinv.h>
-#if defined(CONFIG_SGI_IP35)
-// The hack file has to be before vector and after sn0_fru....
-#include <asm/hack.h>
-#include <asm/sn/vector.h>
-#include <asm/xtalk/xtalk.h>
-#endif /* CONFIG_SGI_IP35 */
-#endif /* CONFIG_SGI_IP27 || CONFIG_SGI_IP35 */
+
+#endif /* CONFIG_SGI_IP27 */
 
 typedef u64  nic_t;
 
-- 
2.47.3

