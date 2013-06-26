Received: from multi.imgtec.com ([194.200.65.239]:37159 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827473Ab3FZXcAvnN3s (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 27 Jun 2013 01:32:00 +0200
Message-ID: <51CB79BB.9090905@imgtec.com>
Date: Wed, 26 Jun 2013 18:31:07 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Use scratch registers when MIPS_PGD_C0_CONTEXT is
 not set
References: <1372011381-18600-1-git-send-email-jchandra@broadcom.com>
In-Reply-To: <1372011381-18600-1-git-send-email-jchandra@broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jayachandran C <jchandra@broadcom.com>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20130626233107.qTEVc64_9fzE7rRUbes9MHBg1AwiD0Gf6PtKAWlJSSw@z>

On 06/23/2013 01:16 PM, Jayachandran C wrote:
>
> Jayachandran C (3):
>    MIPS: Move generated code to .text for microMIPS
>    MIPS: mm: Use scratch for PGD when !CONFIG_MIPS_PGD_C0_CONTEXT
>    MIPS: Move definition of SMP processor id register to header file
>
>   arch/mips/include/asm/mmu_context.h |   28 ++---
>   arch/mips/include/asm/stackframe.h  |   24 +---
>   arch/mips/include/asm/thread_info.h |   33 +++++-
>   arch/mips/mm/Makefile               |    2 +-
>   arch/mips/mm/tlb-funcs.S            |   37 ++++++
>   arch/mips/mm/tlbex.c                |  224 ++++++++++++++++-------------------
>   6 files changed, 187 insertions(+), 161 deletions(-)
>   create mode 100644 arch/mips/mm/tlb-funcs.S
>
The microMIPS kernel compiles, but fails to boot. It stops at:

    Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)

and does not go any further. I will look at this later this evening.

-Steve
