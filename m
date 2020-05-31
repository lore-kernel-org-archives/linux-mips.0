Return-Path: <SRS0=BAFX=7N=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31209C433E0
	for <linux-mips@archiver.kernel.org>; Sun, 31 May 2020 09:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11DAA2074A
	for <linux-mips@archiver.kernel.org>; Sun, 31 May 2020 09:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgEaJ5y (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 31 May 2020 05:57:54 -0400
Received: from elvis.franken.de ([193.175.24.41]:45472 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgEaJ5y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 May 2020 05:57:54 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jfKj2-0002Ku-00; Sun, 31 May 2020 11:57:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 56365C063E; Sun, 31 May 2020 11:36:45 +0200 (CEST)
Date:   Sun, 31 May 2020 11:36:45 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/3] CPUCFG emulation future-proofing & HWCAP addition
Message-ID: <20200531093645.GA3948@alpha.franken.de>
References: <20200530073243.16411-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200530073243.16411-1-git@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 30, 2020 at 03:32:40PM +0800, WANG Xuerui wrote:
> This patch series future-proofs the CPUCFG emulation, in light of
> possibility of new Loongson cores still lacking native CPUCFG.
> Also an HWCAP flag bit is allocated and exposed for userspace's probing
> convenience, per the earlier plan shared on the mailing list.
> 
> Tested on Loongson-3A3000 and Loongson-3A4000. Compile-tested with
> 64r2_defconfig.
> 
> v2:
> - unconditionally bump PERF_COUNT_SW_EMULATION_FAULTS even on
>   unsupported core models
> - reordered model match arms per Huacai's review
> - tweaked commit message of 2nd patch
> 
> WANG Xuerui (3):
>   MIPS: Loongson64: Guard against future cores without CPUCFG
>   MIPS: Expose Loongson CPUCFG availability via HWCAP
>   MIPS: Loongson64: Reorder CPUCFG model match arms
> 
>  .../include/asm/mach-loongson64/cpucfg-emul.h | 11 +++
>  arch/mips/include/uapi/asm/hwcap.h            |  1 +
>  arch/mips/kernel/traps.c                      |  4 ++
>  arch/mips/loongson64/cpucfg-emul.c            | 70 +++++++++++--------
>  4 files changed, 56 insertions(+), 30 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
