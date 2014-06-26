Received: from mailapp01.imgtec.com ([195.59.15.196]:62097 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6860035AbaFZTzfSzZ0f (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 26 Jun 2014 21:55:35 +0200
Message-ID: <53AC7AAD.7010007@imgtec.com>
Date: Thu, 26 Jun 2014 12:55:25 -0700
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/7] MIPS: KVM: Rename files to remove the prefix "kvm_"
 and "kvm_mips_"
References: <1403809900-17454-1-git-send-email-dengcheng.zhu@imgtec.com> <1403809900-17454-6-git-send-email-dengcheng.zhu@imgtec.com> <53AC7466.6070401@gmail.com>
In-Reply-To: <53AC7466.6070401@gmail.com>
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
To: David Daney <ddaney.cavm@gmail.com>
Cc: pbonzini@redhat.com, gleb@kernel.org, kvm@vger.kernel.org, sanjayl@kymasys.com, james.hogan@imgtec.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20140626195525.Lbke_jcNtZ6r4C5bzKXpNinfXptBvUrChY4bR4wO8tM@z>

On 06/26/2014 12:28 PM, David Daney wrote:
> On 06/26/2014 12:11 PM, Deng-Cheng Zhu wrote:
>> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
>>
>> Since all the files are in arch/mips/kvm/, there's no need of the prefixes
>> "kvm_" and "kvm_mips_".
>>
>
> I don't like this change.
>
> It will leads me to confuse arch/mips/kvm/interrupt.h with 
> include/linux/interrupt.h

We have <linux/interrupt.h> and "interrupt.h".

>
> x86 calls these things irq.c and irq.h, perhaps that would be a little 
> better.

There's also include/linux/irq.h

>
> There is precedence in x86 for some of the names though.
>
> But really why churn up the code in the first place?  the kvm_mips prefix 
> does tell us exactly what we are dealing with.

That's why people created the arch/mips/kvm directory, isn't it?


Deng-Cheng
