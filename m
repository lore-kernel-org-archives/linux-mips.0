Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199707081017.MAA21226@informatik.uni-koblenz.de>
Subject: Re: MIPS Distribution status (Was: Status ...)
Date: Tue, 8 Jul 1997 12:17:11 +0200 (MET DST)
In-Reply-To: <199707071619.MAA20927@jenolan.caipgeneral> from "David S. Miller" at Jul 7, 97 12:19:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@jenolan.rutgers.edu>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970708101711.oOI-0A2X-y-G452aJuGjd1NRoS3bsAMx-IJqIbk8xfU@z>

> Emacs should build strictly out of the box in an of itself, I know
> because I specifically sent RMS patches for linux-mips support the
> moment I got it working last summer with GLIBC.  (I even then logged
> in to the gnu project machines and made sure those changes made it
> into his tree ;-)
> 
> If it isn't compiling at all, tell me how it is failing.

Ok, I took a look at it.  The Emacs 19.34b does not contain the least
bit of support for mips{el}-linux, so no wonder why it doesn't build.
Can you send me your patches?  I assume RMS won't like it if we take
the Emacs snapshot from the FSF ...

Thanks,

  Ralf
