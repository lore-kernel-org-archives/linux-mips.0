content-class: urn:content-classes:message
Subject: glibc 2.0.6 building problem.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Thu, 16 Aug 2001 10:33:43 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B0A24C5@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010816173343.1bFYL5XLEnZmHPq46AEomLC9pPdJtVAspzZxrmSweC0@z>

Hi, ALL:

After built Linux kernel 2.2.12 for mips r3000, I got the related files
for glibc-2.0.6 build.  But I found a problem when I were building glibc
2.0.6. Here is part of the screen printout:

cd build <return>
C=mips-linux-gcc BUILD_CC=gcc AR=mips-linux-ar RANLIB=mips-linux-ranlib
../configure --prefix=/usr --host=mips-linux
--enable-add-ons=crypt,linuxthreads,localedata --enable-profile <return>

.....

......
checking installed Linux kernel header files... TOO OLD!
configure: error: GNU libc requires kernel header files from
Linux 2.0.10 or later to be installed before configuring.
The kernel header files are found usually in /usr/include/asm and
/usr/include/linux; make sure these directories use files from
Linux 2.0.10 or later.  This check uses <linux/version.h>, so
make sure that file was built correctly when installing the kernel
header
files.

It seems that I need to copy the kernel's include files and lib to
somewhere. I could not figure it out.

If you know how to build the glibc, please let me know.

Thank you all.

Steven Liu
 
