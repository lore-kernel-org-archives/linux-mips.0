Message-ID: <04a201c0f542$28184620$056aaac0@kjlin>
From: "kjlin" <kj.lin@viditec-netmedia.com.tw>
Subject: How to trigger a binary to excute in Linux/MIPS?
Date: Fri, 15 Jun 2001 10:23:04 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_049F_01C0F585.29803F20"
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010615022304._7ju-7iEWfDDljibHGSsCkYduce4ye6P-DC3ONFSuKo@z>

This is a multi-part message in MIME format.

------=_NextPart_000_049F_01C0F585.29803F20
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Hi,

To execute a program, the load_elf_binary() loads it and descdes the =
value of elf_entry, start_code, start_data....etc..
Then , the start_thread(regs, elf_entry, bprm->p) will trigger it.
But it just sets up the value of regs->cp0_status, regs->cp0_epc, =
regs->regs[29] and current->thread.current_ds.
Why can the start_thread() trigger a program?

Here is my situation :
The kernel boots up and mounts the filesystem, when it tries to
execute /sbin/hello i don't see any output.
(Ps: /sbin/hello is a simple testing program to replace the real =
/sbin/init.
        It just outputs some console message.)
I looked at the memory and the code for hello is present at "elf_entry",
so why does the start_thread not execute it ??

Any help would be really appreciated.

Thanks,
KJ



------=_NextPart_000_049F_01C0F585.29803F20
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dbig5" http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hi,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>To execute a program, the load_elf_binary() loads it =
and=20
descdes the value of elf_entry, start_code, =
start_data....etc..</FONT></DIV>
<DIV><FONT size=3D2>Then , the start_thread(regs, elf_entry, bprm-&gt;p) =
will=20
trigger it.</FONT></DIV>
<DIV><FONT size=3D2>But <FONT size=3D2>it just sets up the value of=20
regs-&gt;cp0_status, regs-&gt;cp0_epc, regs-&gt;regs[29] and=20
current-&gt;thread.current_ds.</FONT></FONT></DIV>
<DIV><FONT size=3D2>Why can the start_thread() trigger a =
program?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Here is my situation :</FONT></DIV>
<DIV><FONT size=3D2>The kernel boots up and mounts the filesystem, when =
it tries=20
to<BR>execute /sbin/hello i don't see any output.</FONT></DIV>
<DIV><FONT size=3D2>(Ps: /sbin/hello is a simple testing program to =
replace the=20
real /sbin/init.<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It just =
outputs=20
some console message.)</FONT></DIV>
<DIV><FONT size=3D2>I&nbsp;looked at the memory and the code =
for&nbsp;hello is=20
present at "elf_entry",</FONT></DIV>
<DIV><FONT size=3D2>so why does the start_thread not execute it =
??</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Any help would be really =
appreciated.<BR></FONT></DIV>
<DIV><FONT size=3D2>Thanks,<BR>KJ<BR><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_049F_01C0F585.29803F20--
