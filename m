Message-ID: <38866.156.153.254.10.1066086919.squirrel@webmail.rmci.net>
Date: Mon, 13 Oct 2003 17:15:19 -0600 (MDT)
Subject: 64 bit kernel in the name of HIGHMEM
From: <exister99@velocitus.net>
In-Reply-To: <20031009140319.GA17647@linux-mips.org>
References: <5334.156.153.254.2.1065650433.squirrel@webmail.rmci.net>
        <20031009140319.GA17647@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-Path: <exister99@velocitus.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20031013231519.xa-ORZ6Cgi6XrOgXgT5muJfbH_nZH0S1hc-jUtXv_2g@z>

Hi Ralf,

Thanks for the prompt response.

> Reminds me of the HP Laserjet code in the kernel.  Anybody still using
> or testing that?

Yes, the code I am working with is basically a snapshot of the kernel
source with /arch/mips/hp-lj etc.

> Anyway, for a 64-bit processor such as the 20Kc I suggest a 64-bit
> kernel. Highmem is a pain and 64-bit is the cure.

To that end I have been trying to build a 64 bit kernel.  I think I am
going about it correctly.  Got ahold of

mips64el-linux-binutils-2.14-3.i386.rpm 
mips64el-linux-boot-gcc-2.95.4-9.i386.rpm

and got cranking.  Currently make is dying with the following output:


[root@l51dhcp252 ljlinux]# make ARCH=mips64 CROSS_COMPILE=mips64el-linux-
. scripts/mkversion > .tmpversion
mips64el-linux-gcc -D__KERNEL__ -I/home/astone/cf_burn_64/ljlinux/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing
-fno-common -I/usr/lib/gcc-lib/mips64el-linux/2.95.4/include
-fomit-frame-pointer -Dx_unity_x -I
/home/astone/cf_burn_64/ljlinux/include/asm/gcc -mabi=64 -G 0
-mno-abicalls -fno-pic -Wa,--trap -pipe  -DUTS_MACHINE='"mips64"'
-DKBUILD_BASENAME=version -c -o init/version.o init/version.c
mips64el-linux-gcc -D__KERNEL__ -I/home/astone/cf_burn_64/ljlinux/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing
-fno-common -I/usr/lib/gcc-lib/mips64el-linux/2.95.4/include
-fomit-frame-pointer -Dx_unity_x -I
/home/astone/cf_burn_64/ljlinux/include/asm/gcc -mabi=64 -G 0
-mno-abicalls -fno-pic -Wa,--trap -pipe   -DKBUILD_BASENAME=do_mounts -c
-o init/do_mounts.o init/do_mounts.c
cpp0: output pipe has been closed
mips64el-linux-gcc: Internal compiler error: program cc1 got fatal signal 11
make: *** [init/do_mounts.o] Error 1


Initial searches claim this is a bug in the compiler.  Could it be due to
something I am doing wrong?  Any guidance on building a 64 bit kernel
would be greatly appreciated.

Best Regards, Andrew Stone
