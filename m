Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: "John Chen" <chen@betty.esd.sgi.com>
Message-ID: <9706181241.ZM5754@betty.esd.sgi.com>
Date: Wed, 18 Jun 1997 12:41:23 -0700
In-Reply-To: kck@darwin (Ken Klingman)
        "Getting X on Linux/SGI" (Jun 18,  9:41am)
References: <199706181641.JAA05598@darwin.esd.sgi.com>
Subject: Re: Getting X on Linux/SGI
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux@cthulhu.engr.sgi.com
To: John Chen <chen@darwin.esd.sgi.com>, Joe Chien <jc@darwin.esd.sgi.com>, Ken Klingman <kck@darwin.esd.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970618194123.oUA-Rm8jorAJstGOrxnKCQ9W-chEMo16jXo4k2ILmxE@z>

On Jun 18,  9:41am, Ken Klingman wrote:
> Subject: Getting X on Linux/SGI
> John,
>
> There's an effort going to port Linux to SGI systems.  They've
> got the basic kernel up on an Indy, but are now trying to figure
> out what to do with X.  Could you reply to the mail alias (linux@engr)
> with a few words on the effort involved and what kind of specs they
> need?  I know that our X server architecture is complicated by the
> support of OpenGL, but wouldn't it be a lot simpler to just do X
> without any OpenGL support?
>
> ...
>
> Ken
>
> ...
>
> Forwarded message:
> > Larry McVoy wrote:
> > >
> > > : There are some very serious issues which come up even getting
> > > : Xfree to a moderate level of acceleration.
> > >
> > > How about to a simple level of working?  Without any acceleration?
> > > For most people, just having xterms and netscape working is enough.
> > >
> > > I'm not a graphics or X person.  Could someone who knows SGI's gfx
> > > devices tell us how hard it would be to make the basics work?

The fastest path to make basic X works is probably by implementing
a device dependent layer (DDX) that controls all pixels going in/out
framebuffer, opens and closes devices like keyboard and mouse,
interpret input events and control graphic display backend.
Since frame buffer on Indy system is not directly accessible.
all pixels in/out frame buffer has to be via this DDX layer.
A lot of sample code under cfb directory should be
reuseable with minor changes. To begin with non-accelerated
rendering, only setpixel and getpixel are required.

A generic DDX layer which described in "The X Window System Server" book
(authors: Elias Israel and Erik Fortune) can be FTP from export.lcs.mit.edu

I think you also need following stuff for Indy system with Newport graphic:

1) Newport graphics spec.
2) A basic graphic driver that map RE chip to Xsgi's address
   space, so X can program RE registers
3) This graphic driver also needs to set up graphic backend display
   id table and display mode registers (if X support only one visual,
   this step is simple), to program Cmap for cursor color
   and to program cursor registers for glyph and location.
   All of these work can also be done in X if driver map backend to X.

> > >
> >
> > ...
> >
> >  Questions:
> >
> > - How much HW dependent stuff is in Xsgi itself?

Xsgi contains something specific to IRIX, e.g. share memory input
queue stuff which may not be wanted by Linux.

> > - Which of the DSOs in /usr/lib/X11/dyDDX are minimally
> >   needed to bring up an non-GLX Xserver?

All DSOs in dyDDX support GLX. If the system is Indy,
rex3.so is used for Newport graphic and exp.so is used for
EXPRESS graphic. By trimming down Xsgi and DSO's, you should be able
to run Xsgi on Linux without GLX.

-John

> > - How much efforts would it cost to compile the dyDDX
> >   stuff for Linux and distribute the binaries only
> >   (assuming that there is not to much HW stuff in Xsgi itself)?
> >
> >
> >  And of course, we probably have to provide the microcode and
> > loader for the different GFX cards.
> >
> >  I definitely agree with Ariel, that this is the most important
> > topic once we have Linux running stable.
> >
> > Martin
> >
>-- End of excerpt from Ken Klingman
