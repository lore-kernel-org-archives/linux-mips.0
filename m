Received: from localhost.localdomain ([127.0.0.1]:51767 "EHLO
        localhost.localdomain" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011975AbbAUB7RRLBYC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Jan 2015 02:59:17 +0100
Date: Wed, 21 Jan 2015 01:59:17 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH RFC v2 45/70] MIPS: kernel: branch: Prevent BLTZL emulation
 for MIPS R6
In-Reply-To: <1421405389-15512-46-git-send-email-markos.chandras@imgtec.com>
Message-ID: <alpine.LFD.2.11.1501210044050.28301@eddie.linux-mips.org>
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-46-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <macro@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20150121015917.PvuXNkphx-id55hQv87CBcOPNrdO2XRV8LJIi0RXGrI@z>

On Fri, 16 Jan 2015, Markos Chandras wrote:

> MIPS R6 removed the BLTZL instruction so do not try to emulate it
> if the R2-to-R6 emulator is not present.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---

 I appreciate your effort in splitting 45-52/70 into separate patches, but 
frankly I think removing individual branch instructions one by one seems 
an overkill to me, and actually makes a review more difficult.  They 
comprise a single functional entity and can really be treated as one 
feature and splitting it into pieces makes it easy to miss the big 
picture.

> diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
> index 9b622ca391d8..502bf2aeb834 100644
> --- a/arch/mips/kernel/branch.c
> +++ b/arch/mips/kernel/branch.c
> @@ -436,6 +436,11 @@ int __compute_return_epc_for_insn(struct pt_regs *regs,
>  		switch (insn.i_format.rt) {
>  		case bltz_op:
>  		case bltzl_op:
> +			if (NO_R6EMU && (insn.i_format.rt == bltzl_op)) {
> +				ret = -SIGILL;
> +				/* not emulating the branch likely for R6 */
> +				break;
> +			}
>  			if ((long)regs->regs[insn.i_format.rs] < 0) {
>  				epc = epc + 4 + (insn.i_format.simmediate << 2);
>  				if (insn.i_format.rt == bltzl_op)

 For example here it is obvious that there is no need to repeat the 
condition and:

		switch (insn.i_format.rt) {
		case bltzl_op:
			if (NO_R6EMU) {
				ret = -SIGILL;
				/* not emulating the branch likely for R6 */
				break;
			}
			/* Fall through */
		case bltz_op:

will do.

 However the way how the return value is set and the error return path 
handled here is inconsistent with how BPOSGE32 does these things here.  
