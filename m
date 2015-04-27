Received: from mail.windriver.com ([147.11.1.11]:57073 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026178AbbD0WscWtUnX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 00:48:32 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 06/11] mips/ath25: remove legacy __cpuinit section that crept in
Date: Mon, 27 Apr 2015 18:47:55 -0400
Message-ID: <1430174880-27958-7-git-send-email-paul.gortmaker@windriver.com>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20150427224755.LUzfVb_yFgk_6tDq1T0CxdS4ZnC7qxL8_vbHiCSjnJ0@z>

We removed __cpuinit support (leaving no-op stubs) quite some time ago.
However this one crept back in as of commit 43cc739fd98b8c517ad45756d869f
("MIPS: ath25: add common parts")

Since we want to clobber the stubs soon, get this removed now.

Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/ath25/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ath25/board.c b/arch/mips/ath25/board.c
index b8bb78282d6a..9ab48ff80c1c 100644
--- a/arch/mips/ath25/board.c
+++ b/arch/mips/ath25/board.c
@@ -216,7 +216,7 @@ void __init plat_time_init(void)
 		ar2315_plat_time_init();
 }
 
-unsigned int __cpuinit get_c0_compare_int(void)
+unsigned int get_c0_compare_int(void)
 {
 	return CP0_LEGACY_COMPARE_IRQ;
 }
-- 
2.2.1
