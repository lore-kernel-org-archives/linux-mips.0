Received: from mailapp01.imgtec.com ([195.59.15.196]:38671 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006725AbbCKI3B4uf0E (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 11 Mar 2015 09:29:01 +0100
Message-ID: <54FFFCC7.5090707@imgtec.com>
Date: Wed, 11 Mar 2015 08:28:55 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "MIPS: mm: tlbex: Use cpu_has_mips_r2_exec_hazard
 for the EHB instruction"
References: <1424731974-27926-1-git-send-email-ddaney.cavm@gmail.com>
In-Reply-To: <1424731974-27926-1-git-send-email-ddaney.cavm@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20150311082855.WTRinBUgoffc_7XrlKicxBOmtayX8YI43dN0DHMQoqQ@z>

On 02/23/2015 10:52 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
> 
> This reverts commit 77f3ee59ee7cfe19e0ee48d9a990c7967fbfcbed.
> 
> There are two problems:
> 
> 1) It breaks OCTEON, which will now crash in early boot with:
> 
>   Kernel panic - not syncing: No TLB refill handler yet (CPU type: 80)
> 
> 2) The logic is broken.
> 
> The meaning of cpu_has_mips_r2_exec_hazard is that the EHB instruction
> is required.  The offending patch attempts (and fails) to change the
> meaning to be that EHB is part of the ISA.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>
> ---
Hi,

First of all sorry about the octeon breakage.

However, whilst this patch will fix Octeon it will break R6

Can we please consider another patch that will simply use
cpu_has_mips_r2_r6 instead of cpu_has_mips_r2 so both will work in 4.0?

-- 
markos
