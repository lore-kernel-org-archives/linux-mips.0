Return-Path: <SRS0=pN+d=A6=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F32C433E1
	for <linux-mips@archiver.kernel.org>; Sun, 19 Jul 2020 15:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23FB222BEF
	for <linux-mips@archiver.kernel.org>; Sun, 19 Jul 2020 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595171594;
	bh=NJ+8Y8xBtYKVq7It5UDmlrFvfA6IdxHidPvXTq/XF7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=G9YtMISXcNvg2hy0X96+0PMbQQ534QVf/zq59rOkZKLcIXM1OiYmWe2X+8EyYvQpO
	 J8bb8ikbVhvAhjz23g7ddN+dJOV7DUAsdrsFYvtufJe+bfbW3uTU5LYONItwimgzJF
	 V6KefhJfgnKN/7IgQ2ebADl4CEQ048nizFAg80FE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgGSPNN (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 19 Jul 2020 11:13:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726024AbgGSPNM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 19 Jul 2020 11:13:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 478E622B4D;
        Sun, 19 Jul 2020 15:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595171591;
        bh=NJ+8Y8xBtYKVq7It5UDmlrFvfA6IdxHidPvXTq/XF7I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Faftx/0Hn6GnZ5dDLGHnUEQ4pR549d2YryvE4r5cdmBdg58nTgYPN7WHH7wtQPdqF
         no581pI7YeuY17rsynWainmO83EUPIyxLHvkTOZI+boGzKVkX1piQM4uqJMmchQT6f
         K1aBnhzIlRioT3WUJ1VrQok/NXExiUBDHEMRzbCw=
Date:   Sun, 19 Jul 2020 17:13:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        "Stable # 4 . 4/4 . 9/4 . 14/4 . 19" <stable@vger.kernel.org>
Subject: Re: [PATCH -stable] MIPS: Fix build for LTS kernel caused by
 backporting lpj adjustment
Message-ID: <20200719151322.GA301242@kroah.com>
References: <1594892369-28060-1-git-send-email-chenhc@lemote.com>
 <CAAhV-H4wdxtLCAFOJE6wgAZdg+U5mquSZjHmAL_qsDaGtENbFg@mail.gmail.com>
 <34928e81-3675-0309-b020-0cb4b402dc5c@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34928e81-3675-0309-b020-0cb4b402dc5c@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 19, 2020 at 10:51:11PM +0800, Jiaxun Yang wrote:
> 
> 在 2020/7/19 上午11:24, Huacai Chen 写道:
> > Hi, Serge,
> > 
> > Could you please have a look at this patch?
> 
> 
> + Gregkh
> 
> This is urgent for next stable release, please take a look.

Relax, it was only sent 3 days ago, we will get to this...

Also, why was this not caught by any of the testing systems that we
have?  That might be good to determine so we don't mess up again in the
future.

thanks,

greg k-h
