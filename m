Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: [patch] new wait instruction for vr4181
Date: Thu, 24 Apr 2003 14:28:47 -0700
Message-ID: <079701c30aa8$7de13300$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0798_01C30A6D.D1825B00"
In-Reply-To: <20030424112711.E28275@mvista.com>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Jun Sun' <jsun@mvista.com>, 'Steven Seeger' <sseeger@stellartec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030424212847.A_gxLrtmak5ggkEaEk-WIm_GDlUictIkIwNZ6hTWZ-0@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0798_01C30A6D.D1825B00
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

I think I figured this out. Could someone look at this and tell me if I did
it right?

Thanks.

-Steve


------=_NextPart_000_0798_01C30A6D.D1825B00
Content-Type: application/octet-stream;
	name="cpu-probe.c.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cpu-probe.c.diff"

--- /root/vr/new/linux-2.4.21.orig/arch/mips/kernel/cpu-probe.c	=
2003-04-24 05:32:21.000000000 -0700
+++ ./cpu-probe.c	2003-04-24 14:16:35.000000000 -0700
@@ -34,6 +34,16 @@
 		".set\tmips0");
 }
=20
+#ifdef CONFIG_VR4181
+static void vr4181_wait(void)
+{
+   __asm__(".set\tnoreorder\n"
+	   ".int 0x42000021\n"
+	   ".set\treorder\n");
+  =20
+}
+#endif
+ =20
 void au1k_wait(void)
 {
 #ifdef CONFIG_PM
@@ -83,6 +93,12 @@
 		cpu_wait =3D au1k_wait;
 		printk(" available.\n");
 		break;
+#ifdef CONFIG_VR4181
+	 case CPU_VR4181:
+	   cpu_wait =3D vr4181_wait;
+	   printk(" available\n");
+	   break;
+#endif	  =20
 	default:
 		printk(" unavailable.\n");
 		break;

------=_NextPart_000_0798_01C30A6D.D1825B00--
