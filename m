Received: from mailapp01.imgtec.com ([195.59.15.196]:47844 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861108AbaGQJRyEsomN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Jul 2014 11:17:54 +0200
Message-ID: <53C794B0.4060504@imgtec.com>
Date: Thu, 17 Jul 2014 10:17:36 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] mips: dma: Add cma support
References: <1405525892-60383-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1405525892-60383-5-git-send-email-Zubair.Kakakhel@imgtec.com> <xa1t7g3db6mu.fsf@mina86.com>
In-Reply-To: <xa1t7g3db6mu.fsf@mina86.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Zubair.Kakakhel@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Michal Nazarewicz <mina86@mina86.com>, Ralf Baechle <ralf@linux-mips.org>, gregkh@linuxfoundation.org, m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140717091736.EPt1yLjZOvD53AWQAvLafDIUZz3Jo5kmRil5GhyXFiU@z>



On 16/07/14 17:39, Michal Nazarewicz wrote:
> On Wed, Jul 16 2014, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com> wrote:
>> Adds cma support to the mips architecture.
>>
>> cma uses memblock. However, mips uses bootmem.
> 
> Does cma_early_percent_memory work correctly then?
> 

Yes it does. All memblock functions work. And this is before bootmem
is informed.

>> bootmem is informed about any regions reserved by memblock
> 
> Alternatively maybe it would make sense to create a new definition of
> dma_contiguous_reserve_area that uses bootmem and choose it based on
> some CONFIG_CMA_USE_BOOTMEM which would be selected by MIPS.
> 

Telling bootmem takes only 3 lines.

Adding CONFIG_CMA_USE_BOOTMEM would add more functions and maintenance overhead.
And it will basically do the same thing.
Reserve memory. And tell the bootmem allocator.

>> dma api is modified to use cma reserved memory regions when available
>>
>> Tested using cma_test. cma_test is a simple driver that assigns blocks
>> of memory from cma reserved sections.
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> Acked-by: Michal Nazarewicz <mina86@mina86.com>

Thank-you

ZubairLK
