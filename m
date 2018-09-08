Received: from mail.bootlin.com ([62.4.15.54]:48469 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23994059AbeIHIRjBHzYG (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 8 Sep 2018 10:17:39 +0200
Date: Sat, 8 Sep 2018 10:17:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 1/2] rtc: mips: default to rtc-cmos on mips
Message-ID: <20180908081723.GB2598@piout.net>
References: <20180828142724.4067857-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180828142724.4067857-1-arnd@arndb.de>
Return-Path: <alexandre.belloni@bootlin.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, keguang.zhang@gmail.com, y2038@lists.linaro.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Redfearn <matt.redfearn@mips.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On 28/08/2018 16:26:30+0200, Arnd Bergmann wrote:
> The old rtc driver is getting in the way of some compat_ioctl
> simplification. Looking up the loongson64 git history, it seems
> that everyone uses the more modern but compatible RTC_CMOS driver
> anyway, so let's remove the special case for loongson64.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/mips/Kconfig    | 2 +-
>  drivers/char/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
