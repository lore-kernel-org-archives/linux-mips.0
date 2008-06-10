Received: from mga02.intel.com ([134.134.136.20]:34153 "EHLO mga02.intel.com")
	by ftp.linux-mips.org with ESMTP id S20033495AbYFJBFQ (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 10 Jun 2008 02:05:16 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Subject: RE: [patch]modify the MIPS CPU classfication
Date: Tue, 10 Jun 2008 09:05:08 +0800
Message-ID: <42DFA526FC41B1429CE7279EF83C6BDC01404431@pdsmsx415.ccr.corp.intel.com>
In-Reply-To: <Pine.LNX.4.55.0806091330560.26593@cliff.in.clinika.pl>
References: <42DFA526FC41B1429CE7279EF83C6BDC01404341@pdsmsx415.ccr.corp.intel.com> <Pine.LNX.4.55.0806091330560.26593@cliff.in.clinika.pl>
From: "Chen, Huacai" <huacai.chen@intel.com>
Return-Path: <huacai.chen@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20080610010508.raPapbDwJAJhJSrRhSDLXLo4rZ2k-aMadK9XVBejKz0@z>

This is the new patch sorted numerically.

Signed-off-by: Huacai Chen <huacai.chen@intel.com>

----
diff --git a/include/asm-mips/cpu.h b/include/asm-mips/cpu.h
index 1c35cac..229a786 100644
--- a/include/asm-mips/cpu.h
+++ b/include/asm-mips/cpu.h
@@ -66,8 +66,10 @@
 #define PRID_IMP_RM7000		0x2700
 #define PRID_IMP_NEVADA		0x2800		/* RM5260 ??? */
 #define PRID_IMP_RM9000		0x3400
+#define PRID_IMP_LOONGSON1	0x4200
 #define PRID_IMP_R5432		0x5400
 #define PRID_IMP_R5500		0x5500
+#define PRID_IMP_LOONGSON2	0x6300
 
 #define PRID_IMP_UNKNOWN	0xff00
 
@@ -90,8 +92,6 @@
 #define PRID_IMP_24KE		0x9600
 #define PRID_IMP_74K		0x9700
 #define PRID_IMP_1004K		0x9900
-#define PRID_IMP_LOONGSON1      0x4200
-#define PRID_IMP_LOONGSON2      0x6300
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_SIBYTE
----

-----Original Message-----
From: macro@cliff.in.clinika.pl [mailto:macro@cliff.in.clinika.pl] On Behalf Of Maciej W. Rozycki
Sent: 2008年6月9日 20:33
To: Chen, Huacai
Cc: linux-mips@linux-mips.org; linux-kernel@vger.kernel.org
Subject: Re: [patch]modify the MIPS CPU classfication

On Mon, 9 Jun 2008, Chen, Huacai wrote:

> The company ID of Loongson1/Loongson2 is PRID_COMP_LEGACY, but they were
> classified in the list whoes company ID is  PRID_COMP_MIPS. This patch
> move them to the right place.

 Note the list is currently sorted numerically and meant to stay such.  
Please update your patch accordingly.

  Maciej
