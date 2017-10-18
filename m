Received: from 20pmail.ess.barracuda.com ([64.235.154.232]:38541 "EHLO
        20pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992378AbdJRRg2aEQwI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 Oct 2017 19:36:28 +0200
Date: Wed, 18 Oct 2017 18:34:49 +0100
From: "Maciej W. Rozycki" <macro@mips.com>
Subject: Re: [PATCH] MIPS: Fix exception entry when CONFIG_EVA enabled
In-Reply-To: <1507712360-20657-1-git-send-email-matt.redfearn@mips.com>
Message-ID: <alpine.DEB.2.00.1710181817140.3886@tp.orcam.me.uk>
References: <1507712360-20657-1-git-send-email-matt.redfearn@mips.com>
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
To: Matt Redfearn <matt.redfearn@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, Matthew Fortune <matthew.fortune@mips.com>, linux-mips@linux-mips.org, Corey Minyard <cminyard@mvista.com>, linux-kernel@vger.kernel.org, "Jason A. Donenfeld" <jason@zx2c4.com>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20171018173449.fMht30BSgXdHMNk83v4sjmm7XVBO5RXZbOjlMVDuI_o@z>

On Wed, 11 Oct 2017, Matt Redfearn wrote:

> diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
> index 5d3563c55e0c..2161357cc68f 100644
> --- a/arch/mips/include/asm/stackframe.h
> +++ b/arch/mips/include/asm/stackframe.h
> @@ -199,6 +199,10 @@
>  		sll	k0, 3		/* extract cu0 bit */
>  		.set	noreorder
>  		bltz	k0, 8f
> +		 move	k0, sp
> +		.if \docfi
> +		.cfi_register sp, k0
> +		.endif

 Using $k1 for the Status.CU0 check would let us get rid of the 
`noreorder' block, making this code less fragile at no run-time cost, 
i.e.:

		mfc0	k1, CP0_STATUS
		sll	k1, 3
		move	k0, sp
		bltz	k1, 8f

(unfortunately I can't see a way to usefully fill the coprocessor move 
delay slot automatically scheduled by GAS here between MFC0 and SLL for 
processors that require it).

  Maciej
