Subject: Re: apparent math-emu hang on movf instruction
References: <OFFE4A0198.56A3A2A2-ON88256EDF.006D0D9F@philips.com>
From: Richard Sandiford <rsandifo@redhat.com>
Date: Thu, 29 Jul 2004 07:54:50 +0100
In-Reply-To: <OFFE4A0198.56A3A2A2-ON88256EDF.006D0D9F@philips.com> (greg
 roelofs's message of "Wed, 28 Jul 2004 12:54:04 -0700")
Message-ID: <876587uwud.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <rsandifo@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: greg.roelofs@philips.com
Cc: linux-mips@linux-mips.org
Message-ID: <20040729065450.EgXE-PcNR4fOnsEsF9t57r5M2YYTyqyy7WWa_61yRqw@z>

greg.roelofs@philips.com writes:
> I've just started looking at the kernel's emulation code, and one thing
> that pops out immediately is that there's no mention of movf anywhere
> in arch/mips/math-emu, though cp1emu.c does cover movc, movn, movz, and
> plain mov (at least, their .fmt variants).

"movc" covers both movf and movt (bit 16 says which).

But yes, it does look like an emulation bug.  It seems that the code
to handle GPR conditional moves (in cop1Emulate) was copied from the
code to handle FPR moves (in fpu_emu).  The cop1Emulate() code reads:

		if (((ctx->fcr31 & cond) != 0) != ((MIPSInst_RT(ir) & 1) != 0))
			return 0;
		xcp->regs[MIPSInst_RD(ir)] = xcp->regs[MIPSInst_RS(ir)];

"return 0" was fine in fpu_emu(), but not here, since it skips the
all-important:

	/* we did it !! */
	xcp->cp0_epc = VA_TO_REG(contpc);
	xcp->cp0_cause &= ~CAUSEF_BD;
	return 0;

So we'd reenter the exception handler on exit.

Does the patch below (against 2.6) fix things?  Only the first hunk
is needed to fix the bug, the rest is just there for consistency.

Richard


Index: arch/mips/math-emu/cp1emu.c
===================================================================
RCS file: /home/cvs/linux/arch/mips/math-emu/cp1emu.c,v
retrieving revision 1.32
diff -u -p -F^\([(a-zA-Z0-9_]\|#define\) -r1.32 cp1emu.c
--- arch/mips/math-emu/cp1emu.c	19 Jan 2004 16:25:21 -0000	1.32
+++ arch/mips/math-emu/cp1emu.c	29 Jul 2004 06:42:53 -0000
@@ -528,9 +528,8 @@ static int cop1Emulate(struct pt_regs *x
 		if (MIPSInst_FUNC(ir) != movc_op)
 			return SIGILL;
 		cond = fpucondbit[MIPSInst_RT(ir) >> 2];
-		if (((ctx->fcr31 & cond) != 0) != ((MIPSInst_RT(ir) & 1) != 0))
-			return 0;
-		xcp->regs[MIPSInst_RD(ir)] = xcp->regs[MIPSInst_RS(ir)];
+		if (((ctx->fcr31 & cond) != 0) == ((MIPSInst_RT(ir) & 1) != 0))
+			xcp->regs[MIPSInst_RD(ir)] = xcp->regs[MIPSInst_RS(ir)];
 		break;
 #endif
 
@@ -850,20 +849,17 @@ static int fpu_emu(struct pt_regs *xcp, 
 #if __mips >= 4
 		case fmovc_op:
 			cond = fpucondbit[MIPSInst_FT(ir) >> 2];
-			if (((ctx->fcr31 & cond) != 0) !=
+			if (((ctx->fcr31 & cond) != 0) ==
 				((MIPSInst_FT(ir) & 1) != 0))
-				return 0;
-			SPFROMREG(rv.s, MIPSInst_FS(ir));
+				SPFROMREG(rv.s, MIPSInst_FS(ir));
 			break;
 		case fmovz_op:
-			if (xcp->regs[MIPSInst_FT(ir)] != 0)
-				return 0;
-			SPFROMREG(rv.s, MIPSInst_FS(ir));
+			if (xcp->regs[MIPSInst_FT(ir)] == 0)
+				SPFROMREG(rv.s, MIPSInst_FS(ir));
 			break;
 		case fmovn_op:
-			if (xcp->regs[MIPSInst_FT(ir)] == 0)
-				return 0;
-			SPFROMREG(rv.s, MIPSInst_FS(ir));
+			if (xcp->regs[MIPSInst_FT(ir)] != 0)
+				SPFROMREG(rv.s, MIPSInst_FS(ir));
 			break;
 #endif
 		case fabs_op:
@@ -1040,20 +1036,17 @@ static int fpu_emu(struct pt_regs *xcp, 
 #if __mips >= 4
 		case fmovc_op:
 			cond = fpucondbit[MIPSInst_FT(ir) >> 2];
-			if (((ctx->fcr31 & cond) != 0) !=
+			if (((ctx->fcr31 & cond) != 0) ==
 				((MIPSInst_FT(ir) & 1) != 0))
-				return 0;
-			DPFROMREG(rv.d, MIPSInst_FS(ir));
+				DPFROMREG(rv.d, MIPSInst_FS(ir));
 			break;
 		case fmovz_op:
-			if (xcp->regs[MIPSInst_FT(ir)] != 0)
-				return 0;
-			DPFROMREG(rv.d, MIPSInst_FS(ir));
+			if (xcp->regs[MIPSInst_FT(ir)] == 0)
+				DPFROMREG(rv.d, MIPSInst_FS(ir));
 			break;
 		case fmovn_op:
-			if (xcp->regs[MIPSInst_FT(ir)] == 0)
-				return 0;
-			DPFROMREG(rv.d, MIPSInst_FS(ir));
+			if (xcp->regs[MIPSInst_FT(ir)] != 0)
+				DPFROMREG(rv.d, MIPSInst_FS(ir));
 			break;
 #endif
 		case fabs_op:
