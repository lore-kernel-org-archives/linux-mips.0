Message-ID: <00a601c3fa5e$ee4fe8b0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Law10-F10138dWMJ69i0000d0f4@hotmail.com>
Subject: Re: r3000 instruction set
Date: Mon, 23 Feb 2004 23:46:49 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Mark and Janice Juszczec <juszczec@hotmail.com>, linux-mips@linux-mips.org
Cc: uhler@mips.com, dom@mips.com, echristo@redhat.com
Message-ID: <20040223224649.h4VrZHfn4_-lSXJ9xhf6UmdwJItlVzqvRtNqTn6wh-A@z>

Kaffe's makefiles won't pick up on configuration changes, so any time
you re-configure for a different engine or debug level, you need to do
a make clean.  At least, that's the way it was the last time I worked on it.
If you had a partial build with JIT, then changed to intrp, then you could
get all kinds of strange behavior.  The address range of your error us a
dead giveaway.  It's too high to be the kaffe code segment, but too low
to be a shared library.  It's where I'd expect the heap to be, and where
I remember the JIT buffers being allocated when I was trying to debug
that stuff.

> Its been a few weeks since I built this version of kaffe.  The configure 
> output says I did specify --with-engine=intrp.  I'll delete the compiled 
> stuff, reconfigure (double checking that I give it --with-engine=intrp), 
> recompile and retest.
> 
> I'll post my results.
> 
> Mark
> 
> 
> 
> >From: "Kevin D. Kissell" <kevink@mips.com>
> >To: "Mark and Janice Juszczec" <juszczec@hotmail.com>,        
> ><linux-mips@linux-mips.org>
> >CC: <uhler@mips.com>, <dom@mips.com>, <echristo@redhat.com>
> >Subject: Re: r3000 instruction set
> >Date: Mon, 23 Feb 2004 18:21:19 +0100
> >
> > > Someone suggested posting the message I get.  Here it is:
> > >
> > > >./kaffe-bin FirstClass
> > > [kaffe-bin:6] Illgal instruction 674696a at 2abb034, ra=2adbffd0,
> > > P0_STATUS=0000500
> > > pid 6: killed (signal 4)
> > > >Reading command line: Try again
> > > Kernel panic: Attmpted to kill int!
> >
> >Let me guess.  You are running little-endian.  The instruction word
> >in memory would be 0x6a697406.  Do you think it's a coincidence
> >that 0x6a6974 spells "jit" in ASCII?  ;o)
> >
> >The reported address range looks like that where kaffe builds its
> >JITted instruciton buffers in MIPS/Linux.  And, like I say, JIT is
> >somewhat broken for MIPS in Kaffe.  Which version of the kaffe sources
> >are you building, and have you tried configuring with --with-engine=intrp
> >as I suggested?
> >
> >             Regards,
> >
> >             Kevin K.
> 
> _________________________________________________________________
> Click, drag and drop. My MSN is the simple way to design your homepage. 
> http://click.atdmt.com/AVE/go/onm00200364ave/direct/01/
> 
> 
