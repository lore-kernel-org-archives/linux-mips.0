Message-ID: <000901bef2ed$cab2d0c0$c800a8c0@balticinsservices.net>
From: "Thomas Berg" <thomas@baltic-ins-services.net>
Subject: crosscompiler
Date: Mon, 30 Aug 1999 15:44:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
Content-Transfer-Encoding: 7bit
To: linux@cthulhu.engr.sgi.com
Message-ID: <19990830134432.eAtli7aoyMI_PN0fV3nXrvceCm929BodZmjqRlwopBg@z>

Hello everyone!

I've been trying to set up a crosscompiler but it seems I've run out of
luck..

binutils(2.8.1 + recommended patch) builds and installs fine
egcs(1.0.3a + recommended patch) first installation builds and installs

glibc(2.0.6 + addon libs) doesnt come close to building
( [root@sushi build]# CC=mips-linux-gcc BUILD_CC=gcc AR=mips-linux-ar
RANLIB=mips-linux-ranlib
../configure --prefix=/usr --host=mips -linux --enable-add-ons=crypt,linuxth
reads,localedata --enable-profile )

I have tried this setup on a i386 redhat box (6.0) and on sparc running
solaris 7, and taken great care to follow the instructions in the howto.

The patch that is used on glibc-2.0.6 in the Linux/MIPS HOWTO is no where to
be found ? ie glibc-2.0.6-mips.patch

Anyone got a clue what im doing wrong ? (also tried to use the precompiled
packages of binutils/egcs etc, no luck there either)

best regards,
Thomas Berg
thomas@baltic-ins-services.net
