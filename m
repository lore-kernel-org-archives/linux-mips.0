Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Robin Humble <rjh@pixel.maths.monash.edu.au>
Message-ID: <199901281634.DAA10412@pixel.maths.monash.edu.au>
Subject: Re: Installing Linux on an Indy with 1 HD
Date: Fri, 29 Jan 1999 03:34:00 +1100 (EDT)
In-Reply-To: <Pine.LNX.4.05.9901281531560.9205-100000@vitelus.com> from "Robbie Stone" at Jan 28, 99 03:33:28 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Robbie Stone <rstone@vitelus.com>
Cc: nachtfalke@usa.net, linux@cthulhu.engr.sgi.com
Message-ID: <19990128163400.hofPbGQYbDZfGXZq-MGwMcemDOZdQs25fE5boteBNBI@z>


>Er, you can use gcc for most all of your building, as a matter of fact it

Actually if you're talking about using gcc under IRIX then IRIX 5.3
doesn't come with the necessary header files to compile anything(*).
You need the IDO or IRIX >= 6.5 which Alexander does not posess. Also
just to clear up some apparent confusion (which may well be mine rather
than Alexanders) in order to install SGI-Linux for Indy you don't
actually need to compile anything...

I would also point out that Linux on Indy doesn't support any X11
graphics yet. Swapping from IRIX 5.3 to something text-only could be
a bit of a shock... But wait a few months and life could be all
xPeaches and xCream :-)

Personally I'd try to find a small (hyper-cheap/free) old SCSI drive
(erm, 300-500M would do?) and install on that. Or do like Richard
suggested and permanently run your Linux/Indy off a network root drive.

cheers,
robin

(*) except the IRIX kernel. It uses a weirdly lobotomised compiler
hidden well away...

--
He'd found that even the people whose job of work was, so to speak, the
Universe, didn't really believe in it and were actually quite proud of not
knowing what it really was or even if it could theoretically exist.
     Robin Humble     /      http://www.maths.monash.edu.au/~rjh/
