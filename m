Message-ID: <00bf01bf78ce$37cf6cc0$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Indy crashes
Date: Wed, 16 Feb 2000 23:33:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "William J. Earl" <wje@cthulhu.engr.sgi.com>
Cc: linux-mips@vger.rutgers.edu, linux-mips@fnet.fr, linux@cthulhu.engr.sgi.com
Message-ID: <20000216223333.kDGL3cHB4D98BBZfWeoJE9rv0y2stqga4QRtVYatrbU@z>

>Emprirically, it appears that the [R5000] manual is incorrect in regard
>to the number of nop instructions.  The above sequences are known
>to work (via years of testing, and also via validation in discussions
>with people familiar with the hardware pipelines).

In principle, I could check it against the RTL, but I probably
won't bother.  Many thanks for sharing the IRIX disassembly!

> > Thirdly, this whole thread underscores why "clever" solutions that 
> > depend on implementation features of particular CPUs should 
> > be avoided whenever possible. If you want to be assured of
> > getting a delay cycle in a MIPS instruction stream, you should
> > use a "SSNOP", (sll r0,r0,1 as opposed to the "nop" sll r0,r0,0),
> > which forces delays even in superscalar implementations.
>
>      This is not realistic, given the number of workarounds required
>for various processors, unless you are willing to have most processors
>run quite a bit slower.  (Extra cycles in utlbmiss are noticeable.)


I agree that it is not realistic to hav a single binary TLB miss handler
for all possible MIPS CPUs, but that's not what I was getting at.
I just consider it unwise to use the fact that one "knows" that branches 
"always" delay three cycles to avoid hazards.  Such tricks are 
obscurantist, and lead, in my experience, to errors.

            Kevin K.
