Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EA2C001B3
	for <linux-mips@archiver.kernel.org>; Tue, 20 Jun 2023 12:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjFTMxB (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 20 Jun 2023 08:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbjFTMw7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jun 2023 08:52:59 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC73210F8
        for <linux-mips@vger.kernel.org>; Tue, 20 Jun 2023 05:52:58 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qBaqt-00087t-00; Tue, 20 Jun 2023 14:52:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 300C5C02FD; Tue, 20 Jun 2023 14:49:48 +0200 (CEST)
Date:   Tue, 20 Jun 2023 14:49:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sui Jingfeng <suijingfeng@loongson.cn>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Loongson64: loongson3_defconfig: Enable amdgpu drm
 driver
Message-ID: <20230620124948.GA10520@alpha.franken.de>
References: <20230611055903.802801-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230611055903.802801-1-suijingfeng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jun 11, 2023 at 01:59:03PM +0800, Sui Jingfeng wrote:
> As it's usuable on LS3A4000 platform. Tested with RX550, glmark2
> got about 4235 score.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index 6f4a52608ea4..3087e64e6ebe 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -276,6 +276,13 @@ CONFIG_MEDIA_SUPPORT=m
>  CONFIG_MEDIA_USB_SUPPORT=y
>  CONFIG_USB_VIDEO_CLASS=m
>  CONFIG_DRM=y
> +CONFIG_DRM_AMDGPU=m
> +CONFIG_DRM_AMDGPU_SI=y
> +CONFIG_DRM_AMDGPU_CIK=y
> +CONFIG_DRM_AMDGPU_USERPTR=y
> +CONFIG_DRM_AMD_ACP=y
> +CONFIG_DRM_AMD_DC=y
> +CONFIG_DRM_AMD_DC_SI=y
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_QXL=y
>  CONFIG_DRM_VIRTIO_GPU=y
> -- 
> 2.25.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
