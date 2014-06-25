Received: from mailapp01.imgtec.com ([195.59.15.196]:41921 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6816503AbaFYJYnhcEqk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 11:24:43 +0200
Message-ID: <53AA9554.1050908@imgtec.com>
Date: Wed, 25 Jun 2014 10:24:36 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 6/9] MIPS: KVM: Restore correct value for WIRED at
 TLB uninit
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com> <1403631071-6012-7-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-7-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20140625092436.1UjiC0D_tCdPAHYbZc39Ldf2CIYCLta4tCbKVFdd0W0@z>

On 24/06/14 18:31, Deng-Cheng Zhu wrote:
> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
> 
> At TLB initialization, the commpage TLB entry is reserved on top of the
> existing WIRED entries (the number not necessarily be 0).
> 
> Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
> ---
>  arch/mips/kvm/mips.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 27250ee..3d53d34 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -170,7 +170,7 @@ void kvm_arch_sync_events(struct kvm *kvm)
>  static void kvm_mips_uninit_tlbs(void *arg)
>  {
>  	/* Restore wired count */
> -	write_c0_wired(0);
> +	write_c0_wired(read_c0_wired() - 1);
>  	mtc0_tlbw_hazard();
>  	/* Clear out all the TLBs */
>  	kvm_local_flush_tlb_all();

kvm_local_flush_tlb_all blasts all the entries away regardless of wired,
so I don't think this is an improvement.

I suspect to really be safe/correct in the presence of other dynamic
users of wired it would have to either manage arbitrary
allocation/deallocation of per-cpu tlb entries correctly from a single
place, or abandon the use of wired altogether.

Cheers
James
