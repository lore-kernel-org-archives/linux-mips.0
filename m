Received: from eng32 [192.168.48.96] by mac.com [192.168.48.242]
	with SMTP (MDaemon.v3.0.0.R)
	for <linux-mips@linux-mips.org>; Wed, 07 Jul 2004 08:51:43 +0530
Message-ID: <000d01c463d1$994e59a0$6030a8c0@eng32>
From: "hemanth" <macindiard@vsnl.net>
Subject: querries on cross compiler
Date: Wed, 7 Jul 2004 08:52:14 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <macindiard@vsnl.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040707032214.EYcebmP6LeM5Os4wJNr5KEGt1S5Zp0hYYd150x84RVI@z>


Hi,

Iam trying to build a cross compiler for MIPS processor on
"i686-pc-linux-gcc" host. Iam getting some errors during the installation of
BINUTILS(binutils-2.9.1) i.e, after configure, when I type "make" Iam
getting errors. Can u please suggest how to remove these errors.

These are the errors,
root@localhost binutils-2.9.1]# make

make[1]: Entering directory `/root/cross_compiler/binutils-2.9.1/libiberty'

if [ -n "" ] && [ ! -d pic ]; then \

mkdir pic; \

else true; fi

touch stamp-picdir

echo "# !Automatically generated from ./functions.def"\

"- DO NOT EDIT!" >needed2.awk

grep '^DEFVAR(' < ./functions.def \

| sed -e '/DEFVAR/s|DEFVAR.\([^,]*\).*|/\1/ { printf "#ifndef
NEED_\1\\n#define NEED_\1\\n#endif\\n" }|' \

>>needed2.awk

grep '^DEFFUNC(' < ./functions.def \

| sed -e '/DEFFUNC/s|DEFFUNC.\([^,]*\).*|/\1/ { printf "#ifndef
NEED_\1\\n#define NEED_\1\\n#endif\\n" }|' \

>>needed2.awk

gcc -c -g -O2 -I. -I./../include ./dummy.c 2>/dev/null

make[1]: *** [dummy.o] Error 1

make[1]: Leaving directory `/root/cross_compiler/binutils-2.9.1/libiberty'

make: *** [all-libiberty] Error 2

regards,
Hemanth
MACIL
Electronics city
Bangalore
