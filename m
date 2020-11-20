Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBACC5519F
	for <linux-mips@archiver.kernel.org>; Fri, 20 Nov 2020 14:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60656208B6
	for <linux-mips@archiver.kernel.org>; Fri, 20 Nov 2020 14:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9VsB7bz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbgKTOHA (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 20 Nov 2020 09:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgKTOG7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Nov 2020 09:06:59 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B3FC0613CF;
        Fri, 20 Nov 2020 06:06:58 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id r9so13611503lfn.11;
        Fri, 20 Nov 2020 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fbAiUqaPdGmgSOxYvD/S4BBUsRrQ9zsclh+SLteqLJA=;
        b=R9VsB7bz9NIu4jPGvQ2kIxDpZ2ePLSn1P5eSwuX1IgM9/pF9HOpV053s/b/DSiyUOq
         WsyVfw8cjLUBb/jx+/TwG0CvkpjZ1LVfBq/m4CvGkmkdmjPflW/K9P7atyg0tiZCYSR/
         BKP/SOILpQ5tKTfHTeXDLhnleCnpkekVLYm78YyP6NEOE2NWGlR2maGvWAHbI4f7P6Wh
         rxwkpjpjVKL6xrzsWz9u8S4/ti/SfikiQBdNF6DqrByVIvODkrPEpQwv4M4BE6oFX8cA
         rOvRvKKhWhVgGAvurosFFO/Xxj+7mzZSqau/Ibu1Yf1dhgOCLVGPraVFyMjeWjjopN+Q
         /Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fbAiUqaPdGmgSOxYvD/S4BBUsRrQ9zsclh+SLteqLJA=;
        b=eZujAQuXR92vz1eKaIndb6CBKgM48R9dZQ0Y05MVXBrzSEFJbOOfJHrIaz4YsRMHr+
         FDOl/pjnK+N/H14f/8CiFsy2pc3+23GHXQbI/OPzs6+9Ky9IwrSfVY71Ot0ZU+IAczrB
         p+daufWiZ/GiLkNapGEUiynNYSSSid9Rf5kpCQvQ06uHXZDRYbiLxE4hn5ZcmU+U2g2C
         ZEIEWljDDStxDQQDFtyE8FbjVcmb15AAiIEpbch3FguyBo+Kd4rDbb76GOXSkxRoH7+O
         AFVtVqiFyT2Wef4JVZonApxzBKRInSDfv+1XYfZfQ+ngTpTDOVMHyxYp/rOUfLNmG26k
         4Rug==
X-Gm-Message-State: AOAM531jzwXoY+FOBJaKAnE2trzYsek+jasSXIoth1h5p8nCxRCQ62ks
        V/vDpTT5T2KjlR8DGXr58x4=
X-Google-Smtp-Source: ABdhPJzwQWJ63D8TNJulIR6b4LRfQ1CTUfPxdqBigm13RDf7nmdJmKIaOW0KZp0Sm/bTfgHqiYOeQw==
X-Received: by 2002:ac2:48b7:: with SMTP id u23mr8773594lfg.327.1605881217368;
        Fri, 20 Nov 2020 06:06:57 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id l18sm291084ljj.60.2020.11.20.06.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 06:06:56 -0800 (PST)
Date:   Fri, 20 Nov 2020 17:06:54 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: cdmm: fix use-after-free in mips_cdmm_bus_discover
Message-ID: <20201120140654.e3jrnnyqesqbsko3@mobilestation>
References: <20201120074847.31369-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120074847.31369-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Qinglang

Thanks for the patch. Good catch. Please see a tiny nitpick below.

On Fri, Nov 20, 2020 at 03:48:47PM +0800, Qinglang Miao wrote:
> kfree(dev) has been called inside put_device so anther
> kfree would cause a use-after-free bug/
> 
> Fixes: 8286ae03308c ("MIPS: Add CDMM bus support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/bus/mips_cdmm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/bus/mips_cdmm.c b/drivers/bus/mips_cdmm.c
> index 9f7ed1fcd..e43786c67 100644
> --- a/drivers/bus/mips_cdmm.c
> +++ b/drivers/bus/mips_cdmm.c
> @@ -561,7 +561,6 @@ static void mips_cdmm_bus_discover(struct mips_cdmm_bus *bus)
>  		ret = device_register(&dev->dev);

>  		if (ret) {
>  			put_device(&dev->dev);
> -			kfree(dev);
>  		}

After removing kfree() from here the braces around the if clause
are no more needed in accordance with the kernel coding style.
Please remove them too. Then feel free to add the tag
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

>  	}
>  }
> -- 
> 2.23.0
> 
