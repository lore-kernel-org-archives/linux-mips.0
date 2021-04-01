Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E487C433ED
	for <linux-mips@archiver.kernel.org>; Thu,  1 Apr 2021 06:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED84961057
	for <linux-mips@archiver.kernel.org>; Thu,  1 Apr 2021 06:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbhDAGW5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 1 Apr 2021 02:22:57 -0400
Received: from verein.lst.de ([213.95.11.211]:38295 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233291AbhDAGWn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 02:22:43 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E016968B05; Thu,  1 Apr 2021 08:22:40 +0200 (CEST)
Date:   Thu, 1 Apr 2021 08:22:40 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, hch@lst.de
Subject: Re: [PATCH v2 1/4] MIPS: kernel: Remove not needed set_fs calls
Message-ID: <20210401062240.GA25474@lst.de>
References: <20210331115603.146159-1-tsbogend@alpha.franken.de> <20210331115603.146159-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331115603.146159-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 31, 2021 at 01:55:58PM +0200, Thomas Bogendoerfer wrote:
> flush_icache_range always does flush kernel address ranges, so no
> need to do the set_fs dance.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
