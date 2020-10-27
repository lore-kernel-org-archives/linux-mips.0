Return-Path: <SRS0=6nsr=EC=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC32C55178
	for <linux-mips@archiver.kernel.org>; Tue, 27 Oct 2020 12:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1FB022456
	for <linux-mips@archiver.kernel.org>; Tue, 27 Oct 2020 12:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750661AbgJ0MLM (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 27 Oct 2020 08:11:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:52160 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750685AbgJ0MLM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Oct 2020 08:11:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kXNoj-0002cz-00; Tue, 27 Oct 2020 13:11:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3193BC0592; Tue, 27 Oct 2020 13:01:42 +0100 (CET)
Date:   Tue, 27 Oct 2020 13:01:42 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        linux-mips@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] MIPS: export has_transparent_hugepage() for modules
Message-ID: <20201027120142.GA13777@alpha.franken.de>
References: <20201023194440.13371-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023194440.13371-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 23, 2020 at 12:44:40PM -0700, Randy Dunlap wrote:
> MIPS should export its local version of "has_transparent_hugepage"
> so that loadable modules (dax) can use it.
> 
> Fixes this build error:
> ERROR: modpost: "has_transparent_hugepage" [drivers/dax/dax.ko] undefined!
> 
> Fixes: fd8cfd300019 ("arch: fix has_transparent_hugepage()")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: linux-nvdimm@lists.01.org
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  arch/mips/mm/tlb-r4k.c |    1 +
>  1 file changed, 1 insertion(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
