Received: from bay101-dav7.bay101.hotmail.com ([64.4.56.79]:51377 "EHLO
	hotmail.com") by ftp.linux-mips.org with ESMTP id S8134343AbVI0TGa
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 27 Sep 2005 20:06:30 +0100
Message-ID: <BAY101-DAV78DFA4E9067D7C54B9527D28A0@phx.gbl>
From: "oski" <oski2001@hotmail.com>
References: <BAY101-DAV76EF721B0CFCE85875AC3D28A0@phx.gbl> <Pine.LNX.4.62.0509272037590.30305@numbat.sonytel.be>
Subject: Re: Compiling a kernel for ibm z50
Date: Tue, 27 Sep 2005 20:06:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <oski2001@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050927190613.iWFKFes_OSXAc3P8Dh1s8POuoi4z96OpX9zRkghChyQ@z>

Hi,
In fact I changed to the mipsel SDE because I had the same results after
using mipsel-linux-binutils-2.14-3.i386.rpm and
mipsel-linux-gcc-2.95.3-23.i386.rpm.
Could be related to the kernel source I used?
thanks for answering.

oski
----- Original Message ----- 
From: "Geert Uytterhoeven" <geert@linux-m68k.org>
To: "oski" <oski2001@hotmail.com>
Cc: "Linux/MIPS Development" <linux-mips@linux-mips.org>
Sent: Tuesday, September 27, 2005 7:39 PM
Subject: Re: Compiling a kernel for ibm z50


> On Tue, 27 Sep 2005, oski wrote:
> > I am a newbie trying to compile a kernel for my z50 and up to now
failed.
> >
> > This is my set up:
> > -An old Pentium II box with Redhat 8
> > -Downloaded linux-2.6.13.mipscvs-20050904 from www.longlandclan...and
bzip2
> > and tar into /usr/src.
> > -Installed the mipsel crosscompiler from MIPS SDE
>
> This is a FAQ, please use a real mipsel-linux crosscompiler instead.
>
> Gr{oetje,eeting}s,
>
> Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker.
But
> when I'm talking to journalists I just say "programmer" or something like
that.
>     -- Linus Torvalds
>
