Received: from mailapp01.imgtec.com ([195.59.15.196]:57228 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6843037AbaFYJKD4u44r (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 11:10:03 +0200
Message-ID: <53AA91E4.3090605@imgtec.com>
Date: Wed, 25 Jun 2014 10:09:56 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/9] MIPS: KVM: Remove unneeded volatile
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com> <1403631071-6012-5-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-5-git-send-email-dengcheng.zhu@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>, pbonzini@redhat.com
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20140625090956.n7AQsokeXdeOzl_j-v2DWOdE1XJwEx8KXPMjJ_x7qK0@z>

On 24/06/14 18:31, Deng-Cheng Zhu wrote:
> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
> 
> The keyword volatile for idx in the TLB functions is unnecessary.
> 
> Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James

> ---
>  arch/mips/kvm/kvm_tlb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kvm/kvm_tlb.c b/arch/mips/kvm/kvm_tlb.c
> index 29a5bdb..bbcd822 100644
> --- a/arch/mips/kvm/kvm_tlb.c
> +++ b/arch/mips/kvm/kvm_tlb.c
> @@ -201,7 +201,7 @@ int kvm_mips_host_tlb_write(struct kvm_vcpu *vcpu, unsigned long entryhi,
>  {
>  	unsigned long flags;
>  	unsigned long old_entryhi;
> -	volatile int idx;
> +	int idx;
>  
>  	local_irq_save(flags);
>  
> @@ -426,7 +426,7 @@ EXPORT_SYMBOL(kvm_mips_guest_tlb_lookup);
>  int kvm_mips_host_tlb_lookup(struct kvm_vcpu *vcpu, unsigned long vaddr)
>  {
>  	unsigned long old_entryhi, flags;
> -	volatile int idx;
> +	int idx;
>  
>  	local_irq_save(flags);
>  
> 
