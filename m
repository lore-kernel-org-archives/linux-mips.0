Message-ID: <004101c04969$b744b160$0323c0d8@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <3A09753F.DB2457EE@isratech.ro>
Subject: Re: MIPS kernel!
Date: Wed, 8 Nov 2000 10:53:14 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Nicu Popovici <octavp@isratech.ro>, linux-mips@oss.sgi.com
Message-ID: <20001108095314.YJmXm_yU7yyaj_FXNqaqzKahImKYPs87nO4_lRv-fZY@z>

> I tried to cross compile the kernel from ftp.embedix.com, meaning that
> I found that this embedix Linux is made to work on any platform . I have
> an Atlas board and a QED processsor (  a mips one ) and I fail in trying
> to cross compile the linux-2.2.13. I get the following errors.
...
[errors snipped] 
...
> Another weird thing . When I received my Atlas board I gqt a CD with the
> kernel sources and binaries. I installed the binaries on the Atlas board
> and it works fine but when I tried to cross compile the kernel I get
> some stupid errors like the one above. I realy do not understand
> anything , does anyone cross compiled a kernele for MIPS processors and
> Atlas boards ? The version is linux 2.2.12.( the Hard Hat Linux ).

In general, at MIPS, we generally build native or semi-native
(mipsel on mipseb machines and vice versa).  In cross-builds
of other components, however, I have observed that problems
such as those you describe can result from include files
on the host platform being erroneously pulled in to the cross-build.
Cross-gcc and the makefiles have been known to be set up such
that, if the needed include file can be found neither in the explicitly
requested directories nor in the cross-compiler's default includes, 
it will silently search the host /usr/include directories.

One quick-and-dirty way to test this would be to temporarily rename
/usr/include on your host platform to /usr/include.native or whatever,
and then make your  /usr/include a symbolic link to the include 
directory of your MIPS Linux tree.  This should either let you build
correctly or give you a more useful error message telling you which
include file is missing from your cross-environment or MIPS kernel 
distribution. Just don't forget to put things back the way they were! 

            Regards,

            Kevin K.
