Subject: Re: apparent math-emu hang on movf instruction
References: <OFFE4A0198.56A3A2A2-ON88256EDF.006D0D9F@philips.com>
	<876587uwud.fsf@redhat.com>
From: Richard Sandiford <rsandifo@redhat.com>
Date: Thu, 29 Jul 2004 08:01:24 +0100
In-Reply-To: <876587uwud.fsf@redhat.com> (Richard Sandiford's message of
 "Thu, 29 Jul 2004 07:54:50 +0100")
Message-ID: <871xivuwjf.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <rsandifo@redhat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: greg.roelofs@philips.com
Cc: linux-mips@linux-mips.org
Message-ID: <20040729070124.sQjL9LwKmH0XBfjGmCSBA0zqZqu9eHJkoC23DZUFxQE@z>

Richard Sandiford <rsandifo@redhat.com> writes:
> Does the patch below (against 2.6) fix things?  Only the first hunk
> is needed to fix the bug, the rest is just there for consistency.

Oops!  Serves me right for dabbling in new code.  Only the first
hunk is correct.

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
 
