Received: from mail-io0-f193.google.com ([209.85.223.193]:35790 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27027725AbcD1RvMZ3Icr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Apr 2016 19:51:12 +0200
MIME-Version: 1.0
In-Reply-To: <20160428164856.10120.qmail@ns.horizon.com>
References: <1461843824-19853-1-git-send-email-zengzhaoxiu@163.com>
        <20160428164856.10120.qmail@ns.horizon.com>
Date: Thu, 28 Apr 2016 19:51:06 +0200
Message-ID: <CAMuHMdU2e2PdwKYVaEsJ73X8Di1XHNPqnxuunr8R8bN8udazxw@mail.gmail.com>
Subject: Re: [patch V3] lib: GCD: add binary GCD algorithm
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
To: George Spelvin <linux@horizon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, zengzhaoxiu@163.com, Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, James Hogan <james.hogan@imgtec.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Jonas Bonn <jonas@southpole.se>, Lennox Wu <lennox.wu@gmail.com>, Ley Foon Tan <lftan@altera.com>, alpha <linux-alpha@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:METAG ARCHITECTURE" <linux-metag@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, linux <linux@lists.openrisc.net>, Chen Liqin <liqin.linux@gmail.com>, Matt Turner <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>, nios2-dev@lists.rocketboards.org, Ralf Baechle <ralf@linux-mips.org>, Richard Henderson <rth@twiddle.net>, sparclinux <sparclinux@vger.kernel.org>, uclinux-h8-devel@lists.sourceforge.jp, Yoshinori Sato <ysato@users.sourceforge.jp>, zhaoxiu.zeng@gmail.com
Message-ID: <20160428175106.rwigue8ZdRWD_eq5c40A9U933fCSBNM4mumx69tGjl8@z>

On Thu, Apr 28, 2016 at 6:48 PM, George Spelvin <linux@horizon.com> wrote:
> Another few comments:
>
> 1. Would ARCH_HAS_FAST_FFS involve fewer changes than CPU_NO_EFFICIENT_FFS?

No, as you want to _disable_ ARCH_HAS_FAST_FFS / _enable_
CPU_NO_EFFICIENT_FFS as soon as you're enabling support for a
CPU that doesn't support it.

Logical OR is easier in both the Kconfig and C preprocessor languages
than logical NAND.

E.g. in Kconfig, a CPU core not supporting it can just select
CPU_NO_EFFICIENT_FFS.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
