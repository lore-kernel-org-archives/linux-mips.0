Received: from mail1.windriver.com ([147.11.146.13]:38270 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1903394Ab2FSJcN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 Jun 2012 11:32:13 +0200
Date: Tue, 19 Jun 2012 17:32:00 +0800
From: Yong Zhang <yong.zhang@windriver.com>
Subject: Re: [PATCH V2 15/16] MIPS: Loongson 3: Add CPU Hotplug support.
Message-ID: <20120619093200.GC305@windriver.com>
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
Message-ID: <20120619093200.8CsyvfzbW8T7B-EEGXN2pKIk18OkzWArfCzsdN3Yq2c@z>

On Tue, Jun 19, 2012 at 02:50:23PM +0800, Huacai Chen wrote:
> +#ifdef CONFIG_HOTPLUG_CPU
> +
> +static DEFINE_SPINLOCK(smp_reserve_lock);

Do you really need this lock?

Thanks,
Yong
