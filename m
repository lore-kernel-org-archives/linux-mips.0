Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4003BBFC2;
	Wed,  2 Sep 2026 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382563; cv=none; b=NY3OAZDFtmIDAAVsIebqGoU89ibZy/dWfP8gx7tAnwmB4KoXX/ypcOkry3b0uzB8MYEOmB6ltdjZmXjgymFOw7lrFE1t00htVq2VbrTB6apkgzpnxwXAHsve6h8rRb+mlMdxtWMDg6UWIyvicDLvt0BzrkOHBEzEhV9yUK2QHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382563; c=relaxed/simple;
	bh=yOp/QwLcsFzKak6geScZDKKxKOKgTlwu0GRjCfP776Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYF+1Ep+EDcC+9QiRPy6NjB1NMBMa4jLUkYPcnKdKPMNvFRso2TFaPNXOlZEOoIscsPbFeS/1im4gpK013T/J0CCbp3CnlCp9nFPq+s0IKmzIoT/Ez8xpEf56MgT395UDIsTPYEU05O7RmI652MAY5V2JV4RXYo7/HRe3BSUl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KNKy6ESq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KNKy6ESq"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 643231F8;
	Wed,  2 Sep 2026 22:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788382461;
	bh=yOp/QwLcsFzKak6geScZDKKxKOKgTlwu0GRjCfP776Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNKy6ESqs9jc1DSUAxm2rIVPt6QfPXSje/ia548HWfrwix7W2Rg+9ymN3AXRk6YX0
	 +zkHv6srVg7BOqu3aakf7Dn42VXqKZ36oFDQwcEIsQfR9/sk4xoWhifJKpXyB0LFSM
	 Q0CH3JHEv1EanB5jfY7QzjWSrl+EYIK4tpKcO8Vw=
Date: Wed, 2 Sep 2026 23:55:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Cercueil <paul@crapouillou.net>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: Re: [PATCH v2 9/11] drm: xlnx: zynqmp_dpsub: Use
 devm_of_reserved_mem_device_init()
Message-ID: <20260902205551.GC287496@killaraus.ideasonboard.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
 <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902201640.2024648-10-mukesh.ojha@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 01:46:38AM +0530, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 53ab1a2a5aaf..e93a7a299b52 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -203,7 +203,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  
>  	/* Try the reserved memory. Proceed if there's none. */
> -	of_reserved_mem_device_init(&pdev->dev);
> +	devm_of_reserved_mem_device_init(&pdev->dev);
>  
>  	ret = zynqmp_dpsub_init_clocks(dpsub);
>  	if (ret < 0)
> @@ -255,7 +255,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	clk_disable_unprepare(dpsub->apb_clk);
>  err_mem:
> -	of_reserved_mem_device_release(&pdev->dev);
>  	if (!dpsub->drm)
>  		zynqmp_dpsub_release(dpsub);
>  	return ret;
> @@ -276,7 +275,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  	clk_disable_unprepare(dpsub->apb_clk);
> -	of_reserved_mem_device_release(&pdev->dev);
>  
>  	if (!dpsub->drm)
>  		zynqmp_dpsub_release(dpsub);

-- 
Regards,

Laurent Pinchart
