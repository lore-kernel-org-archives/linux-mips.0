From: "Gilad Rom" <gilad@romat.com>
Subject: =?windows-1255?B?+vnl4eQ6IEF1MTUwMCBDaGlwIFNlbGVjdA==?=
Date: Thu, 25 Nov 2004 09:12:44 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <41A4CB92.7070403@embeddedalley.com>
Message-ID: <20041125071225.ADA1AEB2D0@mail.romat.com>
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Pete Popov' <ppopov@embeddedalley.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20041125071244.IUk29HgRVQ8sIOHfqvU9Y3I4lZzsWBAA_hAnOzxlF9Q@z>

Well, what I did so far was setup mem_stcfg1/mem_staddr1. 
What I'm having trouble with is, what values do I need to 
Set in mem_staddr1, and then, how do I access 
That memory (mmap? Driver?).

Thanks.
Gilad.

-----הודעה מקורית-----
מאת: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] בשם Pete Popov
נשלח: Wednesday, November 24, 2004 7:58 PM
אל: Gilad Rom
עותק: linux-mips@linux-mips.org
נושא: Re: Au1500 Chip Select

Gilad Rom wrote:

> Hello,
> 
> I am trying to implement a simple program which Will be used to 
> communicate with an I/O peripheral Over CS1 (Chip select 1) of the 
> au1500.

I'm not sure I understand what you're trying to do. The chip select is setup
by the boot loader or kernel, and you don't touch it anymore. The CS will
get asserted/deasserted based on the addresses you're trying to access.

> Has anyone ever attempted this? Could someone Point me to some sample 
> code, perhaps? I am grepping Through the kernel, yet having trouble 
> locating Chip-select specific code for reference.

Again, what sort of an example are you looking for?  Setting up a chip
select on the Au1x is nothing more than writing the appropriate values to
the 3 chip select registers. Then you're done.

Pete
