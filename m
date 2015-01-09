Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:59338 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006516AbbAIJkmSdSAf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 9 Jan 2015 10:40:42 +0100
Date: Fri, 9 Jan 2015 15:18:19 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH 04/17] MIPS: Netlogic: Disable writing IRT for disabled
 blocks
Message-ID: <20150109094818.GA18823@jayachandranc.netlogicmicro.com>
References: <1420630118-17198-1-git-send-email-jchandra@broadcom.com>
 <1420630118-17198-5-git-send-email-jchandra@broadcom.com>
 <54AD67EF.2080406@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <54AD67EF.2080406@cogentembedded.com>
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
Message-ID: <20150109094819.iPQM9EiBoPE3CABB6ayDukobHoaxLyPqV3NjOuw4NPk@z>

On Wed, Jan 07, 2015 at 08:07:59PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 01/07/2015 02:28 PM, Jayachandran C wrote:
> 
> >If the device header of a block is not present, return invalid IRT
> >value so that we do not program an incorrect offset.
> 
> >Signed-off-by: Jayachandran C <jchandra@broadcom.com>
> >---
> >  arch/mips/netlogic/xlp/nlm_hal.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> >diff --git a/arch/mips/netlogic/xlp/nlm_hal.c b/arch/mips/netlogic/xlp/nlm_hal.c
> >index 7e0d224..de41fb5 100644
> >--- a/arch/mips/netlogic/xlp/nlm_hal.c
> >+++ b/arch/mips/netlogic/xlp/nlm_hal.c
> >@@ -170,16 +170,23 @@ static int xlp_irq_to_irt(int irq)
> >  	}
> >
> >  	if (devoff != 0) {
> >+		uint32_t val;
> >+
> >  		pcibase = nlm_pcicfg_base(devoff);
> >-		irt = nlm_read_reg(pcibase, XLP_PCI_IRTINFO_REG) & 0xffff;
> >-		/* HW weirdness, I2C IRT entry has to be fixed up */
> >-		switch (irq) {
> >-		case PIC_I2C_1_IRQ:
> >-			irt = irt + 1; break;
> >-		case PIC_I2C_2_IRQ:
> >-			irt = irt + 2; break;
> >-		case PIC_I2C_3_IRQ:
> >-			irt = irt + 3; break;
> >+		val = nlm_read_reg(pcibase, XLP_PCI_IRTINFO_REG);
> >+		if (val == 0xffffffff) {
> >+			irt = -1;
> >+		} else {
> >+			irt = val & 0xffff;
> >+			/* HW weirdness, I2C IRT entry has to be fixed up */
> >+			switch (irq) {
> >+			case PIC_I2C_1_IRQ:
> >+				irt = irt + 1; break;
> >+			case PIC_I2C_2_IRQ:
> >+				irt = irt + 2; break;
> >+			case PIC_I2C_3_IRQ:
> >+				irt = irt + 3; break;
> 
>    Why not 'irt += n' in all 3 cases?
>    And don't place *break* on the same line -- this upsets checkpatch.pl IIRC.

checkpatch did not complain, and also I did not want to mix formatting
change with actual fix. But agree that the code can cleaned up a bit.
I will sent out a patch for this next cycle.

JC.
