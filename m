Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF8395266;
	Sun, 27 Sep 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790500538; cv=none; b=MELZ73n2/QYbHQ7RNZqPTzdLLZNnAm8FYSp3WBolT506YjmK+Or9EYjQBMPh5SbA/WbrbI5GBEeyt00MoBSjQD38JRSVZ0JYNrUNDkXkqOaRSzcADTGh5o9FuMKldSCwEsErD7dkMdYemPhW+w2iGZbvR+N36yEOiws2dBMyDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790500538; c=relaxed/simple;
	bh=hMO4NyaxfEYYR64CwvNMaEs+uPYjwCuKAYDmNgCMYgw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3VRLQS912GMsj8g5X6f91NsU1WWGlrkOpunKunG+8bsNbIYjoO7jY5uykglAOfvr9kn0I8gedW2YTDWjM7ktjxwbbxVx5gWCx6T0NU7Q5Y4ecxlRQqY76TPKkQ4/kf3ky0i8e3Gph9VKiubPgUXft6PqGP1sZvZ9TJYL8UddCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD60B1FDDC;
	Sun, 27 Sep 2026 09:15:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58576133F3;
	Sun, 27 Sep 2026 09:15:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vQBjCKXeuGp1egAAD6G6ig:T2
	(envelope-from <tsbogend@alpha.franken.de>); Sun, 27 Sep 2026 09:15:20 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: octeon: Add detection of UBNT Edgeroute Lite devices
Date: Sun, 27 Sep 2026 11:15:11 +0200
Message-ID: <20260927091512.117046-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260927091512.117046-1-tsbogend@alpha.franken.de>
References: <20260927091512.117046-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Rspamd-Queue-Id: AD60B1FDDC
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 6.51
X-Spam-Level: ******
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [6.51 / 50.00];
	NEURAL_SPAM_LONG(3.49)[0.997];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.43)[0.810];
	R_DKIM_NA(2.20)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[]

The U-Boot of Ubiquiti Edgerouter Lite don't provide a DT to the kernel.
Use MIPS_MACHINE mechanism to provide one.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/boot/dts/cavium-octeon/Makefile |  1 +
 arch/mips/cavium-octeon/Kconfig           |  5 +++++
 arch/mips/cavium-octeon/Makefile          |  2 ++
 arch/mips/cavium-octeon/board-ubnt.c      | 16 ++++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 arch/mips/cavium-octeon/board-ubnt.c

diff --git a/arch/mips/boot/dts/cavium-octeon/Makefile b/arch/mips/boot/dts/cavium-octeon/Makefile
index 48085bca666c..aa3a5ff1468d 100644
--- a/arch/mips/boot/dts/cavium-octeon/Makefile
+++ b/arch/mips/boot/dts/cavium-octeon/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_CAVIUM_OCTEON_SOC)	+= octeon_3xxx.dtb octeon_68xx.dtb
+dtb-$(CONFIG_OCTEON_BOARD_UBNT)	+= ubnt_e100.dtb
diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 450e979ef5d9..f3618117cc39 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -89,4 +89,9 @@ config OCTEON_ILM
 	  To compile this driver as a module, choose M here.  The module
 	  will be called octeon-ilm
 
+config OCTEON_BOARD_UBNT
+	bool "Support Ubiquiti Devices"
+	help
+	  Enable this for missing Ubiquit device trees and quirks
+
 endif # CAVIUM_OCTEON_SOC
diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
index ab84ede0cbe0..c9b52c94a8ca 100644
--- a/arch/mips/cavium-octeon/Makefile
+++ b/arch/mips/cavium-octeon/Makefile
@@ -18,3 +18,5 @@ obj-y += executive/
 obj-$(CONFIG_MTD)		      += flash_setup.o
 obj-$(CONFIG_SMP)		      += smp.o
 obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
+
+obj-$(CONFIG_OCTEON_BOARD_UBNT)	      += board-ubnt.o
diff --git a/arch/mips/cavium-octeon/board-ubnt.c b/arch/mips/cavium-octeon/board-ubnt.c
new file mode 100644
index 000000000000..e89ab3a02f49
--- /dev/null
+++ b/arch/mips/cavium-octeon/board-ubnt.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/machine.h>
+#include <asm/octeon/octeon.h>
+
+static __init bool ubnt_e100_detect(void)
+{
+	return cvmx_sysinfo_get()->board_type == CVMX_BOARD_TYPE_UBNT_E100;
+}
+
+extern const char __dtb_ubnt_e100_begin[];
+
+MIPS_MACHINE(ubnt_e100) = {
+	.fdt = __dtb_ubnt_e100_begin,
+	.detect = ubnt_e100_detect,
+};
-- 
2.51.0

