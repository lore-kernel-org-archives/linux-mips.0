Received: from mailapp01.imgtec.com ([195.59.15.196]:18920 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010674AbbKMAs4Aiisl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Nov 2015 01:48:56 +0100
Date: Fri, 13 Nov 2015 00:48:48 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH] MIPS: math-emu: Always propagate sNaN payload in quieting
In-Reply-To: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1511130006480.7097@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20151113004848.gvCH2tMZ3pB7LjaeDq6q5bF2hN3eMLHqXaVfqTChfNI@z>

Propagate sNaN payload in quieting in the legacy-NaN mode as well.  If 
clearing the quiet bit would produce infinity, then set the next lower 
trailing significand field bit, matching the SB-1 and BMIPS5000 hardware 
implementations.  Some other MIPS FPU hardware implementations do 
produce the default qNaN bit pattern instead.

This reverts some changes made for semantics preservation with commit 
dc3ddf42 [MIPS: math-emu: Update sNaN quieting handlers], consequently
bringing back most of the semantics from before commit fdffbafb [Lots of 
FPU bug fixes from Kjeld Borch Egevang.], except from the qNaN produced 
in the infinity case.  Previously the default qNaN bit pattern was 
produced in that case.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-mips-emu-snan-legacy.diff
Index: linux-sfr-perf132-malta-el/arch/mips/math-emu/ieee754dp.c
===================================================================
--- linux-sfr-perf132-malta-el.orig/arch/mips/math-emu/ieee754dp.c	2015-04-08 16:59:18.000000000 +0100
+++ linux-sfr-perf132-malta-el/arch/mips/math-emu/ieee754dp.c	2015-04-08 17:05:29.233752000 +0100
@@ -54,10 +54,13 @@ union ieee754dp __cold ieee754dp_nanxcpt
 	assert(ieee754dp_issnan(r));
 
 	ieee754_setcx(IEEE754_INVALID_OPERATION);
-	if (ieee754_csr.nan2008)
+	if (ieee754_csr.nan2008) {
 		DPMANT(r) |= DP_MBIT(DP_FBITS - 1);
-	else
-		r = ieee754dp_indef();
+	} else {
+		DPMANT(r) &= ~DP_MBIT(DP_FBITS - 1);
+		if (!ieee754dp_isnan(r))
+			DPMANT(r) |= DP_MBIT(DP_FBITS - 2);
+	}
 
 	return r;
 }
Index: linux-sfr-perf132-malta-el/arch/mips/math-emu/ieee754sp.c
===================================================================
--- linux-sfr-perf132-malta-el.orig/arch/mips/math-emu/ieee754sp.c	2015-04-08 16:59:45.000000000 +0100
+++ linux-sfr-perf132-malta-el/arch/mips/math-emu/ieee754sp.c	2015-04-08 17:05:29.235752000 +0100
@@ -54,10 +54,13 @@ union ieee754sp __cold ieee754sp_nanxcpt
 	assert(ieee754sp_issnan(r));
 
 	ieee754_setcx(IEEE754_INVALID_OPERATION);
-	if (ieee754_csr.nan2008)
+	if (ieee754_csr.nan2008) {
 		SPMANT(r) |= SP_MBIT(SP_FBITS - 1);
-	else
-		r = ieee754sp_indef();
+	} else {
+		SPMANT(r) &= ~SP_MBIT(SP_FBITS - 1);
+		if (!ieee754sp_isnan(r))
+			SPMANT(r) |= SP_MBIT(SP_FBITS - 2);
+	}
 
 	return r;
 }
