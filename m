Received: from dns1.mips.com ([12.201.5.69]:44305 "EHLO dns1.mips.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6823034Ab3AGSGA32i0e (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 7 Jan 2013 19:06:00 +0100
From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: [RESEND PATCH v3 3/5] MIPS: APRP (APSP): remove kspd.h
Date: Mon, 7 Jan 2013 10:05:12 -0800
Message-ID: <1357581914-4589-4-git-send-email-dczhu@mips.com>
In-Reply-To: <1357581914-4589-1-git-send-email-dczhu@mips.com>
References: <1357581914-4589-1-git-send-email-dczhu@mips.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org, kevink@paralogos.com, macro@linux-mips.org, john@phrozen.org
Cc: sjhill@mips.com, dczhu@mips.com
Message-ID: <20130107180512.MJusjiZctq-AUWCm_MolY8yTQMZdam-kJv9x6d4giRc@z>

Now that KSPD is gone, kspd.h has no reason to be there.

Cc: Steven J. Hill <sjhill@mips.com>
Signed-off-by: Deng-Cheng Zhu <dczhu@mips.com>
---
 arch/mips/include/asm/kspd.h |   32 --------------------------------
 1 files changed, 0 insertions(+), 32 deletions(-)
 delete mode 100644 arch/mips/include/asm/kspd.h

diff --git a/arch/mips/include/asm/kspd.h b/arch/mips/include/asm/kspd.h
deleted file mode 100644
index ec68329..0000000
--- a/arch/mips/include/asm/kspd.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- * Copyright (C) 2005 MIPS Technologies, Inc.  All rights reserved.
- *
- *  This program is free software; you can distribute it and/or modify it
- *  under the terms of the GNU General Public License (Version 2) as
- *  published by the Free Software Foundation.
- *
- *  This program is distributed in the hope it will be useful, but WITHOUT
- *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
- *  for more details.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  59 Temple Place - Suite 330, Boston MA 02111-1307, USA.
- *
- */
-
-#ifndef _ASM_KSPD_H
-#define _ASM_KSPD_H
-
-struct kspd_notifications {
-	void (*kspd_sp_exit)(int sp_id);
-
-	struct list_head list;
-};
-
-static inline void kspd_notify(struct kspd_notifications *notify)
-{
-}
-
-#endif
-- 
1.7.1
