From: Justin Carlson <carlson@sibyte.com>
Reply-To: carlson@sibyte.com
Subject: Re: floating point on Nevada cpu
Date: Wed, 24 Jan 2001 18:57:04 -0800
Content-Type: text/plain
References: <3A6F8F66.6258801@mvista.com> <0101241833281Q.00834@plugh.sibyte.com> <3A6F94E0.4AB07CEB@mvista.com>
In-Reply-To: <3A6F94E0.4AB07CEB@mvista.com>
MIME-Version: 1.0
Message-ID: <0101241913291R.00834@plugh.sibyte.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Pete Popov <ppopov@mvista.com>
Cc: linux-mips@oss.sgi.comlinux-mips@oss.sgi.com
Message-ID: <20010125025704.zCLe1nQsklAghSTlDb3r3WdpUB2arTuMQoHOXLinQfM@z>

On Wed, 24 Jan 2001, you wrote:
> Justin Carlson wrote:
> > 
> > On Wed, 24 Jan 2001, Pete Popov wrote:
> > > This simple test fails on a Nevada (5231) cpu:
> > >
> > > int main()
> > > {
> > >     float x1,x2,x3;
> > >
> > >     x1 = 7.5;
> > >     x2 = 2.0;
> > >     x3 = x1/x2;
> > >     printf("x3 = %f\n", x3);
> > > }
> > >
> > 
> > Ummm...care to tell *how* it fails?
> 
> Here it is:
> 
> sh-2.03# ./fl
> x3 = 0.000000
> 
> 
> I'm running a test9 based kernel, but the same kernel compiled for my
> Indigo2 produces the right result.  

Hmmm...the only thing here that should involve kernel support is the lazy FPU
register saving.   I'm not terribly familiar with that portion of the kernel,
but it should take an unimplemented instruction trap on the first fpu op, set
up a flag for saving FP state on context switches, enable the FPU, then let the
program run.  From what I *have* seen of that code, it's shared between many
processors; doesn't seem like a likely candidate for such a simple problem.

If you compile that code snippet and optimize it with gcc, you actually won't
invoke any fpu ops, as gcc is smart enough to precalculate the result, and
just load that before jumping to printf().

How are you compiling the code?  And are you compiling it the same way on both
platforms?  Do you have fpu emulation enabled on a kernel that doesn't need it? 

These are the potential problems that jump to mind...

-Justin
