Message-ID: <sc9ad9c1.008@quicklogic.com>
Date: Fri, 22 Mar 2002 07:13:40 -0800
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
Subject: Re: Re: PCI VGA Card Initilization (SIS6326 / PT80)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com, girishvg@yahoo.com
Message-ID: <20020322151340.9nRhI1lrHrHaymolj4WSh1uK6xFmD2WoFM964y1i_Xg@z>

Hello Girish,

I have used the x86emu code to run the BIOS code
on an ATI Rage IIC PCI adapter. I added the code
to the PMON that I build for my company's Hurricane
board. The code for the emulator does not require
a lot of work because it is seperated between
portable code that is not board or system specific
and glue code that is.

In the x86emu-0.8.tar.gz archive you will find the
portable code in the directory scitech/src/x86emu.

The code in scitech/src/biosemu can be used as a
starting point for creating the glue code.

Dan Aizenstros
Software Project Manager
QuickLogic Canada

>>> "Girish Gulawani" <girishvg@yahoo.com> 03/22/02 03:45 AM >>>

hello, all
thank you very much for all these reply mails.
my saga of VGA initialization continues. it occurs to me that the x86
emulation for the VGA bios is a long process. SiS6326 chipset has support
inside XFree86 & digging out the BIOS code from here is also a big story.
hence i was looking for a rather quickish solution. currently i'm trying to
use sis_*.c files from XFree86 source. dont know how but my monitor displays
2 red & 1 green vertical lines. the sis_bios source code searched for the
mode, memory references inside the BIOS at 0x20A offset & it failed to find
the mode & other info. AOpen BIOS version is 2.25.
could anybody of you please share your success story of VGA initialization
on MIPS board with me??
many thanks in advance.
regards,
girish.



----- Original Message -----
From: "Dan Aizenstros" <daizenstros@quicklogic.com>
To: <dom@algor.co.uk>; <fxzhang@ict.ac.cn>; <linux-mips@oss.sgi.com>;
<girishvg@yahoo.com>
Sent: Friday, March 22, 2002 4:10 AM
Subject: Re: Re: PCI VGA Card Initilization (SI6326 / PT80)


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


_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
