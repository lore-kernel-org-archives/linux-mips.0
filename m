Received: from mail-it0-x244.google.com ([IPv6:2607:f8b0:4001:c0b::244]:35551
        "EHLO mail-it0-x244.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990924AbdGRMB0ZfzxZ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Jul 2017 14:01:26 +0200
Received: by mail-it0-x244.google.com with SMTP id v193so1914138itc.2
        for <linux-mips@linux-mips.org>; Tue, 18 Jul 2017 05:01:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170718101730.2541-1-jonas.gorski@gmail.com>
References: <20170718101730.2541-1-jonas.gorski@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jul 2017 14:01:19 +0200
Message-ID: <CAMuHMdUQgZcgj88EnVDvbwcZniWJi-5XjVTmoeVrBJXsuqUUFQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] make clk_get_rate implementations behavior more consistent
Content-Type: text/plain; charset="UTF-8"
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, bcm-kernel-feedback-list@broadcom.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20170718120119.fwHUUm6jGB5cPIZrN2wI7KoBVNb-C2JlKvuYkgA5eaE@z>

Hi Jonas,

On Tue, Jul 18, 2017 at 12:17 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> The common clock and several other clock API implementations allow
> calling clk_get_rate with a NULL pointer. While not specified as
> expected behavior of the API, device drivers have come to rely on that,
> causing them to OOPS when run on a platform with a different clock API
> implementation.
>
> Fix this by making sure all clk_get_rate implementations handle
> NULL clocks instead of OOPSing.
>
> While some custom implementations even allow ERR_PTR()s, I decided
> against that as IIRC the usual idea is that errors should be handled and
> not silently carried over.
>
> Cc: adi-buildroot-devel@lists.sourceforge.net
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@linux-mips.org
>
> Jonas Gorski (9):
>   ARM: ep93xx: allow NULL clock for clk_get_rate
>   ARM: mmp: allow NULL clock for clk_get_rate
>   blackfin: bf609: allow NULL clock for clk_get_rate
>   m68k: allow NULL clock for clk_get_rate
>   MIPS: AR7: allow NULL clock for clk_get_rate
>   MIPS: BCM63XX: allow NULL clock for clk_get_rate
>   MIPS: Loongson 2F: allow NULL clock for clk_get_rate
>   MIPS: ralink: allow NULL clock for clk_get_rate
>   unicore32: allow NULL clock for clk_get_rate
>
>  arch/arm/mach-ep93xx/clock.c           | 3 +++
>  arch/arm/mach-mmp/clock.c              | 4 +++-
>  arch/blackfin/mach-bf609/clock.c       | 2 +-
>  arch/m68k/coldfire/clk.c               | 3 +++
>  arch/mips/ar7/clock.c                  | 3 +++
>  arch/mips/bcm63xx/clk.c                | 3 +++
>  arch/mips/loongson64/lemote-2f/clock.c | 3 +++
>  arch/mips/ralink/clk.c                 | 3 +++
>  arch/unicore32/kernel/clock.c          | 3 +++
>  9 files changed, 25 insertions(+), 2 deletions(-)

For the whole series:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
