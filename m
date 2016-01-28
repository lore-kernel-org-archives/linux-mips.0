Received: from mail-ig0-f193.google.com ([209.85.213.193]:33331 "EHLO
        mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011283AbcA1SAjmRFwq (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Jan 2016 19:00:39 +0100
MIME-Version: 1.0
In-Reply-To: <3596300.IYfzmako0c@wuerfel>
References: <569e1dbb.MgLv8OaZwklOxxtU%fengguang.wu@intel.com>
        <1947556.38OyJnvGS5@wuerfel>
        <20160127093018.GA21190@wfg-t540p.sh.intel.com>
        <3596300.IYfzmako0c@wuerfel>
Date: Thu, 28 Jan 2016 19:00:30 +0100
Message-ID: <CAMuHMdWCwP8Hkn+tGEoG-FxUnjAq8uExcPhmXASh_ErU8DDN2w@mail.gmail.com>
Subject: Re: [linux-review:James-Hogan/kbuild-Remove-stale-asm-generic-wrappers/20160119-183642]
 d979f99e9cc14e2667e9b6e268db695977e4197a BUILD DONE
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Fengguang Wu <fengguang.wu@intel.com>, James Hogan <james.hogan@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20160128180030.oePYhvBjQ_Rvof5incO7AlVdZ8YX27f7V4DEnnK6ykY@z>

Hi Arnd,

On Wed, Jan 27, 2016 at 10:44 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> - in some configurations, you end up without any boards selected, hitting
>   an #error in the final link

FWIW, I have a similar problem with m68k+MMU=y randconfig...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
