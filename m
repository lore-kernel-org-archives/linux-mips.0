Message-ID: <3D7F9414.2020305@realitydiluted.com>
Date: Wed, 11 Sep 2002 14:05:56 -0500
From: "Steven J. Hill" <sjhill@realitydiluted.com>
MIME-Version: 1.0
Subject: New uClibc-0.9.15 cross toolchains for MIPS...
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <sjhill@realitydiluted.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: uclibc.@uclibc.org, linux-mips@linux-mips.org
Message-ID: <20020911190556.zwCoEBGE7qpbfRGmRM4RWknTPVF7tB5wp1ggOQux-qM@z>

Greetings.

I am pleased to announce new cross toolchains for uClibc
based MIPS big and little endian compilers. These RPMS
are for installation on a x86 host to produce uClibc
binaries for MIPS targets. They can be downloaded from
the following URL:

    ftp://ftp.realitydiluted.com/Linux/uclibc/

The RPMS are based off of the uClibc toolchain builder
found at:

    http://www.us.kernel.org/pub/linux/libs/uclibc/toolchain/

This toolchain uses the following tool versions:

    binutils-2.13
    gcc-3.2
    uClibc-0.9.15 w/patches to uClibc CVS as of yesterday

These toolchains can also be used to compile Linux MIPS
kernels which I have been doing with no problems at all.
Thanks and enjoy!

-Steve
