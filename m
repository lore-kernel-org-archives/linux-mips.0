Received: from mailapp01.imgtec.com ([195.59.15.196]:42612 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009454AbbJMOqJQbko6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 13 Oct 2015 16:46:09 +0200
Subject: Re: [RFC v2 PATCH 10/14] MIPS: make smp CMP, CPS and MT use the new
 generic IPI functions
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
 <1444731382-19313-11-git-send-email-qais.yousef@imgtec.com>
 <alpine.DEB.2.11.1510131548530.25029@nanos>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <561D192A.5080407@imgtec.com>
Date: Tue, 13 Oct 2015 15:46:02 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.11.1510131548530.25029@nanos>
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
Message-ID: <20151013144602.HBnM142qHYg8fGve8fbWo_Xu7ru-hFVMOMYMJPLsSPg@z>

On 10/13/2015 02:49 PM, Thomas Gleixner wrote:
> On Tue, 13 Oct 2015, Qais Yousef wrote:
>
>> Only the SMP variants that use GIC were converted as it's the only irqchip that
>> will have the support for generic IPI for now which will be introduced in
>> the following patches.
> You break bisectability. Introduce the new gic magic first and then
> switch it over.
>
>

Yes I was trying to make the review easier by grouping things together. 
I might need to squash some of these last patches together to avoid 
breaking bisectability.

Thanks,
Qais
