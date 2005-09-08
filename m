Received: from unknown (HELO vasanth) (Authenticated-user:_vasanth@aelixsystems.com@[59.92.141.41])
          (envelope-sender <vasanth@aelixsystems.com>)
          by xmail05.myhosting.com (qmail-ldap-1.03) with SMTP
          for <linux-mips@linux-mips.org>; 8 Sep 2005 13:55:39 -0000
Message-ID: <005201c5b47d$20a0d4d0$3c00a8c0@vasanth>
From: "vasanth" <vasanth@aelixsystems.com>
Subject: unresolved symbol
Date: Thu, 8 Sep 2005 19:26:17 +0530
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004F_01C5B4AB.2F2C0AF0"
Return-Path: <vasanth@aelixsystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050908135617.o3K--hJNJ6883dxUbh9qPGtgJwEEEldg028C2ly8BLM@z>

This is a multi-part message in MIME format.

------=_NextPart_000_004F_01C5B4AB.2F2C0AF0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am getting the folowing error message when i do insmod .
insmod: unresolved symbol __udelay
insmod: unresolved symbol atomic_add
insmod: unresolved symbol atomic_sub

I complied the driver code for mips processor using the folowing command
mips-linux-gcc -G O -mno-abicalls -fno-pic -pipe -mtune=3D4kc -mips32 -c =
lcddriver.c -I/mykernel/include
It is compiling without any error .=20
Can anybody know how to solve this problem.?

Regards,
Vasanth.
------=_NextPart_000_004F_01C5B4AB.2F2C0AF0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Courier New" size=3D3>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I&nbsp;am getting&nbsp;the folowing =
error message=20
when i do&nbsp;insmod .</FONT></DIV>
<DIV>insmod: unresolved symbol __udelay<BR>insmod: unresolved symbol=20
atomic_add</DIV>
<DIV>insmod: unresolved symbol atomic_sub</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I&nbsp;complied the driver code for =
mips processor=20
using the folowing command</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mips-linux-gcc -G O -mno-abicalls =
-fno-pic -pipe=20
-mtune=3D4kc -mips32 -c lcddriver.c -I/mykernel/include</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It is compiling without any error . =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Can anybody&nbsp;know how to solve this =

problem.?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT></FONT></FONT><FONT face=3DArial =

size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>Vasanth.</DIV></DIV></FONT></BODY></HTML>

------=_NextPart_000_004F_01C5B4AB.2F2C0AF0--
