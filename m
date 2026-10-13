Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141D51E455;
	Tue, 13 Oct 2026 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897526; cv=none; b=taWMHB3Lpjxj6kmzl2XRGqLAARPb+ecUktN5br7Kk68zSwpuDBt+U4E4sw2w35MooeMAYr0MhIOruPugdzZHl/JpX+kM4dW5MaQHNWHTeovSjh6i48iReX9kWS15tbwcMt5cBoQc1ojYEg3tIxecqyw7tNemuk9HDzngy896rMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897526; c=relaxed/simple;
	bh=W/d+xW1gnECn1weslJrNnRp/NzqSab+PVBOMwMJwxw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/xDa1b8Aa0C3pvW0Yui227dd1sRgdELsztJsN0kRnVGOrk9CmKxiTaJip3iWfMm80pi3Q+JgR0QoWRPLo8iqrvcGusxtU7okZ7d/AQLtHEzaYA942JNsJQjJeVS7l9F3Rb4fHP+GistaSAyDlrINOJni6X7pO2rXnpuXjtPb74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM3Zy1Fz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM3Zy1Fz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FBB1F000FF;
	Tue, 13 Oct 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897524;
	bh=369x9jOZ4wiUw75CMV3Q6X+4Bx+4gSAY+vN6bHwuANA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LM3Zy1Fz3VQSXRmXNnDtuzeTkm2T+4rusYJLRz6TorsXy+duGP6t0U7abanjR0Vig
	 ZoNumUdZGqV4qWUAeBl/6fUPeogsnkIVjWL8Eb09gaP5a07s6CZFxUHof5dwj/VF5N
	 J4MqCv3Nzkdd+A3WlNRV+ClXXd4b7S/FkF0QfiEMRshglCWmwdEdrJC7TDr2XiQHuJ
	 fRdNPTSq0PbYoXroevd46oRSAgvr6UFTALYxPLlu5fj/rp/VtkCv458Q7aw4iaQbUy
	 h1GwYZDDfeazEvOZqnIkjqqX9mnnuC1Z1XdFUFXJex0zIkZYBHhNBkNpQ6DVPd0VYy
	 7Pov8RJaPIcyw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 07/53] MIPS: SGI-IP27: dump the NMI save areas the CPU scan recorded
Date: Tue, 13 Oct 2026 15:16:27 +0200
Message-ID: <cc49be0da88c393436904b6b6df33527e8965e7e.1791890466.git.kaloz@kernel.org>
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

nmi_node_eframe_save() walks a fixed two slices per node, so the crash
dump can print a register set and a hub interrupt state for a slice the
node's CPU scan never recorded. Walk the recorded slices instead.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-nmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-nmi.c b/arch/mips/sgi-ip27/ip27-nmi.c
index c502982621e6..2cb17f8c7bf3 100644
--- a/arch/mips/sgi-ip27/ip27-nmi.c
+++ b/arch/mips/sgi-ip27/ip27-nmi.c
@@ -5,6 +5,7 @@
 #include <linux/nodemask.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
+#include <linux/topology.h>
 #include <linux/atomic.h>
 #include <asm/sn/types.h>
 #include <asm/sn/addrs.h>
@@ -14,12 +15,6 @@
 
 #include "ip27-common.h"
 
-#if 0
-#define NODE_NUM_CPUS(n)	CNODE_NUM_CPUS(n)
-#else
-#define NODE_NUM_CPUS(n)	CPUS_PER_NODE
-#endif
-
 #define SEND_NMI(_nasid, _slice)	\
 	REMOTE_HUB_S((_nasid),  (PI_NMI_A + ((_slice) * PI_NMI_OFFSET)), 1)
 
@@ -149,13 +144,18 @@ static void nmi_dump_hub_irq(nasid_t nasid, int slice)
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

