Received: from lahoo.priv ([162.39.1.206]) by ispmxmta09-srv.alltel.net
          with ESMTP
          id <20040413192043.VXPA2984.ispmxmta09-srv.alltel.net@lahoo.priv>
          for <linux-mips@linux-mips.org>; Tue, 13 Apr 2004 14:20:43 -0500
Received: from prefect.priv ([10.1.1.141] helo=prefect)
	by lahoo.priv with smtp (Exim 3.36 #1 (Debian))
	id 1BDTET-0006Ax-00
	for <linux-mips@linux-mips.org>; Tue, 13 Apr 2004 15:06:05 -0400
Message-ID: <028001c4218c$6d792350$8d01010a@prefect>
From: "Bradley D. LaRonde" <brad@laronde.org>
Subject: [PATCH] catch "new" gcc 3.4.0 sections
Date: Tue, 13 Apr 2004 15:20:48 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@laronde.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040413192048.l7Mjgo_u8YN7QRFjBUMvzxUQOSPZDKvHfs0_q4E-l9c@z>

Building with gcc 3.4.0 emits a couple new sections, .rodata.cst4 and
.rodata.str1.4, which the current ld.script doesn't contemplate.  Here is a
patch to catch them (and maybe some other latent ones).

Anyone know why or when these sections are emitted?

Regards,
Brad


diff -u -r1.1.1.1 ld.script.in
--- arch/mips/ld.script.in      10 Nov 2003 21:06:52 -0000      1.1.1.1
+++ arch/mips/ld.script.in      13 Apr 2004 19:18:25 -0000
@@ -11,6 +11,11 @@
     *(.text)
     *(.rodata)
     *(.rodata1)
+    *(.rodata.str1.1);
+    *(.rodata.str1.4);
+    *(.rodata.str1.32);
+    *(.rodata.cst4);
+    *(.rodata.cst8);
     /* .gnu.warning sections are handled specially by elf32.em.  */
     *(.gnu.warning)
   } =0
