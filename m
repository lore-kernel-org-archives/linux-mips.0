Received: from mailapp01.imgtec.com ([195.89.28.115]:56019 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6834698AbaDPM6sOvCbH (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 16 Apr 2014 14:58:48 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id 8E1C550E4FF3D
        for <linux-mips@linux-mips.org>; Wed, 16 Apr 2014 13:58:39 +0100 (IST)
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 18/39] MIPS: inst.h: define MT yield op
Date: Wed, 16 Apr 2014 13:53:09 +0100
Message-ID: <1397652810-4336-19-git-send-email-paul.burton@imgtec.com>
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
Message-ID: <20140416125309.QxJb14VGoDu12RJfVI54ZJ-zXHOHeWv-w9IJv5OA6Qc@z>

The opcode for the MT ASE yield instruction within the spec3 group was
missing. This patch adds it for use by a subsequent patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---
 arch/mips/include/uapi/asm/inst.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index 044123b..b7492c6 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -74,16 +74,17 @@ enum spec2_op {
 enum spec3_op {
 	ext_op, dextm_op, dextu_op, dext_op,
 	ins_op, dinsm_op, dinsu_op, dins_op,
-	lx_op     = 0x0a, lwle_op   = 0x19,
-	lwre_op   = 0x1a, cachee_op = 0x1b,
-	sbe_op    = 0x1c, she_op    = 0x1d,
-	sce_op    = 0x1e, swe_op    = 0x1f,
-	bshfl_op  = 0x20, swle_op   = 0x21,
-	swre_op   = 0x22, prefe_op  = 0x23,
-	dbshfl_op = 0x24, lbue_op   = 0x28,
-	lhue_op   = 0x29, lbe_op    = 0x2c,
-	lhe_op    = 0x2d, lle_op    = 0x2e,
-	lwe_op    = 0x2f, rdhwr_op  = 0x3b
+	yield_op  = 0x09, lx_op     = 0x0a,
+	lwle_op   = 0x19, lwre_op   = 0x1a,
+	cachee_op = 0x1b, sbe_op    = 0x1c,
+	she_op    = 0x1d, sce_op    = 0x1e,
+	swe_op    = 0x1f, bshfl_op  = 0x20,
+	swle_op   = 0x21, swre_op   = 0x22,
+	prefe_op  = 0x23, dbshfl_op = 0x24,
+	lbue_op   = 0x28, lhue_op   = 0x29,
+	lbe_op    = 0x2c, lhe_op    = 0x2d,
+	lle_op    = 0x2e, lwe_op    = 0x2f,
+	rdhwr_op  = 0x3b
 };
 
 /*
-- 
1.8.5.3
