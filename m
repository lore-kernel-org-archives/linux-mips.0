Received: from outbound-va3.frontbridge.com ([216.32.180.16]:20370 "EHLO
	VA3EHSOBE003.bigfish.com") by ftp.linux-mips.org with ESMTP
	id S28786208AbYISD1l (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 19 Sep 2008 04:27:41 +0100
Content-Class: urn:content-classes:message
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C91A07.9E5192B7"
Subject: Re: execve errno setting on MIPS
Date: Fri, 19 Sep 2008 08:57:17 +0530
Message-ID: <7B7EF7F090B9804A830ACC82F2CDE95D56DA35@insardxms01.ap.sony.com>
From: "Sadashiiv, Halesh" <halesh.sadashiv@ap.sony.com>
Return-Path: <halesh.sadashiv@ap.sony.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: tsbogend@alpha.franken.de
Cc: linux-mips@linux-mips.org
Message-ID: <20080919032717.YXqSpfNU-yP16k2QnjtHHin7s5YxQxDQ36gsqK797QI@z>

------_=_NextPart_001_01C91A07.9E5192B7
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>this is broken and does cause an EFAULT on x86 as well (you should
>take the warning from gcc about the second argument of execve serious).
=20
 Thanks, you are right.
=20
>Try:
=20
>char *e2BIG[ARG_MAX+1];
>char *envList[]=3D{NULL};
>=20
>int main(void)
>{
>  int ret,ind;
>=20
>   for(ind =3D 0; ind < ARG_MAX+1; ind++)
>        e2BIG[ind] =3D strdup("helloword");
>=20
>=20
 It wroks on X86 and other Archs.
>=20
>=20
>And it looks like the ARG_MAX limit is bigger than my installed glibc
>thinks, because it works at least on x86. When I increase the array two
>2 * ARG_MAX I'll get the wanted E2BIG.
=20
 Yes, on MIPS we need to increase the ARM_MAX to 2*ARG_MAX to get E2BIG.
=20
Thanks,
Halesh

=20



-------------------------------------------------------------------
This email is confidential and intended only for the use of the =
individual or entity named above and may contain information that is =
privileged. If you are not the intended recipient, you are notified that =
any dissemination, distribution or copying of this email is strictly =
prohibited. If you have received this email in error, please notify us =
immediately by return email or telephone and destroy the original =
message. - This mail is sent via Sony Asia Pacific Mail Gateway.
-------------------------------------------------------------------

------_=_NextPart_001_01C91A07.9E5192B7
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"State"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place" downloadurl=3D"http://www.5iantlavalamp.com/"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
@font-face
	{font-family:"\@MS Mincho";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
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
pre
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
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

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1><pre><font size=3D2 color=3Dblack face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;color:black'>&gt;this is broken and does cause =
an EFAULT on x86 as well (you =
should<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;take the warning from gcc =
about the second argument of execve =
serious).<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'><o:p>&nbsp;</o:p></span></font></p=
re><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'> Thanks, you are =
right.<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'><o:p>&nbsp;</o:p></span></font></p=
re><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;Try:<o:p></o:p></span></font><=
/pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'><o:p>&nbsp;</o:p></span></font></p=
re><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;char =
*e2BIG[ARG_MAX+1];<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;char =
*envList[]=3D{NULL};<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;<o:p>&nbsp;</o:p></span></font=
></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;int =
main(void)<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;{<o:p></o:p></span></font></pr=
e><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;&nbsp; int ret,<st1:State
w:st=3D"on"><st1:place =
w:st=3D"on">ind</st1:place></st1:State>;<o:p></o:p></span></font></pre><p=
re><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;<o:p>&nbsp;</o:p></span></font=
></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;&nbsp;&nbsp; for(<st1:State
w:st=3D"on">ind</st1:State> =3D 0; <st1:State =
w:st=3D"on">ind</st1:State> &lt; ARG_MAX+1; <st1:State
w:st=3D"on"><st1:place =
w:st=3D"on">ind++</st1:place></st1:State>)<o:p></o:p></span></font></pre>=
<pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; e2BIG[<st1:State
w:st=3D"on"><st1:place w:st=3D"on">ind</st1:place></st1:State>] =3D =
strdup(&quot;helloword&quot;);<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;<o:p>&nbsp;</o:p></span></font=
></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;<o:p>&nbsp;</o:p></span></font=
></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'> It wroks on X86 and other =
Archs.<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;<o:p>&nbsp;</o:p></span></font=
></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;<o:p>&nbsp;</o:p></span></font=
></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;And it looks like the ARG_MAX =
limit is bigger than my installed =
glibc<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;thinks, because it works at =
least on x86. When I increase the array =
two<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>&gt;2 * ARG_MAX I'll get the =
wanted E2BIG.<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'><o:p>&nbsp;</o:p></span></font></p=
re><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'> Yes, on MIPS we need to increase =
the ARM_MAX to 2*ARG_MAX to get =
E2BIG.<o:p></o:p></span></font></pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'><o:p>&nbsp;</o:p></span></font></p=
re><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>Thanks,<o:p></o:p></span></font></=
pre><pre><font
size=3D2 color=3Dblack face=3D"Courier New"><span =
style=3D'font-size:10.0pt;color:black'>Halesh<o:p></o:p></span></font></p=
re>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

<p></p><hr><br>This email is confidential and intended only for the use =
of the individual or entity named above and may contain information that =
is privileged. If you are not the intended recipient, you are notified =
that any dissemination, distribution or copying of this email is =
strictly prohibited. If you have received this email in error, please =
notify us immediately by return email or telephone and destroy the =
original message. - This mail is sent via Sony Asia Pacific Mail =
Gateway.<hr></body>

</html>

------_=_NextPart_001_01C91A07.9E5192B7--
