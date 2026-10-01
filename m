Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04CA475344;
	Thu,  1 Oct 2026 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871212; cv=none; b=axbZpoavlTsPbLNMMFlig9+8yZZRHYXMMAJMknotRHEFcttm73jnuNPs9iOVsyzu4W5ARrvUYnjS/iDXoVlYwS0DqeI+5S8HxNfSQnGPSdhNRtefchr/8f09JUUxpDwvCNCyld7Atxa7YhtYayA9YTj6EnWNr1FS1uwAEqEcG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871212; c=relaxed/simple;
	bh=qzr381M4jQrCqOy50gj0657Krtwngz2FDDN6eHzK9vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D82eIWKaWPUTHveUxKbrhcdrQMHChg4wSKXfVFEfH8UINNveZyGN2G68Ku7e9wM3s8Nqtcgvbqg6Dd8OdTHfobDEVYailpM/tGiJGmP7bKrSbX0paVnr85M7Wm9VvEB+6VXvwjrze6mAFKGc3Ee7c5umDqU3Pz2+5wKXRPn1IRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5a/feKc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5a/feKc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9E31F00898;
	Thu,  1 Oct 2026 16:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871210;
	bh=s9JsZbLBN2ktH0/DfsMUl+U/Asupg5vWsbX20GnEMQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b5a/feKc2QhouX4QuGLCgU5tKiDemDUrQiWxsbf2BRH6CJTBi2S0A8NSLZo3+cfbA
	 WJnIhncJ/dJP4RdNc7aMwygKqozEmFTsv7ZXFUg40hBlBgqImRRlIMV2hskCIEY+mi
	 ScwtVdCh8xXXkE/Dq27esi/ZePC7Yoi7924Olks8muIg/EtoIkG0JisJhu83P7go+f
	 V0ifm2x3YhbBLGqNy8Z+tlWn1CwwXlN+sB/pNz9kN51+Gga2EYHJeBtJAIK4dleqOo
	 HLJKLxgi7yJEV340ie5f7DgThMmGc/bnmj0PTXk+FAAdrbEyat61BjG6p7nW77iMRV
	 7LTUkHU3MIA6w==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/38] MIPS: SGI-IP27: detect Bedrock hubs at boot
Date: Thu,  1 Oct 2026 18:11:39 +0200
Message-ID: <c8db28c553a0f99eb05682a6a44bd3399dd4d63e.1790857966.git.kaloz@kernel.org>
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

Read a hub's widget-ID register as the first thing prom_init() does
and record whether it is a Bedrock ASIC, so later code can branch on
that instead of a compile-time select. A local alias read needs no
nasid, so this runs first.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/addrs.h | 6 ++++++
 arch/mips/sgi-ip27/ip27-init.c   | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/mips/include/asm/sn/addrs.h b/arch/mips/include/asm/sn/addrs.h
index d5c7cfea7761..51161fd5130b 100644
--- a/arch/mips/include/asm/sn/addrs.h
+++ b/arch/mips/include/asm/sn/addrs.h
@@ -35,6 +35,12 @@
 
 #endif /* __ASSEMBLER__ */
 
+#ifndef __ASSEMBLER__
+
+extern bool system_is_ip35;
+
+#endif /* __ASSEMBLER__ */
+
 
 #define NASID_GET_META(_n)	((_n) >> NASID_LOCAL_BITS)
 #ifdef CONFIG_SGI_IP27
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index a4daf8ccd16c..6394c2076041 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -31,6 +31,7 @@
 #include <asm/thread_info.h>
 #include <asm/sn/launch.h>
 #include <asm/sn/mapped_kernel.h>
+#include <asm/xtalk/xwidget.h>
 
 #include "ip27-common.h"
 
@@ -38,6 +39,7 @@
 
 static DECLARE_BITMAP(hub_init_mask, MAX_NUMNODES);
 nasid_t master_nasid = INVALID_NASID;
+bool system_is_ip35;
 
 struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
 EXPORT_SYMBOL_GPL(sn_cpu_info);
@@ -139,8 +141,15 @@ const char *get_system_type(void)
 	return "SGI Origin";
 }
 
+static inline bool hub_is_bedrock(void)
+{
+	return XWIDGET_PART_NUM(LOCAL_HUB_L(IIO_WID)) == WIDGET_BDRCK_PART_NUM;
+}
+
 void __init prom_init(void)
 {
+	system_is_ip35 = hub_is_bedrock();
+
 	prom_init_cmdline(fw_arg0, (LONG *)fw_arg1);
 	prom_meminit();
 }
-- 
2.47.3

