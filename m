Received: from mout.kundenserver.de ([212.227.126.131]:63878 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007931AbbLKMthpKq0S (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 11 Dec 2015 13:49:37 +0100
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 4/4] printk/nmi: Increase the size of NMI buffer and make it configurable
Date: Fri, 11 Dec 2015 13:47:59 +0100
Message-ID: <10841284.ycX60MmRhF@wuerfel>
In-Reply-To: <20151211124159.GB3729@pathway.suse.cz>
References: <1449667265-17525-1-git-send-email-pmladek@suse.com> <CAMuHMdXVgr58YjoePGrRbMyMncQ27f85prL7G5SpeHeNxoYrXQ@mail.gmail.com> <20151211124159.GB3729@pathway.suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Return-Path: <arnd@arndb.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-arm-kernel@lists.infradead.org
Cc: Petr Mladek <pmladek@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jiri Kosina <jkosina@suse.com>, Cris <linux-cris-kernel@axis.com>, linux-s390 <linux-s390@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, Ingo Molnar <mingo@redhat.com>, Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20151211124759.1Z6PYeyWmR8tTLKYQkHUrHh7bXh5wio--558ZGgH0Dw@z>

On Friday 11 December 2015 13:41:59 Petr Mladek wrote:
> diff --git a/init/Kconfig b/init/Kconfig
> index efcff25a112d..61cfd96a3c96 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -870,7 +870,7 @@ config NMI_LOG_BUF_SHIFT
>         int "Temporary per-CPU NMI log buffer size (12 => 4KB, 13 => 8KB)"
>         range 10 21
>         default 13
> -       depends on PRINTK && HAVE_NMI
> +       depends on PRINTK_NMI
>         help
>           Select the size of a per-CPU buffer where NMI messages are temporary
>           stored. They are copied to the main log buffer in a safe context
> 
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

I found this on linux-next as well today and came to the same conclusion.

	Arnd
