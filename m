From: "Gilad Rom" <gilad@romat.com>
Subject: =?windows-1255?B?+vnl4eQ6IPr55eHkOiBBdTE1MDAgQ2hpcCBTZWxlY3Q=?=
Date: Thu, 25 Nov 2004 09:32:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <41A5886F.3000101@embeddedalley.com>
Message-ID: <20041125073158.98A11EB2A9@mail.romat.com>
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Pete Popov' <ppopov@embeddedalley.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20041125073217.-elqlENfIbnpCIJRAG-JQqGP7A2WAjL0sDmaBrN-K6g@z>

The device is a simple ALTERA chip, used for testing (for the mean time).
I need to make sure that I can access it, and simply read data from it.
Here's my question: Let's say I assign 0x1000 as the address portion (CSBA)
Of MEM_STADDR1. What address should I mmap after that?
(Using mmap only for initial development, Once I realize all I need
To do I'll write a driver).

Thanks,
Gilad.

-----הודעה מקורית-----
מאת: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] בשם Pete Popov
נשלח: Thursday, November 25, 2004 9:23 AM
אל: Gilad Rom
עותק: linux-mips@linux-mips.org
נושא: Re: תשובה: Au1500 Chip Select

Gilad Rom wrote:
> Well, what I did so far was setup mem_stcfg1/mem_staddr1. 
> What I'm having trouble with is, what values do I need to Set in 
> mem_staddr1,

Depends on the device attached to that CS and the physical address you want
to assign to it.

> and then, how do I access
> That memory (mmap? Driver?).

Driver would be better.

Pete

> Thanks.
> Gilad.
> 
> -----הודעה מקורית-----
> מאת: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org] בשם Pete Popov
> נשלח: Wednesday, November 24, 2004 7:58 PM
> אל: Gilad Rom
> עותק: linux-mips@linux-mips.org
> נושא: Re: Au1500 Chip Select
> 
> Gilad Rom wrote:
> 
> 
>>Hello,
>>
>>I am trying to implement a simple program which Will be used to 
>>communicate with an I/O peripheral Over CS1 (Chip select 1) of the 
>>au1500.
> 
> 
> I'm not sure I understand what you're trying to do. The chip select is 
> setup by the boot loader or kernel, and you don't touch it anymore. 
> The CS will get asserted/deasserted based on the addresses you're trying
to access.
> 
> 
>>Has anyone ever attempted this? Could someone Point me to some sample 
>>code, perhaps? I am grepping Through the kernel, yet having trouble 
>>locating Chip-select specific code for reference.
> 
> 
> Again, what sort of an example are you looking for?  Setting up a chip 
> select on the Au1x is nothing more than writing the appropriate values 
> to the 3 chip select registers. Then you're done.
> 
> Pete
> 
> 
> 
> 
