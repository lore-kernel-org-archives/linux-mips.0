Message-ID: <000e01c3e04a$52f38a80$6a0d12ac@ess>
From: "wei liu" <wei.liu@esstech.com>
Subject: is there any cache problem with 4kc core?
Date: Wed, 21 Jan 2004 10:13:51 -0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C3E007.44A717A0"
Return-Path: <Wei.Liu@esstech.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040121181351.ptmVIoaB4O-LeGOIvpYG6EDV7JJnc_IKJrepk6NICqA@z>

This is a multi-part message in MIME format.

------=_NextPart_000_000B_01C3E007.44A717A0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

I met a crash problem when trying linux2.4.18 on 4kc board. When the =
kernel starts thread to run function init, it will crash, showing =
Unhandled kernel unaligned access in =
unaligned.c:emulate_load_store_insn, line 3
51:
while it is ok for me to run linux2.4.3

Following is chip detail.
CPU revision is: 00018004
Primary instruction cache 8kb, linesize 16 bytes (2 ways)
Primary data cache 8kb, linesize 16 bytes (2 ways)
Linux version 2.4.18-MIPS-01.01 (gcc version 3.0)=20


------=_NextPart_000_000B_01C3E007.44A717A0
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>I met a crash problem when trying linux2.4.18 on 4kc =
board.=20
When the kernel starts thread to run function init, it will crash, =
showing=20
Unhandled kernel unaligned access in =
unaligned.c:emulate_load_store_insn, line=20
3<BR>51:</FONT></DIV>
<DIV><FONT size=3D2>while it is ok for me to run linux2.4.3</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Following is chip detail.</FONT></DIV>
<DIV><FONT size=3D2>CPU revision is: 00018004<BR>Primary instruction =
cache 8kb,=20
linesize 16 bytes (2 ways)<BR>Primary data cache 8kb, linesize 16 bytes =
(2=20
ways)<BR>Linux version 2.4.18-MIPS-01.01 (gcc version 3.0)=20
<BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_000B_01C3E007.44A717A0--
