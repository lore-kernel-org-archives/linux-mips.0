Received: from mail.windriver.com ([147.11.1.11]:57094 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27026181AbbD0Wskf7tCh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 00:48:40 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 10/11] mips/mm/tlbex: remove new instance of __cpuinit that crept back in
Date: Mon, 27 Apr 2015 18:47:59 -0400
Message-ID: <1430174880-27958-11-git-send-email-paul.gortmaker@windriver.com>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20150427224759.vj1dzUT6777Q-NbPVqXh3840LkP7m1HFbHyfleuNTLs@z>

We removed __cpuinit support (leaving no-op stubs) quite some time ago.
However a new instance was added in commit c5b367835cfc7a8ef53b9670a409ff
("MIPS: Add support for XPA.")

Since we want to clobber the stubs soon, get this removed now.

Cc: Steven J. Hill <Steven.Hill@imgtec.com>
Cc: linux-mips@linux-mips.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/mips/mm/tlbex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index 97c87027c17f..d7db82c3fbce 100644
--- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -35,7 +35,7 @@
 #include <asm/uasm.h>
 #include <asm/setup.h>
 
-static int __cpuinitdata mips_xpa_disabled;
+static int mips_xpa_disabled;
 
 static int __init xpa_disable(char *s)
 {
-- 
2.2.1
