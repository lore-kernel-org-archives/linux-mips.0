Received: from mailapp01.imgtec.com ([195.59.15.196]:28048 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007240AbbLAKrLrdZKY (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 1 Dec 2015 11:47:11 +0100
Subject: Re: [PATCH v2 09/19] genirq: Add a new function to get IPI reverse
 mapping
References: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
 <1448453217-3874-10-git-send-email-qais.yousef@imgtec.com>
 <5658429D.3000105@imgtec.com> <alpine.DEB.2.11.1511301139500.3572@nanos>
 <565C2ABD.5030409@imgtec.com> <alpine.DEB.2.11.1511301220380.3572@nanos>
 <565C3A14.10401@imgtec.com>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <565D7AA9.2080708@imgtec.com>
Date: Tue, 1 Dec 2015 10:47:05 +0000
MIME-Version: 1.0
In-Reply-To: <565C3A14.10401@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20151201104705.Clq96d6XDCglqJiR1jyxe-8CAGQG76d4zS4EZ73UaoM@z>

On 11/30/2015 11:59 AM, Qais Yousef wrote:
> On 11/30/2015 11:22 AM, Thomas Gleixner wrote:
>> Well, the question is why can't those functions not all use the raw
>> hardware irq. We have it in irq_data exactly to avoid calculations in
>> the hot path functions.
>>
>
>
> I'll see what I can do as part of this series. I think I can fix the 
> new IPI and device domains, but can't promise about the root gic 
> domain. It might be too big of a change for this series.


Unfortunately this is more work than I can afford putting into it right 
now. Can we have this fix coming in later? It shouldn't affect anything 
in this series.

The major issue here is that I need to split the root domain into shared 
and local so that each will have its linear hwirq space therefore get 
rid of the conversion macros.

BUT, the DT binding will break if I do this. I can't think of a simple 
way to keep the existing binding and do the split. Not without hackery 
and more magic at least which I don't think would be a better alternative.

Thanks,
Qais
