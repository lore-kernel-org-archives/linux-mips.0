content-class: urn:content-classes:message
Subject: RE: glibc 2.0.6 building problem.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Fri, 24 Aug 2001 17:31:17 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B0A2699@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Brian Murphy <brian.murphy@eicon.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010825003117.NmtUePwZeVGsOHhO02Wevovpcktv_eEu-eKK_KzvulM@z>

Hi, Brian:

Thank you very much for your help in my building glibc-2.0.6. Now I am
building gcc from egcs-1.1.2.tar.gz for the native compiler of my Mips
R3000 target.

Do you have a Makefile in doing this? If you do, could you please send
it to me? 

Regards,

Steven Liu


-----Original Message-----
From: Brian Murphy [mailto:brian.murphy@eicon.com]
Sent: Thursday, August 16, 2001 12:58 PM
To: Steven Liu
Subject: Re: glibc 2.0.6 building problem.


Steven Liu wrote:

> Hi, ALL:
>
> After built Linux kernel 2.2.12 for mips r3000, I got the related
files
> for glibc-2.0.6 build.  But I found a problem when I were building
glibc
> 2.0.6. Here is part of the screen printout:
>
> cd build <return>
> C=mips-linux-gcc BUILD_CC=gcc AR=mips-linux-ar
RANLIB=mips-linux-ranlib
> ../configure --prefix=/usr --host=mips-linux
> --enable-add-ons=crypt,linuxthreads,localedata --enable-profile
<return>
>
> .....
>
> ......
> checking installed Linux kernel header files... TOO OLD!
> configure: error: GNU libc requires kernel header files from
> Linux 2.0.10 or later to be installed before configuring.
> The kernel header files are found usually in /usr/include/asm and
> /usr/include/linux; make sure these directories use files from
> Linux 2.0.10 or later.  This check uses <linux/version.h>, so
> make sure that file was built correctly when installing the kernel
> header
> files.
>

Here is my Makefile.global and Makefile I use to build a glibc-2.0.6

- hope it helps.

/Brian
