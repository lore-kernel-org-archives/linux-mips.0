Received: from mailapp01.imgtec.com ([195.89.28.114]:33132 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837072AbaDPM6ogfQ53 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 14:58:44 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 52A25C916D05
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 13:58:35 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 17/39] MIPS: inst.h: define COP0 wait op
Date: Wed, 16 Apr 2014 13:53:08 +0100
Message-ID: <1397652810-4336-18-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416125308.PYNzvKRVN30eOrlvioug8Zy-Ut1zDKvJC_gdB8pmocU@z>

The func field for the wait instruction was missing from inst.h - this
patch adds it.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index df6e775..044123b 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -125,7 +125,8 @@ enum bcop_op {
 enum cop0_coi_func {
 	tlbr_op	      = 0x01, tlbwi_op	    = 0x02,
 	tlbwr_op      = 0x06, tlbp_op	    = 0x08,
-	rfe_op	      = 0x10, eret_op	    = 0x18
+	rfe_op	      = 0x10, eret_op	    = 0x18,
+	wait_op       = 0x20,
 };
 
 /*
-- 
1.8.5.3
