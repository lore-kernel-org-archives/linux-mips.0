From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: custom ide driver causes "Badness in smp_call_function"
Date: Tue, 23 Aug 2005 10:07:02 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008F_01C5A7CA.68D6B0E0"
Message-ID: <20050823140159Z8225393-3678+7283@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050823140702.xE43CfVdFFFJtbRLCecmGwTvUA_Kgyis_HYWvLOP2Uk@z>

This is a multi-part message in MIME format.

------=_NextPart_000_008F_01C5A7CA.68D6B0E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I have added a compact flash disk onto the local bus of an rm9224 mips
processor.  We are using an FPGA as an IDE host adaptor.  Our driver works
great when the kernel is compiled for a single processor.  But if SMP
support is enabled, the kernel dies with: 
            .
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
Ide:  Assuming 50MHz system bus speed for PIO modes; override with
idebuss=xx
Badness in smp_call_function at arch/mips/kernel/smp.c:149
Call Trace:
 [<ffffffff8010aff8>] smp_call_function+0x1f8/0x200
 [<ffffffff8032adb0>] schedule+0x950/0xa08
 [<ffffffff8010b9f8>] local_rm9k_perfcounter_irq_startup+0x0/0x68
 [<ffffffff8010baa8>] rm9k_perfcounter_irq_startup+0x48/0x68
 [<ffffffff801658b8>] probe_irq_on+0x2b8/0x2e8
 [<ffffffff80146c00>] del_singleshot_timer_sync+0x38/0x50
 [<ffffffff8028e510>] try_to_identify+0x180/0x190
 [<ffffffff80147d88>] process_timeout+0x0/0x8
 [<ffffffff8028e66c>] do_probe+0x14c/0x338
 [<ffffffff8028e57c>] do_probe+0x5c/0x338
 [<ffffffff8028ec40>] wait_hwif_ready+0x178/0x180
 [<ffffffff8028f230>] probe_hwif+0x508/0x6e8
 [<ffffffff8028eec8>] probe_hwif+0x1a0/0x6e8
 [<ffffffff8028f42c>] probe_hwif_init_with_fixup+0x1c/0xe8
 [<ffffffff8029435c>] ide_3P_init+0xb4/0x118
 [<ffffffff80294324>] ide_3P_init+0x7c/0x118
 [<ffffffff8023d100>] idr_get_new+0x18/0x50
etc. 

Does anyone know what sort of bug could cause problems with SMP, but would
work fine otherwise?  I could supply my driver code if anyone is interested.
Thanks!

Bryan
 

------=_NextPart_000_008F_01C5A7CA.68D6B0E0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7036.0">
<TITLE>custom ide driver causes &quot;Badness in =
smp_call_function&quot;</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Hi =
all,</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">I</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial"> have added a compact flash =
disk onto the local bus of a</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">n</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial"> rm9224 mips =
processor.&nbsp; We are using an FPGA as an IDE host</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> <FONT SIZE=3D2 =
FACE=3D"Arial">adaptor</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">.</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp; Our</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial"></FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> <FONT SIZE=3D2 =
FACE=3D"Arial">driver works great when the kernel is compiled for =
a</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> <FONT =
SIZE=3D2 FACE=3D"Arial">single</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"> <FONT SIZE=3D2 FACE=3D"Arial">processor.&nbsp; But if =
SMP support is enabled,</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"> <FONT SIZE=3D2 FACE=3D"Arial">the kernel dies with: =
</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> =
<FONT SIZE=3D2 FACE=3D"Arial">&#8230;</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Uniform Multi-Platform E-IDE driver Revision: =
7.00alpha2</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Ide:&nbsp; Assuming 50MHz system bus speed for PIO modes; =
override with idebuss=3Dxx</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Badness in smp_call_function at =
arch/mips/kernel/smp.c:149</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Call =
Trace:</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8010aff8&gt;] =
smp_call_function+0x1f8/0x200</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8032adb0&gt;] =
schedule+0x950/0xa08</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8010b9f8&gt;] =
local_rm9k_perfcounter_irq_startup+0x0/0x68</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8010baa8&gt;] =
rm9k_perfcounter_irq_startup+0x48/0x68</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff801658b8&gt;] =
probe_irq_on+0x2b8/0x2e8</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff80146c00&gt;] =
del_singleshot_timer_sync+0x38/0x50</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028e510&gt;] =
try_to_identify+0x180/0x190</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff80147d88&gt;] =
process_timeout+0x0/0x8</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028e66c&gt;] =
do_probe+0x14c/0x338</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028e57c&gt;] =
do_probe+0x5c/0x338</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028ec40&gt;] =
wait_hwif_ready+0x178/0x180</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028f230&gt;] =
probe_hwif+0x508/0x6e8</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028eec8&gt;] =
probe_hwif+0x1a0/0x6e8</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8028f42c&gt;] =
probe_hwif_init_with_fixup+0x1c/0xe8</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8029435c&gt;] =
ide_3P_init+0xb4/0x118</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff80294324&gt;] =
ide_3P_init+0x7c/0x118</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;[&lt;ffffffff8023d100&gt;] =
idr_get_new+0x18/0x50</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">etc</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">&#8230;</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"> </SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">Does =
anyone know what sort of bug could cause problems with SMP, but would =
work fine otherwise?&nbsp; I could supply my driver code if anyone =
is</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"> <FONT =
SIZE=3D2 FACE=3D"Arial">interested</FONT></SPAN><SPAN =
LANG=3D"en-us"></SPAN><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">.</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"><FONT SIZE=3D2 FACE=3D"Arial">&nbsp; =
Thanks!</FONT></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial">Bryan</FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us"></SPAN></P>

<P ALIGN=3DLEFT><SPAN LANG=3D"en-us"><FONT SIZE=3D2 =
FACE=3D"Arial"></FONT></SPAN><SPAN LANG=3D"en-us"></SPAN><SPAN =
LANG=3D"en-us">&nbsp;</SPAN></P>

</BODY>
</HTML>
------=_NextPart_000_008F_01C5A7CA.68D6B0E0--
