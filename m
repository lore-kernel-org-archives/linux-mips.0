Message-ID: <sc99bfe4.043@quicklogic.com>
Date: Thu, 21 Mar 2002 11:10:56 -0800
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
Subject: Re: Re: PCI VGA Card Initilization (SIS6326 / PT80)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: dom@algor.co.uk, fxzhang@ict.ac.cn, linux-mips@oss.sgi.com, girishvg@yahoo.com
Message-ID: <20020321191056.ZiRKa0JxX-5V-AB0Zn9xX5zfgpbNhOqYcisM055-tP0@z>

Hello Dominic,

Actually it was Girish Gulawani who said he used the
MILO bios not Zhang. He said he was using the files
vgaraw1.c and vgaraw2.c from MILO. Those files do not
use the x86emu BIOS emulator but try to directly
initialize the VGA adapter.

Dan Aizenstros
Software Project Manager
QuickLogic Canada

>>> Dominic Sweetman <dom@algor.co.uk> 03/21/02 08:28 AM >>>

Dan,

> Is Algorithmics BIOS emulator not the x86emu code
> that can be found in the Alpha MILO and the XFree86
> code base as Alan Cox mentioned?

It's an entirely indepedent invention of the same idea.  I've no idea
whether it's any better/worse, but it sounded like our binary was
working for Zhang better than the MILO he'd built.

Dominic
Algorithmics Ltd
