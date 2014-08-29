Received: from mailapp01.imgtec.com ([195.59.15.196]:7001 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006505AbaH2JHpAh1yB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 29 Aug 2014 11:07:45 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id D3D558DE6AB46
        for <linux-mips@linux-mips.org>; Fri, 29 Aug 2014 10:07:35 +0100 (IST)
Message-ID: <540042D9.1050208@imgtec.com>
Date: Fri, 29 Aug 2014 10:07:37 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Loongson: Fix the write-combine CCA value setting
References: <1409283416-16926-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1409283416-16926-1-git-send-email-chenhc@lemote.com>
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
Message-ID: <20140829090737.5_xgOi6L305vNBCBJHUCuIDZ2SnN-uvWKoe4rVyHWR8@z>

On 08/29/2014 04:36 AM, Huacai Chen wrote:
> All Loongson-2/3 processors support _CACHE_UNCACHED_ACCELERATED, not
> only Loongson-3A.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
Hi,

Thanks for the patch.

Ralf, perhaps you can merge it with

http://git.linux-mips.org/?p=ralf/upstream-sfr.git;a=commit;h=2ac2118deca510649c15b0ba6ce433c37bba345c

Thanks in advance.

-- 
markos
