Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199704090525.HAA06508@kernel.panic.julia.de>
Subject: Re: It booooooooooots!
Date: Wed, 9 Apr 1997 07:25:46 +0200 (MET DST)
In-Reply-To: <199704082337.QAA14690@fir.esd.sgi.com> from "William J. Earl" at Apr 8, 97 04:37:49 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.esd.sgi.com>
Cc: shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com, kneedham@ottawa.sgi.com
Message-ID: <19970409052546.IPx144WGzXca17cxdKZrHPmyEJrdF6B8o9rLK2d1PWE@z>

> ...
>  > Checking for 'wait' instruction...  unavailable.
> ...
> 
>      This appears to be a bug.  The R5000 does have the wait instruction.

Linux doesn't really check; instead it has encoded which CPU types
have a wait instruction.  I add the R500 to that list.

  Ralf
