Received: from GILAD (comp113.wanwall.com [10.0.0.113])
	by mail.riverhead.com (8.11.0/8.11.0) with SMTP id h0EAClv01441
	for <linux-mips@linux-mips.org>; Tue, 14 Jan 2003 12:12:48 +0200
From: "Gilad Benjamini" <gilad@riverhead.com>
Subject: insmod failure: "Unhandled relocation" errors
Date: Tue, 14 Jan 2003 12:06:46 +0200
Message-ID: <001801c2bbb4$a6177de0$7100000a@riverhead.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0019_01C2BBC5.69A04DE0"
Return-Path: <gilad@riverhead.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030114100646.IOMfaoYoQIKlomfuy_csTuRK2MXsIQ6EqTrq_AujCps@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0019_01C2BBC5.69A04DE0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 7bit

Hi,
I've built,compiled and ran successfully a 64 bit kernel on my 
mips64 platform. Kernel was compiled with support for 32 bit binaries.

I am now trying to insert a module, a standard module from
the kernel tree, and get lots of errors such as:
"Unhandled relocation of type 18 for"
or
"Unhandled relocation of type 18 for <function_name>"

How can this be resolved ?

TIA



------=_NextPart_000_0019_01C2BBC5.69A04DE0
Content-Type: text/html;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dwindows-1255">


<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2>Hi,</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial size=3D2>I've =
built,compiled=20
and ran successfully a 64 bit kernel on my </FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial size=3D2>mips64 =
platform.=20
Kernel was compiled with support for 32 bit =
binaries.</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial size=3D2>I am =
now trying to=20
insert a module, a standard module from</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial size=3D2>the =
kernel tree, and=20
get lots of errors such as:</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial =
size=3D2>"Unhandled=20
relocation of type 18 for"</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2>or</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial =
size=3D2>"Unhandled=20
relocation of type 18 for &lt;function_name&gt;"</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial size=3D2>How =
can this be=20
resolved ?</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2>TIA</FONT></SPAN></DIV>
<DIV><SPAN class=3D240080310-14012003></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D240080310-14012003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0019_01C2BBC5.69A04DE0--
