Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F89417D86;
	Thu,  1 Oct 2026 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871208; cv=none; b=sgJhRy4AYoz/H7qyFCWonsr4AAm7/BhoFyT+E/hYH5w+r2g6lTo1EFr3DzNTqp+zsmjvR0Ebu/DmYfUYTnjC3IC2JaXyaALq4ngyyE9RKTKR7CxavQi1EgUiHFahOnMJqMTm6PI3A4XxpWdBz6y1FNJuHbUGb/JvbsfeD0xKJyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871208; c=relaxed/simple;
	bh=CdGivnxl5MoL32xwj6eFE357qYSGI2eVI/HLthxhfN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gomFKQcsk0AHflzwyYXDjbsVVZSSIUPf6k9R9YExWqkSmsr9NtvS44PDBVul5qIaK0O16oDQ6Vwol5RTlWMyXA6TWTL+B/NwP6B3fzwmpGo799EtM3y93uqthvGqpkbD5Sq/snTBnQa/VyNKoOGee0E3Tv0Q6h0bVUG0CH8tyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REZ2v5AL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REZ2v5AL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F601F00899;
	Thu,  1 Oct 2026 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871207;
	bh=OsIglhLwMszfFOmwWJ2K1FGVyyLQb8WZ6HpQVaoCw60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=REZ2v5ALSgUp0lYYSHUEcDod0XCqlf+JgVg3c1BiAI+ZIzpeUI6uH05jQKaEB9egr
	 TAnyunJU98+3rbkC8BKlcP++3OFwjOuSlWL/Nc8GkoFDpl1gE7rZ4CV3G0ZkPu63x9
	 LlrLcCcEOYqzKWtVMqx0lUEyOvSYLndr6MlLsyWLKQlSgEygGxNtJOuPOEMi1ekTRS
	 UWcBEQPdoCxmYCFWP5i79iyJUK6Fi6A2jubiROCOnsdYAmptNwT/99Nei37LYtK9Hs
	 m4bjCjIPUk6ibkwLDFg9/7dNoadx4TxrE2phkz+NXPYK1Dl/Qke7wByZU9dQdFLKoe
	 KO7ob5dbXYh1Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/38] MIPS: SGI-IP27: dump the NMI save areas the CPU scan recorded
Date: Thu,  1 Oct 2026 18:11:37 +0200
Message-ID: <ce2cb621eb1b54ed316689ab9fc4933ae57ce932.1790857966.git.kaloz@kernel.org>
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

nmi_node_eframe_save() walks a fixed two slices per node, so the crash
dump can print a register set and a hub interrupt state for a slice the
node's CPU scan never recorded. Walk the recorded slices instead.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-nmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-nmi.c b/arch/mips/sgi-ip27/ip27-nmi.c
index fc2816398d0c..07d63d020d22 100644
--- a/arch/mips/sgi-ip27/ip27-nmi.c
+++ b/arch/mips/sgi-ip27/ip27-nmi.c
@@ -4,6 +4,7 @@
 #include <linux/nodemask.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
+#include <linux/topology.h>
 #include <linux/atomic.h>
 #include <asm/sn/types.h>
 #include <asm/sn/addrs.h>
@@ -13,12 +14,6 @@
 
 #include "ip27-common.h"
 
-#if 0
-#define NODE_NUM_CPUS(n)	CNODE_NUM_CPUS(n)
-#else
-#define NODE_NUM_CPUS(n)	CPUS_PER_NODE
-#endif
-
 #define SEND_NMI(_nasid, _slice)	\
 	REMOTE_HUB_S((_nasid),  (PI_NMI_A + ((_slice) * PI_NMI_OFFSET)), 1)
 
@@ -148,13 +143,18 @@ static void nmi_dump_hub_irq(nasid_t nasid, int slice)
  */
 static void nmi_node_eframe_save(nasid_t nasid)
 {
-	int slice;
+	int cpu;
 
 	if (nasid == INVALID_NASID)
 		return;
 
 	/* Save the registers into eframe for each cpu */
-	for (slice = 0; slice < NODE_NUM_CPUS(slice); slice++) {
+	for_each_possible_cpu(cpu) {
+		int slice = cputoslice(cpu);
+
+		if (cputonasid(cpu) != nasid)
+			continue;
+
 		nmi_cpu_eframe_save(nasid, slice);
 		nmi_dump_hub_irq(nasid, slice);
 	}
-- 
2.47.3

