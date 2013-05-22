Received: from mail-db8lp0184.outbound.messaging.microsoft.com ([213.199.154.184]:38208
        "EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6825735Ab3EVRzpPc7Sn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 May 2013 19:55:45 +0200
Message-ID: <519D0688.40007@caviumnetworks.com>
Date: Wed, 22 May 2013 10:55:20 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/6] mips/kvm: Fix ABI by moving manipulation of CP0
 registers to KVM_{G,S}ET_ONE_REG
References: <1369169695-10444-1-git-send-email-ddaney.cavm@gmail.com> <1369169695-10444-6-git-send-email-ddaney.cavm@gmail.com> <16CE6694-CEAE-48F1-9F8E-723A657CE470@kymasys.com>
In-Reply-To: <16CE6694-CEAE-48F1-9F8E-723A657CE470@kymasys.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
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
To: Sanjay Lal <sanjayl@kymasys.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, kvm@vger.kernel.org, Gleb Natapov <gleb@redhat.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130522175520.NdtTofm7J2-1GiKzSVvSZaxJG_OJX5RRExJwbumDdxc@z>

On 05/22/2013 10:44 AM, Sanjay Lal wrote:
>
> On May 21, 2013, at 1:54 PM, David Daney wrote:
>
>> From: David Daney <david.daney@cavium.com>
>>
>> Because not all 256 CP0 registers are ever implemented, we need a
>> different method of manipulating them.  Use the
>> KVM_SET_ONE_REG/KVM_GET_ONE_REG mechanism.
>>
>> Code related to implementing KVM_SET_ONE_REG/KVM_GET_ONE_REG is
>> consolidated in to kvm_trap_emul.c, now unused code and definitions
>> are removed.
>>
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> ---
>> arch/mips/include/asm/kvm.h      |  91 +++++++++--
>> arch/mips/include/asm/kvm_host.h |   4 -
>> arch/mips/kvm/kvm_mips.c         |  90 +----------
>> arch/mips/kvm/kvm_trap_emul.c    | 338 ++++++++++++++++++++++++++++++++++-----
>> 4 files changed, 383 insertions(+), 140 deletions(-)
[...]
>>
>
> Most of the functions that have been relocated to kvm_trap_emul.c should stay in kvm_mips.c. They are/will shared between the trap and emulate and VZ modes.  They include kvm_mips_reset_vcpu(), kvm_vcpu_ioctl_interrupt(), kvm_arch_vcpu_ioctl().
>
> kvm_mips_get_reg() and kvm_mips_set_reg() should be in kvm_mips.c as they will be shared by the trap and emulate and VZ code.
>

OK, I will revise the patch set to rearrange things in a manner that 
leaves these in kvm_mips.c.  However, this is of secondary importance to 
the question of the suitability of the ABI.


> If you plan on defining specific versions of these functions for Cavium's implementation of KVM, please make them callbacks.
>

There will soon be follow on patches that do exactly that.
