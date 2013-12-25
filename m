Received: from fep14.mx.upcmail.net ([62.179.121.34]:42574 "EHLO
        fep14.mx.upcmail.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6871922Ab3LYOHl4UJpv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Dec 2013 15:07:41 +0100
From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <petr.pisar@atlas.cz>
Subject: [PATCH 1/2] Fix cache flushing on Loongson 2
Date: Wed, 25 Dec 2013 15:04:21 +0100
Message-ID: <1387980262-2250-2-git-send-email-petr.pisar@atlas.cz>
In-Reply-To: <1387980262-2250-1-git-send-email-petr.pisar@atlas.cz>
References: <1387980262-2250-1-git-send-email-petr.pisar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-Path: <petr.pisar@atlas.cz>
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
Cc: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <petr.pisar@atlas.cz>
Message-ID: <20131225140421.eCFFLotOxXVaonHv8w2Gixnwig0Z49--np0yvN1TVjo@z>

This bug was introduced by an unintended branch swap in commit
14bd8c082016cd1f67fdfd702e4cf6367869a712 (MIPS: Loongson:
Get rid of Loongson 2 #ifdefery all over arch/mips).

Signed-off-by: Petr Písař <petr.pisar@atlas.cz>
---
 arch/mips/mm/c-r4k.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 62ffd20..1c2029d 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -580,11 +580,11 @@ static inline void local_r4k_flush_icache_range(unsigned long start, unsigned lo
 	else {
 		switch (boot_cpu_type()) {
 		case CPU_LOONGSON2:
-			protected_blast_icache_range(start, end);
+			protected_loongson23_blast_icache_range(start, end);
 			break;
 
 		default:
-			protected_loongson23_blast_icache_range(start, end);
+			protected_blast_icache_range(start, end);
 			break;
 		}
 	}
-- 
1.8.5.1
