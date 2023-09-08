Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3D6EE57E0
	for <linux-mips@archiver.kernel.org>; Fri,  8 Sep 2023 08:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjIHIQm (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 8 Sep 2023 04:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjIHIQl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Sep 2023 04:16:41 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95621BDA;
        Fri,  8 Sep 2023 01:16:37 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 61D8F68B05; Fri,  8 Sep 2023 10:16:35 +0200 (CEST)
Date:   Fri, 8 Sep 2023 10:16:34 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Christoph Hellwig <hch@lst.de>, tsbogend@alpha.franken.de,
        manuel.lauss@gmail.com, arnd@arndb.de, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Alchemy: only build mmc support helpers if
 au1xmmc is enabled
Message-ID: <20230908081634.GC8240@lst.de>
References: <20230905070656.196274-1-hch@lst.de> <d8e0dd0f-ce37-2dbf-8ac3-a1e26a18cf45@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8e0dd0f-ce37-2dbf-8ac3-a1e26a18cf45@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 05, 2023 at 06:04:18PM -0700, Randy Dunlap wrote:
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thomas, given that this is mips arch code, it's probably best if you
pick it up.

