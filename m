Received: from fw01.bwg.de (localhost [127.0.0.1])
	by fw01.bwg.de (8.11.6p2G/8.11.6) with ESMTP id iAQLcxR07542
	for <linux-mips@linux-mips.org>; Fri, 26 Nov 2004 22:38:59 +0100 (CET)
From: =?iso-8859-1?Q?Ralf_R=F6sch?= <ralf.roesch@rw-gmbh.de>
Subject: [PATCH] Fix for Toshiba TX49XX TLB refill handler
Date: Fri, 26 Nov 2004 22:39:06 +0100
Message-ID: <NHBBLBCCGMJFJIKAMKLHCEHNCCAA.ralf.roesch@rw-gmbh.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0024_01C4D408.BCF5F8C0"
Return-Path: <ralf.roesch@rw-gmbh.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041126213906.oV2eMPffwN0zU1eWuiOgoD4SFwJ0bt1GAUbPjj93Zf8@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0024_01C4D408.BCF5F8C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi Thiemo,

without this patch the TX4927 Toshiba processor definitely does not boot.
(My CPU was hanging without any message on the serial console), this means
the panic() message
		panic("No TLB refill handler yet (CPU type: %d)",
		      current_cpu_data.cputype);
could not be seen.

I am not sure, if the place where I inserted the new processor type is
correct.
Please review and apply.

The patch included is against 2.6.

Thanks and regards
  Ralf Roesch


------=_NextPart_000_0024_01C4D408.BCF5F8C0
Content-Type: application/octet-stream;
	name="tlbex-tx4927.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="tlbex-tx4927.patch"

Index: arch/mips/mm/tlbex.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/linux/arch/mips/mm/tlbex.c,v=0A=
retrieving revision 1.6=0A=
diff -u -r1.6 tlbex.c=0A=
--- arch/mips/mm/tlbex.c	24 Nov 2004 22:57:59 -0000	1.6=0A=
+++ arch/mips/mm/tlbex.c	26 Nov 2004 21:25:16 -0000=0A=
@@ -763,6 +763,7 @@=0A=
 	case CPU_R4700:=0A=
 	case CPU_R5000:=0A=
 	case CPU_5KC:=0A=
+	case CPU_TX49XX:=0A=
 		i_nop(p);=0A=
 		i_tlbwr(p);=0A=
 		break;=0A=

------=_NextPart_000_0024_01C4D408.BCF5F8C0--
