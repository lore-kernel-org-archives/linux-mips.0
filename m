Received: from mailapp01.imgtec.com ([195.59.15.196]:21360 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860058AbaF0Xr34Kmoj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 28 Jun 2014 01:47:29 +0200
Message-ID: <53AE0288.6000905@imgtec.com>
Date: Fri, 27 Jun 2014 16:47:20 -0700
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/9] MIPS: KVM: Fix memory leak on VCPU
References: <1403631071-6012-1-git-send-email-dengcheng.zhu@imgtec.com> <1403631071-6012-8-git-send-email-dengcheng.zhu@imgtec.com> <53AA9625.8020802@imgtec.com> <53AABDE9.3050907@redhat.com>
In-Reply-To: <53AABDE9.3050907@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <DengCheng.Zhu@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paolo Bonzini <pbonzini@redhat.com>, James Hogan <james.hogan@imgtec.com>
Cc: gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20140627234720.Zqb7c0O821JsIrxDkjRQDkwmL05L_lLMlnU4kajg4ys@z>

Hi Paolo,


On 06/25/2014 05:17 AM, Paolo Bonzini wrote:
> Il 25/06/2014 11:28, James Hogan ha scritto:
>> On 24/06/14 18:31, Deng-Cheng Zhu wrote:
>>> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
>>>
>>> kvm_arch_vcpu_free() is called in 2 code paths:
>>>
>>> 1) kvm_vm_ioctl()
>>>        kvm_vm_ioctl_create_vcpu()
>>>            kvm_arch_vcpu_destroy()
>>>                kvm_arch_vcpu_free()
>>> 2) kvm_put_kvm()
>>>        kvm_destroy_vm()
>>>            kvm_arch_destroy_vm()
>>>                kvm_mips_free_vcpus()
>>>                    kvm_arch_vcpu_free()
>>>
>>> Neither of the paths handles VCPU free. We need to do it in
>>> kvm_arch_vcpu_free() corresponding to the memory allocation in
>>> kvm_arch_vcpu_create().
>>>
>>> Signed-off-by: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
>>
>> Reviewed-by: James Hogan <james.hogan@imgtec.com>
>>
>> Maybe worth adding "Cc: stable@vger.kernel.org" and moving this to the
>> beginning of the patchset to avoid conflicts.
>>
>> Cheers
>> James
>>
>
> I've queued this for 3.16.  It applies cleanly apart for the filename change.

Maybe you forgot to put this on the branch "queue"? I don't see it. Thanks.


Deng-Cheng
