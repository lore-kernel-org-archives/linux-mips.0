Received: from mailapp01.imgtec.com ([195.59.15.196]:36968 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007167AbbK3KxzukKsE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 30 Nov 2015 11:53:55 +0100
Subject: Re: [PATCH v2 09/19] genirq: Add a new function to get IPI reverse
 mapping
References: <1448453217-3874-1-git-send-email-qais.yousef@imgtec.com>
 <1448453217-3874-10-git-send-email-qais.yousef@imgtec.com>
 <5658429D.3000105@imgtec.com> <alpine.DEB.2.11.1511301139500.3572@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <565C2ABD.5030409@imgtec.com>
Date: Mon, 30 Nov 2015 10:53:49 +0000
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1511301139500.3572@nanos>
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
Message-ID: <20151130105349.eEp9sa1rrriPOTnW250zqS4U6S4l9USke4L-fUQdJII@z>

On 11/30/2015 10:40 AM, Thomas Gleixner wrote:
> On Fri, 27 Nov 2015, Qais Yousef wrote:
>> While trying to get my remoteproc driver work with this I uncovered a problem
>> with this approach.
>>
>> mips-gic doesn't store the actual hwirq in the irq_data. It uses
>> GIC_SHARED_TO_HWIRQ() and GIC_HWIRQ_TO_SHARED() to add and remove an offset.
> Why can't MIPS store the real hwirq number in irq_data?


I'm wary of ending up in inconsistency hell where some functions need to 
deal with raw hwirq and others with translated ones.

I will give this a go first and see if it gets really ugly.

Thanks,
Qais
