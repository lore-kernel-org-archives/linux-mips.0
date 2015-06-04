Received: from mailapp01.imgtec.com ([195.59.15.196]:13514 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007440AbbFDLRvtZKqN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 4 Jun 2015 13:17:51 +0200
Message-ID: <557033D9.6000006@imgtec.com>
Date: Thu, 4 Jun 2015 12:17:45 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: asm: pgtable-bits: Add R6 support for PTE RI/XI
 bits
References: <1432907032-16689-1-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1432907032-16689-1-git-send-email-markos.chandras@imgtec.com>
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
To: linux-mips@linux-mips.org
Cc: "Steven J. Hill" <Steven.Hill@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20150604111745.AXPbv5UzLIqFLcg8sLmyczV_5GLCzKcD4EBnid1a3YA@z>

On 05/29/2015 02:43 PM, Markos Chandras wrote:
> Commit be0c37c985ed ("MIPS: Rearrange PTE bits into fixed positions.")
> rearranged the PTE bits into fixed positions in preparation for the XPA
> support. However, this patch broke R6 since it only took R2 cores
> into consideration for the RI/XI bits leading to boot failures. We fix
> this by adding the missing CONFIG_CPU_MIPSR6 definitions
> 
> Fixes: be0c37c985ed ("MIPS: Rearrange PTE bits into fixed positions.")
> Cc: Steven J. Hill <Steven.Hill@imgtec.com>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> This is a bugfix for a bug introduced in 4.1-rc1. Can we please have
> this patch in 4.1?
> ---

Ralf,

I see you merged this patch (thanks!) but it's in the wrong branch it
seems. It's not in the 4.1-fixes I think. Can you please schedule this
patch for 4.1 since it's a bugfix? Otherwise R6 won't even boot in 4.1.

Thank you

-- 
markos
