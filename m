Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199707171912.VAA29648@informatik.uni-koblenz.de>
Subject: Re: strace
Date: Thu, 17 Jul 1997 21:12:55 +0200 (MET DST)
In-Reply-To: <199707171728.NAA08651@neon.ingenia.ca> from "Mike Shaver" at Jul 17, 97 01:28:43 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970717191255.EYk0POPQfU3hTyGnMs_mZaLkrjp_TA2PRWYucRzgZwc@z>

> Anyone know what state the strace stuff in the CVS tree is in?

The strace is the strace as left by David Miller plus some modifications
by Miguel.  Those add some IRIX bits he needs to reverse engineer what
the X server is doing.

> I'm seeing some weird behaviour with rpm right now (can't find
> user/group) and I'd like to see what it's actually doing.
> 
> (Also, remind me to work on fdisk when I get back[*] -- I don't like
> fx very much.)

Set up an at(1) job ;-)

  Ralf
