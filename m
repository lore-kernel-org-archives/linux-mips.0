Message-ID: <000f01c140de$2bf553e0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <00fe01c140b4$ad3f9200$cd22690a@huawei.com>
Subject: Re: kgdb with linux-mips problem
Date: Wed, 19 Sep 2001 09:38:48 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Shaolin Zhang <zhangshaolin@huawei.com>, linux-mips@oss.sgi.com
Cc: Ernest Jih <ernest.jih@idt.com>, "\"recc stone\"" <renwei@huawei.com>
Message-ID: <20010919073848.5feBAo7tNAkYqfE96qdz523J7jFDRfmQ5DQDwA-ECoI@z>

I'm not 100% sure about where your first problem is coming
from,but you should not be too surprised that gdb is sending a
continue message as part of implementing the "next" command.
The gdb kernel agent has no idea what the composition of
the source code would be - that's up to gdb.  Gdb implements
commands like "next" by computing a breakpoint address,
setting an (internal) breakpoint, and telling the agent
to resume execution, presumably with a "c" packet.

This problem *may* be linked with the second you describe,
which is one I know well.  While this may have been fixed
in more recent versions of gdb, the last time I used kgdb
for MIPS, it was certainly the case that gdb looked for
text (code) symbols *only* in the *.text* section of the
kernel image.  All of the init_module functions are
grouped together in a seperate (".init_text" or something
like that) section of the file. They need to be loaded
together in a seperate hunk  of memory, after all.
That causes the backtrace problem you describe on a
compiled-in breakpoint, and makes it very tricky to
dynamically set breakpoints in the init modules.
I remember that I had to set them, not by symbol,
but by hex address after having manually dumped the
kernel symbol table.  This situation could also explain
why doing a "next" command while the kernel is still
executing in init modules is causing bad behavior.

This, along with some other bugs that are fatal to
the kernel during kgdb sessions, should have been
fixed in gdb long ago, but I don't know that they
ever were.  When I was using it, I was in sufficiently
desperate need of *something* that I accepted doing
a lot of painful procedural work-arounds.

            Kevin K.

----- Original Message -----
From: "Shaolin Zhang" <zhangshaolin@huawei.com>
To: <linux-mips@oss.sgi.com>
Cc: "Ernest Jih" <ernest.jih@idt.com>; ""recc stone"" <renwei@huawei.com>
Sent: Wednesday, September 19, 2001 4:42 AM
Subject: kgdb with linux-mips problem


> Hello ,
>
>   Now we have some problems in using kgdb to debug the Linux-mips kernel
on IDT 79s334A board.
>
> 1.I enabled the kernel startup option kgdb=on to debug the kernel setup.
>   At first, the gdb on host pc connected to the target boards correctly.
>   Then I use a few "n"(Next) command to debug the kernel, but the kernel
> seems
>  to run out of my hands, as if I had executed some "c" command.
>   I use "set debug remote 1"  command to see the packets gdb send&receive:
>   and find :
>    the gdb send a "c" packet to the stub at the end of packet sequence.
>
>   I guess that the gdb on the host pc send some wrong command , or it
can't
> get right info
>   to debug?
>
>
> 2.I want to debug some init_module function in module , like this :
>
> int init_module(void)
> {
>     breakpoint(); // use the breakpoint function in kernel to get a break.
>     my_functions();
> }
>
> When I insmod this module, it through exception 9 (breakpoint), then I run
> "bt"
> command in gdb, but this time gdb report "can't find the start of function
> 0x....".
> Is this a gdb problem or gdb stub problem? BTW, when I first bootup the
> kernel
> and connect the gdb&stub ,the sample problem happened.
>
>
