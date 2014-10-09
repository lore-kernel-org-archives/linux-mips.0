Received: from mail-la0-f41.google.com ([209.85.215.41]:55852 "EHLO
        mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27010929AbaJILbsYrKbi (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Oct 2014 13:31:48 +0200
Received: by mail-la0-f41.google.com with SMTP id pn19so972930lab.14
        for <linux-mips@linux-mips.org>; Thu, 09 Oct 2014 04:31:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1412659726-29957-2-git-send-email-linux@roeck-us.net>
References: <1412659726-29957-1-git-send-email-linux@roeck-us.net>
        <1412659726-29957-2-git-send-email-linux@roeck-us.net>
Date: Thu, 9 Oct 2014 13:31:40 +0200
Message-ID: <CAMuHMdVOBnZ=pyVeGSxbOT9MtRR2iNY4V-PUm0NU=UFQ2pxE_g@mail.gmail.com>
Subject: Re: [PATCH 01/44] kernel: Add support for poweroff handler call chain
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
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "adi-buildroot-devel@lists.sourceforge.net" <adi-buildroot-devel@lists.sourceforge.net>, driverdevel <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lguest@lists.ozlabs.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, "moderated list:PANASONIC MN10300..." <linux-am33-list@redhat.com>, Cris <linux-cris-kernel@axis.com>, linux-efi@vger.kernel.org, "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, linux-m32r-ja@ml.linux-m32r.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, openipmi-developer@lists.sourceforge.net, uml-devel <user-mode-linux-devel@lists.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-c6x-dev@linux-c6x.org, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:METAG ARCHITECTURE" <linux-metag@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Parisc List <linux-parisc@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, Heiko Stuebner <heiko@sntech.de>, Romain Perier <romain.perier@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, Alexander Graf <agraf@suse.de>
Message-ID: <20141009113140.r7NTympHg9M-XC8FZRoNMZAMORyWxPvcjA4s-NN9D00@z>

On Tue, Oct 7, 2014 at 7:28 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> +int register_poweroff_handler_simple(void (*handler)(void), int priority)
> +{
> +       char symname[KSYM_NAME_LEN];
> +
> +       if (poweroff_handler_data.handler) {
> +               lookup_symbol_name((unsigned long)poweroff_handler_data.handler,
> +                                  symname);
> +               pr_warn("Poweroff function already registered (%s)", symname);
> +               lookup_symbol_name((unsigned long)handler, symname);
> +               pr_cont(", cannot register %s\n", symname);

Doesn't %ps work to look up symbols?

pr_warn("Poweroff function already registered (%ps), cannot register
%ps\n", poweroff_handler_data.handler, handler);

> +               return -EBUSY;
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
