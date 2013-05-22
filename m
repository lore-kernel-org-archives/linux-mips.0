Received: from mail-db8lp0184.outbound.messaging.microsoft.com ([213.199.154.184]:16290
        "EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6823056Ab3EVVzrWtA9l (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 22 May 2013 23:55:47 +0200
Message-ID: <519D3ED0.20703@caviumnetworks.com>
Date: Wed, 22 May 2013 14:55:28 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] MIPS: OCTEON: Get rid of CONFIG_CAVIUM_OCTEON_HW_FIX_UNALIGNED
References: <1369259204-29164-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1369259204-29164-1-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
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
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20130522215528.jU2AbB7JDuc9DzIgFXpNp8B8JQjUdaQg0mRja0EYTk4@z>

On 05/22/2013 02:46 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> When you turn it off, the kernel is unusable, so get rid of the option
> and always allow unaligned access.
>
> The Octeon specific memcpy intentionally does unaligned accesses and it
> must not fault.
>
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
>   arch/mips/cavium-octeon/Kconfig                              | 11 -----------
>   arch/mips/include/asm/mach-cavium-octeon/kernel-entry-init.h |  7 +------
>   2 files changed, 1 insertion(+), 17 deletions(-)
>

This patch is stand-alone too. So subject should be [PATCH 1/1] ...

Still mergeable though.

David Daney
