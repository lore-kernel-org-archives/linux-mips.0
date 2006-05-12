Received: from gateway.stellartec.com ([65.107.16.99]:1289 "EHLO
	gateway.stellartec.com") by ftp.linux-mips.org with ESMTP
	id S8133888AbWELA03 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 12 May 2006 02:26:29 +0200
Content-Transfer-Encoding: 7bit
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6755A.AE1DEC0C"
Subject: Nedd help burning flash using osprey vr41xx
Date: Thu, 11 May 2006 17:26:19 -0700
Message-ID: <7F5F67B895426C40AC75B8290421C239D1EA62@Exchange.stellartec.com>
From: "Yashwant Shitoot" <yshitoot@stellartec.com>
Return-Path: <yshitoot@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060512002619.ZGc1m55kE803jxVTVoiPzlIYZKZ9L4Hm5v88yjvad18@z>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6755A.AE1DEC0C
X-EC0D2A8E-5CB7-4969-9C36-46D859D137BE-PartID: E871A6D4-809B-4F4F-9B72-2E88ABBF3B02
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

=20

I do have a working system with vrboot, vmlinux and romdisk. Now I would
like to use about 10 bytes in the unused portion of flash (at addr
0xbfc01fc0) and put in a serial number. I have tried bin2rom
serialNum.inf 0xbfc01fc0 0xbfc01fff (and some variations) however
ethload hangs up at "sending jump addr".

=20

Any suggestions ?

=20

Thanks

=20

Yash


------_=_NextPart_001_01C6755A.AE1DEC0C
X-EC0D2A8E-5CB7-4969-9C36-46D859D137BE-PartID: 24C25BEB-49AF-4F02-B3C8-34A8320CCC93
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I do have a working system with vrboot, vmlinux and =
romdisk.
Now I would like to use about 10 bytes in the unused portion of flash =
(at addr
0xbfc01fc0) and put in a serial number. I have tried bin2rom =
serialNum.inf
0xbfc01fc0 0xbfc01fff (and some variations) however ethload hangs up at =
&#8220;sending
jump addr&#8221;.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Any suggestions ?</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Yash</span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C6755A.AE1DEC0C--
