Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199711142117.NAA27890@oz.engr.sgi.com>
Subject: Pentium F00F bug Linux workaround
Date: Fri, 14 Nov 1997 13:17:24 -0800 (PST)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19971114211724.dnXwdXtqecxAely4Wm8NQC4LB5eLDpTLLlB9W5eYKAw@z>

[Just forwarding from linux-dev since I thought some people
 may be interested.  Ingo Molnar has found a way to workaround
 the latest Pentium/Pentium-MMX F00F bug. Linus then improved on it.

 I'm impressed by the repeatedly demonstrated ability of the Linux
 community to beat Microsoft.  It remains to be seen how long it'll
 take Microsoft to respond to this serious bug that can crash any
 Windows/WindowsNT machine from user mode (incl. any remotely loaded
 Captive-X control)]

-------------------------------------------------------------------------

From Linus:

Ingo, Alan, others,
 I have a quick cleanup of 2.1.63 that looks a bit better wrt the F0 0F
bug, and also avoids the double SMP unlock that somebody noticed (sorry
for not giving attribution, I've been pretty rushed today trying to get
the stuff out quickly to people to test). 

I still don't have any pentium closeby to actually test this, so I'm
appending patches relative to 2.1.63. Does this still work for people with
the bug?

		Linus

-----
diff -u --recursive --new-file v2.1.63/linux/arch/i386/mm/fault.c linux/arch/i386/mm/fault.c
--- v2.1.63/linux/arch/i386/mm/fault.c	Wed Nov 12 13:34:25 1997
+++ linux/arch/i386/mm/fault.c	Wed Nov 12 13:33:48 1997
@@ -74,14 +74,6 @@
 	return 0;
 }
 
-asmlinkage void divide_error(void);
-asmlinkage void debug(void);
-asmlinkage void nmi(void);
-asmlinkage void int3(void);
-asmlinkage void overflow(void);
-asmlinkage void bounds(void);
-asmlinkage void invalid_op(void);
-
 asmlinkage void do_divide_error (struct pt_regs *, unsigned long);
 asmlinkage void do_debug (struct pt_regs *, unsigned long);
 asmlinkage void do_nmi (struct pt_regs *, unsigned long);
@@ -189,44 +181,27 @@
 		goto out;
 	}
 
-	printk(&quot;&lt;%p/%p&gt;\n&quot;, idt2, (void *)address);
 	/*
 	 * Pentium F0 0F C7 C8 bug workaround:
 	 */
-	if ( pentium_f00f_bug &amp;&amp; (address &gt;= (unsigned long)idt2) &amp;&amp;
-			(address &lt; (unsigned long)idt2+256*8) ) {
-
-		void (*handler) (void);
-		int nr = (address-(unsigned long)idt2)/8;
-		unsigned long low, high;
-
-		low = idt[nr].a;
-		high = idt[nr].b;
-
-		handler = (void (*) (void)) ((low&amp;0x0000ffff) | (high&amp;0xffff0000));
-		printk(&quot;&lt;handler %p... &quot;, handler);
-		unlock_kernel();
-
-		if (handler==divide_error)
-			do_divide_error(regs,error_code);
-		else if (handler==debug)
-			do_debug(regs,error_code);
-		else if (handler==nmi)
-			do_nmi(regs,error_code);
-		else if (handler==int3)
-			do_int3(regs,error_code);
-		else if (handler==overflow)
-			do_overflow(regs,error_code);
-		else if (handler==bounds)
-			do_bounds(regs,error_code);
-		else if (handler==invalid_op)
-			do_invalid_op(regs,error_code);
-		else {
-			printk(&quot;INVALID HANDLER!\n&quot;);
-			for (;;) __cli();
+	if ( pentium_f00f_bug ) {
+		unsigned long nr;
+		
+		nr = (address - (unsigned long) idt2) &gt;&gt; 3;
+
+		if (nr &lt; 7) {
+			static void (*handler[])(struct pt_regs *, unsigned long) = {
+				do_divide_error,	/* 0 - divide overflow */
+				do_debug,		/* 1 - debug trap */
+				do_nmi,			/* 2 - NMI */
+				do_int3,		/* 3 - int 3 */
+				do_overflow,		/* 4 - overflow */
+				do_bounds,		/* 5 - bound range */
+				do_invalid_op };	/* 6 - invalid opcode */
+			unlock_kernel();
+			handler[nr](regs, error_code);
+			return;
 		}
-		printk(&quot;... done&gt;\n&quot;);
-		goto out;
 	}
 
 	/* Are we prepared to handle this kernel fault?  */


-- 
Peace, Ariel
