Message-ID: <00a901c0bb6f$d3e77820$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Dumb Question on Cross-Development
Date: Mon, 2 Apr 2001 14:24:00 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "MIPS/Linux List (SGI)" <linux-mips@oss.sgi.com>
Message-ID: <20010402122400.sf8lrgmPY87OkYdufSECiHvrzYzyYitrztXOSxBdyqE@z>

I've historically done all of my MIPS/Linux development
native, on Indies, P-5064's, Atlas, and Malta.  But now
that we seem to be in a situation where the latest, 
greatest, and most correct compilers are x86 cross-dev
only, I've cut over to building kernels on my Athlon box.
I'd like to start building apps and benchmarks (not 
necessarily from srpm's).  Plainly, I need a set of
libraries (naive attempts at cross-compilation of
user code with the egcs 1.1.2 compiler results in
complaints about the missing crt1.o), and possibly
some variant include files.  Are these packaged
somewhere, and is there an FAQ/HowTo on how
to set them up?  This may have been handled in 
Ralf's HowTo, but that seems to have disappeared
from the web.

            Regards,

            Kevin K.
