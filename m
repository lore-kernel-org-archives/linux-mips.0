Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4338E.53011F38"
Subject: Strange Behavior - help
Date: Thu, 6 May 2004 10:19:43 -0700
Message-ID: <7F5F67B895426C40AC75B8290421C23915CE57@Exchange.stellartec.com>
From: "Yashwant Shitoot" <yshitoot@stellartec.com>
Return-Path: <yshitoot@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040506171943.fshjSpHL8v_W2ld0de6qPaFQIyu_t1_rkj7Rm1gmp08@z>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C4338E.53011F38
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Hello Friends,

=20

My root file system and linux is in rom (flash). The linux itself runs
out of ram. When I reprogram the rom, I erase and write a new image of
the rom from a compact flash card. After the new image is programmed in
the function fclose() hangs up, implying that fclose() is rom resident
and loaded as needed. Does this make sense ? Remember even after erasing
the rom fopen() works fine.

=20

Thanks=20

=20

Yash


------_=_NextPart_001_01C4338E.53011F38
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
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
	margin:1.0in 1.0in 192.25pt 1.0in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello Friends,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>My root file system and linux is in rom (flash). The =
linux
itself runs out of ram. When I reprogram the rom, I erase and write a =
new image
of the rom from a compact flash card. After the new image is programmed =
in the
function fclose() hangs up, implying that fclose() is rom resident and =
loaded
as needed. Does this make sense ? Remember even after erasing the rom =
fopen()
works fine.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Yash<o:p></o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C4338E.53011F38--
