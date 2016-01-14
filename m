Received: from mail-io0-f180.google.com ([209.85.223.180]:36215 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007755AbcANIpt71hBm (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 14 Jan 2016 09:45:49 +0100
Received: by mail-io0-f180.google.com with SMTP id g73so251532251ioe.3
        for <linux-mips@linux-mips.org>; Thu, 14 Jan 2016 00:45:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8128014.DbbgBtKY3z@wuerfel>
References: <8128014.DbbgBtKY3z@wuerfel>
Date: Thu, 14 Jan 2016 09:45:44 +0100
Message-ID: <CACna6rwAUh+LTBAepMTy1ZT7QhRYFPFmP5wPxyyQVb29gFwQYg@mail.gmail.com>
Subject: Re: [PATCH] ssb: host_soc depends on sprom
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <zajec5@gmail.com>
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
Cc: Kalle Valo <kvalo@codeaurora.org>, Hauke Mehrtens <hauke@hauke-m.de>, Michael Buesch <m@bues.ch>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20160114084544.qh1R9Ro8WfQGcfHfWPKA65oN1aOdXyeuvX8jd2iKQww@z>

On 13 January 2016 at 23:51, Arnd Bergmann <arnd@arndb.de> wrote:
> Drivers that use the SSB sprom functionality typically 'select SSB_SPROM'
> from Kconfig, but CONFIG_SSB_HOST_SOC misses this, which results in
> a build failure unless at least one of the other drivers that selects
> it is enabled:
>
> drivers/built-in.o: In function `ssb_host_soc_get_invariants':
> (.text+0x459494): undefined reference to `ssb_fill_sprom_with_fallback'
>
> This adds the same select statement that is used elsewhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 541c9a84cd85 ("ssb: pick SoC invariants code from MIPS BCM47xx arch")

I missed this dependency, thanks, patch looks OK.
