Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0934C07E99
	for <linux-mips@archiver.kernel.org>; Fri,  9 Jul 2021 13:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF1AE6128A
	for <linux-mips@archiver.kernel.org>; Fri,  9 Jul 2021 13:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhGINiP (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 9 Jul 2021 09:38:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:48526 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231482AbhGINiP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Jul 2021 09:38:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m1qfA-0004vx-00; Fri, 09 Jul 2021 15:35:28 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CEA37C07DA; Fri,  9 Jul 2021 15:35:16 +0200 (CEST)
Date:   Fri, 9 Jul 2021 15:35:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Martin =?iso-8859-1?Q?F=E4cknitz?= <faecknitz@hotsplots.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] invalid GIC access through VDSO
Message-ID: <20210709133516.GA7410@alpha.franken.de>
References: <48756553-5aa2-f07f-ca69-0e4d6bda8f24@hotsplots.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48756553-5aa2-f07f-ca69-0e4d6bda8f24@hotsplots.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 05, 2021 at 02:03:54AM +0200, Martin Fäcknitz wrote:
> Accessing raw timers (currently only CLOCK_MONOTONIC_RAW) through VDSO doesn't
> return the correct time when using the GIC as clock source. The address of the
> GIC mapped page is in this case not calculated correctly. The GIC mapped page
> is calculated from the VDSO data by subtracting PAGE_SIZE:
> 
>   void *get_gic(const struct vdso_data *data) {
>     return (void __iomem *)data - PAGE_SIZE;
>   }
> 
> However, the data pointer is not page aligned for raw clock sources. This is
> because the VDSO data for raw clock sources (CS_RAW = 1) is stored after the
> VDSO data for coarse clock sources (CS_HRES_COARSE = 0). Therefore, only the
> VDSO data for CS_HRES_COARSE is page aligned:
> 
>   +--------------------+
>   |                    |
>   | vd[CS_RAW]         | ---+
>   | vd[CS_HRES_COARSE] |    |
>   +--------------------+    | -PAGE_SIZE
>   |                    |    |
>   |  GIC mapped page   | <--+
>   |                    |
>   +--------------------+
> 
> When __arch_get_hw_counter() is called with &vd[CS_RAW], get_gic returns the
> wrong address (somewhere inside the GIC mapped page). The GIC counter values
> are not returned which results in an invalid time.
> 
> Signed-off-by: Martin Fäcknitz <faecknitz@hotsplots.de>

applied to mips-next.

I've fixed subject and commit log formating. Please use checkpatch before
submitting next time. I also added

Fixes: a7f4df4e21dd ("MIPS: VDSO: Add implementations of gettimeofday() and clock_gettime()")

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
