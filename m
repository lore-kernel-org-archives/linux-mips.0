Received: from mail-io0-f181.google.com ([209.85.223.181]:33288 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006151AbcCGJBPb8E6P (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 7 Mar 2016 10:01:15 +0100
Received: by mail-io0-f181.google.com with SMTP id n190so124596996iof.0
        for <linux-mips@linux-mips.org>; Mon, 07 Mar 2016 01:01:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1457340934-23042-1-git-send-email-geert@linux-m68k.org>
References: <1457340934-23042-1-git-send-email-geert@linux-m68k.org>
Date: Mon, 7 Mar 2016 10:01:09 +0100
Message-ID: <CAMuHMdWe9bTjp-qmTJc9=n9-iP-qH8-O0jafiRD3-y_EtT=WvA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v4.5-rc7
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
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
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20160307090109.iyIAC9ZtKbQlWTyeLpxdroWMAliaIIUtajstZE3KyXQ@z>

On Mon, Mar 7, 2016 at 9:55 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v4.5-rc7[1] to v4.5-rc6[3], the summaries are:
>   - build errors: +8/-7
  + error: debugfs.c: undefined reference to `clk_round_rate':  =>
.text+0x11b9e0)

arm-randconfig

While looking for more context, I noticed another regression that fell through
the cracks of my script:

    arch/arm/kernel/head.o: In function `stext':
    (.head.text+0x40): undefined reference to `CONFIG_PHYS_OFFSET'
    drivers/built-in.o: In function `v4l2_clk_set_rate':
    debugfs.c:(.text+0x11b9e0): undefined reference to `clk_round_rate'

  + error: misc.c: undefined reference to `ftrace_likely_update':  =>
.text+0x714), .text+0x94c), .text+0x3b8), .text+0xc10)

sh-randconfig

    arch/sh/boot/compressed/misc.o: In function `lzo1x_decompress_safe':
    misc.c:(.text+0x3b8): undefined reference to `ftrace_likely_update'
    misc.c:(.text+0x714): undefined reference to `ftrace_likely_update'
    misc.c:(.text+0x94c): undefined reference to `ftrace_likely_update'
    arch/sh/boot/compressed/misc.o: In function `unlzo.constprop.2':
    misc.c:(.text+0xc10): undefined reference to `ftrace_likely_update'

  + /tmp/cc52LvuK.s: Error: can't resolve `_start' {*UND* section} -
`L0^A' {.text section}:  => 41, 403
  + /tmp/ccHfoDA4.s: Error: can't resolve `_start' {*UND* section} -
`L0^A' {.text section}:  => 43
  + /tmp/cch1r0UQ.s: Error: can't resolve `_start' {*UND* section} -
`L0^A' {.text section}:  => 49, 378
  + /tmp/ccoHdFI8.s: Error: can't resolve `_start' {*UND* section} -
`L0^A' {.text section}:  => 43

mips-allnoconfig
bigsur_defconfig
malta_defconfig
cavium_octeon_defconfig

Not really new, but it would be great if the MIPS people could get this
fixed for the final release.

Thanks!

> [1] http://kisskb.ellerman.id.au/kisskb/head/10011/ (all 262 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/head/9974/ (all 262 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
