Message-ID: <00bd01c12020$31041d00$d11110ac@snow.isltd.insignia.com>
From: "Andrew Thornton" <andrew.thornton@insignia.com>
Subject: Re: How to build a kernel for the malta board?
Date: Wed, 8 Aug 2001 16:38:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010808153837.SAFH3zaq0WOvNLsft5gGm9a-5KN4lAv4vavpjd4_9eE@z>

Shuanglin,

This is what I did.

Download the Linux kernel source from the MIPS ftp site and extract it on
the development host:

 % tar -xzf linux-2.4.3.mips-src-01.00.tar.gz
 % cd linux-2.4.3

I patched this kernel to make the FPU emulator more reliable using patches
from this list's archive.

Setup the configuration file:

 % cp .config.malta .config
 % chmod +w .config

For little endian mode, edit this file changing the line:

 # CONFIG_CPU_LITTLE_ENDIAN is not set
to:
 CONFIG_CPU_LITTLE_ENDIAN=y

Setup the make file:

 % chmod +w Makefile

Edit this file changing the line:

 CROSS_COMPILE   =
to:
 CROSS_COMPILE   = mipsel-linux-

Build and install the kernel:

 % make oldconfig
 % make dep
 % make

To use TFTP to boot the kernel:

 % mipsel-linux-objcopy -O srec vmlinux vmlinux.srec
 % cp vmlinux.srec /tftpboot/mipsel-2.4.3

Andrew Thornton
