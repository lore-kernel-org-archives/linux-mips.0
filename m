Date: Tue, 4 Nov 2003 19:48:09 +0100 (CET)
From: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Subject: Re: CVS Update@-mips.org: linux 
In-Reply-To: <20031103231010Z8225443-1272+8723@linux-mips.org>
Message-ID: <Pine.LNX.4.32.0311041939110.31563-100000@jurand.ds.pg.gda.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <macro@ds2.pg.gda.pl>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20031104184809.V5DmWSiU_91CU7bWYcNJpNG_HvsbAxRPyU_6CsiW6SA@z>

On Mon, 3 Nov 2003 ralf@linux-mips.org wrote:

> Modified files:
> 	include/asm-mips: i8259.h
>
> Log message:
> 	Declare i8259A_lock spinlock.  New inline function i8259_irq to poll
> 	interrupts in a PC-style daisy-chained i8259 configuration where no
> 	better method to execute an interrupt acknowledge cycle is available.

 This is broken -- you do want to check bit #7 for spurious interrupts
instead of doing awkward PIC poking.  Alternatively, just skip the check
-- the condition is rare and handlers need to be able to deal with it
anyway.  It was discussed a few months ago and I proposed a correct patch
similar to your one, but it was rejected, sigh...

-- 
+  Maciej W. Rozycki, Technical University of Gdansk, Poland   +
+--------------------------------------------------------------+
+        e-mail: macro@ds2.pg.gda.pl, PGP key available        +
