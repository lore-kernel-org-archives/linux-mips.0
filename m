Received: from ind-iport-1.cisco.com ([64.104.129.195]:61750 "EHLO
	ind-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20045047AbYGHJVg (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 8 Jul 2008 10:21:36 +0100
Received: from hkg-core-1.cisco.com (hkg-core-1.cisco.com [64.104.123.94])
	by hkg-dkim-2.cisco.com (8.12.11/8.12.11) with ESMTP id m689L9L5020364
	for <linux-mips@linux-mips.org>; Tue, 8 Jul 2008 17:21:09 +0800
Received: from xbh-hkg-412.apac.cisco.com (xbh-hkg-412.cisco.com [64.104.123.69])
	by hkg-core-1.cisco.com (8.13.8/8.13.8) with ESMTP id m689L9p9003482
	for <linux-mips@linux-mips.org>; Tue, 8 Jul 2008 09:21:09 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C8E0DB.F49FC1B0"
Subject: how to print stack trace in signal handler
Date: Tue, 8 Jul 2008 17:21:27 +0800
Message-ID: <F86B91A10B14744E88408E80B8A30EF30340DE33@xmb-hkg-412.apac.cisco.com>
From: "Rockson Li (zhengyli)" <zhengyli@cisco.com>
Return-Path: <zhengyli@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20080708092127.Aj90STBUsr9GjmZs0vaZVeBFJl0EqafYwl12eqyhJ0s@z>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C8E0DB.F49FC1B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Gurus,
=20
I want to print the stack trace in exception signal handler, do you guys
know any reliable way to do it?
=20
My Dev Env,
Gcc: MontaVista 3.3.1
Linux Kernel: 2.4.18
Glibc: 2.3.2
=20
I tired,=20
1) backtrace, it just print nothing.
2) try to use sa_sigaction, but when I get uc_mcontext.gregs from the
third parameter (cast to ucontext_t*),
    there is no stack pointer register??
=20
do not know why.
=20
Many thanks=20
=20
-Rockson
=20
Registers dumped in signal handler:
Reg 0: 0
Reg 1: 5f13
Reg 2: 0
Reg 3: 47269c
Reg 4: 0
Reg 5: 0
Reg 6: 0
Reg 7: 7fff7918
Reg 8: 0
Reg 9: 0
Reg 10: 0
Reg 11: 8
Reg 12: 0
Reg 13: b
Reg 14: 0
Reg 15: 7fff78f8
Reg 16: 0
Reg 17: 0
Reg 18: 0
Reg 19: 0
Reg 20: 0
Reg 21: 5f00
Reg 22: 0
Reg 23: b
Reg 24: 0
Reg 25: 0
Reg 26: 0
Reg 27: 0
Reg 28: 0
Reg 29: 0
Reg 30: 0
Reg 31: 0
Reg 32: 0
Reg 33: b
Reg 34: 0
Reg 35: 0
Reg 36: 0
=20
=20


------_=_NextPart_001_01C8E0DB.F49FC1B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.6000.16674" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>Hi=20
Gurus,</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>I want =
to print the=20
stack trace in exception signal handler, do you guys know any reliable =
way to do=20
it?</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>My Dev =

Env,</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>Gcc: =
MontaVista=20
3.3.1</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>Linux =
Kernel:=20
2.4.18</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>Glibc: =

2.3.2</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008></SPAN>&nbsp;</DIV></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>I =
tired,=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>1) =
backtrace, it=20
just print nothing.</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>2) try =
to use=20
sa_sigaction, but when I get uc_mcontext.gregs from the third parameter =
(cast to=20
ucontext_t*),</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;=20
there is no stack pointer register??</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>do not =
know=20
why.</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>Many =
thanks=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2>-Rockson</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial =
size=3D2>Registers dumped in=20
signal handler:</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial size=3D2>Reg 0: =
0<BR>Reg 1:=20
5f13<BR>Reg 2: 0<BR>Reg 3: 47269c<BR>Reg 4: 0<BR>Reg 5: 0<BR>Reg 6: =
0<BR>Reg 7:=20
7fff7918<BR>Reg 8: 0<BR>Reg 9: 0<BR>Reg 10: 0<BR>Reg 11: 8<BR>Reg 12: =
0<BR>Reg=20
13: b<BR>Reg 14: 0<BR>Reg 15: 7fff78f8<BR>Reg 16: 0<BR>Reg 17: 0<BR>Reg =
18:=20
0<BR>Reg 19: 0<BR>Reg 20: 0<BR>Reg 21: 5f00<BR>Reg 22: 0<BR>Reg 23: =
b<BR>Reg 24:=20
0<BR>Reg 25: 0<BR>Reg 26: 0<BR>Reg 27: 0<BR>Reg 28: 0<BR>Reg 29: =
0<BR>Reg 30:=20
0<BR>Reg 31: 0<BR>Reg 32: 0<BR>Reg 33: b<BR>Reg 34: 0<BR>Reg 35: =
0<BR>Reg 36:=20
0</FONT></SPAN></DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D156351009-08072008><FONT face=3DArial =
size=3D2>&nbsp;</DIV>
<DIV><BR></DIV></FONT></SPAN></BODY></HTML>

------_=_NextPart_001_01C8E0DB.F49FC1B0--
