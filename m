Return-Path: <SRS0=yY2i=4A=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0A6C352A4
	for <linux-mips@archiver.kernel.org>; Wed, 12 Feb 2020 21:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D19AF2082F
	for <linux-mips@archiver.kernel.org>; Wed, 12 Feb 2020 21:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581544321;
	bh=CqfexFpFL2Kvk+pZ9hKVo8U3ep9xVwRyPRkPasjv5MA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aLdzTegOyy1PecdMX78RDpdoG0nAIgxriiJ3OnaiX3kunxMzrUskhEh43F/m6dnM1
	 2OiHqKSBXKr3YxkMdzgAf1NomHJ8cny+69phGpf8L9DJ4M2tspdAUQkyBXVlwcgH3R
	 eZY3PUdAbo8cGQNa8AABU/X9roLZBFWqEjZ2aOdQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgBLVwB (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 12 Feb 2020 16:52:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:42684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727564AbgBLVwB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Feb 2020 16:52:01 -0500
Received: from localhost (unknown [104.132.1.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5BD3206DB;
        Wed, 12 Feb 2020 21:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581544320;
        bh=CqfexFpFL2Kvk+pZ9hKVo8U3ep9xVwRyPRkPasjv5MA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k0YtbvwK0+BdeASaaSY+VKozd/Lnxx+raoJDZzvCiaiANS6NjrpK0P2D9q8AaJas7
         kZQzj6tL2X1+rbxXGt6yiPPioMOPJ1T7prHE0tEnqnxkTlOr2LVCAU34wR9Xd0tL1G
         uSyf7vZWh3zsu3jIOdr3YuQ/Kn7n16OLZpscRD/w=
Date:   Wed, 12 Feb 2020 13:52:00 -0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     ralf@linux-mips.org, paulburton@kernel.org, linux@roeck-us.net,
        dan.carpenter@oracle.com, willy@infradead.org,
        devel@driverdev.osuosl.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Re-instate octeon staging drivers
Message-ID: <20200212215200.GA2367959@kroah.com>
References: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 05, 2020 at 01:11:10PM +1300, Chris Packham wrote:
> This series re-instates the octeon drivers that were recently removed and
> addresses the build issues that lead to that decision.
> 
> I've approached Cavium/Marvell about taking a more active interest in getting
> the code out of staging and into their proper location. No reply on that (yet).

Good luck with talking to the companies, hopefully that will work.

Anyway, I've applied this series, thanks for this, let's see what breaks
now :)

greg k-h
