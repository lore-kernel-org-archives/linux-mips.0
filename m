From: greg.roelofs@philips.com
Subject: Re: apparent math-emu hang on movf instruction
Date: Thu, 29 Jul 2004 14:53:46 -0700
Message-ID: <OF8AA8C2FE.CCAA8F91-ON88256EE0.0078027A@philips.com>
MIME-Version: 1.0
Return-Path: <greg.roelofs@philips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: rsandifo@redhat.com
Cc: linux-mips@linux-mips.org
Message-ID: <20040729215346.R0bfRdHBu2_a9BiwN_B2s221caJEnQsbg3iDBhAdO5E@z>

Richard Sandiford <rsandifo@redhat.com> wrote...

>> Does the patch below (against 2.6) fix things?  Only the first hunk
>> is needed to fix the bug, the rest is just there for consistency.

> Oops!  Serves me right for dabbling in new code.  Only the first
> hunk is correct.

Yup, that does it!  Many thanks.  The only thing I had to change for
2.4.x was the name of the "fcr31" soft-struct member; it's "sr" in
older kernels:

> +		if (((ctx->fcr31 & cond) != 0) == ((MIPSInst_RT(ir) & 1) != 0))
		           ^^^^^ sr
> +			xcp->regs[MIPSInst_RD(ir)] = xcp->regs[MIPSInst_RS(ir)];

(Ralf renamed things on 20030720, according to the cvsweb.)

Thanks again,
-- 
Greg Roelofs            `Name an animal that's small and fuzzy.' `Mold.'
Philips Semiconductors   greg.roelofs@philips.com
