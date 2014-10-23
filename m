Received: from mail-qa0-f46.google.com ([209.85.216.46]:56358 "EHLO
        mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011355AbaJWD0Ios0YQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 23 Oct 2014 05:26:08 +0200
Received: by mail-qa0-f46.google.com with SMTP id s7so139218qap.5
        for <linux-mips@linux-mips.org>; Wed, 22 Oct 2014 20:26:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+AuqTOU7UFdYi28YGjL1QorY=3zOSccN43Vb1a=q6SHw@mail.gmail.com>
References: <1413930186-23168-1-git-send-email-cernekee@gmail.com>
 <1413930186-23168-10-git-send-email-cernekee@gmail.com> <CAL_Jsq+AuqTOU7UFdYi28YGjL1QorY=3zOSccN43Vb1a=q6SHw@mail.gmail.com>
From: Kevin Cernekee <cernekee@gmail.com>
Date: Wed, 22 Oct 2014 20:25:42 -0700
Message-ID: <CAJiQ=7BrfnyOQYptBCTR8GP8hLq4+q1NQ2H988wHK=8PnkqLkg@mail.gmail.com>
Subject: Re: [PATCH V3 09/10] tty: serial: of-serial: Allow OF earlycon to
 default to "on"
Content-Type: text/plain; charset=UTF-8
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli <f.fainelli@gmail.com>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20141023032542.rscaTdf7atmBxLAqfd2tCyJdrksYkfwBR5i6gkgBRWk@z>

On Wed, Oct 22, 2014 at 2:27 AM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Oct 22, 2014 at 6:23 AM, Kevin Cernekee <cernekee@gmail.com> wrote:
>> On many development systems it is very common to see failures during the
>> early stages of the boot process, e.g. SMP boot or PCIe initialization.
>> This is one likely reason why some existing earlyprintk implementations,
>> such as arch/mips/kernel/early_printk.c, are enabled unconditionally
>> at compile time.
>>
>> Now that earlycon's operating parameters can be passed into the kernel
>> via DT, it is helpful to be able to configure the kernel to turn it on
>> automatically.  Introduce a new CONFIG_SERIAL_EARLYCON_FORCE option for
>> this purpose.
>
> You can already force this using the CMDLINE_EXTEND option. I'm not
> sure we need more options.

Hi Rob,

Now that earlycon can get all of its parameters from DT, do you think
it might make sense to drop the command line option entirely from
fdt.c and enable it all of the time if stdout-path is set correctly?
