Received: from smtp.codeaurora.org ([198.145.29.96]:57482 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991172AbeAZO4vJicWD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 26 Jan 2018 15:56:51 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: ssb: Do not disable PCI host on non-Mips
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <87vafpq7t2.fsf@turtle.gmx.de>
References: <87vafpq7t2.fsf@turtle.gmx.de>
Message-ID: <20180126145647.D8DD060A08@smtp.codeaurora.org>
Date: Fri, 26 Jan 2018 14:56:47 +0000 (UTC)
Return-Path: <kvalo@codeaurora.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Michael Buesch <m@bues.ch>, linux-wireless@vger.kernel.org, James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>James Hogan <jhogan@kernel.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Guenter Roeck <linux@roeck-us.net>
Message-ID: <20180126145647.EwaVT7xKBb-WEUo4c644dqod_7Sar0q9MtAsapLdSn8@z>

Sven Joachim <svenjoac@gmx.de> wrote:

> After upgrading an old laptop to 4.15-rc9, I found that the eth0 and
> wlan0 interfaces had disappeared.  It turns out that the b43 and b44
> drivers require SSB_PCIHOST_POSSIBLE which depends on
> PCI_DRIVERS_LEGACY, a config option that only exists on Mips.
> 
> Fixes: 58eae1416b80 ("ssb: Disable PCI host for PCI_DRIVERS_GENERIC")
> Cc: stable@vger.org
> Signed-off-by: Sven Joachim <svenjoac@gmx.de>
> Reviewed-by: James Hogan <jhogan@kernel.org>

Patch applied to wireless-drivers.git, thanks.

a9e6d44ddecc ssb: Do not disable PCI host on non-Mips

-- 
https://patchwork.kernel.org/patch/10185397/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
