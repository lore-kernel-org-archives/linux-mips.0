Received: from mailapp01.imgtec.com ([195.59.15.196]:3283 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6843037AbaFYJ2MntZY- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 11:28:12 +0200
Message-ID: <53AA9625.8020802@imgtec.com>
Date: Wed, 25 Jun 2014 10:28:05 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/9] MIPS: KVM: Fix memory leak on VCPU
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com> <1403631071-6012-8-git-send-email-dengcheng.zhu@imgtec.com>
In-Reply-To: <1403631071-6012-8-git-send-email-dengcheng.zhu@imgtec.com>
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
Message-ID: <20140625092805.3L__SjT3-G20JB4TTtUBgfXuP6AgxE1xZqp3uD3ARhM@z>

On 24/06/14 18:31, Deng-Cheng Zhu wrote:
> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
> 
> kvm_arch_vcpu_free() is called in 2 code paths:
> 
> 1) kvm_vm_ioctl()
>        kvm_vm_ioctl_create_vcpu()
>            kvm_arch_vcpu_destroy()
>                kvm_arch_vcpu_free()
> 2) kvm_put_kvm()
>        kvm_destroy_vm()
>            kvm_arch_destroy_vm()
>                kvm_mips_free_vcpus()
>                    kvm_arch_vcpu_free()
> 
> Neither of the paths handles VCPU free. We need to do it in
> kvm_arch_vcpu_free() corresponding to the memory allocation in
> kvm_arch_vcpu_create().
> 
> Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Maybe worth adding "Cc: stable@vger.kernel.org" and moving this to the
beginning of the patchset to avoid conflicts.

Cheers
James
