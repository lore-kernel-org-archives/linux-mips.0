Message-ID: <004d01c2e223$5e9d8730$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030304011459.457.qmail@web13302.mail.yahoo.com>
Subject: Re: JVM under Linux on MIPS
Date: Tue, 4 Mar 2003 08:54:56 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0048_01C2E22B.BADDE2D0"
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Rajesh Palani <rpalani2@yahoo.com>, linux-mips@linux-mips.org
Message-ID: <20030304075456.Tyxe_6wiRQ0pf_a8RC53fRMnD4f64CwC891IZ1JokBM@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0048_01C2E22B.BADDE2D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I developed a patch to post-Transvirtual Kaffe 1.0.7 that allows it to =
pass=20
all its internal regression tests and run the Spec JVM98 benchmarks
on MIPS/Linux on a MIPS Malta/5Kc system (little endian)
using H.K.'s "Red Hat" distribution (with an update to the X11
stuff).  The necessary code has been integrated into the Kaffe
CVS repository if you check out the current sources, or you
can apply the patch at
ftp://ftp.paralogos.com/pub/kaffe/mips/kaffe-1.0.7.patch_kevink_021001=20
to the 1.0.7 source release on the kaffe.org site.

Note that I did *not* get the JIT functioning fully.  It will run some
programs (including Caffeinemark) but contains the same bugs in=20
argument passing that I fixed for the interpreter linkage to native=20
methods, but the same fix doesn't quite work there, and I ran out of =
time=20
to look at it.  You therefore need to run configure with =
--with-engine=3Dintrp
and to not expect miraculous performance.

  ----- Original Message -----=20
  From: Rajesh Palani=20
  To: linux-mips@linux-mips.org=20
  Sent: Tuesday, March 04, 2003 2:14 AM
  Subject: JVM under Linux on MIPS


  Hi,=20

     Has anyone had any success running any open source JVMs (other than =
Cobalt machines running Transvirtual's Kaffe) under Linux/MIPS.=20

     Thanks and regards,=20

     Rajesh





-------------------------------------------------------------------------=
-----
  Do you Yahoo!?
  Yahoo! Tax Center - forms, calculators, tips, and more
------=_NextPart_000_0048_01C2E22B.BADDE2D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4919.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I developed a patch to =
post-Transvirtual Kaffe=20
1.0.7 that allows it to pass </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>all </FONT><FONT face=3DArial =
size=3D2>its internal=20
regression tests and run the Spec JVM98 benchmarks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>on MIPS/Linux on a MIPS Malta/5Kc =
system (little=20
endian)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>using H.K.'s "Red Hat" distribution =
(with an update=20
to the X11</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>stuff).&nbsp; The necessary code has =
been=20
integrated into the Kaffe</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>CVS repository if you check out the =
current=20
sources, or you</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>can apply the patch at</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"ftp://ftp.paralogos.com/pub/kaffe/mips/kaffe-1.0.7.patch_kevink_0=
21001">ftp://ftp.paralogos.com/pub/kaffe/mips/kaffe-1.0.7.patch_kevink_02=
1001</A>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>to the 1.0.7 source release on the =
kaffe.org=20
site.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Note that I did *not* get the JIT =
functioning=20
fully.&nbsp; It will run some</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>programs (including Caffeinemark) but =
contains=20
</FONT><FONT face=3DArial size=3D2>the same bugs in </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>argument passing that I fixed for the =
interpreter=20
</FONT><FONT face=3DArial size=3D2>linkage to native </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>methods, but the same fix doesn't quite =
work there,=20
</FONT><FONT face=3DArial size=3D2>and I ran out of time </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>to look at it.&nbsp; You therefore need =
to run=20
</FONT><FONT face=3DArial size=3D2>configure with =
--with-engine=3Dintrp</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and to not expect miraculous=20
performance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Drpalani2@yahoo.com =
href=3D"mailto:rpalani2@yahoo.com">Rajesh Palani</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dlinux-mips@linux-mips.org=20
  =
href=3D"mailto:linux-mips@linux-mips.org">linux-mips@linux-mips.org</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Tuesday, March 04, 2003 =
2:14=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> JVM under Linux on =
MIPS</DIV>
  <DIV><BR></DIV>
  <P>Hi,=20
  <P>&nbsp;&nbsp; Has anyone had any success running any open source =
JVMs (other=20
  than Cobalt machines running Transvirtual's Kaffe) under Linux/MIPS.=20
  <P>&nbsp;&nbsp;&nbsp;Thanks and regards,=20
  <P>&nbsp;&nbsp; Rajesh</P>
  <P><BR>
  <HR SIZE=3D1>
  Do you Yahoo!?<BR><A=20
  =
href=3D"http://rd.yahoo.com/finance/mailtagline/*http://taxes.yahoo.com/"=
>Yahoo!=20
  Tax Center</A> - forms, calculators, tips, and =
more</BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0048_01C2E22B.BADDE2D0--
