Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793640;
	b=zwfqrTJyDfvVoIcoUIJ3d2NVOrTX1eppeblF3qeD1t7YOt7bkrH4JWxw8ze3jZ2CYEXf
	 /Xuv2lzt/TmDAjzimP7RqMboc7IgrqE/9R9FiNDePf6psfmRkWzgY0BX0E2Go0Gd45Uni
	 R2HUNlaqWopWfyrnBcfdtMRWIIPAHv0fQPA3coZGnPL5Q1OggoTzeFurFJ3QAqULN5Yhn
	 ifY4+3ngtzCKF8SNjh+ZCeVPTsn6/qrLinXdnu1GolUlLlupcpSU2j86ZrY6s9tHPar4B
	 tHjcSzAXJ89nhb7p3IhCI8Rpse8sjnt7OMbQYUl9ed+DgVVGquA/4lqKp3+zaTyd2IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793640;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=3TangyTQ+F1EF3tLxNBi9hzZtvBvVtmUOHm+mBgsEkw=;
	b=CeqoZYMfdyLTsEFhUQJFN1c5G1/oYEO9q/75JLUFmcyCPFhkOSxwAeVujpO5E28PWl6J
	 zrBPsncHPV7T5C/M1ZavBkV9D5su7JIxWgBiBZCCTvXbFp+KE3ild6lfZtTepfqQ9kAgB
	 wSQ32jgxkf5G+OuG7n038QtJNPGBNSZcW3I6n1xfwP77JOp77sYjhC/bgMvmn7XSU9gav
	 VihDUtKuWvSexcZpQ2HO51TfTSQwMxOr7lnTbWAxG96UKKQdKDJ+B30Y/xu/ZaofSaFKi
	 kN86DB4vqfnEHymGtBSUeOGTh8RZwBURR92zKEsFA+ju+j7lEukFhGzgzqTdTlLPcXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J67P1KE4;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB48606A328;
	Wed,  4 Nov 2026 12:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB48606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J67P1KE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793639; x=1825329639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JrJIZS7mdC2DNBsFz30CB/vSL/nLJEAA4va9gpdgOXI=;
  b=J67P1KE4ftpzcvv4GeJkTm4ru6w/M/3K+Tppo8OSsE/fIHo2X9HiBaS3
   LE4jAWDrz9n+LHp7SWdXPHvNQ5X4NEfZNMQPw4jsa5vKpowg/Unnzv4sz
   uJA+zPYJ8a7hDLG1JG0TPhFVLC+aOuCjJID7IyzIjAIj3kWTZNPUbWzBN
   ZVkVaERoC/XF4h3sJsqYEk6UFEBkwMk/Jg4cOPL7V00DA6iHFXwX68R5Q
   41t6GrGgBGycChWC849oN6aFHJghx775GFabbmseL+rxbIE5etLtGD+gv
   ntQkvnEuH/MdUaHUHoCWq14YhnqdUIk9zNrM3o3i9uWPF89pWe0DpPFXZ
   w==;
X-CSE-ConnectionGUID: P+92gCeJQBWv7sxROXFdpQ==
X-CSE-MsgGUID: TL+GaD8nShqMNXy4QEETdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424977"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:00:38 -0800
X-CSE-ConnectionGUID: UyX6S0NrR8Cn/t3ekVp3Kw==
X-CSE-MsgGUID: RILWyBVVT9C9yvWe+V/zQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7047392"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:00:35 -0800
Date: Wed, 4 Nov 2026 14:00:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Viresh Kumar <vireshk@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dmaengine: Convert to subsys_platform_driver()
Message-ID: <auseYVGGYnxXMCUf@ashevche-desk.local>
References: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 07:33:02PM +0800, Peng Fan (OSS) wrote:

> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.

Ah, good one!

>  drivers/dma/dw/platform.c       | 13 +------------

> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -194,18 +194,7 @@ static struct platform_driver dw_driver = {
>  		.acpi_match_table = ACPI_PTR(dw_dma_acpi_id_table),
>  	},
>  };
> -
> -static int __init dw_init(void)
> -{
> -	return platform_driver_register(&dw_driver);
> -}
> -subsys_initcall(dw_init);
> -
> -static void __exit dw_exit(void)
> -{
> -	platform_driver_unregister(&dw_driver);
> -}
> -module_exit(dw_exit);
> +subsys_platform_driver(dw_driver);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Synopsys DesignWare DMA Controller platform driver");

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # dw

-- 
With Best Regards,
Andy Shevchenko


