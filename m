Return-Path: <SRS0=4oka=6M=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5DFC83007
	for <linux-mips@archiver.kernel.org>; Tue, 28 Apr 2020 11:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2B2C206E2
	for <linux-mips@archiver.kernel.org>; Tue, 28 Apr 2020 11:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgD1LeM (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 28 Apr 2020 07:34:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:58669 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbgD1LeK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 07:34:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTOV6-0004MF-01; Tue, 28 Apr 2020 13:34:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7DF84C0344; Tue, 28 Apr 2020 13:20:33 +0200 (CEST)
Date:   Tue, 28 Apr 2020 13:20:33 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: perf: Add hardware perf events support for new
 Loongson-3
Message-ID: <20200428112033.GB11443@alpha.franken.de>
References: <1587978040-29624-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587978040-29624-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 27, 2020 at 05:00:40PM +0800, Huacai Chen wrote:
> diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> index 128fc99..c96eb03 100644
> --- a/arch/mips/kernel/perf_event_mipsxx.c
> +++ b/arch/mips/kernel/perf_event_mipsxx.c
> @@ -90,6 +90,7 @@ struct mips_pmu {
> -	unsigned long cntr_mask = (hwc->event_base >> 8) & 0xffff;
> +	if (get_loongson3_pmu_type() != LOONGSON_PMU_TYPE2)
> +		cntr_mask = (hwc->event_base >> 8) & 0xffff;
> +	else
> +		cntr_mask = (hwc->event_base >> 10) & 0xffff;

please invert the logic and do

	 if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2)
		cntr_mask = (hwc->event_base >> 10) & 0xffff;
	else
		cntr_mask = (hwc->event_base >> 8) & 0xffff;

> +	if (get_loongson3_pmu_type() != LOONGSON_PMU_TYPE2)
> +		cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0xff) |
> +			(evt->config_base & M_PERFCTL_CONFIG_MASK) |
> +			/* Make sure interrupt enabled. */
> +			MIPS_PERFCTRL_IE;
> +	else
> +		cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0x3ff) |
> +			(evt->config_base & M_PERFCTL_CONFIG_MASK) |
> +			/* Make sure interrupt enabled. */
> +			MIPS_PERFCTRL_IE;

same here

>  	else
>  #endif /* CONFIG_MIPS_MT_SMP */
> -		return ((pev->cntr_mask & 0xffff00) |
> -			(pev->event_id & 0xff));
> +	if (get_loongson3_pmu_type() != LOONGSON_PMU_TYPE2)
> +		return (pev->cntr_mask & 0xffff00) |
> +			(pev->event_id & 0xff);
> +	else
> +		return (pev->cntr_mask & 0xfffc00) |
> +			(pev->event_id & 0x3ff);

and here.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
