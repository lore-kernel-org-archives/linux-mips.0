Received: from mailapp01.imgtec.com ([195.59.15.196]:36046 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992494AbcHSROZBFnjr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Aug 2016 19:14:25 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 2/3] MIPS: c-r4k: Treat physically indexed dcaches as not aliasing
Date: Fri, 19 Aug 2016 18:13:35 +0100
Message-ID: <20160819171336.28401-2-paul.burton@imgtec.com>
In-Reply-To: <20160819171336.28401-1-paul.burton@imgtec.com>
References: <20160819171336.28401-1-paul.burton@imgtec.com>
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
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20160819171335.KEkpkvcKwVPK39hdVVD58rCNQXJxvIvZNarSmD68470@z>

Physically indexed caches cannot suffer from virtual aliasing, so clear
the MIPS_CACHE_ALIASES bit in order to ensure we don't do extra work
avoiding aliasing that cannot happen.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/mm/c-r4k.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 7a64a8a81..d519c9e 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1311,6 +1311,10 @@ static void probe_pcache(void)
 			c->dcache.flags |= MIPS_CACHE_ALIASES;
 	}
 
+	/* Physically indexed caches don't suffer from virtual aliasing */
+	if (c->dcache.flags & MIPS_CACHE_PINDEX)
+		c->dcache.flags &= ~MIPS_CACHE_ALIASES;
+
 	switch (current_cpu_type()) {
 	case CPU_20KC:
 		/*
-- 
2.9.3
