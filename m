Message-ID: <016001c140b9$c5a2e900$cd22690a@huawei.com>
Reply-To: "Shaolin Zhang" <zhangshaolin@huawei.com>
From: "Shaolin Zhang" <zhangshaolin@huawei.com>
References: <00fe01c140b4$ad3f9200$cd22690a@huawei.com> <20010918224620.A22455@nevyn.them.org>
Subject: Re: kgdb with linux-mips problem
Date: Wed, 19 Sep 2001 11:18:37 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: Ernest Jih <ernest.jih@idt.com>, linux-mips@oss.sgi.com, renwei@huawei.com
Message-ID: <20010919031837.yCsUHFtQgSoBfeC1SAkWeZagxIzMH-NaVW-jrdX-nsU@z>

My gcc verison is 2.95.3 19991030, gdb verison is 20000204.
What is current version of bintuil and egcs,and where can i get it ?
thanks.

----- Original Message ----- 
From: "Daniel Jacobowitz" <dan@debian.org>
To: "Shaolin Zhang" <zhangshaolin@huawei.com>
Cc: <linux-mips@oss.sgi.com>; "Ernest Jih" <ernest.jih@idt.com>; "recc stone" <renwei@huawei.com>
Sent: Wednesday, September 19, 2001 10:46 AM
Subject: Re: kgdb with linux-mips problem


> What version of GDB are you using?  I recommend you get the current CVS
> snapshot and try again.
> 
> On Wed, Sep 19, 2001 at 10:42:08AM +0800, Shaolin Zhang wrote:
> > Hello ,
> > 
> >   Now we have some problems in using kgdb to debug the Linux-mips kernel on IDT 79s334A board.
> > 
> > 1.I enabled the kernel startup option kgdb=on to debug the kernel setup.
> >   At first, the gdb on host pc connected to the target boards correctly.
> >   Then I use a few "n"(Next) command to debug the kernel, but the kernel
> > seems
> >  to run out of my hands, as if I had executed some "c" command.
> >   I use "set debug remote 1"  command to see the packets gdb send&receive:
> >   and find :
> >    the gdb send a "c" packet to the stub at the end of packet sequence.
> > 
> >   I guess that the gdb on the host pc send some wrong command , or it can't
> > get right info
> >   to debug?
> > 
> > 
> > 2.I want to debug some init_module function in module , like this :
> > 
> > int init_module(void)
> > {
> >     breakpoint(); // use the breakpoint function in kernel to get a break.
> >     my_functions();
> > }
> > 
> > When I insmod this module, it through exception 9 (breakpoint), then I run
> > "bt"
> > command in gdb, but this time gdb report "can't find the start of function
> > 0x....".
> > Is this a gdb problem or gdb stub problem? BTW, when I first bootup the
> > kernel
> > and connect the gdb&stub ,the sample problem happened.
> > 
> > 
> 
> -- 
> Daniel Jacobowitz                           Carnegie Mellon University
> MontaVista Software                         Debian GNU/Linux Developer
