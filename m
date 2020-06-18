Return-Path: <SRS0=+T2v=77=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BF0C433E0
	for <linux-mips@archiver.kernel.org>; Thu, 18 Jun 2020 10:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F9B22085B
	for <linux-mips@archiver.kernel.org>; Thu, 18 Jun 2020 10:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgFRK4s (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 18 Jun 2020 06:56:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:46576 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727037AbgFRK4r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Jun 2020 06:56:47 -0400
IronPort-SDR: lna/KPeqo3OpsJTql+aXkLj0C1mYAoIzEGxr6CupHqCyRrK91OIpXA7jQYHBv3XxSIVe0oNnZj
 E6+HHLIhiejw==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="227220217"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="227220217"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 03:56:46 -0700
IronPort-SDR: zdiPUJ2m4eR2vu3KsX/Brm4Q0KndS06I5xDuiNO6Hq35jGecgCI6qkcIX3WbAudI5X+2axyy/Q
 AtwB2n06qtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="261992061"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jun 2020 03:56:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jlsDw-00EFZg-K2; Thu, 18 Jun 2020 13:56:48 +0300
Date:   Thu, 18 Jun 2020 13:56:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, Vikas Gupta <vikas.gupta@broadcom.com>
Subject: Re: [PATCH v1] firmware: tee_bnxt: Use UUID API for exporting the
 UUID
Message-ID: <20200618105648.GP2428291@smile.fi.intel.com>
References: <20200422130021.38424-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422130021.38424-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 22, 2020 at 04:00:21PM +0300, Andy Shevchenko wrote:
> There is export_uuid() function which exports uuid_t to the u8 array.
> Use it instead of open coding variant.
> 
> This allows to hide the uuid_t internals.

Any comment on this?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/firmware/broadcom/tee_bnxt_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> index ed10da5313e86..4cf0c2576037d 100644
> --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> @@ -197,7 +197,7 @@ static int tee_bnxt_fw_probe(struct device *dev)
>  		return -ENODEV;
>  
>  	/* Open session with Bnxt load Trusted App */
> -	memcpy(sess_arg.uuid, bnxt_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
> +	export_uuid(sess_arg.uuid, &bnxt_device->id.uuid);
>  	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>  	sess_arg.num_params = 0;
>  
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


