Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708162207.AAA01148@informatik.uni-koblenz.de>
Subject: Re: boot linux - wish
Date: Sun, 17 Aug 1997 00:07:45 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970816224739.21289F-100000@odin.waw.com> from "Vincent Renardias" at Aug 16, 97 10:54:01 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Vincent Renardias <vincent@waw.com>
Cc: miguel@nuclecu.unam.mx, linux@cthulhu.engr.sgi.com
Message-ID: <19970816220745.wEg0pFBADPNmH3-0cCH5crp30TCRE-UwPWnXdhq6IfA@z>

> On Sat, 16 Aug 1997, Miguel de Icaza wrote:
> 
> > > Is there ever ANY chance of seeing XFS in Linux? Or a flavor of a really
> > > fast journaled file system?
> > 
> > not right now.  And getting an XFS clone to work on Linux is really
> > not a trivial task.
> 
> Are the XFS specs. available BTW?

There is a whitepaper available on SGI's webserver.  It however does
not refer to the really interesting details.

As far as the complexity of writing an XFS-like fs is concerned - SGI has
invested a significant fraction of the R&D of XFS into the realtime stuff.
So ignoring that part for the beginning makes the task of writing a XFS
like filesystem much easier.

  Ralf
