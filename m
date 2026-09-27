Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D42B2931F8;
	Sun, 27 Sep 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790500536; cv=none; b=um4VnzKlXmeNEFh9kCeLUxk5jHLSBrVsRKjqb0GTp9lZbQYVXJMIGMoMIz8g0XCjGH6mhagmjnIR9ZE5Nu1MzHQ32A0kWm6vU/l2hmcfJERMSppf/49CeF3yO97KWNybuAEBulqsNroCcOnxA6UDLCylx6h5+WqdJk78gU9eWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790500536; c=relaxed/simple;
	bh=uAt6SRxMQw4wes3kfi/0J2L6yEL2v/iqhtB0PSFMfi8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UeOrMMUmfkudaHekD8f6yvtT0pOBqr85N3h6DY8Nt35nqnLLh4Ot92j+tuV6tu/BUITuOUxFDztsqZYE9VN7d4ut4Bs/vU/dMD/wfWdGBnhMwHo9r77pJAU5hBD7eTpyHq5JN9VEM9ZyLqhHLO6TmGbDmpjzOibYLZwxRWnAcbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=fail smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=alpha.franken.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A331F1FB47;
	Sun, 27 Sep 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BDA213274;
	Sun, 27 Sep 2026 09:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vQBjCKXeuGp1egAAD6G6ig
	(envelope-from <tsbogend@alpha.franken.de>); Sun, 27 Sep 2026 09:15:17 +0000
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: octeon: Use MIPS_MACHINE for boards without provided device tree
Date: Sun, 27 Sep 2026 11:15:10 +0200
Message-ID: <20260927091512.117046-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.958];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

There are older Octeon boards with ld U-Boots, which don't use and pass
a device tree to the kernel. Use MIPS_MACHINE mechanism to get a device
tree.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/cavium-octeon/setup.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index d2bba2fe636d..7497be7b9431 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -30,6 +30,7 @@
 #include <linux/libfdt.h>
 #include <linux/kexec.h>
 
+#include <asm/machine.h>
 #include <asm/processor.h>
 #include <asm/reboot.h>
 #include <asm/smp-ops.h>
@@ -1159,7 +1160,7 @@ void __init octeon_fill_mac_addresses(void);
 
 void __init device_tree_init(void)
 {
-	const void *fdt;
+	const void *fdt = NULL;
 	bool do_prune;
 	bool fill_mac;
 
@@ -1178,12 +1179,28 @@ void __init device_tree_init(void)
 		do_prune = false;
 		fill_mac = false;
 		pr_info("Using passed Device Tree.\n");
-	} else if (OCTEON_IS_MODEL(OCTEON_CN68XX)) {
-		fdt = &__dtb_octeon_68xx_begin;
-		do_prune = true;
-		fill_mac = true;
 	} else {
-		fdt = &__dtb_octeon_3xxx_begin;
+		const struct mips_machine *check_mach;
+
+		for_each_mips_machine(check_mach) {
+			if (!check_mach->detect)
+				continue;
+			if (!check_mach->detect())
+				continue;
+
+			fdt = check_mach->fdt;
+			do_prune = false;
+			fill_mac = true;
+			pr_info("Using compiled-in Device Tree.\n");
+			break;
+		}
+	}
+
+	if (!fdt) {
+		if (OCTEON_IS_MODEL(OCTEON_CN68XX))
+			fdt = &__dtb_octeon_68xx_begin;
+		else
+			fdt = &__dtb_octeon_3xxx_begin;
 		do_prune = true;
 		fill_mac = true;
 	}
-- 
2.51.0

