From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200204241335.PAA02613@copsun17.mips.com>
Subject: Re: Updates for RedHat 7.1/mips
Date: Wed, 24 Apr 2002 15:35:16 +0200 (MET DST)
In-Reply-To: <20020423155925.A8846@lucon.org> from "H . J . Lu" at Apr 23, 2002 03:59:25 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020424133516.Wb3ZFAt56buDqE11XNHCIfgJJgbSUgp6ALO1HMK_GrY@z>

All the problems I reported are fixed (only tested LE so far). Thanks.

Currently recompiling glibc natively for the installation images.
We'll post a message here when our new installation images are ready.

/Hartvig

H . J . Lu writes:
> 
> On Mon, Apr 22, 2002 at 08:38:49PM +0200, Hartvig Ekner wrote:
> > Hi,
> > 
> > H . J . Lu writes:
> > > 
> > > On Mon, Apr 22, 2002 at 06:55:14PM +0200, Hartvig Ekner wrote:
> > > > Hi H.J,
> > > > 
> > > > No, I did not compile myself, but used your binary (except for cracklib,
> > > > where I used our natively compiled package instead). But I did replace
> > > > ALL new updated packages at once during the upgrade.
> > > > 
> > > > However, I have also tried to install (-U) rpm*rpm and the popt rpm on a
> > > > working system based on your original packages, and voila: the same error
> > > > appears. So it does appear to be linked to the rpm RPM package.
> > > > 
> > > > The grep you asked for returns:
> > > 
> > > Thanks. I will fix those among other bugs I have been working on.
> > 
> > Great, thanks. Can you let me know as soon as the RPM problem has been fixed,
> > so that I can continue the update of the installation images? BTW, are the
> > other bugs you're working on something to wait for in this regard or not?
> > 
> 
> I updated glibc, python, gcc, gdb, rpm, openssl, binutils and toolchain at
> 
> ftp://oss.sgi.com/pub/linux/mips/redhat/7.1/
> 
> Let know know if there are any problems.
> 
> 
> H.J.
