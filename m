Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1226C77B61
	for <linux-mips@archiver.kernel.org>; Thu, 13 Apr 2023 15:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjDMP53 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 13 Apr 2023 11:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjDMP51 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Apr 2023 11:57:27 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9948A7A;
        Thu, 13 Apr 2023 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=ZSJ0CgkcO5cgB+Wz1CbNujsGMaIPrS8zoMJXotiv8CU=; b=mvtGuwljYbPaMV+ZAd9FMUCQG8
        Y0euh75eZnmjveUJdutNRxoQkI/gr31mRZZp8c+DwZkB6C+mKzY9djFbkSSUCQ2kJe6zvAJTqFRoI
        ofgYomfexAbTqJuNxP5H3DA4KuH4WJTiOnymOt8yyVK/vA/UEB0RGfIl2O4W6QbboBjU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pmzJk-00ACee-Oq; Thu, 13 Apr 2023 17:57:00 +0200
Date:   Thu, 13 Apr 2023 17:57:00 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-staging@lists.linux.dev, netdev@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 1/3] staging: octeon: don't panic
Message-ID: <c69572ba-5ecf-477e-9dbe-8b6bd5dd98e8@lunn.ch>
References: <ZDgNexVTEfyGo77d@lenoch>
 <ZDgN8/IcFc3ZXkeC@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgN8/IcFc3ZXkeC@lenoch>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> -void cvm_oct_rx_initialize(void)
> +int cvm_oct_rx_initialize(void)
>  {
>  	int i;
>  	struct net_device *dev_for_napi = NULL;
> @@ -460,8 +460,11 @@ void cvm_oct_rx_initialize(void)
>  		}
>  	}
>  
> -	if (!dev_for_napi)
> -		panic("No net_devices were allocated.");
> +	if (!dev_for_napi) {
> +		pr_err("No net_devices were allocated.");

It is good practice to use dev_per(dev, ... You then know which device
has problem finding its net_devices.

checkpatch is probably warning you about this.

Once you have a registered netdev, you should then use netdev_err(),
netdev_dbg() etc.

However, cvm_oct_probe() in 6.3-rc6 seems to be FUBAR. As soon as you
call register_netdev(dev), the kernel can start using it, even before
that call returns. So the register_netdev(dev) should be the last
thing _probe does, once everything is set up. You can call
netdev_err() before it is registered, but the name is less
informative, something like "(unregistered)".

      Andrew
