Date: Thu, 30 May 2002 14:05:17 -0700 (PDT)
From: Muthukumar Ratty <muthu5@sbcglobal.net>
Subject: Re: cross-compiler for MIPS_RedHat7.1_Release-01.00 on Atlas/4Kc
 using RH7.3-i386 host
In-Reply-To: <007401c20817$f2277f60$0b01a8c0@w2k30g>
Message-ID: <Pine.LNX.4.33.0205301346530.4760-100000@Muruga.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: David Christensen <dpchrist@holgerdanske.com>
Cc: linux-mips@oss.sgi.com, Hartvig Ekner <hartvige@mips.com>
Message-ID: <20020530210517.SdQnX80gJBDyLCdtsYfAfno1EHHvxKWsxsW7QwMZCRs@z>

On Thu, 30 May 2002, David Christensen wrote:

> linux-mips@oss.sgi.com & Hartvig:
>
> Hartvig Ekner wrote:
> > from H.J.) as well on an Atlas, you'll just have to use the 2.4.3
> > install kernel from the 01.00 CD image you downloaded, and everything
> > else from the new release.

Is there any latest kernel (2.5.xx) available for MIPS/Atlas?

>
> >
> >        binutils-mipsel-linux-2.9.5-3
> >        egcs-mipsel-linux-1.1.2-4
>

I played around with some cross-compilers and what I understood is

1. Algorithmics sde4 is not matured enough to compile 2.4.xx kernels (As
Dominic Sweetman mentioned in his reply to my help mail). He said sde5
will do but I dint get a chance to try this. Any update from anyone used it?

2. I followed BradLaRondes write up - Building a Modern Mips Tool chain (I
dont have the link irght now, but you can google it). It compiles the
kernel and Applications. But it requires kernel header lying around from previous
builds. So if you are just starting, then you may wanna grab the header
from somewhere. But the problem with this toolchain is: I was not able to
build Yamon SREC using this.

3. I also tried Steve Hills toolchain located at
ftp://ftp.cotw.com/Linux/MIPS/toolchain/experimental
It is complete and I can build kernel and applications with it. Again I
couldnt build Yamon SREC with it.

BTW you may need to do slight changes, like changing target from
little-mips to tradlittle-mips etc. Its simple but if you get stuck, post
it here and someone will help you.

All the best,
Muthu

> I'll try what I've already installed and see what happens.  If it fails,
> I'll upgrade binutils and try again.
>
>
> Thank you for your help.  :-)
>
>
> David
>
>
>
>
>
