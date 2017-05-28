Received: from mail-it0-x231.google.com ([IPv6:2607:f8b0:4001:c0b::231]:35731
        "EHLO mail-it0-x231.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993935AbdE1NwePDSdB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 28 May 2017 15:52:34 +0200
Received: by mail-it0-x231.google.com with SMTP id c15so16280524ith.0
        for <linux-mips@linux-mips.org>; Sun, 28 May 2017 06:52:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1495879129-28109-6-git-send-email-daniel.lezcano@linaro.org>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org> <1495879129-28109-6-git-send-email-daniel.lezcano@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 May 2017 15:52:27 +0200
Message-ID: <CACRpkda5za9vPJAsvD0FfgWLNep0hLpbhSZyuMgrT6QEGYQ-yA@mail.gmail.com>
Subject: Re: [PATCH 6/7] clocksource: Rename CLKSRC_OF to TIMER_OF
Content-Type: text/plain; charset="UTF-8"
Return-Path: <linus.walleij@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michal Simek <monstr@monstr.eu>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Message-ID: <20170528135227.qKUNGR7ActCP7fSm9wo6Wc5B5Jc0lAKWUAhop3FL9XA@z>

On Sat, May 27, 2017 at 11:58 AM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:

> The config option name is now renamed to 'TIMER_OF' for consistency with
> the CLOCKSOURCE_OF_DECLARE => TIMER_OF_DECLARE change.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

After fixing the offset thing found by Shawn:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
