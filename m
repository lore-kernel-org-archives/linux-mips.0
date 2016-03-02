Received: from mailapp01.imgtec.com ([195.59.15.196]:51338 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006797AbcCBLjoShQh4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Mar 2016 12:39:44 +0100
Subject: Re: [PATCH 0/4] MIPS cache & highmem fixes
References: <1456799879-14711-1-git-send-email-paul.burton@imgtec.com>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <56D6D0F8.5090204@imgtec.com>
Date: Wed, 2 Mar 2016 11:39:36 +0000
MIME-Version: 1.0
In-Reply-To: <1456799879-14711-1-git-send-email-paul.burton@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Harvey.Hunt@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
Cc: Lars Persson <lars.persson@axis.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Huacai Chen <chenhc@lemote.com>, David Daney <david.daney@cavium.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Jerome Marchand <jmarchan@redhat.com>, Ralf
 Baechle <ralf@linux-mips.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20160302113936.s-SrSZtF8p7614Xz_So6CsKjlT1Jl9qGvhVwhLAGJtA@z>

Hi Paul,

On 01/03/16 02:37, Paul Burton wrote:
> This series fixes up a few issues with our current cache maintenance
> code, some specific to highmem & some not. It fixes an issue with icache
> corruption seen on the pistachio SoC & Ci40, and icache corruption seen
> using highmem on MIPS Malta boards with a P5600 CPU.
>
> Applies atop v4.5-rc6. It would be great to squeeze these in for v4.5,
> but I recognise it's quite late in the cycle & this brokenness has been
> around for a while so won't object to v4.6.
>
> Thanks,
>      Paul
>
> Paul Burton (4):
>    MIPS: Flush dcache for flush_kernel_dcache_page
>    MIPS: Flush highmem pages in __flush_dcache_page
>    MIPS: Handle highmem pages in __update_cache
>    MIPS: Sync icache & dcache in set_pte_at
>
>   arch/mips/include/asm/cacheflush.h |  7 +------
>   arch/mips/include/asm/pgtable.h    | 26 +++++++++++++++++++-----
>   arch/mips/mm/cache.c               | 41 +++++++++++++++++++-------------------
>   3 files changed, 43 insertions(+), 31 deletions(-)
>

I tested this patchset on a Ci20 (using highmem) and I can successfully 
boot to userland from an rfs on NAND, which I couldn't do before.

Tested-by: Harvey Hunt <harvey.hunt@imgtec.com>

Thanks,

Harvey
