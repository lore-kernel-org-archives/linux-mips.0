Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B00DC433E9
	for <linux-mips@archiver.kernel.org>; Fri, 12 Mar 2021 11:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 222C864FEA
	for <linux-mips@archiver.kernel.org>; Fri, 12 Mar 2021 11:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhCLLwk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 12 Mar 2021 06:52:40 -0500
Received: from aposti.net ([89.234.176.197]:38764 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231611AbhCLLwW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 06:52:22 -0500
Date:   Thu, 11 Mar 2021 16:12:55 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/5] drm: Add and export function
 drm_gem_cma_mmap_noncoherent
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Message-Id: <JPBTPQ.TL10VUKPUBL23@crapouillou.net>
In-Reply-To: <20210311123642.GA1741910@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
        <20210307202835.253907-4-paul@crapouillou.net>
        <20210311122642.GB1739082@infradead.org>
        <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
        <20210311123642.GA1741910@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 11 mars 2021 à 12:36, Christoph Hellwig <hch@infradead.org> a 
écrit :
> On Thu, Mar 11, 2021 at 12:32:27PM +0000, Paul Cercueil wrote:
>>  > dma_to_phys must not be used by drivers.
>>  >
>>  > I have a proper helper for this waiting for users:
>>  >
>>  > 
>> http://git.infradead.org/users/hch/misc.git/commitdiff/96a546e7229ec53aadbdb7936d1e5e6cb5958952
>>  >
>>  > If you can confirm the helpers works for you I can try to still 
>> sneak
>>  > it to Linus for 5.12 to ease the merge pain.
>> 
>>  I can try. How do I get a page pointer from a dma_addr_t?
> 
> You don't - you get it from using virt_to_page on the pointer returned
> from dma_alloc_noncoherent.  That beind said to keep the API sane I
> should probably add a wrapper that does that for you.

I tested using:

ret = dma_mmap_pages(cma_obj->base.dev->dev,
                     vma, vma->vm_end - vma->vm_start,
                     virt_to_page(cma_obj->vaddr));

It works fine.

I think I can use remap_pfn_range() for now, and switch to your new API 
once it's available in drm-misc-next.

Cheers,
-Paul


