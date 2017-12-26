Received: from bombadil.infradead.org ([65.50.211.133]:41325 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990408AbdLZQ3YZP0Zi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 26 Dec 2017 17:29:24 +0100
Subject: Re: [PATCH] MIPS: Use proper @return keyword
References: <20171226105532.23452-1-malat@debian.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9bd8b13f-e9c0-44ec-f53d-f9171973d9a8@infradead.org>
Date: Tue, 26 Dec 2017 08:29:16 -0800
MIME-Version: 1.0
In-Reply-To: <20171226105532.23452-1-malat@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Return-Path: <rdunlap@infradead.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Mathieu Malaterre <malat@debian.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, "Maciej W. Rozycki" <macro@mips.com>, Paul Burton <paul.burton@mips.com>, Ingo Molnar <mingo@kernel.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On 12/26/2017 02:55 AM, Mathieu Malaterre wrote:
> Fix non-fatal warning:
> 
> arch/mips/kernel/branch.c:418: warning: Excess function parameter 'returns' description in '__compute_return_epc_for_insn'
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  arch/mips/kernel/branch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
> index b79ed9af9886..e0d3a432e1e3 100644
> --- a/arch/mips/kernel/branch.c
> +++ b/arch/mips/kernel/branch.c
> @@ -399,7 +399,7 @@ int __MIPS16e_compute_return_epc(struct pt_regs *regs)
>   *
>   * @regs:	Pointer to pt_regs
>   * @insn:	branch instruction to decode
> - * @returns:	-EFAULT on error and forces SIGILL, and on success
> + * @return:	-EFAULT on error and forces SIGILL, and on success

No @, just
	return: <text>

>   *		returns 0 or BRANCH_LIKELY_TAKEN as appropriate after
>   *		evaluating the branch.
>   *
> 


-- 
~Randy
