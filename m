From: Dominic Sweetman <dom@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <16812.19039.764510.640663@gargle.gargle.HOWL>
Date: Tue, 30 Nov 2004 10:24:31 +0000
Subject: Re: CP0 EntryLo
In-Reply-To: <20041130095640.499DFEB2EF@mail.romat.com>
References: <20041130095640.499DFEB2EF@mail.romat.com>
Return-Path: <dom@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gilad Rom <gilad@romat.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20041130102431.xuPf3pIA3T7UKmqptmL7Qertq2QlR_F8psTw3VL-0c8@z>


Gilad Rom (gilad@romat.com) writes:

> I am attempting to access a peripheral device over the Au1500 static bus.
> 
> According to the Au1500 Databook, Whenever I set the Chip Select config
> Register DTY bits to 1 (for "I/O Device").

> I must also set Bits 29:26 of CoProcessor 0 to 0xD, to represent
> bits 35:32 of the Physical address.

"CoProcessor 0" is a kind of fiction represented by a whole bunch of
registers, so you've wandered a long way into the weeds here.

> My question is, if anyone can answer it, is how do I setup
> The CoProcessor0 registers 29:26 in my driver?

I think you are referring to the "EntryLo0-1" register pair.  These
are used as staging registers when reading or writing entries in the
TLB, which is the address translation table.  

The manual is implying is that you need to set up a TLB entry to
access these high physical addresses.  

In Linux most of the TLB is maintained by the kernel as a cache of the
translations used by user programs.  That's probably why you see
"random values" from the staging registers; the kernel is busy taking
exceptions when required translations aren't in the TLB and fixing
them up.

However, the Au1500 hardware permits a small number of TLB entries to
be "wired", for fixed functions like your I/O accesses.

I'm not enough of an expert on the Linux kernel to tell you how to set
up a wired entry: but grep through the sources and you'll turn
something up!

> I have noticed a set of functions called write/read_c0_entrylo[0,1],
> But I keep getting random values when invoking these from my driver.

I think those are way too low-level for your purposes.

--
Dominic Sweetman
MIPS Technologies
