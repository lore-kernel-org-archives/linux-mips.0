Received: from multi.imgtec.com ([194.200.65.239]:41712 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6821408Ab3LIJt4BfHjB (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 9 Dec 2013 10:49:56 +0100
From: Qais Yousef <qais.yousef@imgtec.com>
Subject: [PATCH v2] mips/include/asm/mipsregs.h: include linux/types.h
Date: Mon, 9 Dec 2013 09:49:45 +0000
Message-ID: <1386582585-20867-1-git-send-email-qais.yousef@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-Path: <Qais.Yousef@imgtec.com>
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
Cc: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <20131209094945.mbh9bXR9XzWp7hb71hthhsu-NPmngla_BoRhEr5-fHA@z>

The file uses u16 type but doesn't include its definition explicitly

I was getting this error when including this header in my driver:

  arch/mips/include/asm/mipsregs.h:644:33: error: unknown type name ‘u16’

Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
Reviewed-by: Steven J. Hill <Steven.Hill@imgtec.com>
---
changes since v1:
	- include linux/types.h instead of s/u16/unsigned short/
	- amend commit message accordingly

 arch/mips/include/asm/mipsregs.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index e033141..86479bb 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -14,6 +14,7 @@
 #define _ASM_MIPSREGS_H
 
 #include <linux/linkage.h>
+#include <linux/types.h>
 #include <asm/hazards.h>
 #include <asm/war.h>
 
-- 
1.7.1
