Received: from mail1.windriver.com ([147.11.146.13]:48626 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6837156AbaEUFjICK6cz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 May 2014 07:39:08 +0200
Date: Wed, 21 May 2014 13:38:53 +0800
From: Yong Zhang <yong.zhang@windriver.com>
Subject: Re: [PATCH] MIPS: change type of asid_cache to unsigned long
Message-ID: <20140521053853.GC19655@pek-yzhang-d1>
Reply-To: Yong Zhang <yong.zhang@windriver.com>
References: <1400573344-5035-1-git-send-email-yong.zhang0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1400573344-5035-1-git-send-email-yong.zhang0@gmail.com>
Return-Path: <yong.zhang@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Yong Zhang <yong.zhang0@gmail.com>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org, huawei.libin@huawei.com
Message-ID: <20140521053853.XK2HWd-VF03TlBsrfDzK842XBw_pc8xBSEEh91IIcxI@z>

Please check the V2 in which I add the reporter.
And thanks libin for reporting it :)

Thanks,
Yong

On Tue, May 20, 2014 at 04:09:04PM +0800, Yong Zhang wrote:
> From: Yong Zhang <yong.zhang@windriver.com>
> 
> asid_cache must be unsigned long otherwise on 64bit system
> it will become 0 if the value in get_new_mmu_context()
> reaches 0xffffffff and in the end the assumption of
> ASID_FIRST_VERSION is not true anymore thus leads to
> more dangerous things.
> 
> Signed-off-by: Yong Zhang <yong.zhang@windriver.com>
> ---
>  arch/mips/include/asm/cpu-info.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
> index f6299be..ebcc2ed 100644
> --- a/arch/mips/include/asm/cpu-info.h
> +++ b/arch/mips/include/asm/cpu-info.h
> @@ -40,7 +40,7 @@ struct cache_desc {
>  
>  struct cpuinfo_mips {
>  	unsigned int		udelay_val;
> -	unsigned int		asid_cache;
> +	unsigned long		asid_cache;
>  
>  	/*
>  	 * Capability and feature descriptor structure for MIPS CPU
> -- 
> 1.7.9.5
