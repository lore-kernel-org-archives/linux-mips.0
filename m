Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199704100701.JAA08771@kernel.panic.julia.de>
Subject: Re: all in the family
Date: Thu, 10 Apr 1997 09:01:33 +0200 (MET DST)
In-Reply-To: <199704100226.WAA01960@jenolan.caipgeneral> from "David S. Miller" at Apr 9, 97 10:26:18 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@jenolan.rutgers.edu>
Cc: shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970410070133.bsFQ6h5bAOaOqLiH8Z8aUYmZoezc61r-jGzoiYZf_sw@z>

>    Looks like I may be getting a machine here to see if we can migrate
>    some of our non-Oracle machines to Linux/SPARC.
> 
>    Anyone know if the emulation is up to hosting the Linux/Indy
>    cross-compiler?
> 
> It should be straight forward, 32-bit to 32-bit crosses under gcc work
> flawlessly right out of the box for everything I've ever tried.  It's
> when you cross from 32-bit to 64-bit that you may hit a bug or two.

I've got the necessary patches to make the binutils and GCC work as
Linux/Alpha -> Linux/MIPS crosscompiler.  Mike, if you need them remind
me to send them if you need them.

>    In related news, we'll then have Linux running on 5 architectures
>    in the same room (Intel, Alpha, SPARC, ELKS, Indy).  Maybe I'll
>    steal the PowerMac too... =)
> 
> ELKS, that is cheating ;-)

:-)

  Ralf
