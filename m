Received: from co9ehsobe004.messaging.microsoft.com ([207.46.163.27]:19585
        "EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6824104Ab3EUQV1HQGIN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 May 2013 18:21:27 +0200
Message-ID: <519B9EF2.8020107@caviumnetworks.com>
Date: Tue, 21 May 2013 09:21:06 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3 5/5] mips/kvm: Fix ABI by moving manipulation of CP0
 registers to KVM_{G,S}ET_MSRS
References: <1369083686-27524-1-git-send-email-ddaney.cavm@gmail.com> <1369083686-27524-6-git-send-email-ddaney.cavm@gmail.com> <20130521153752.GD14287@redhat.com>
In-Reply-To: <20130521153752.GD14287@redhat.com>
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
To: Gleb Natapov <gleb@redhat.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, kvm@vger.kernel.org, Sanjay Lal <sanjayl@kymasys.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130521162106.MOPwzbmLW3UEwTlWDy-rHefG7ZHwK8aOfIDg10RrQlo@z>

On 05/21/2013 08:37 AM, Gleb Natapov wrote:
> On Mon, May 20, 2013 at 02:01:26PM -0700, David Daney wrote:
>> From: David Daney <david.daney@cavium.com>
>>
>> Because not all 256 CP0 registers are ever implemented, we need a
>> different method of manipulating them.  Use the
>> KVM_GET_MSRS/KVM_SET_MSRS mechanism as x86 does for its MSRs.
>>
> Have you looked at KVM_(GET|SET)_ONE_REG interface (not used by x86, but is
> used bu arm/ppc/s390). It looks like it is more suitable for your case.
> Actually you can use it instead of KVM_(GET|SET)_REGS for all registers.

Yes, I suppose it could be used.  One problem it has is that there is no 
way to query the set of supported registers.  Also you have to make 
multiple calls to set multiple registers, which involves vcpu_{load,put} 
for each register.

We will definitely implement it for all the FP and General Purpose 
registers.

>
>> Code related to implementing KVM_GET_MSRS/KVM_SET_MSRS is consolidated
