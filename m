Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708230125.DAA27638@informatik.uni-koblenz.de>
Subject: Re: Kernel compile errors...
Date: Sat, 23 Aug 1997 03:25:11 +0200 (MET DST)
In-Reply-To: <Pine.LNX.3.95.970822171154.1607C-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Aug 22, 97 05:15:11 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: miguel@nuclecu.unam.mx, linux@cthulhu.engr.sgi.com
Message-ID: <19970823012511.Lp3R64jyh61cMzvV9khmm_b89IK0Lq-VHkrArzrdQmo@z>

> > > I just checked out the latest kernel, and I get the following errors when
> > > I try to compile. Uh, what am I doing wrong?  I'm afraid MIPS assembler is
> > > above me.
> > 
> > Strange, I have been using the gcc and binutils packages put together
> > by Ralf for a long time, it is not the stock gcc/binutils, probably
> > this is your problem?
> 
> I don't think so.  The ones I'm using are those from Ralf as well.  I will
> double check to make sure.

This is a bug which I fixed in my version of binutils, so ...

  Ralf
