Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199708120407.GAA03608@informatik.uni-koblenz.de>
Subject: Re: Bottom half bug
Date: Tue, 12 Aug 1997 06:07:06 +0200 (MET DST)
In-Reply-To: <199708112359.SAA03734@athena.nuclecu.unam.mx> from "Miguel de Icaza" at Aug 11, 97 06:59:07 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com
Message-ID: <19970812040706.Kz4ImWd3fQxQRm4yhcWQRphcqrVRGzdUxdzpAuGtcMk@z>

>   Well, the major problem with getting gdb up was that init is for
> some reason setting the blocked signal mask to 0x39 (this includes
> sighup, sigtrap and a couple of others).  
> 
>   I will debug this next, right now I have this gross hack on gdb to
> reset the signal mask to zero.  Any ideas of why would init be doing this?

Well, I'll look at this when I get off the plane or so ...

I finally tracked the problem with <CTRL>-s locking up the machine down.
It's a missing restore_flags() in the newport driver that makes the
keyboard driver bottom half go bobo.  Also we were missing irq_enter/
irq_leave in the Indy interrupt handler.  The patch, well, it's in my
suit case.  Have fun with your crashing boxes :-)

California, I'm comin',

  Ralf
