From: "Ian Chilton" <ian@ichilton.co.uk>
Subject: RE: User/Group Problem
Date: Mon, 13 Nov 2000 20:02:21 -0000
Message-ID: <NAENLMKGGBDKLPONCDDOGEMADCAA.ian@ichilton.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.GSO.3.96.1001113195048.12211C-100000@delta.ds2.pg.gda.pl>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com, lfs-discuss@linuxfromscratch.org
Message-ID: <20001113200221.JaqdJ1HWsDV3lCohUvtJGg5OjyGOTENe5Mk03MpmYTw@z>

Hello,

>  That's actually not a MIPS-specific problem.

I actually got round this by copying /lib/libnss* from glibc 2.0.6 over,
until I had finished compiling everything..


From the LFS-Book:

------------ Quote --------------
Copying old NSS library files
If your normal Linux system runs glibc-2.0, you need to copy the NSS library
files to the LFS partition. Certain statically linked programs still depend
on the NSS library, especially programs that need to lookup
usernames,userid's and groupid's. You can check which C library version your
normal Linux system uses by running:

strings /lib/libc* | grep "release version"

The output of that command should tell you something like this:

GNU C Library stable release version 2.1.3, by Roland McGrath et al.

If you have a libc-2.0.x file copy the NSS library files by running:

cp -av /lib/libnss* $LFS/lib

--------------- End Quote --------------


Bye for Now,

Ian


                                \|||/
                                (o o)
 /---------------------------ooO-(_)-Ooo---------------------------\
 |  Ian Chilton        (IRC Nick - GadgetMan)     ICQ #: 16007717  |
 |-----------------------------------------------------------------|
 |  E-Mail: ian@ichilton.co.uk     Web: http://www.ichilton.co.uk  |
 \-----------------------------------------------------------------/
