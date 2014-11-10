Received: from mail-pd0-f176.google.com ([209.85.192.176]:50485 "EHLO
        mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27011908AbaKJWALwkvHS (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 10 Nov 2014 23:00:11 +0100
Received: by mail-pd0-f176.google.com with SMTP id ft15so8662308pdb.21
        for <linux-mips@linux-mips.org>; Mon, 10 Nov 2014 14:00:05 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH V4 04/14] genirq: Generic chip: Add big endian I/O accessors
References: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
        <1415342669-30640-5-git-send-email-cernekee@gmail.com>
Date: Mon, 10 Nov 2014 14:00:02 -0800
In-Reply-To: <1415342669-30640-5-git-send-email-cernekee@gmail.com> (Kevin
        Cernekee's message of "Thu, 6 Nov 2014 22:44:19 -0800")
Message-ID: <7hy4riogwt.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <khilman@deeprootsystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, linux-sh@vger.kernel.org, arnd@arndb.de, f.fainelli@gmail.com, ralf@linux-mips.org, sergei.shtylyov@cogentembedded.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, Olof Johansson <olof@lixom.net>Arnd Bergmann <arnd@arndb.de>
Message-ID: <20141110220002.vINaVSXPRoOLxbAa5x3tpEJXOsc_ATn0iyT4OBFAkUo@z>

Kevin Cernekee <cernekee@gmail.com> writes:

> Use io{read,write}32be if the caller specified IRQ_GC_BE_IO when creating
> the irqchip.
>
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

I bisected a couple ARM boot failures in next-20141110 on atmel sama5 platforms down to
this patch, though I'm not quite yet sure how it's causing the failure.
I'm not getting any console output, so haven't been able to dig deeper
yet.  Maybe the atmel maintainers (Cc'd) can help dig.

I've confirmed that reverting $SUBJECT patch (commit
b79055952badbd73710685643bab44104f2509ea2) on top of next-20141110 gets
things booting again.

Also, it only happens with sama5_defconfig, not with multi_v7_defconfig.

Kevin
