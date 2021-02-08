Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFBBC433E0
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 15:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3FD364E92
	for <linux-mips@archiver.kernel.org>; Mon,  8 Feb 2021 15:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhBHPBM (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 8 Feb 2021 10:01:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:51218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231782AbhBHPBH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 10:01:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B19364E87;
        Mon,  8 Feb 2021 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612796427;
        bh=N2qAaEF+3vCal/IUAEMuWldnK28lwtVGBy4zy/3xQnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OBCVKGxgL7AwA/EBPZev3Yn27mzm1utXzMxQjebeNfn7XQ9PP/1E1llwkXFCxDjaF
         0QTh6X60Th1mWFCBEbY5TftVWTwblcsibLMyzEULPPdOkNjbnlEc6iPkBu33yYvSiw
         L8Dge0oeh+uNAQV4c29S7Yj9xWsJzRl9s754en4k=
Date:   Mon, 8 Feb 2021 16:00:25 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <YCFSCZz3qjdM5rJw@kroah.com>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210208145024.3320420-6-hch@lst.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 03:50:23PM +0100, Christoph Hellwig wrote:
> Lift the dma_default_coherent variable from the mips architecture code
> to the driver core.  This allows an architecture to sdefault all device
> to be DMA coherent at run time, even if the kernel is build with support
> for DMA noncoherent device.  By allowing device_initialize to ѕet the
> ->dma_coherent field to this default the amount of arch hooks required
> for this behavior can be greatly reduced.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
