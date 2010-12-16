Received: from p02c12o148.mxlogic.net ([208.65.145.81]:47584 "EHLO
        p02c12o148.mxlogic.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491984Ab0LPPjg (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 16 Dec 2010 16:39:36 +0100
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
        boundary="----_=_NextPart_001_01CB9D37.329CD4D4"
Subject: Re: SMTC support status in latest git head.
Date: Thu, 16 Dec 2010 09:37:50 -0600
Message-ID: <8F242B230AD6474C8E7815DE0B4982D7179FB880@EXV1.corp.adtran.com>
From: STUART VENTERS <stuart.venters@adtran.com>
Return-Path: <stuart.venters@adtran.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: kevink@paralogos.com, anoop.pa@gmail.com
Cc: linux-mips@linux-mips.org, Anoop_P.A@pmc-sierra.com
Message-ID: <20101216153750.mds6Gc1FPaVFHG5spYbZTXJjpLtQ21oZen3oF4L2FFU@z>

------_=_NextPart_001_01CB9D37.329CD4D4
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Two other possible clues:

The EVP is clear in the MVPControl register.
   Does this say that only VPE0, T0 gets to run?

Also the EXCPT bits in VPEControl for VPE1 indicate a Gating Storage =
Exception dispatch.
   But that seems to conflict the EVP bit above.

Perhaps these are an artifact of getting to a good state to dump things =
out.

------_=_NextPart_001_01CB9D37.329CD4D4
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7651.59">
<TITLE>Re: SMTC support status in latest git head.</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Two other possible clues:</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">The EVP is clear in the MVPControl =
register.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; Does this say that only =
VPE0, T0 gets to run?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Also the EXCPT bits in VPEControl for =
VPE1 indicate a Gating Storage Exception dispatch.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; But that seems to =
conflict the EVP bit above.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Perhaps these are an artifact of =
getting to a good state to dump things out.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01CB9D37.329CD4D4--
