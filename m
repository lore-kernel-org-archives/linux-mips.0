Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:22267 "EHLO
        mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010870AbbAIJnohQ8I2 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 Jan 2015 10:43:44 +0100
Date: Fri, 9 Jan 2015 15:21:20 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH 13/17] MIPS: Netlogic: Handle XLP hardware errata
Message-ID: <20150109095119.GB18823@jayachandranc.netlogicmicro.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
 <1420630118-17198-14-git-send-email-jchandra@broadcom.com>
 <54AD6B19.3020007@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <54AD6B19.3020007@cogentembedded.com>
Return-Path: <jchandra@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20150109095120.Pxi6hkKR9UsvrumHULU0WiMaNzUmDs8ZTHjFu_GqdMc@z>

On Wed, Jan 07, 2015 at 08:21:29PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 01/07/2015 02:28 PM, Jayachandran C wrote:
> 
> >Core configuration register IFU_BRUB_RESERVE has to be setup to handle
> >a silicon errata which can result in a CPU hang.
> 
> >Signed-off-by: Jayachandran C <jchandra@broadcom.com>
> 
> [...]
> 
> >diff --git a/arch/mips/netlogic/common/reset.S b/arch/mips/netlogic/common/reset.S
> >index 701c4bc..ff2673a 100644
> >--- a/arch/mips/netlogic/common/reset.S
> >+++ b/arch/mips/netlogic/common/reset.S
> >@@ -235,6 +235,24 @@ EXPORT(nlm_boot_siblings)
> >  	mfc0	v0, CP0_EBASE, 1
> >  	andi	v0, 0x3ff		/* v0 <- node/core */
> >
> >+	/* Errata: to avoid potential live lock, only apply to 4
> >+	 * thread per core mode */
> 
>    The preferred multi-line comment style is:
> 
> /*
>  * bla
>  * bla
>  */

Will fix this and post a new patch.

> >+	andi	v1, v0, 0x3             /* v1 <- thread id */
> >+	bnez	v1, 2f
> >+	nop
> 
>    If this 'nop' is in a delay slot, there's a tradition to add
> extra space before the instruction.
> 
> >+
> >+	/* thread 0 of each core. */
> >+	li	t0, CKSEG1ADDR(RESET_DATA_PHYS)
> 
>    Hm, does this get auto-expanded into several instructions?
> 
> >+	lw	t1, BOOT_THREAD_MODE(t0)        /* t1 <- thread mode */
> >+	subu	t1, 0x3				/* 4-thread per core mode? */
> >+	bnez	t1, 2f
> >+	nop
> 
>    Same here...

I did not know about this convention, so none of the Netlogic platform
files have the space before delay slot instruction. I will have to fixup
all of them in one commit if needed.

Thanks,
JC.
