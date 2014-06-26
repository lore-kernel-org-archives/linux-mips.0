Received: from mailapp01.imgtec.com ([195.59.15.196]:37529 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6856089AbaF0C6fOkF9M (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Jun 2014 04:58:35 +0200
Message-ID: <53ACB28F.8010405@imgtec.com>
Date: Thu, 26 Jun 2014 16:53:51 -0700
From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 5/7] MIPS: KVM: Rename files to remove the prefix "kvm_"
 and "kvm_mips_"
References: <1403809900-17454-1-git-send-email-dengcheng.zhu@imgtec.com> <1403809900-17454-6-git-send-email-dengcheng.zhu@imgtec.com> <53AC7466.6070401@gmail.com> <53AC7AAD.7010007@imgtec.com> <53AC96D7.8040208@gmail.com> <53ACA261.7040007@imgtec.com>
In-Reply-To: <53ACA261.7040007@imgtec.com>
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
Message-ID: <20140626235351.g9JteNjrYidQFBFdrtYMNg5qfqWKDSIgBYyu14rR88A@z>

On 06/26/2014 02:55 PM, David Daney wrote:
> On 06/26/2014 12:55 PM, Deng-Cheng Zhu wrote:
>> On 06/26/2014 12:28 PM, David Daney wrote:
>>> On 06/26/2014 12:11 PM, Deng-Cheng Zhu wrote:
>>>> From: Deng-Cheng Zhu <dengcheng.zhu@imgtec.com>
>>>>
>>>> Since all the files are in arch/mips/kvm/, there's no need of the
>>>> prefixes
>>>> "kvm_" and "kvm_mips_".
>>>>
>>>
>>> I don't like this change.
>>>
>>> It will leads me to confuse arch/mips/kvm/interrupt.h with
>>> include/linux/interrupt.h
>>
>> We have <linux/interrupt.h> and "interrupt.h".
>>
>>>
>>> x86 calls these things irq.c and irq.h, perhaps that would be a little
>>> better.
>>
>> There's also include/linux/irq.h
>>
>
> Yes, I know.

I simply wanted to let you know that if arch/mips/kvm/interrupt.h and 
include/linux/interrupt.h are consufing, then arch/x86/kvm/irq.h and 
include/linux/irq.h the same -- not even a little better.

>
>>>
>>> There is precedence in x86 for some of the names though.
>>>
>>> But really why churn up the code in the first place?  the kvm_mips
>>> prefix does tell us exactly what we are dealing with.
>>
>> That's why people created the arch/mips/kvm directory, isn't it?
>
> No.  Segregating things into directories keeps code related to one 
> functional area together.
>
> File names are different.  They should carry as much meaning as possible.

Remember that directory path is also part of file info.

>
> For examples of this look at some of these directories:
>
> drivers/net/ethernet/intel/ixgb
> drivers/i2c/busses

One can find way more examples not having prefixes. Look at kernel/events/. 
In the beginning, Perf-events has things under kernel. Then people did 
things like:

kernel/perf_event.c -> kernel/events/core.c

If it's kernel/events/perf_events_core.c, I think it looks ugly.

Other examples are kernel/sched/, mm/, and many more. When talking about 
filemap.c, one may think it may be under fs/. But there's mm/filemap.c (not 
mm/mm_filemap.c which seems, again, ugly). What I want to say is that: 
Talking about a file should include its path info.

In addition, I'm saying "ugly" is not only from the perspective of feeling, 
but also from practicability. When reading source code using some tools, 
the file list window is usually (at least for me) relatively small. If the 
prefix is there, it's easy to see something like:

arch/mips/kvm/kvm_mips_e...
arch/mips/kvm/kvm_mips_s...


Deng-Cheng
