Message-ID: <006a01c10532$13d4c760$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <013801c104f4$a807cf60$056aaac0@kjlin>
Subject: Re: Kernel panic: Attempted to kill init! 
Date: Thu, 5 Jul 2001 11:08:35 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0067_01C10542.D60F6C80"
Sender: owner-linux-mips@oss.sgi.com
To: kjlin <kj.lin@viditec-netmedia.com.tw>, linux-mips@oss.sgi.com
Message-ID: <20010705090835.1LGXgbMSf9IyBJKOdijvdpszZD-4EXmfRd55aJd-5tY@z>

This is a multi-part message in MIME format.

------=_NextPart_000_0067_01C10542.D60F6C80
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

  When the kernel boots up and mounts the root file system,=20
  the kernel start to do "execve("/sbin/AP",argv_init,envp_init)" to run =
a AP.
  But in my case, it panics when kernel tries to do the =
"execve("/sbin/AP",argv_init,envp_init)".
  The kernel panic message shows " Kernel panic: Attempted to kill init! =
".
  What situation will trigger such kernel panic?
Well, bogus values for argv_init and envp_init would be the first thing =
I would check...

            Kevin K.

------=_NextPart_000_0067_01C10542.D60F6C80
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 5.50.4134.600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT size=3D2></FONT></DIV></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
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
  <DIV><FONT size=3D2>What situation will trigger such kernel=20
panic?</FONT></DIV></BLOCKQUOTE>
<DIV dir=3Dltr><FONT size=3D2>Well, bogus values for argv_init and =
envp_init would=20
be the first thing I would check...</FONT></DIV>
<DIV dir=3Dltr><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr><FONT size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; Kevin K.</FONT></DIV></BODY></HTML>

------=_NextPart_000_0067_01C10542.D60F6C80--
