Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016084;
	b=MLp6evoDxPg0U1+1OScfyH8jfo8+sEi9SMtHcSgalhxpKWQ0hODQL0Juwinxn9eDzFQ8
	 iSeR0Z4tQisi+nHXrTlbLmFjUNE1gi15A4CgzZvIuc0nBZawswVVBcVmdUhYlZcFmAp0t
	 HJquw6gGS4/AwTvA/5AXdiqoBajSesqM8QcfsYzLxybpg/BTGk7zvIUbt/B7WIIiB90tP
	 +TqI5t9WcWd9pS5T/Opkgn0ywnKvc7geiJ54fjR+T5u17xMHj29/fRI/qVbUt6cW56BJT
	 kbVUTueAJJluly+o3bsQS0JewPLYcO0dWaKTgjLfl4ipD5WiD9/7rm3MRZqNCzF9AmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016084;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vV4nzYtnq0Su3EKuqjppBdphgMEbntXty37KBbIcae8=;
	b=OCJs9KvdygICkL42qAoY/iAeTFuufo1lQsoW7Bq2v9ZyW3IfQLfO3YBZQSAylC4hcUBp
	 8YIl82XmRFrrXtVoDPfvRlVlhJvp+QKG2Cf8hjwLpNRqFqo9jCnnc45ChTkU0j3/4N8Wp
	 7us3duq8nfkQpXvs6F4a+J0O3mA86n/OzKHj9od1soIxFXuVteec+pgY8uYTlBvnwHHMj
	 Ls6v6pjfBKbAwYbV1XW3n92sz3yF5LDe2F8NiF4/JvhTtVo5AI+NID+BA0WY+9xuszUjm
	 viL5kj8uD2fk4pt6jYfnNaFTdLvkG6U+uryhp3qJWJlWsLiVVCRClfksd/aP51v/Q5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7IhK8i0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B17C606A32F;
	Mon, 26 Oct 2026 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7IhK8i0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6A31F031E7;
	Mon, 26 Oct 2026 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016083;
	bh=vV4nzYtnq0Su3EKuqjppBdphgMEbntXty37KBbIcae8=;
	h=From:To:Cc:Subject:Date;
	b=k7IhK8i0zzOIQjJ7wZ/MqLxlC0p12DIFL9GNFJ3g2rcNfK+UmBAkLAeduJ0QwOpGt
	 HttdxBadufC2MhMF2xa3Qwi90zTt1Yrbm4M6Yu/5ZKlPPu8RA4jboPzKowvaSAIRgJ
	 LudJYNxGn1MuwMME0e2/NJqeFzPFHOCy3/uXPI2lqRlc0Qs5a+rFLYd0lHiUFcShoP
	 i1PYipjpqKIHGBwqEOObIZ2Ihsjoouhdi9ak6gHR9vrmMTMhfsfFdAxeTVCG+mpSUN
	 L8UXzIB6qeOeS6G8nIX0LrOP84ABLq30lR5N9ur3gRvPbbyhuGvKZWWw5BeIfrrcvn
	 qlYs0NsDlmB+Q==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: SGI-IP27: Install the cache error vector on every CPU
Date: Mon, 26 Oct 2026 13:00:11 +0100
Message-ID: <20261026120011.24675-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

The R10000 drives an uncached attribute on the bus, decoded by the hub.
CKSEG1 uses attribute 0, UALIAS, whose low 128K is flipped by CPU slice
(UALIAS_FLIP_BIT), so slice 1 reads CKSEG1 0x100 from node memory
0x10100. trap_init() writes the vector only through TO_UNCAC(),
attribute 3, unflipped. Copy it on each secondary.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
Changes in v2:
- Rewrote the message to explain the per-slice UALIAS flip that makes
  CKSEG1 0x100 differ from TO_UNCAC(0x100) on a secondary CPU.
- Stated in the message and in ip27_init_secondary() that the R10000
  drives an uncached attribute on the bus that the hub decodes,
  attribute 0 for CKSEG1 and attribute 3 for TO_UNCAC().
- No code change.

 arch/mips/sgi-ip27/ip27-smp.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 62733e049570..4c9a0d9b4417 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -7,11 +7,13 @@
  * Copyright (C) 2000 - 2001 by Silicon Graphics, Inc.
  */
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 #include <linux/topology.h>
 #include <linux/nodemask.h>
 
+#include <asm/addrspace.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -133,6 +135,20 @@ static void ip27_init_cpu(void)
 	per_cpu_init();
 }
 
+static void ip27_init_secondary(void)
+{
+	/*
+	 * The R10000 drives an uncached attribute on the bus and the hub
+	 * decodes it.  The cache error vector is fetched through CKSEG1,
+	 * attribute 0, whose low 128K the hub flips per CPU slice.
+	 * trap_init() wrote it through TO_UNCAC(), attribute 3, which is
+	 * not flipped, so that copy only serves slice 0.
+	 */
+	memcpy((void *)CKSEG1ADDR(0x100), (void *)TO_UNCAC(0x100), 0x80);
+
+	ip27_init_cpu();
+}
+
 static void ip27_smp_finish(void)
 {
 	hub_rt_clock_event_init();
@@ -182,7 +198,7 @@ static void __init ip27_prepare_cpus(unsigned int max_cpus)
 const struct plat_smp_ops ip27_smp_ops = {
 	.send_ipi_single	= ip27_send_ipi_single,
 	.send_ipi_mask		= ip27_send_ipi_mask,
-	.init_secondary		= ip27_init_cpu,
+	.init_secondary		= ip27_init_secondary,
 	.smp_finish		= ip27_smp_finish,
 	.boot_secondary		= ip27_boot_secondary,
 	.smp_setup		= ip27_smp_setup,

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.47.3

