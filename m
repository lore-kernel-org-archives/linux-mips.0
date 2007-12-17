Received: from miranda.se.axis.com ([193.13.178.8]:59032 "EHLO
	miranda.se.axis.com") by ftp.linux-mips.org with ESMTP
	id S20021826AbXLQGpi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 17 Dec 2007 06:45:38 +0000
From: "Mikael Starvik" <mikael.starvik@axis.com>
Subject: RE: GCC 3.4.5 and mftc0
Date: Mon, 17 Dec 2007 07:45:27 +0100
Message-ID: <BFECAF9E178F144FAEF2BF4CE739C66804C402C4@exmail1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <BFECAF9E178F144FAEF2BF4CE739C668056FE63A@exmail1.se.axis.com>
Return-Path: <mikael.starvik@axis.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>, Mikael Starvik <mikael.starvik@axis.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20071217064527.Pi7x35FcSFJVA514HYu3Kmxhp-5xmuXUcDmD4LNVHbw@z>

Thanks!

and sorry for the spelling of simulator.

/Mikael

-----Original Message-----
From: Ralf Baechle [mailto:ralf@linux-mips.org] 
Sent: Friday, December 14, 2007 5:26 PM
To: Mikael Starvik
Cc: linux-mips@linux-mips.org
Subject: Re: GCC 3.4.5 and mftc0


On Fri, Dec 14, 2007 at 10:49:40AM +0100, Mikael Starvik wrote:

> mftc0() is implemented as
>  
>  .word ...
>   move %0, $1
> 
> With at least gcc 3.4.5 the move is implemented as an addu %0, $1, $0.
> But in the MIPS sumulator this fails and %0 gets the value 0xffffffff.
> Implementing this as a or %0, $1, $0 instead gives the expected result.

I wonder what "sumulator" you're using ...

Addu is a perfectly fine implementation of move for 32-bit code.  It's not
for 64-bit code but that's beside the point here.  The or method is also
correct but historically the add instruction has been prefered, also
because some processor - the R4300 afair - processes arithmetic instructions
(add, sub that is not mul / div) faster than logic operations.

> Any suggestions where the problem is and what the correct solution is?

Fix the sumulator.

> After fixing this my next problem is that IPIs doesn't reach all TCs
> correctly (it seams like the code doesn't detect IXMT status correctly,
> but I am still investigating). It is likely that it is caused by
> something similar to the problem above.

The code certainly works on real silicon, so the cause must be something
local to your environment.

Cheers,

  Ralf
