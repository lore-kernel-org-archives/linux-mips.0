Received: from mail-wm0-f49.google.com ([74.125.82.49]:38581 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991960AbcIPNf6N9rWn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Sep 2016 15:35:58 +0200
Received: by mail-wm0-f49.google.com with SMTP id 1so42181063wmz.1
        for <linux-mips@linux-mips.org>; Fri, 16 Sep 2016 06:35:58 -0700 (PDT)
Message-ID: <1474032950.9425.12.camel@gmail.com>
Subject: Re: genirq: Setting trigger mode 0 for irq 11 failed
 (txx9_irq_set_type+0x0/0xb8)
From: Alban Browaeys <alban.browaeys@gmail.com>
Date: Fri, 16 Sep 2016 15:35:50 +0200
In-Reply-To: <57DBEBC8.7000209@arm.com>
References: <CAMuHMdVW1eTn20=EtYcJ8hkVwohaSuH_yQXrY2MGBEvZ8fpFOg@mail.gmail.com>
         <1473980577.17787.21.camel@gmail.com> <57DBA464.9010506@arm.com>
         <1474023805.17258.10.camel@gmail.com> <57DBEBC8.7000209@arm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: <alban.browaeys@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Marc Zyngier <marc.zyngier@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20160916133550.cJyPP_ENYKxW-1T5gpYaAGJkZ7gtol4ZC4FECkkQDu8@z>

Le vendredi 16 septembre 2016 à 13:55 +0100, Marc Zyngier a écrit :
> At that stage, I'm not sure I should care. Does the workaround make
> your
> platform usable?

However awkward this was all about logs and clearing worries. There was
no change in behavior  between the three cases : upstream, upstream
commit reverted and patched upstream.

Mind this hardware (the Odroid U2) has no hardware buttons. Only power
on plug.

Best regards,
Alban
