Received: from mailapp01.imgtec.com ([195.59.15.196]:33990 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010433AbbGPM1yKfs3G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Jul 2015 14:27:54 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id A26871EE57351
        for <linux-mips@linux-mips.org>; Thu, 16 Jul 2015 13:27:45 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH] MIPS: math-emu: ieee754int.h: Fix indentation
Date: Thu, 16 Jul 2015 13:27:36 +0100
Message-ID: <1437049656-4436-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20150716122736.1cH3WxrzTaWQXNI-gJuWlrs6ouwcUiNut5MuaNSGUjM@z>

Fix indentation for the final 'else' block.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/math-emu/ieee754int.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/math-emu/ieee754int.h b/arch/mips/math-emu/ieee754int.h
index 05389d5e3a93..c4e4936460e8 100644
--- a/arch/mips/math-emu/ieee754int.h
+++ b/arch/mips/math-emu/ieee754int.h
@@ -65,8 +65,8 @@ static inline int ieee754_class_nan(int xc)
 			vc = IEEE754_CLASS_INF;				\
 		else if (vm & SP_MBIT(SP_FBITS-1))			\
 			vc = IEEE754_CLASS_SNAN;			\
-	else								\
-		vc = IEEE754_CLASS_QNAN;				\
+		else							\
+			vc = IEEE754_CLASS_QNAN;			\
 	} else if (ve == SP_EMIN-1+SP_EBIAS) {				\
 		if (vm) {						\
 			ve = SP_EMIN;					\
-- 
2.4.5
