Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022188;
	b=jT2GKOd59KLLFhF0lqQgxaVkHdioUtKmB8oxAXUOXcoplHsMBhvGkONYEtzixOkXlOav
	 eYcYIl98DTDYciXBN7vvp6b6QUbyNbpOaQmj4ApBm57SXMZT7BOrBMFLlQNbbqcqXhHYq
	 4B0xYoUTCvpnYH3p2z2HHpKFKCDlH6Hb/F9P7kjkGc/xRa3Y+8djJUjH+0sM3Y4LsPA71
	 xclNaGgCGBzxLKdh0zvCrVnJB6IDyf6i4NsiGhTVaCu+BNlpDYdAaJhZQzZ6sDJX69zqa
	 EcGgI/a+oXeiZ74uUdl3EKDbmsngYOAz56ObL5WaD114YGXVaVqMRbmYFSmFyqiARQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022188;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TlWRZZID9viQWJBo9Avq0do8nJNK/DKXbO66sFp22Wg=;
	b=bfCfPj/QYwqZr4akRmYjtQwaeQcuc+z85sCC0IOX8UhAfyOmVJufF36p2c1yATSZFwkF
	 iFKkjT3rHpTJSOl1wCmhJvLucbjBjrr+nM8xKT8ZqY57vo8rrkezrpU7k65tE+QL5hcr1
	 B8Q/Vj8paySV+SOnFJG0HYY+CHk9tUZXr4LQViSVlaR1DyPPVq0PXzRtvg09CahtNeafE
	 RQuFY6RsjF6ua4/Fbi89MuMSPqoNPjDFB43yhKMQxGVAJlrIGCmedYlVgcT/AloscZ04o
	 URzOHMmfxra96t8LNR85Eiuvj6HZEmFA979/R5E3Vjq2Vc53bjoax9pcpqHPBQv9zDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QR+j6lI6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D876760A2603;
	Mon, 26 Oct 2026 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QR+j6lI6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965F91F031E0;
	Mon, 26 Oct 2026 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022187;
	bh=TlWRZZID9viQWJBo9Avq0do8nJNK/DKXbO66sFp22Wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QR+j6lI6ShGBQfQ9GH56wYF48wJs9RlhY7zRyP5AYSXGxlDNcycdt3jfuNbErlMyN
	 nlmAkOX7RxqhWCE1fmOqJ2ZT6G/fCgLTB7PZs70zBhgXj3lll0vynsEPMhzqZRu/8C
	 2YqeFAfceEdywnZfCI4nESaB2t636ZiOrFX+AbbkjRKcmLVH6+AD32HSOIcmv+4nQp
	 O9V/6h0d44JzSDZIlYtovT62GVlCPLoYcgi+wWOiLwGfFzLU+84YPFIhjhReVl6anv
	 THKleVveORyB1uYjo4JtjNsbzkOzfwAPqIXLOC9W/D1ALtImKt5DWXRKABkoxV1heh
	 ubWDo8OVOxjYA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] MIPS: SGI-IP27: Report all CPUs to the R10000 LL/SC workaround
Date: Mon, 26 Oct 2026 14:41:43 +0100
Message-ID: <20261026134147.15988-4-kaloz@kernel.org>
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

Pass the PRId of every enabled CPU in KLCONFIG to r10k_llsc_note_cpu(),
so that an affected CPU on any node keeps the workaround.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 62733e049570..6a5f5903a443 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -15,6 +15,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
+#include <asm/r10k-llsc.h>
 #include <asm/sn/agent.h>
 #include <asm/sn/arch.h>
 #include <asm/sn/gda.h>
@@ -49,6 +50,7 @@ static int node_scan_cpus(nasid_t nasid, int highest)
 				cputoslice(cpus_found) = acpu->cpu_info.physid;
 				sn_cpu_info[cpus_found].p_speed =
 							acpu->cpu_speed;
+				r10k_llsc_note_cpu(acpu->cpu_prid);
 				cpus_found++;
 			}
 			acpu = (klcpu_t *)find_component(brd, (klinfo_t *)acpu,
-- 
2.47.3

