Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Tue, 12 Aug 1997 11:26:43 -0500
Message-ID: <199708121626.LAA07889@athena.nuclecu.unam.mx>
From: Miguel de Icaza <miguel@nuclecu.unam.mx>
In-reply-to: <199708120407.GAA03608@informatik.uni-koblenz.de> (message from
	Ralf Baechle on Tue, 12 Aug 1997 06:07:06 +0200 (MET DST))
Subject: Re: Bottom half bug
Sender: owner-linux@cthulhu.engr.sgi.com
To: ralf@mailhost.uni-koblenz.de
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970812162643.aMsY0cE5kFo1cHVXHIwEjd4uC0raV-kqfNIJD_Ldr3U@z>


> I finally tracked the problem with <CTRL>-s locking up the machine down.
> It's a missing restore_flags() in the newport driver that makes the
> keyboard driver bottom half go bobo.  Also we were missing irq_enter/
> irq_leave in the Indy interrupt handler.  The patch, well, it's in my
> suit case.  Have fun with your crashing boxes :-)

Thanks for the pointers.  They are fixed in my tree now :-).

Cheers,
Miguel.
