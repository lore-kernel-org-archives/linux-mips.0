Message-ID: <062a01bf3092$e54906b0$0228a8c0@satanas>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: kernel-headers RPM?
Date: Wed, 17 Nov 1999 01:30:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: SGI Linux Alias <linux@cthulhu.engr.sgi.com>, linux-mips@fnet.fr
Message-ID: <19991117003003.LxFL3o91qPP6BWPeNe40fhRoa18Vdq4MWOj3foPXk7s@z>

I've managed to bring up a mipsel 2.2.12
kernel using the Red Hat 6.0 root filesystem
from off the SGI web site.  I can install the
egcs package, but I also need the development
glibc package to be installed before I can
"go native".   That package in turn depends
on the kernel-headers package, which I've
been unable to locate on the web.  Do any
of you know where I could find a copy, or
that failing, build/fake one? Forcing the
install by overriding the dependencies
seems to but the rpm database in a
corrupt state - rpm core dumps thereafter
on installation that would otherwise succeed.
:-(
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
