Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840A5C433F5
	for <linux-mips@archiver.kernel.org>; Mon, 21 Feb 2022 06:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344883AbiBUGGv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 21 Feb 2022 01:06:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344885AbiBUGGu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Feb 2022 01:06:50 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A18114000
        for <linux-mips@vger.kernel.org>; Sun, 20 Feb 2022 22:06:26 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id A144A68AFE; Mon, 21 Feb 2022 07:06:21 +0100 (CET)
Date:   Mon, 21 Feb 2022 07:06:21 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: question on mips/kernel/setup.c
Message-ID: <20220221060621.GA12337@lst.de>
References: <7d6fa84b-2fc8-57ac-f240-e681a4b8c390@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6fa84b-2fc8-57ac-f240-e681a4b8c390@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 20, 2022 at 03:56:42PM -0800, Randy Dunlap wrote:
> Both of these command line options set 'dma_default_coherent' to true.
> 
> Is that correct or a typo?  Or it doesn't matter?

It is a typo, but apparently no one noticed in all the time.
nocoherentio should set it to false.
