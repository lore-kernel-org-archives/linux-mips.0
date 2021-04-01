Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E031C433ED
	for <linux-mips@archiver.kernel.org>; Thu,  1 Apr 2021 06:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01BA5600EF
	for <linux-mips@archiver.kernel.org>; Thu,  1 Apr 2021 06:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhDAG1s (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 1 Apr 2021 02:27:48 -0400
Received: from verein.lst.de ([213.95.11.211]:38308 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229539AbhDAG1k (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 02:27:40 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9934A68BEB; Thu,  1 Apr 2021 08:27:38 +0200 (CEST)
Date:   Thu, 1 Apr 2021 08:27:38 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH v2 2/4] MIPS: uaccess: Added __get/__put_kernel_nofault
Message-ID: <20210401062738.GA25514@lst.de>
References: <20210331115603.146159-1-tsbogend@alpha.franken.de> <20210331115603.146159-3-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331115603.146159-3-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 31, 2021 at 01:55:59PM +0200, Thomas Bogendoerfer wrote:
> Added __get/__put_kernel_nofault as preparation for removing
> get/set_fs.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
