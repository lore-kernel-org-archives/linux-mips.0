From: "Jay Carlson" <nop@nop.com>
Subject: RE: The initial results (Re: stable binutils, gcc, glibc ...
Date: Mon, 6 Nov 2000 06:43:25 -0500
Message-ID: <KEEOIBGCMINLAHMMNDJNIEDGCAAA.nop@nop.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <39ED2166.9B5F970@mvista.com>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@fnet.fr, linux-mips@oss.sgi.com
Message-ID: <20001106114325.RXO7cCr1hDep2tfyrcXMtb0fZXbVfHkn5LleufuB5mc@z>

> I also had success with latest binutils CVS tree.  I gave a try to the
> latest gcc, but did not look into it further.
>
> http://sourceware.cygnus.com/binutils
> cvs -z 9 -d :pserver:anoncvs@anoncvs.cygnus.com:/cvs/src co -D "Oct 13,
> 2000" binutils

OK, I've decided to bite the bullet and try to get current on everything.
Most of the patches I've seen lying around have been integrated into
binutils and gcc.  Congratulations!

However, there's still this lingering issue with binutils.  The ulfc patches
haven't been integrated, and I'm worried that I'm going to run into the
"binutils generate busted relocs" problem as a result.  What's the
resolution of that issue?  Patch still needed?  Patch not needed if the only
two binutils ever used are 2.8.1 and current-cvs (>2.10)?

Jay
