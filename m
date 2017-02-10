Received: from mailapp01.imgtec.com ([195.59.15.196]:24638 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23992236AbdBJXBhUaW0t (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 11 Feb 2017 00:01:37 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] MIPS: Fix cacheinfo overflow
Date: Fri, 10 Feb 2017 23:01:20 +0000
Message-ID: <20170210230120.21588-1-james.hogan@imgtec.com>
In-Reply-To: <20170208234523.GA13263@roeck-us.net>
References: <20170208234523.GA13263@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Justin Chen <justin.chen@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com
Message-ID: <20170210230120.egCf57m0byJQ68kqkT4P-YI5J7L5FX_rjzcfcp6jTkE@z>

The recently added MIPS cacheinfo support used a macro populate_cache()
to populate the cacheinfo structures depending on which caches are
present. However the macro contains multiple statements without
enclosing them in a do {} while (0) loop, so the L2 and L3 cache
conditionals in populate_cache_leaves() only conditionalised the first
statement in the macro.

This overflows the buffer allocated by detect_cache_attributes(),
resulting in boot failures under QEMU where neither the L2 or L2 caches
are present.

Enclose the macro statements in a do {} while (0) block to keep the
whole macro inside the conditionals.

Fixes: ef462f3b64e9 ("MIPS: Add cacheinfo support")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Justin Chen <justin.chen@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@linux-mips.org
Cc: bcm-kernel-feedback-list@broadcom.com
---
 arch/mips/kernel/cacheinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index a92bbbae969b..97d5239ca47b 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -17,6 +17,7 @@
 
 /* Populates leaf and increments to next leaf */
 #define populate_cache(cache, leaf, c_level, c_type)		\
+do {								\
 	leaf->type = c_type;					\
 	leaf->level = c_level;					\
 	leaf->coherency_line_size = c->cache.linesz;		\
@@ -24,7 +25,8 @@
 	leaf->ways_of_associativity = c->cache.ways;		\
 	leaf->size = c->cache.linesz * c->cache.sets *		\
 		c->cache.ways;					\
-	leaf++;
+	leaf++;							\
+} while (0)
 
 static int __init_cache_level(unsigned int cpu)
 {
-- 
2.11.0
