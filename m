Message-ID: <000e01bf3c9e$99711e90$0228a8c0@satanas>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Problems with glibc RPM
Date: Thu, 2 Dec 1999 09:23:09 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Khaled Labib <labibk@taec.toshiba.com>, linux@cthulhu.engr.sgi.com
Message-ID: <19991202082309.NwmRhjIacszI2Gnh6-YlMnP6U88BgKsXHaXe9fLqgQ4@z>

>
>I downloaded glibc-2.0.6-4.src.rpm and glibc-2.0.6-3.src.rpm from 
>ftp.linux.sgi.com.
>
>When I tried to use the rpm tool to install them, I got the following error 
>message:
>
>unpacking of archive failed on file glibc-2.0.6.tar.gz: cpio: read failed - 
>Success
>
>
>Can someone help ? I really need these sources from the rpm.
>
>I am using RedHat Linux 6.0 on a PC.


I believe there are some interoperatbility problems between
Red Hat 5.2 and 6.0 rpm programs.   When I did a port of
mipsel linux to a MIPS development board, I started by
booting the RH 6.0 mipsel root file system, with the 6.0
rpm program, and found that I could not reliably install
the 5.2 gcc/glibc binary RPMs on the SGI server.  I
backed off to a 5.2 level root file system and rpm program,
and the problems went away.

__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
