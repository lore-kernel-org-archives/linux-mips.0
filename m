Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:47776 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133747AbWDXPGv
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 24 Apr 2006 16:06:51 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C667B2.640FE2D3"
Subject: RE: what will be caused by setting TLB's virtual address part to unmapped address?
Date: Mon, 24 Apr 2006 08:18:50 -0700
Message-ID: <692AB3595F5D76428B34B9BEFE20BC1F8ABA07@Exchange.MIPS.COM>
From: "Uhler, Mike" <uhler@mips.com>
Return-Path: <uhler@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Bin Chen <binary.chen@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20060424151850.OFMA04ZyYUHKq83nBxe8tzVFMO1he0_lnm1PnF8yVG0@z>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C667B2.640FE2D3
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What you're seeing is the standard sequence used to initialize the TLB.
The processor doesn't look at entries for kseg0, so those TLB entries
are ignored.


/gmu
---
Michael Uhler, Chief Technology Officer
MIPS Technologies, Inc.   Email: uhler at mips dot com
1225 Charleston Road      Voice:  (650)567-5025
Mountain View, CA 94043=20

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Bin Chen
Sent: Monday, April 24, 2006 8:14 AM
To: linux-mips@linux-mips.org
Subject: what will be caused by setting TLB's virtual address part to
unmapped address?



	Hi,
=09
	In MIPS64, the 0xFFFFFFFF80000000 is a kernel unmapped area,
what will be caused by setting up a TLB entry with the virtual address
be 0xFFFFFFFF80000000?
=09
	I ask this question because I noticed u-boot's TLB init code use
the address from 0xFFFFFFFF80000000 to fill in the blank tlb, but I
don't know the purpose of this operation.
=09
	Thanks in advance.
=09
	B.C
=09


------_=_NextPart_001_01C667B2.640FE2D3
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Message</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2873" name=3DGENERATOR></HEAD>
<BODY>
<DIV><!-- Converted from text/plain format --><SPAN=20
class=3D031461515-24042006></SPAN><FONT face=3DArial><FONT =
color=3D#0000ff><FONT=20
size=3D2>W<SPAN class=3D031461515-24042006>hat you're seeing is the =
standard=20
sequence used to initialize the TLB.&nbsp; The processor doesn't look at =
entries=20
for kseg0, so those TLB entries are =
ignored.</SPAN></FONT></FONT></FONT><BR>
<P><FONT size=3D2>/gmu<BR>---<BR>Michael Uhler, Chief Technology =
Officer<BR>MIPS=20
Technologies, Inc.&nbsp;&nbsp; Email: uhler at mips dot com<BR>1225 =
Charleston=20
Road&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Voice:&nbsp; =
(650)567-5025<BR>Mountain View,=20
CA 94043</FONT> </P></DIV>
<DIV>
<P><FONT size=3D2></FONT></P>
<DIV></DIV><FONT face=3DTahoma size=3D2><FONT face=3DArial=20
color=3D#0000ff></FONT>-----Original Message-----<BR><B>From:</B>=20
linux-mips-bounce@linux-mips.org =
[mailto:linux-mips-bounce@linux-mips.org] <B>On=20
Behalf Of </B>Bin Chen<BR><B>Sent:</B> Monday, April 24, 2006 8:14=20
AM<BR><B>To:</B> linux-mips@linux-mips.org<BR><B>Subject:</B> what will =
be=20
caused by setting TLB's virtual address part to unmapped=20
address?<BR><BR></FONT></DIV>
<BLOCKQUOTE=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">Hi,<BR><BR>In=20
  MIPS64, the 0xFFFFFFFF80000000 is a kernel unmapped area, what will be =
caused=20
  by setting up a TLB entry with the virtual address be=20
  0xFFFFFFFF80000000?<BR><BR>I ask this question because I noticed =
u-boot's TLB=20
  init code use the address from 0xFFFFFFFF80000000 to fill in the blank =
tlb,=20
  but I don't know the purpose of this operation.<BR><BR>Thanks in=20
  advance.<BR><BR>B.C<BR></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C667B2.640FE2D3--
