Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708090123.DAA28961@informatik.uni-koblenz.de>
Subject: Re: Linux GGI and Linux/SGI
Date: Sat, 9 Aug 1997 03:23:35 +0200 (MET DST)
In-Reply-To: <9708081540.ZM26801@blammo.engr.sgi.com> from "John Wiederhirn" at Aug 8, 97 03:40:30 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: John Wiederhirn <jwiede@blammo.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970809012335.eVfH2DLckRozoMu8YlO-u2dm16jE0yxazx3oPcmRVQc@z>

> > Well, we have discussed using GGI.  Last I checkend GGI was still itself
> > in a state of flux and the last thing I want to do is to open another
> > battle field.  Technical reasons against GGI was mostly that the original
> > design was very bloated as far as the kernel is affected.  This has
> > been improoved somwhat since.
> 
> I'm not so attached to the notion of GGI as much as for gfx
> having an in-kernel-space presence in Linux (Linux/SGI is
> going to need this, as I suspect is any Linux that attempts
> hardware acceleration of OpenGL or other similar APIs).

Miguel "Da Newport Man" de Icaza is working on the required kernel stuff.
Since a real native GFX support is a fairly big project currently the
emulation stuff needed for the SGI X server has priority.

  Ralf
