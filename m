Date: Tue, 13 Mar 2001 19:27:11 +0100
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: Compile error with current CVS kernel
Message-ID: <20010313192711.F1208@bacchus.dhis.org>
References: <20010313152236.B1208@bacchus.dhis.org> <200103131818.TAA14585@sparta.research.kpn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200103131818.TAA14585@sparta.research.kpn.com>; from K.H.C.vanHouten@research.kpn.com on Tue, Mar 13, 2001 at 07:18:05PM +0100
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Cc: Adrian Bunk <bunk@fs.tum.de>, linux-mips@oss.sgi.com
Message-ID: <20010313182711.daejfl4zLrVmefmPjZpq7pEJKyv9MlKy6QcptAg4BoM@z>

On Tue, Mar 13, 2001 at 07:18:05PM +0100, Karel van Houten wrote:

> > That's scary - these sections are explicitly mentioned in the linker
> > script and yet ld places them near address zero.  Oh pleassure, oh
> > garbage.
> > 
> > This can probably be fixed by changing the ldscript; can experiment what
> > it takes to get your ld to place all sections with a LOAD attribute placed
> > next to each other?  My ld behaves fine.
> 
> Can you point me to a binutils version and/or patches that should
> behave OK for native compiles?

It's not native vs. crosscompile; this problem with binutils hits in both
cases and only older versions (which aren't suitable for use with
glibc 2.2 ...) are not affected.

  Ralf
