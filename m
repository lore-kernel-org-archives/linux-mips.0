Message-ID: <013801c104f4$a807cf60$056aaac0@kjlin>
From: "kjlin" <kj.lin@viditec-netmedia.com.tw>
Subject: Kernel panic: Attempted to kill init! 
Date: Thu, 5 Jul 2001 09:48:57 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0135_01C10537.B60055E0"
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010705014857.LbgVZOEaWZrYJwRr6MOqQvXY3igLilLBoZWW8WsJbbc@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0135_01C10537.B60055E0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Hi,

When the kernel boots up and mounts the root file system,=20
the kernel start to do "execve("/sbin/AP",argv_init,envp_init)" to run a =
AP.
But in my case, it panics when kernel tries to do the =
"execve("/sbin/AP",argv_init,envp_init)".
The kernel panic message shows " Kernel panic: Attempted to kill init! =
".
What situation will trigger such kernel panic?

Thanks,
KJ

------=_NextPart_000_0135_01C10537.B60055E0
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
<DIV><FONT size=3D2>When the kernel boots up and mounts the root file =
system,=20
</FONT></DIV>
<DIV><FONT size=3D2>the kernel start to do=20
"execve("/sbin/AP",argv_init,envp_init)" to run a AP.</FONT></DIV>
<DIV><FONT size=3D2>But in my case, it panics when kernel tries to do =
the=20
"execve("/sbin/AP",argv_init,envp_init)".</FONT></DIV>
<DIV><FONT size=3D2>The kernel panic message shows " Kernel panic: =
Attempted to=20
kill init! ".</FONT></DIV>
<DIV><FONT size=3D2>What situation will trigger such kernel =
panic?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Thanks,</FONT></DIV>
<DIV><FONT size=3D2>KJ</FONT></DIV></BODY></HTML>

------=_NextPart_000_0135_01C10537.B60055E0--
