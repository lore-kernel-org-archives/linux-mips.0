Received: from 19pmail.ess.barracuda.com ([64.235.154.231]:57884 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990483AbdKWOnVvzaFT (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Nov 2017 15:43:21 +0100
Date: Thu, 23 Nov 2017 14:42:35 +0000
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Fix odd fp register warnings with MIPS64r2
In-Reply-To: <20171110205519.25884-1-james.hogan@mips.com>
Message-ID: <alpine.DEB.2.00.1711231420400.4290@tp.orcam.me.uk>
References: <20171110205519.25884-1-james.hogan@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@mips.com>
Cc: linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, stable@vger.kernel.org
Message-ID: <20171123144235.NarRPzEhrsHYKNFJo5QsZzY7prg0nxh9wxDMT4j9gDo@z>

On Fri, 10 Nov 2017, James Hogan wrote:

> Building 32-bit MIPS64r2 kernels produces warnings like the following
> on certain toolchains (such as GNU assembler 2.24.90, but not GNU
> assembler 2.28.51) since commit 22b8ba765a72 ("MIPS: Fix MIPS64 FP
> save/restore on 32-bit kernels"), due to the exposure of fpu_save_16odd
> from fpu_save_double and fpu_restore_16odd from fpu_restore_double:
> 
> arch/mips/kernel/r4k_fpu.S:47: Warning: float register should be even, was 1
> ...
> arch/mips/kernel/r4k_fpu.S:59: Warning: float register should be even, was 1
> ...

 Hmm, versions 2.24.90 and 2.28.51 are otherwise unindentified development 
snapshots; I think it would be slightly more appropriate if you referred 
to actual release versions, such as 2.25 and 2.29 respectively (if they 
indeed expose the same symptoms), especially as people other than 
toolchain developers and testers are generally expected not to use 
development snapshots.

 Also I find it suspicious that you say that the message has since 
vanished, as I can clearly reproduce it with current head (2.29.51):

$ cat oddfpr.s
	.module mips64r2
foo:
	ldc1	$f1, 0($2)
$ as -o oddfpr.o oddfpr.s
oddfpr.s: Assembler messages:
oddfpr.s:3: Warning: float register should be even, was 1
$ 

Can you send me a .s file produced from r4k_fpu.S along with compiler 
flags used?

> This appears to be because .set mips64r2 does not change the FPU ABI to
> 64-bit when -march=mips64r2 (or e.g. -march=xlp) is provided on the
> command line on that toolchain, from the default FPU ABI of 32-bit due
> to the -mabi=32. This makes access to the odd FPU registers invalid.

 Correct, the purpose of `.set arch=mips64r2', which is the canonical form 
`.set mips64r2' is equivalent to, and indeed any `.set arch=...' 
pseudo-op, is only to change the set of instructions accepted within the 
limits determined by the ABI chosen with `-mabi=...' (or its equivalent 
short forms) and not the ABI itself.

 The patch itself LGTM.

Reviewed-by: Maciej W. Rozycki <macro@mips.com>

  Maciej
