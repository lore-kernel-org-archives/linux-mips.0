From: "yaelgilad" <yaelgilad@myrealbox.com>
Subject: R_MIPS_26 etc.
Date: Tue, 10 Dec 2002 18:11:14 +0200
Message-ID: <ECEPLLMMNGHMFBLHCLMAAECMDGAA.yaelgilad@myrealbox.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C2A077.8706AFF0"
Return-Path: <yaelgilad@myrealbox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20021210161114.IITfnOOab49lrv9qlvc_DTl-9LQBBFRTyukOd0bw1Qc@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C2A077.8706AFF0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 7bit

Looking in the assembly code of my driver, I see the following
pattern repeating with every function call.
    4ce4: 0c000000  jal 0
      4ce4: R_MIPS_26 rx_wait_packet
(R_MIPS_26 is sometimes replaces by a similar command)
What is R_MIPS_26 ? What are the rest of them ?
I am guessing it has to do with relocatable addresses, but this specific
function is in the same C file. Marking it as "static" does change the code
and get rid of this command.

TIA
Gilad

P.S. I am building assembler files in two different methods:
- gmake <path-to-file>.lst
- mips-linux-odjdump -x -S <path-to-C-file>  > <path-to-file.lst>
The outputs are similar but not identical.
What's the more "correct" way ?
TIA-2





------=_NextPart_000_0013_01C2A077.8706AFF0
Content-Type: text/html;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1255">
<META content=3D"MSHTML 6.00.2722.900" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D328594915-10122002>Looking in the=20
assembly code of my driver, I see the following </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D328594915-10122002>pattern repeating=20
with every function call.</SPAN></FONT></DIV>
<DIV><FONT><SPAN class=3D328594915-10122002>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; 4ce4: 0c000000&nbsp; =
jal=20
0&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4ce4: =
R_MIPS_26=20
rx_wait_packet</FONT></DIV>
<DIV><FONT><SPAN class=3D328594915-10122002></SPAN><FONT face=3DArial =
size=3D2>(<SPAN=20
class=3D328594915-10122002>R_MIPS_26 is sometimes replaces by a similar=20
command)</SPAN><BR>What is R_MIPS_26 ? What are the rest of them=20
?</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328594915-10122002>I am =
guessing it has=20
to do with relocatable addresses, but this specific</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D328594915-10122002>function is in the=20
same C file. Marking it as "static" does change the code =
</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328594915-10122002>and =
get rid of this=20
command.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002>TIA</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002>Gilad</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328594915-10122002>P.S. I =
am building=20
assembler files in two different methods:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328594915-10122002>- =
gmake=20
&lt;path-to-file&gt;.lst</SPAN></FONT></SPAN></FONT></DIV></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328594915-10122002>- =
mips-linux-odjdump=20
-x -S &lt;path-to-C-file&gt;&nbsp; &gt;=20
&lt;path-to-file.lst&gt;</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D328594915-10122002>The&nbsp;outputs are=20
similar but not identical.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D328594915-10122002>What's =
the more=20
"correct" way ?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002>TIA-2</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D328594915-10122002></SPAN></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0013_01C2A077.8706AFF0--
