Received: from mail-bn1lp0150.outbound.protection.outlook.com ([207.46.163.150]:22741
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6824790Ab3HEQwhdSz7B (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 5 Aug 2013 18:52:37 +0200
Message-ID: <51FFD848.6050104@caviumnetworks.com>
Date: Mon, 5 Aug 2013 09:52:24 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] mips/kvm: Improve code formatting in arch/mips/kvm/kvm_locore.S
References: <1375388555-4045-1-git-send-email-ddaney.cavm@gmail.com> <1375388555-4045-2-git-send-email-ddaney.cavm@gmail.com> <51FFA5CD.3010406@imgtec.com> <20130805132157.GB3470@linux-mips.org> <20130805134326.GA15901@redhat.com>
In-Reply-To: <20130805134326.GA15901@redhat.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, kvm@vger.kernel.org, Sanjay Lal <sanjayl@kymasys.com>, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
Message-ID: <20130805165224.pfrglxNpHOfx3c3YTYYquU_dFOUoZWc6i03XeF-PgWY@z>

On 08/05/2013 06:43 AM, Gleb Natapov wrote:
> On Mon, Aug 05, 2013 at 03:21:57PM +0200, Ralf Baechle wrote:
>> On Mon, Aug 05, 2013 at 02:17:01PM +0100, James Hogan wrote:
>>
>>>
>>> On 01/08/13 21:22, David Daney wrote:
>>>> From: David Daney <david.daney@cavium.com>
>>>>
>>>> No code changes, just reflowing some comments and consistently using
>>>> tabs and spaces.  Object code is verified to be unchanged.
>>>>
>>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>>> Acked-by: Ralf Baechle <ralf@linux-mips.org>
>>>
>>>
>>>> +   	 /* Put the saved pointer to vcpu (s1) back into the DDATA_LO Register */
>>>
>>> git am detects a whitespace error here ("space before tab in indent").
>>> It's got spaces before and after the tab actually.
>>>
>>>>       /* load the guest context from VCPU and return */
>>>
>>> this comment could have it's indentation fixed too
>>>
>>> Otherwise, for all 3 patches:
>>>
>>> Reviewed-by: James Hogan <james.hogan@imgtec.com>
>>
>> I'm happy with the patch series as well and will fix this issue when
>> applying the patch.
>>
> kvm fixes usually go through kvm.git tree for all arches. Any special
> reasons you want to get those through mips tree?
>

I don't really care which tree takes this particular patch set.

However, in the near future, I will be sending revised versions of 
patches needed by MIPS/KVM that are in files outside of the 
arch/mips/kvm directory and it is possible that those may suffer patch 
ordering problems if merged through a 'foreign tree'.

In any event, there is the problem with the whitespace error in the 
comment.  I blame checkpatch.pl for not flagging it, but that is not 
really a good excuse.  If it goes by the KVM tree, do you want me to 
send a corrected patch?  Or can you fix it when you merge it.

David Daney
