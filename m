Date: Sun, 29 Jun 2003 13:25:58 +0200 (MEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] MIPS DEC/SGI Linux logo
Message-ID: <Pine.GSO.4.21.0306291324380.14478-100000@vervain.sonytel.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <Geert.Uytterhoeven@sonycom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: James Simmons <jsimmons@infradead.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: Linux Frame Buffer Device Development <linux-fbdev-devel@lists.sourceforge.net>, Linux/MIPS Development <linux-mips@linux-mips.org>
Message-ID: <20030629112558.v4cXvgRUvvwRlPwzYlGjfM6-2LqwHLryWEEg0mProPc@z>


MIPS: Show the correct logo on DEC and SGI machines.

--- linux-2.5.x/drivers/video/logo/logo.c.orig	Tue May 27 19:03:30 2003
+++ linux-2.5.x/drivers/video/logo/logo.c	Sat Jun 28 14:54:12 2003
@@ -66,7 +66,7 @@
 #endif
 #ifdef CONFIG_LOGO_DEC_CLUT224
 		/* DEC Linux logo on MIPS/MIPS64 */
-		if (mips_machgroup == MACH_GROUP_SGI)
+		if (mips_machgroup == MACH_GROUP_DEC)
 			logo = &logo_dec_clut224;
 #endif
 #ifdef CONFIG_LOGO_MAC_CLUT224

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
