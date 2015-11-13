Received: from mailapp01.imgtec.com ([195.59.15.196]:64737 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013461AbbKMArQWiOll (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 13 Nov 2015 01:47:16 +0100
Date: Fri, 13 Nov 2015 00:47:08 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH 3/8] MIPS: math-emu: Add IEEE Std 754-2008 ABS.fmt and NEG.fmt
 emulation
In-Reply-To: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1511130006060.7097@tp.orcam.me.uk>
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
Message-ID: <20151113004708.kHmV6i7CYgsf09it1CWaMZWOoCyauz8viMtiImgyFJM@z>

Implement IEEE Std 754-2008 non-arithmetic ABS.fmt and NEG.fmt emulation 
wired to the state of the FCSR.ABS2008 bit.  In the non-arithmetic mode 
the sign bit is altered according to the operation requested regardless 
of the datum encoded in the input operand, no other bits are changed, 
the resulting bit pattern is written to the output operand and no 
exception is ever signalled.

Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>
---
linux-mips-emu-abs2008.diff
Index: linux-sfr-test/arch/mips/math-emu/dp_simple.c
===================================================================
--- linux-sfr-test.orig/arch/mips/math-emu/dp_simple.c	2015-11-10 17:45:25.145419000 +0000
+++ linux-sfr-test/arch/mips/math-emu/dp_simple.c	2015-11-11 02:19:59.120054000 +0000
@@ -23,27 +23,39 @@
 
 union ieee754dp ieee754dp_neg(union ieee754dp x)
 {
-	unsigned int oldrm;
 	union ieee754dp y;
 
-	oldrm = ieee754_csr.rm;
-	ieee754_csr.rm = FPU_CSR_RD;
-	y = ieee754dp_sub(ieee754dp_zero(0), x);
-	ieee754_csr.rm = oldrm;
+	if (ieee754_csr.abs2008) {
+		y = x;
+		DPSIGN(y) = !DPSIGN(x);
+	} else {
+		unsigned int oldrm;
+
+		oldrm = ieee754_csr.rm;
+		ieee754_csr.rm = FPU_CSR_RD;
+		y = ieee754dp_sub(ieee754dp_zero(0), x);
+		ieee754_csr.rm = oldrm;
+	}
 	return y;
 }
 
 union ieee754dp ieee754dp_abs(union ieee754dp x)
 {
-	unsigned int oldrm;
 	union ieee754dp y;
 
-	oldrm = ieee754_csr.rm;
-	ieee754_csr.rm = FPU_CSR_RD;
-	if (DPSIGN(x))
-		y = ieee754dp_sub(ieee754dp_zero(0), x);
-	else
-		y = ieee754dp_add(ieee754dp_zero(0), x);
-	ieee754_csr.rm = oldrm;
+	if (ieee754_csr.abs2008) {
+		y = x;
+		DPSIGN(y) = 0;
+	} else {
+		unsigned int oldrm;
+
+		oldrm = ieee754_csr.rm;
+		ieee754_csr.rm = FPU_CSR_RD;
+		if (DPSIGN(x))
+			y = ieee754dp_sub(ieee754dp_zero(0), x);
+		else
+			y = ieee754dp_add(ieee754dp_zero(0), x);
+		ieee754_csr.rm = oldrm;
+	}
 	return y;
 }
Index: linux-sfr-test/arch/mips/math-emu/sp_simple.c
===================================================================
--- linux-sfr-test.orig/arch/mips/math-emu/sp_simple.c	2015-11-10 17:45:25.147428000 +0000
+++ linux-sfr-test/arch/mips/math-emu/sp_simple.c	2015-11-11 02:19:59.165062000 +0000
@@ -23,27 +23,39 @@
 
 union ieee754sp ieee754sp_neg(union ieee754sp x)
 {
-	unsigned int oldrm;
 	union ieee754sp y;
 
-	oldrm = ieee754_csr.rm;
-	ieee754_csr.rm = FPU_CSR_RD;
-	y = ieee754sp_sub(ieee754sp_zero(0), x);
-	ieee754_csr.rm = oldrm;
+	if (ieee754_csr.abs2008) {
+		y = x;
+		SPSIGN(y) = !SPSIGN(x);
+	} else {
+		unsigned int oldrm;
+
+		oldrm = ieee754_csr.rm;
+		ieee754_csr.rm = FPU_CSR_RD;
+		y = ieee754sp_sub(ieee754sp_zero(0), x);
+		ieee754_csr.rm = oldrm;
+	}
 	return y;
 }
 
 union ieee754sp ieee754sp_abs(union ieee754sp x)
 {
-	unsigned int oldrm;
 	union ieee754sp y;
 
-	oldrm = ieee754_csr.rm;
-	ieee754_csr.rm = FPU_CSR_RD;
-	if (SPSIGN(x))
-		y = ieee754sp_sub(ieee754sp_zero(0), x);
-	else
-		y = ieee754sp_add(ieee754sp_zero(0), x);
-	ieee754_csr.rm = oldrm;
+	if (ieee754_csr.abs2008) {
+		y = x;
+		SPSIGN(y) = 0;
+	} else {
+		unsigned int oldrm;
+
+		oldrm = ieee754_csr.rm;
+		ieee754_csr.rm = FPU_CSR_RD;
+		if (SPSIGN(x))
+			y = ieee754sp_sub(ieee754sp_zero(0), x);
+		else
+			y = ieee754sp_add(ieee754sp_zero(0), x);
+		ieee754_csr.rm = oldrm;
+	}
 	return y;
 }
