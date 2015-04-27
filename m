Received: from mail.windriver.com ([147.11.1.11]:57092 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026180AbbD0WsjAO4Vd (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 00:48:39 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 08/11] mips/c-r4k: remove legacy __cpuinit section that crept in
Date: Mon, 27 Apr 2015 18:47:57 -0400
Message-ID: <1430174880-27958-9-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1430174880-27958-1-git-send-email-paul.gortmaker@windriver.com>
References: <1430174880-27958-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20150427224757.tKoD_nCNtcAhCa_ohYMEpLRpBf4zypBxbayU1gper6M@z>

We removed __cpuinit support (leaving no-op stubs) quite some time ago.
However a new instance was added in commit 4caa906ee949b7002cc1558bbe3744
("MIPS: mm: c-r4k: Build EVA {d,i}cache flushing functions")

Since we want to clobber the stubs soon, get this removed now.

Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/mm/c-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 0dbb65a51ce5..c93070f7c253 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -295,7 +295,7 @@ static void r4k_blast_icache_page_setup(void)
 
 static void (*r4k_blast_icache_user_page)(unsigned long addr);
 
-static void __cpuinit r4k_blast_icache_user_page_setup(void)
+static void r4k_blast_icache_user_page_setup(void)
 {
 	unsigned long ic_lsize = cpu_icache_line_size();
 
-- 
2.2.1
