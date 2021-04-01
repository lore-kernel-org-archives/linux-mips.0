Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FD1C43460
	for <linux-mips@archiver.kernel.org>; Thu,  1 Apr 2021 17:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E28A610A0
	for <linux-mips@archiver.kernel.org>; Thu,  1 Apr 2021 17:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbhDARsD (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:48:03 -0400
Received: from verein.lst.de ([213.95.11.211]:40004 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235608AbhDARnC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 13:43:02 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id BB0A068BFE; Thu,  1 Apr 2021 16:05:07 +0200 (CEST)
Date:   Thu, 1 Apr 2021 16:05:07 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH v3 4/4] MIPS: Remove get_fs/set_fs
Message-ID: <20210401140507.GB24331@lst.de>
References: <20210401125639.42963-1-tsbogend@alpha.franken.de> <20210401125639.42963-5-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401125639.42963-5-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
