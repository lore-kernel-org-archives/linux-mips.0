Message-ID: <00ba01c09c6e$84788380$056aaac0@kjlin>
From: "kjlin" <kj.lin@viditec-netmedia.com.tw>
Subject: Does linux support for microprocessor without MMU?
Date: Thu, 22 Feb 2001 09:26:44 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00B7_01C09CB1.9247D720"
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010222012644.ht3J-QA0FXP9SVMlgEwzA5BNBoaBIHSeRtwGDNzVWOw@z>

This is a multi-part message in MIME format.

------=_NextPart_000_00B7_01C09CB1.9247D720
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Howdy,

I got an embedded MIPS board recently.
It has the following features:
- CPU implements a five-stage pipeline with performance similar to the =
MIPS R3000 pipeline.
- MIPS32 compatible instruction set
- R4000 style privileged resource architecture.
- Without MMU.

I am estimating the possibility of porting linux on it.
Can Linux/MIPS 2.2 or 2.4 support for such a board which without MMU ?
Because i consider it is the most difficult part in the porting process.
Am i right?

KJ




------=_NextPart_000_00B7_01C09CB1.9247D720
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dbig5" http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Howdy,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I got an embedded MIPS board recently.</FONT></DIV>
<DIV><FONT size=3D2>It has the following features:</FONT></DIV>
<DIV><FONT size=3D2>- CPU implements a five-stage pipeline with =
performance=20
similar to the MIPS&nbsp;R3000 pipeline.</FONT></DIV>
<DIV><FONT size=3D2>- MIPS32 compatible instruction set</FONT></DIV>
<DIV><FONT size=3D2>- R4000 style privileged resource =
architecture.</FONT></DIV>
<DIV><FONT size=3D2>- Without MMU.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I am estimating the possibility of porting linux on=20
it.</FONT></DIV>
<DIV><FONT size=3D2>Can&nbsp;Linux/MIPS 2.2 or 2.4 support for such a =
board which=20
without MMU ?</FONT></DIV>
<DIV><FONT size=3D2>Because i consider it is the most difficult part in =
the=20
porting process.</FONT></DIV>
<DIV><FONT size=3D2>Am i right?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>KJ</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00B7_01C09CB1.9247D720--
