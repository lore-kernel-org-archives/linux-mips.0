Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199709232334.BAA03833@informatik.uni-koblenz.de>
Subject: Re: Task list --preliminary list
Date: Wed, 24 Sep 1997 01:34:50 +0200 (MET DST)
In-Reply-To: <199709231837.NAA20145@speedy.rd.qms.com> from "Mark Salter" at Sep 23, 97 01:37:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mark Salter <marks@sun470.sun470.rd.qms.com>
Cc: miguel@nuclecu.unam.mx, ariel@cthulhu.engr.sgi.com, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <19970923233450.6skf7XGphClB-tFw8bMqloEZY3K63iIvxuaZ-9Kl9Wk@z>

> Yes, but I bet you didn't check it on an Indy with no scache :-)
> I have one of those beasts and the latest code in the cvs tree
> crashes early in the boot process.
> 
> The code in arch/mips/mm/r4xx0.c which sets up the cache flush
> procs now selects r4k_flush_page_to_ram_d32i32_r4600 where
> earlier versions of r4xx0.c selected r4k_flush_page_to_ram_d32i32.
> I think the current choice is correct in that my Indy has the
> R4600 cache bug mentioned in IDT's errata. But the *_r4600 version
> also has some inline assembler under an ifdef CONFIG_SGI which
> appears to do something to the SGI scache. But since I have
> no scache, I get a bus error irq instead.
> 
> It seems a bit strange that r4k_flush_page_to_ram_d32i32_r4600
> has this bit of SGI specific code, but r4k_flush_page_to_ram_d32i32
> does not. ???

The R4400 versions of the Indy have the "real" second level cache and
use a SC CPU version.  Opposed to that the  L2 cache of the R4600 and
R5000 Indies is controlled by external circuitry which needs special code.

Actually since we have the same problem on a couple of other machines,
SNI RM family one of them,  what should be done is to break out all the
#ifugly'ed SGI bits and provide some hooks for them.  You L2 less
machine would simply plug an empty function into these hooks.

Using r4k_flush_page_to_ram_d32i32 was definately wrong, the R4600
cache is two way set associative and flush_page_to_ram needs to take
care of that for all the R4600 and R5000 relatives.

  Ralf
