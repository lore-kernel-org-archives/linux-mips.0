Reply-To: <ratin@koperasw.com>
From: "Ratin Kumar" <ratin@koperasw.com>
Subject: RE: (cross)compiling for the Meshcube  (fwd)
Date: Thu, 22 Jul 2004 09:14:37 -0700
Message-ID: <000201c47007$0010cec0$6401a8c0@ratwin1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <Pine.LNX.4.58.0407221756020.4845@shofar.kom.e-technik.tu-darmstadt.de>
Return-Path: <ratin@koperasw.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Ackermann' <rac@KOM.tu-darmstadt.de>, linux-mips@linux-mips.org
Message-ID: <20040722161437.Hgy4w6_XfFFCAtrbsv-cI5U2I1AVo8HauJDUr6phkZY@z>

You don't mention installing libc for the platform. You will need libraries
for the MIPS(el) target to be present in the cross-compile path.
Try ftp://ftp.linux-mips.org/pub/linux/mips/glibc/mipsel-linux/

On doing Native build, if your platform supports tftp loading of boot kernel
(or if it has a boot kernel which you can pass parameter to), load the
kernel with nfsroot="IP-Address-of-server:/path" ip=ip-address-of-target

This requires an NFS image to be kept somewhere reachable by your target.
There is a tarball of RH7.1(mipsel) NFS dump at MIPS ftp for which worked
for my MALTA.

I did (sometime) ago produce NFS image of RH7.3 for my MALTA board. I can
upload it if you can tell me a location where to put it.

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Ralf Ackermann
Sent: Thursday, July 22, 2004 8:56 AM
To: linux-mips@linux-mips.org
Cc: Ralf Ackermann
Subject: Q: (cross)compiling for the Meshcube (fwd)


Hello,

I'm trying to (cross)compile some more modules/applications for the 
meshcube - but failed so far.

I installed (on an i386 system):
	binutils-mipsel-linux-2.13.2.1-3.i386.rpm
	gcc-mipsel-linux-2.95.4-1.i386.rpm
(from ftp://ftp.linux-mips.org/pub/linux/mips/crossdev/)

Making a hello world program fails with:
	mipsel-linux-gcc hello.c -o hello
	/usr/mipsel-linux/bin/ld: cannot open crt1.o: No such file or
directory
	collect2: ld returned 1 exit status

My questions:
 - Are there any specific hints for the cross-compile environment
	(or: "What are you using ... and would therefore suggest ?)
 - Is there any chance to use a native gcc on the cube itself?
	(could this e.g. been done by chrooting into a (which?)
	existing MIPS Linux distribution that is mounted via NFS)

Any hints are highly appreciated (I have worked with crosscompile/native 
environments for ARM so far, but these are my first experiences in the 
MIPS world).

regards
 Ralf
 
---------------------------------------------------------------
Dr. Ralf Ackermann            _         rac@KOM.tu-darmstadt.de
Multimedia Communications |/ | | |\/|           Merckstrasse 25
                          |\ |_| |  |  64283 Darmstadt, Germany
Tel.: (+49) 6151 16-6138                Fax: (+49) 6151 16-6152
---------------------------------------------------------------
             http://www.kom.tu-darmstadt.de/~rac
---------------------------------------------------------------
