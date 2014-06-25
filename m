Received: from mailapp01.imgtec.com ([195.59.15.196]:51556 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6859928AbaFYI76h3F7x (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 10:59:58 +0200
Message-ID: <53AA8F87.6000701@imgtec.com>
Date: Wed, 25 Jun 2014 09:59:51 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/9] MIPS: KVM: Use KVM internal logger
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com> <1403631071-6012-3-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-3-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20140625085951.WysE7lvYk-rFicq3Mk1Fp11MX5Bnc97aXuHmwLpIWW4@z>

Hi Deng-Cheng,

On 24/06/14 18:31, Deng-Cheng Zhu wrote:
> @@ -2213,8 +2209,8 @@ enum emulation_result kvm_mips_check_privilege(unsigned long cause,
>  			 * address error exception to the guest
>  			 */
>  			if (badvaddr >= (unsigned long) KVM_GUEST_KSEG0) {
> -				printk("%s: LD MISS @ %#lx\n", __func__,
> -				       badvaddr);
> +				kvm_err("%s: LD MISS @ %#lx\n", __func__,
> +					badvaddr);

This should probably be kvm_debug since it isn't fatal to the whole VM
(the exception gets passed on to the guest kernel to handle), otherwise
guest userland could maliciously spam the host log by repeatedly trying
to access beyond the T&E useg.

Same goes for the other printks in this function

It probably was only useful to sanity check that userland wasn't trying
to access memory that would be accessible on a normal MIPS core but
isn't with the T&E segment layout.

Otherwise this patch looks okay to me.

Cheers
James
