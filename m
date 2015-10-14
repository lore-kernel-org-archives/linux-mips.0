Received: from mailapp01.imgtec.com ([195.59.15.196]:20879 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009978AbbJNPtyvjRow (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Oct 2015 17:49:54 +0200
Subject: Re: [RFC v2 PATCH 00/14] Implement generic IPI support mechanism
References: <1444731382-19313-1-git-send-email-qais.yousef@imgtec.com>
 <20151014150431.GF3052@linux-uzut.site>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <561E799B.2030306@imgtec.com>
Date: Wed, 14 Oct 2015 16:49:47 +0100
MIME-Version: 1.0
In-Reply-To: <20151014150431.GF3052@linux-uzut.site>
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
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, jiang.liu@linux.intel.com, ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20151014154947.WUzU6-6CpT_wK-EQmKy4BnVHwgLFSjvtirUylZALHX4@z>

On 10/14/2015 04:04 PM, Davidlohr Bueso wrote:
> On Tue, 13 Oct 2015, Qais Yousef wrote:
>
>> Qais Yousef (14):
>>  irq: add new IRQ_DOMAIN_FLAGS_IPI
>>  irq: add GENERIC_IRQ_IPI Kconfig symbol
>>  irq: add new struct ipi_mask
>>  irq: add a new irq_send_ipi() to irq_chip
>>  irq: add struct ipi_mask to irq_data
>>  irq: add struct ipi_mapping and its helper functions
>>  irq: add a new generic IPI reservation code to irq core
>>  irq: implement irq_send_ipi
>>  MIPS: add support for generic SMP IPI support
>>  MIPS: make smp CMP, CPS and MT use the new generic IPI functions
>>  MIPS: delete smp-gic.c
>>  irqchip: mips-gic: add a IPI hierarchy domain
>>  irqchip: mips-gic: implement the new irq_send_ipi
>>  irqchip: mips-gic: remove IPI init code
>>
>> arch/mips/Kconfig                |   6 --
>> arch/mips/include/asm/smp-ops.h  |   5 +-
>> arch/mips/kernel/Makefile        |   1 -
>> arch/mips/kernel/smp-cmp.c       |   4 +-
>> arch/mips/kernel/smp-cps.c       |   4 +-
>> arch/mips/kernel/smp-gic.c       |  64 -----------
>> arch/mips/kernel/smp-mt.c        |   2 +-
>> arch/mips/kernel/smp.c           | 117 ++++++++++++++++++++
>> drivers/irqchip/Kconfig          |   2 +
>> drivers/irqchip/irq-mips-gic.c   | 225 
>> ++++++++++++++++++++++++---------------
>> include/linux/irq.h              |  43 ++++++++
>> include/linux/irqchip/mips-gic.h |   3 -
>> include/linux/irqdomain.h        |  19 ++++
>> kernel/irq/Kconfig               |   4 +
>> kernel/irq/irqdomain.c           |  84 +++++++++++++++
>> kernel/irq/manage.c              | 103 ++++++++++++++++++
>> 16 files changed, 517 insertions(+), 169 deletions(-)
>> delete mode 100644 arch/mips/kernel/smp-gic.c
>
> It strikes me that Documentation/ should at least get _some_ love. 
> Perhaps IRQ-ipi.txt? I dunno...

Since this was an RFC I didn't update documentation without first making 
sure the changes are OK. In the next series I'll add the documentation 
changes.

Thanks for pointing it out though. I could have missed it in the next 
series to be honest as I'm getting more focused on the small details :)

Thanks,
Qais
