Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Wed, 8 Oct 1997 10:46:29 -0700
Message-ID: <199710081746.KAA23629@fir.engr.sgi.com>
From: "William J. Earl" <wje@fir.engr.sgi.com>
Subject: Re: More Linux/SGI status
In-Reply-To: <m0xIqiF-0005FiC@lightning.swansea.linux.org.uk>
References: <199710072356.QAA23399@oz.engr.sgi.com>
	<m0xIqiF-0005FiC@lightning.swansea.linux.org.uk>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: ariel@cthulhu.engr.sgi.com, miguel@nuclecu.unam.mx, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <19971008174629.goqfepBTj-s0aIzO6dhjNIKLelhlCoBpWPIgjMpWsk4@z>

Alan Cox writes:
 > > My take on this is that since whoever bought that Indy
 > > already paid for the OS including the X server and other
 > > binaries there should be no reason why not to allow
 > > them to run it on top of linux.
 > 
 > Thats simple until someone builds a clone SGI box. RedHat rpms
 > actually have some provision for a tool called rhmask which 
 > requires you have some "original" to generate the new rpm. Anyway
 > we don't want to encourage folks not to make the Linux version
 > kick the backside of any SGI original item..

      It makes no sense to clone an SGI box, since there is no
long-term standard hardware profile.  That is, the combination
of hardware and system software provides a consistent model, but
the hardware/software interface changes each generation, both
in graphics and in I/O.  For people building MIPS-based linux boxes,
starting with the XFree86 source base, and adding good OpenGL support,
is a better model than trying to use Xsgi.  Using Xsgi (and libGL.so)
is simply an expedient way to get graphics support for linux on an
SGI box.
