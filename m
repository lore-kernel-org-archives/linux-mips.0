Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:47038 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6871609Ab3LYGzZOK2Zp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Dec 2013 07:55:25 +0100
Date: Wed, 25 Dec 2013 12:37:27 +0530
From: Jayachandran C. <jchandra@broadcom.com>
Subject: Re: [PATCH 12/18] MIPS: Netlogic: XLP9XX UART offset
Message-ID: <20131225070726.GB22667@jayachandranc.netlogicmicro.com>
References: <1387624950-31297-1-git-send-email-jchandra@broadcom.com>
 <1387624950-31297-13-git-send-email-jchandra@broadcom.com>
 <52B5D14A.3030504@phrozen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52B5D14A.3030504@phrozen.org>
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
To: John Crispin <john@phrozen.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20131225070727.rCJ7yoqeZInXdCN0V_5akn97SIwuivI91QegjqniJQk@z>

On Sat, Dec 21, 2013 at 06:35:06PM +0100, John Crispin wrote:
> On 21/12/13 12:22, Jayachandran C wrote:
> >Update IO offset of the early console UART.
> >
> >Signed-off-by: Jayachandran C<jchandra@broadcom.com>
> >---
> >  arch/mips/include/asm/netlogic/xlp-hal/uart.h |    3 ++-
> >  arch/mips/netlogic/common/earlycons.c         |    2 ++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> >diff --git a/arch/mips/include/asm/netlogic/xlp-hal/uart.h b/arch/mips/include/asm/netlogic/xlp-hal/uart.h
> >index 86d16e1..a6c5442 100644
> >--- a/arch/mips/include/asm/netlogic/xlp-hal/uart.h
> >+++ b/arch/mips/include/asm/netlogic/xlp-hal/uart.h
> >@@ -94,7 +94,8 @@
> >  #define nlm_read_uart_reg(b, r)		nlm_read_reg(b, r)
> >  #define nlm_write_uart_reg(b, r, v)	nlm_write_reg(b, r, v)
> >  #define nlm_get_uart_pcibase(node, inst)	\
> >-		nlm_pcicfg_base(XLP_IO_UART_OFFSET(node, inst))
> >+	nlm_pcicfg_base(cpu_is_xlp9xx() ?  XLP9XX_IO_UART_OFFSET(node) : \
> >+						XLP_IO_UART_OFFSET(node, inst))
> 
> nitpick: i think this looks really ugly. maybe move the ()?():()
> logic to a define ?

Since it is already inside a macro, I would say that the improvement is minor.
This is the also the same pattern we have used in all include/asm/xlp-hal/ files,
I cannot change it in just one place.

JC.
