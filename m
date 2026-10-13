Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ADB51EE1F;
	Tue, 13 Oct 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897529; cv=none; b=LCr2IvEj9AcEH3mz7VErCc8jHOQWHsE7mj1kwBdAEDFfFSuogNk7HgDs5jkANrxKhd83URhtb9TXIvnt6gbyFNtkXJqi9kF0nYH1pReGMOUBGJuynqUjB6iI1Ju5KMvHFlBaDp8u8bXNNWdUAa+6Oz9LCuIsvvTOhYiY/p94OOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897529; c=relaxed/simple;
	bh=qzr381M4jQrCqOy50gj0657Krtwngz2FDDN6eHzK9vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdnjfTtnJdx6uqDTKQrSEzc3RelDgaUZukIqaLDAWyiC/8icL2SbAtO/HrybBQD+K6nOnmJsedjmw4EeT62lN8M5PwMAJXhlZMXs6KrXEQrrxWGW4UBSbFbvKHk22Tadb42qb6ltnEyHca+F9ypFep9zXNkHxHZYv1GNagBYR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0hjHshv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0hjHshv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3E11F000FF;
	Tue, 13 Oct 2026 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897528;
	bh=s9JsZbLBN2ktH0/DfsMUl+U/Asupg5vWsbX20GnEMQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K0hjHshv5UyNmIvVlPBbNJ59Lzkx8bDb/Lz9fM7J7KTULY7CLNUnfTkt4VemQTBWq
	 gSzmUwAzUTb62RO2/ZmZWYCU5+Gk4qJhUk3D006sYyABQ5zCtmS6YKWhGnqNs2lxYF
	 tzcKI6dMwDuR0rMBIqV1g+MYPCVN6f2rH3fk5TZDf34tmiWWaPLj64moRwPvnDQvh9
	 2E494ENSUStcyeGRTysyU6bjltQHKRpEUr/EyAL5Sef5Jxd6GhyHkOVcHYuw4Y7F+P
	 iGNRH6vd++MoqXMmYo684MtOLbZuYBvWFvGuV+b7+lgneqqe7eub5w6Rs2iMjhY7h1
	 gyinYz3L19cFQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 09/53] MIPS: SGI-IP27: detect Bedrock hubs at boot
Date: Tue, 13 Oct 2026 15:16:29 +0200
Message-ID: <7db0e3062520e09076e896abda10d581b79fcb1c.1791890466.git.kaloz@kernel.org>
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

