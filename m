Date: Tue, 20 Mar 2001 21:37:15 +0100
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: Recommended toolchain
Message-ID: <20010320213715.C3763@bacchus.dhis.org>
References: <3AB6C948.7F8EE4B7@oz.agile.tv> <200103202012.VAA07412@sparta.research.kpn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200103202012.VAA07412@sparta.research.kpn.com>; from K.H.C.vanHouten@research.kpn.com on Tue, Mar 20, 2001 at 09:12:02PM +0100
Sender: owner-linux-mips@oss.sgi.com
To: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Cc: Simon Gee <simong@oz.agile.tv>, linux-mips@oss.sgi.com
Message-ID: <20010320203715.h1QQ05Hlv17tnc2VoewEnWznW18U1zFSSftDsNGAil4@z>

On Tue, Mar 20, 2001 at 09:12:02PM +0100, Karel van Houten wrote:

> You wrote:
> > Recently I've been working with various version mixes of the gnu tool
> > chain for a mipsel-linux target and settled on a patchy binutils
> > 2.8.1/egcs 1.1.2/glibc 2.0.6 setup. However this lacks the functionality
> > that I would get from a newer toolchain for use with the linux 2.4
> > kernel. As a result, I was wondering if someone could recommend the
> > latest "stable"/recommended toolchain for a mipsel-linux target.
> 
> Well, I'm currently using:
> binutils 2.10.1
> gcc 2.95.3 (with Maciej's patches)
> glibc 2.2.2 (compiled with above toolchain).
> 
> This toolchain works for native compiles on my mipsel box.
> One drawback: I can't compile any kernels with this setup,
> For kernel compiles I use 2.8.1/egcs-2.90.27/glibc-2.0.6.

You MUST use minimum egcs-2.91.66 (1.1.2); older compilers WILL misscompile
kernels.

  Ralf
