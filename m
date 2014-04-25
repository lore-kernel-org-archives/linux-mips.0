Received: from mail-bn1blp0184.outbound.protection.outlook.com ([207.46.163.184]:50222
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6816615AbaDYQhB1W0cX (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 25 Apr 2014 18:37:01 +0200
Message-ID: <535A8F22.4090402@caviumnetworks.com>
Date: Fri, 25 Apr 2014 09:36:50 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 04/21] MIPS: KVM: Fix CP0_EBASE KVM register id
References: <1398439204-26171-1-git-send-email-james.hogan@imgtec.com> <1398439204-26171-5-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1398439204-26171-5-git-send-email-james.hogan@imgtec.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>, Sanjay Lal <sanjayl@kymasys.com>
Message-ID: <20140425163650.KFVv1IwEXxgHbOJU0hcqEPrjOlVZlO2DtqIxVo4Lmac@z>

On 04/25/2014 08:19 AM, James Hogan wrote:
> KVM_REG_MIPS_CP0_EBASE is defined as 64bit, but is a 32bit register even
> in MIPS64, so fix the definition.
>
> Note, this definition isn't actually used yet, so it didn't cause any
> problems.
>
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gleb Natapov <gleb@kernel.org>
> Cc: kvm@vger.kernel.org
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: linux-mips@linux-mips.org
> Cc: David Daney <david.daney@cavium.com>
> Cc: Sanjay Lal <sanjayl@kymasys.com>
> ---
>   arch/mips/kvm/kvm_mips.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/kvm/kvm_mips.c b/arch/mips/kvm/kvm_mips.c
> index 14511138f187..46cea0bad518 100644
> --- a/arch/mips/kvm/kvm_mips.c
> +++ b/arch/mips/kvm/kvm_mips.c
> @@ -512,7 +512,7 @@ kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>   #define KVM_REG_MIPS_CP0_COMPARE	MIPS_CP0_32(11, 0)
>   #define KVM_REG_MIPS_CP0_STATUS		MIPS_CP0_32(12, 0)
>   #define KVM_REG_MIPS_CP0_CAUSE		MIPS_CP0_32(13, 0)
> -#define KVM_REG_MIPS_CP0_EBASE		MIPS_CP0_64(15, 1)
> +#define KVM_REG_MIPS_CP0_EBASE		MIPS_CP0_32(15, 1)


According to:

  MIPS® Architecture Reference Manual
   Volume III: The MIPS64® and
microMIPS64TM Privileged Resource
Architecture

Document Number: MD00089
Revision 5.02
April 30, 2013

In section 9.39 EBase Register (CP0 Register 15, Select 1), we see that 
EBase can be either 32-bits or 64-bits wide.

I would recommend leaving this as a 64-bit wide register, so that CPU 
implementations with the wider EBase can be supported.

Alternately, probe for the width and use the appropriate 32-bit or 
64-bit to more closely reflect reality.


>   #define KVM_REG_MIPS_CP0_CONFIG		MIPS_CP0_32(16, 0)
>   #define KVM_REG_MIPS_CP0_CONFIG1	MIPS_CP0_32(16, 1)
>   #define KVM_REG_MIPS_CP0_CONFIG2	MIPS_CP0_32(16, 2)
>
