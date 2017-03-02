Received: from mailapp01.imgtec.com ([195.59.15.196]:59844 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993875AbdCBTJWomGUx convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 2 Mar 2017 20:09:22 +0100
From: Bryan O'Donoghue <Bryan.ODonoghue@imgtec.com>
Subject: Re: [PATCH] MIPS: pm-cps: Drop manual cache-line alignment of
 ready_count
Date: Thu, 2 Mar 2017 19:09:15 +0000
Message-ID: <fc083eff-aecb-7346-d448-f0282483aa3f@imgtec.com>
References: <20170302183128.22883-1-paul.burton@imgtec.com>
In-Reply-To: <20170302183128.22883-1-paul.burton@imgtec.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <45C5E3A191CC61429C79BCCD99420132@imgtec.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Bryan.ODonoghue@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <Paul.Burton@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Cc: "ralf@linux-mips.org" <ralf@linux-mips.org>, "stable # v3 . 16+" <stable@vger.kernel.org>
Message-ID: <20170302190915.cJ2DiLqkfTrEz3g46PlXSpoftt0LZpu9LuvtwbLHEbA@z>

On 02/03/17 18:31, Paul Burton wrote:
> We allocate memory for a ready_count variable per-CPU, which is accessed
> via a cached non-coherent TLB mapping to perform synchronisation between
> threads within the core using LL/SC instructions. In order to ensure
> that the variable is contained within its own data cache line we
> allocate 2 lines worth of memory & align the resulting pointer to a line
> boundary. This is however unnecessary, since kmalloc is guaranteed to
> return memory which is at least cache-line aligned (see
> ARCH_DMA_MINALIGN). Stop the redundant manual alignment.
> 
> Besides cleaning up the code & avoiding needless work, this has the side
> effect of avoiding an arithmetic error found by Brian on 64 bit systems

Small nit 'Bryan' not 'Brian' - never mind.

> due to the 32 bit size of the former dlinesz. This led the ready_count
> variable to have its upper 32b cleared erroneously for MIPS64 kernels,
> causing problems when ready_count was later used on MIPS64 via cpuidle.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Fixes: 3179d37ee1ed ("MIPS: pm-cps: add PM state entry code for CPS systems")
> Reported-by: Bryan O'Donoghue <bryan.odonoghue@imgtec.com>
> Cc: Bryan O'Donoghue <bryan.odonoghue@imgtec.com>
> Cc: linux-mips@linux-mips.org
> Cc: ralf@linux-mips.org
> Cc: stable <stable@vger.kernel.org> # v3.16+

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@imgtec.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@imgtec.com>
