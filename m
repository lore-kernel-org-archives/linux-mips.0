Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Tue, 13 Aug 1996 04:45:56 -0700
Message-ID: <199608131145.EAA01442@neteng.engr.sgi.com>
From: "David S. Miller" <dm@neteng.engr.sgi.com>
In-reply-to: <199608122259.PAA28318@aa5b.engr.sgi.com> (nigel@aa5b)
Subject: Re: Linux: the next step
Reply-to: dm@sgi.com
Sender: owner-linux@cthulhu.engr.sgi.com
To: nigel@aa5b.engr.sgi.com
Cc: lm@neteng.engr.sgi.com, jes@machine.engr.sgi.com, sca@refugee.engr.sgi.comlm@neteng.engr.sgi.com, nigel@cthulhu.engr.sgi.com, alambie@wellington.sgi.com, ariel@cthulhu.engr.sgi.com, linux@yon.engr.sgi.com
Message-ID: <19960813114556.VaSoXaChta__SBW6McMmUjHiX8Dtg-i0iYEfpGunISc@z>

   From: nigel@aa5b (Nigel Gamble)
   Date: Mon, 12 Aug 1996 15:59:04 -0700 (PDT)

   > They can guarentee real time response of 10Khz, with less than 15 usec
   > variation.  That was with Linux running a 
   > 
   > 	tar f - /usr | (cd /newusr; tar xf -)
   > 
   > a web browser, X, etc, etc.  Good luck doing that on IRIX up.  Maybe MP.

   We can already do this on MP with User Level Interrupts.

I cannot wait to recompile all of my applications so that they can
take advantage of ULI...

The whole idea behind whatever approach linux will take to anything
(using clone() for threads under Linux is a good example) is that you
will not need to teach all of your "dumb" old programs (even ps!)
about these special processes and or things a process can do.

dm@engr.sgi.com

'Ooohh.. "FreeBSD is faster over loopback, when compared to
Linux over the wire". Film at 11.' -Linus
