Received: from mailapp01.imgtec.com ([195.59.15.196]:62467 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009101AbbI1OQwQKu68 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 28 Sep 2015 16:16:52 +0200
Subject: Re: [PATCH 2/3] irqchip: irq-mips-gic: Provide function to map GIC
 user section
References: <1443434629-14325-1-git-send-email-markos.chandras@imgtec.com>
 <1443435117-17144-1-git-send-email-markos.chandras@imgtec.com>
 <56091CA1.1030808@arm.com>
From: Qais Yousef <qais.yousef@imgtec.com>
Message-ID: <56094BCD.6000600@imgtec.com>
Date: Mon, 28 Sep 2015 15:16:45 +0100
MIME-Version: 1.0
In-Reply-To: <56091CA1.1030808@arm.com>
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
To: Marc Zyngier <marc.zyngier@arm.com>, Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, alex@alex-smith.me.uk, Alex Smith <alex.smith@imgtec.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org
Message-ID: <20150928141645.eb5Z_dmCJMa_Ak_xgQKy6J1BaXJ3Gre1owpdMVcJAxk@z>

On 09/28/2015 11:55 AM, Marc Zyngier wrote:
> On 28/09/15 11:11, Markos Chandras wrote:
>
>> +
>> +	pfn = (gic_base_addr + USM_VISIBLE_SECTION_OFS) >> PAGE_SHIFT;
>> +	return io_remap_pfn_range(vma, base, pfn, size,
>> +				  pgprot_noncached(PAGE_READONLY));
>
> - Does this code have to be in the irqchip driver? It really feels out
> of place, and I'd rather see a function that returns the mappable range
> to the VDSO code, where the mapping would occur.
>


I don't think it's a good idea either for the VDSO code to know about 
gic_base_addr. Maybe this function could be split to return the pfn and 
let the caller do io_remap_pfn_range(). Though I think it's nice to have 
it all there. USM stands for USer Mode - GIC wants to make some stuff 
visible to user mode and it puts them in that special section. So it 
makes sense to do it all there IMO.

Qais
