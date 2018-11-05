Received: from mail-eopbgr730138.outbound.protection.outlook.com ([40.107.73.138]:44123
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992783AbeKESbMhY8qO convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 5 Nov 2018 19:31:12 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH] MIPS: Enable IOREMAP_PROT config option for MIPS cpus
Date: Mon, 5 Nov 2018 18:31:09 +0000
Message-ID: <20181105183108.3kzk2oxl4fpypgmw@pburton-laptop>
References: <20181030012741.31391-1-hassan.naveed@mips.com>
In-Reply-To: <20181030012741.31391-1-hassan.naveed@mips.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F13175BF5AD81E4E8D7A38BE7B05DF90@namprd22.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Hassan Naveed <hnaveed@wavecomp.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181105183109.RuXI2UG_p7HYxJwrtkAh4Egzt8QN4prppBkjSoch7gk@z>

Hi Hassan,

On Mon, Oct 29, 2018 at 06:27:41PM -0700, Hassan Naveed wrote:
> From: Hassan Naveed <hnaveed@wavecomp.com>
> 
> Allows the users of ptrace to access memory mapped by the ptraced process
> using the same cache coherency attributes as the original process.
> For example while using gdb with ioremap_prot() incorporated, both gdb and
> the process being traced will have same cache coherency attributes.
> 
> Signed-off-by: Hassan Naveed <hnaveed@wavecomp.com>
> ---
>  .../features/vm/ioremap_prot/arch-support.txt        |  2 +-
>  arch/mips/Kconfig                                    |  1 +
>  arch/mips/include/asm/io.h                           | 12 ++++++++++++
>  arch/mips/include/asm/page.h                         |  1 +
>  4 files changed, 15 insertions(+), 1 deletion(-)

Thanks - applied to mips-next for v4.21.

Paul
