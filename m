Message-ID: <062f01c06be1$d1ca8ce0$056aaac0@kjlin>
From: "kjlin" <kj.lin@viditec-netmedia.com.tw>
References: <053601c06a6c$ee66ca60$056aaac0@kjlin> <20001220183938.A20077@chem.unr.edu>
Subject: Re: Run the cross-compiled program.
Date: Fri, 22 Dec 2000 14:38:38 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Keith M Wesolowski <wesolows@chem.unr.edu>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001222063838.3Yfvyh-TtPriA1o3i48yQ5ltKTMQoX3nJ01b53j2d4g@z>


----- Original Message -----
> I guess I don't quite understand why you would want to use kernel 2.2
> with glibc 2.2.  For embedded purposes, glibc 2.0 will save you a lot
> of space; if you just want the newest stuff unconditionally, use
> kernel 2.4.  The specific libc you are using is rather dated anyway.
> While it worked for most purposes it is hardly bug-free.  Consider
> using CVS glibc, or the glibc from Florian's Debian build environment.
>
> --
The original system of my embedded mips board is the kernel 2.2 with the
libc-2.0.4.
But the libc-2.0.4 seems not to support POSIX 1003.1c, which cause my
program to fail.
That's the reasion why i want to upgrade the library.
In fact, i prefer to upgrade to libc-2.0.6, but i am not sure whether it
supports POSIX 1003.1c.
On the other hand, i can not find the cross-usable libc-2.0.6 source and
patches or binary tarball for my cross-compiler.
Any suggestions ?

Thanks,
KJ
