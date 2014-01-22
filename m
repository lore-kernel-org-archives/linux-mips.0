Received: from mail.windriver.com ([147.11.1.11]:40013 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823124AbaAVU1HVLkVz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 Jan 2014 21:27:07 +0100
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] mips: don't use module_init in non-modular sead3-mtd.c code
Date: Wed, 22 Jan 2014 15:21:30 -0500
Message-ID: <1390422090-24045-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <52df8cbe.rloiJvwsOgUSEvhX%fengguang.wu@intel.com>
References: <52df8cbe.rloiJvwsOgUSEvhX%fengguang.wu@intel.com>
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
To: fengguang.wu@intel.com
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20140122202130.5mKBQ1jA1Cy8chsmnXrC6u5H1sAM52P3zjfbqVHKsRs@z>

The devicetree.o is built for obj-y -- and hence this code is always
present.  It will never be modular, so using module_init as an alias
for __initcall can be somewhat misleading.

Fix this up now, so that we can relocate module_init from
init.h into module.h in the future.  If we don't do this, we'd
have to add module.h to obviously non-modular code, and that
would be a worse thing.

Note that direct use of __initcall is discouraged, vs. one
of the priority categorized subgroups.  As __initcall gets
mapped onto device_initcall, our use of device_initcall
directly in this change means that the runtime impact is
zero -- it will remain at level 6 in initcall ordering.

We also fix a missing semicolon, which this change uncovers.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[patch will be added to init cleanup series:
   http://git.kernel.org/cgit/linux/kernel/git/paulg/init.git/  ]

 arch/mips/mti-sead3/sead3-mtd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/mti-sead3/sead3-mtd.c b/arch/mips/mti-sead3/sead3-mtd.c
index ffa35f509789..f9c890d72677 100644
--- a/arch/mips/mti-sead3/sead3-mtd.c
+++ b/arch/mips/mti-sead3/sead3-mtd.c
@@ -50,5 +50,4 @@ static int __init sead3_mtd_init(void)
 
 	return 0;
 }
-
-module_init(sead3_mtd_init)
+device_initcall(sead3_mtd_init);
-- 
1.8.5.2
