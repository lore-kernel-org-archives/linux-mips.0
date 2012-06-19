Received: from mail1.windriver.com ([147.11.146.13]:38255 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1903394Ab2FSJb3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Jun 2012 11:31:29 +0200
Date: Tue, 19 Jun 2012 17:31:13 +0800
From: Yong Zhang <yong.zhang@windriver.com>
Subject: Re: [PATCH V2 15/16] MIPS: Loongson 3: Add CPU Hotplug support.
Message-ID: <20120619093113.GB305@windriver.com>
Reply-To: Yong Zhang <yong.zhang@windriver.com>
References: <1340088624-25550-1-git-send-email-chenhc@lemote.com>
 <1340088624-25550-16-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1340088624-25550-16-git-send-email-chenhc@lemote.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Huacai Chen <chenhuacai@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, Huacai Chen <chenhc@lemote.com>, Hongliang Tao <taohl@lemote.com>, Hua Yan <yanh@lemote.com>
Message-ID: <20120619093113.IW8A3Zp_pEJvsWUuAKKmrJXRpOwBuNR21nhM5ptymbk@z>

On Tue, Jun 19, 2012 at 02:50:23PM +0800, Huacai Chen wrote:
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index e9a5fd7..69b17a9 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -72,9 +72,7 @@ void __noreturn cpu_idle(void)
>  			}
>  		}
>  #ifdef CONFIG_HOTPLUG_CPU
> -		if (!cpu_online(cpu) && !cpu_isset(cpu, cpu_callin_map) &&
> -		    (system_state == SYSTEM_RUNNING ||
> -		     system_state == SYSTEM_BOOTING))
> +		if (!cpu_online(cpu) && !cpu_isset(cpu, cpu_callin_map))
>  			play_dead();

I think patch like this should be separated from BSP code.

BTW, what's the story behind this change?

Thanks,
Yong
