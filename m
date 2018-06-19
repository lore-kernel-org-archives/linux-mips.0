Received: from 9pmail.ess.barracuda.com ([64.235.154.211]:34909 "EHLO
        9pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993097AbeFSX2rhD08G (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Jun 2018 01:28:47 +0200
Date: Tue, 19 Jun 2018 16:28:28 -0700
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Octeon: assign bool true/false not 1/0
Message-ID: <20180619232828.icebwaaeb5zudnr2@pburton-laptop>
References: <1529133992-15360-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1529133992-15360-1-git-send-email-hofrat@osadl.org>
Return-Path: <Paul.Burton@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, David Daney <david.daney@cavium.com>, "Steven J. Hill" <Steven.Hill@cavium.com>, Joe Perches <joe@perches.com>, Colin Ian King <colin.king@canonical.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20180619232828.arOARnEAWjhspvwmMfnE_S0tpkQvmGcezp8sqC-EU8s@z>

Hi Nicholas,

On Sat, Jun 16, 2018 at 09:26:32AM +0200, Nicholas Mc Guire wrote:
> Booleans should be assigned true/false not 1/0 as comparison is not needed
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> Problem located by scripts/coccinelle/misc/boolinit.cocci
>   ./arch/mips/cavium-octeon/octeon-irq.c:817:3-13:
>   WARNING: Assignment of bool to 0/1
> 
> Patch was compile tested with: cavium_octeon_defconfig
> (with a number of sparse warnings - not related to the proposed change)
> 
> Patch is against 4.17.0 (localversion-next is next-20180614)
> 
>  arch/mips/cavium-octeon/octeon-irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to mips-next for 4.19.

Paul
