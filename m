Received: from wssseeger ([192.168.1.53]) by nt_server.stellartec.com
          (Post.Office MTA v3.1.2 release (PO205-101c)
          ID# 568-43562U100L2S100) with SMTP id AAA479
          for <linux-mips@linux-mips.org>; Thu, 24 Apr 2003 07:04:32 -0700
Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: [patch] wait instruction on vr4181
Date: Thu, 24 Apr 2003 07:10:28 -0700
Message-ID: <076701c30a6b$429b0560$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0768_01C30A30.963C2D60"
In-Reply-To: <20030424141217.A23893@linux-mips.org>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030424141028.HV90FLJ9HNwAVuBJvI1QdW12xdvWldLOgG8c4CDl19o@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0768_01C30A30.963C2D60
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

The VR4181 does work with the wait instruction. This is a patch for that.
(arch/mips/cpu-probe.c)

Steve


------=_NextPart_000_0768_01C30A30.963C2D60
Content-Type: application/octet-stream;
	name="patch-cpu-probe.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="patch-cpu-probe.c"

--- linux-2.4.21.orig/arch/mips/kernel/cpu-probe.c	2003-04-24 =
05:32:21.000000000 -0700
+++ linux-2.4.21/arch/mips/kernel/cpu-probe.c	2003-04-24 =
05:26:42.000000000 -0700
@@ -69,6 +69,7 @@
 	case CPU_NEVADA:
 	case CPU_RM7000:
 	case CPU_TX49XX:
+	case CPU_VR4181:
 	case CPU_4KC:
 	case CPU_4KEC:
 	case CPU_4KSC:

------=_NextPart_000_0768_01C30A30.963C2D60--
