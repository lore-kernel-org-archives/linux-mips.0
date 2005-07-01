From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: Seg fault when compiled with -mabi=64 and -lpthread
Date: Fri, 1 Jul 2005 11:09:22 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050701035105.GA9601@nevyn.them.org>
Message-ID: <20050701150938Z8226157-3678+821@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Daniel Jacobowitz' <dan@debian.org>, "'Stephen P. Becker'" <geoman@gentoo.org>, macro@blysk.ds.pg.gda.pl
Cc: 'Linux/MIPS Development' <linux-mips@linux-mips.org>
Message-ID: <20050701150922.Vh7uF74pG6fj0aucwKfphfUvcYDZ8FBEWBQra1LcNkg@z>

Thanks for everyone's input!

Looks like I should upgrade glibc, and possibly gcc.  When you say that I
should try CVS HEAD of glibc, I'm not sure what you mean.  I have looked in
the linux-mips.org CVS and the closest thing I can find is libc, and it
looks really old.  I have also found a glibc CVS at
:pserver:anoncvs@sources.redhat.com:/cvs/glibc.  If I get libc from here is
this the "CVS HEAD"?  

Should I get GCC from the generic GCC site, or should get it from the
linux-mips CVS?  

I apologize for the simple questions.  I have not built a tool chain before.
I've been using the one supplied by PMC-Sierra.  Will I need to patch any of
these sources for MIPs?

Bryan  

-----Original Message-----
From: Daniel Jacobowitz [mailto:dan@debian.org] 
Sent: Thursday, June 30, 2005 11:51 PM
To: Stephen P. Becker
Cc: Ralf Baechle; Bryan Althouse; 'Linux/MIPS Development'
Subject: Re: Seg fault when compiled with -mabi=64 and -lpthread

On Thu, Jun 30, 2005 at 06:09:09PM -0400, Stephen P. Becker wrote:
> 
> > Bryan seems to be using the original Red Hat gnupro 64-bit toolchain. 
> > I don't know how well that works nowadays; but current CVS versions do
> > work, or did when I last tested (a month or two ago).
> > 
> 
> Hmm, well with respect to my problem, I'm using a pretty recent
> toolchain, with gcc 3.4.4, binutils-2.16.1, glibc-2.3.5, and headers
> from a linux-mips 2.6.11 snapshot.  Interestingly, I tried to reproduce
> Bryan's segfault, but could not.  That code ran without error when I
> linked with libpthread.  Any thoughts?

I don't think glibc 2.3.5 worked for mips64.  But I haven't checked it
in a long time.  Try CVS HEAD of glibc instead.

Other than that, you're on your own - building glibc is extremely error
prone.

-- 
Daniel Jacobowitz
CodeSourcery, LLC
