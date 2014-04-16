Received: from mailapp01.imgtec.com ([195.89.28.115]:58813 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837153AbaDPNFzL5Npg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 15:05:55 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 9A279B167BB1B
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 14:05:46 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 33/39] MIPS: smp-cps: set a coherent default CCA
Date: Wed, 16 Apr 2014 14:05:44 +0100
Message-ID: <1397653544-4703-1-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
References: <1397652810-4336-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20140416130544.k3bwWC0fbdyNIBZW0XKmYajUuylVXXzVq5Mz7fn5ZNM@z>

This patch sets a default CCA suited for use with multi-core SMP on all
current MIPS CPS based systems. It may still be overriden by the cca=
argument on the kernel command line.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/kernel/smp-cps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 4e2346d..ae7be36 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -76,6 +76,9 @@ static void __init cps_smp_setup(void)
 		__cpu_logical_map[v] = v;
 	}
 
+	/* Set a coherent default CCA (CWB) */
+	change_c0_config(CONF_CM_CMASK, 0x5);
+
 	/* Core 0 is powered up (we're running on it) */
 	bitmap_set(core_power, 0, 1);
 
-- 
1.8.5.3
