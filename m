Received: from mail.kernel.org ([198.145.29.136]:33366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993015AbcJaVRVnlI60 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 31 Oct 2016 22:17:21 +0100
MIME-Version: 1.0
In-Reply-To: <20161031203951.5444-2-paul@crapouillou.net>
References: <20161030230247.20538-1-paul@crapouillou.net> <20161031203951.5444-1-paul@crapouillou.net>
 <20161031203951.5444-2-paul@crapouillou.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 31 Oct 2016 16:16:56 -0500
Message-ID: <CAL_Jsq+5=QXfCTux1S7ysu8J5qnzU5AXr-0xzRTifnUYtzaQOg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] Documentation: dt: Add binding info for jz4740-rtc driver
Content-Type: text/plain; charset=UTF-8
Return-Path: <robh+dt@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Cercueil <paul@crapouillou.net>
Cc: "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux@googlegroups.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Maarten ter Huurne <maarten@treewalker.org>, Lars-Peter Clausen <lars@metafoo.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
Message-ID: <20161031211656.TVZwfPYPK1fTTZa03gwW7cmD4Xve8_Jl8YExW8_3z3A@z>

On Mon, Oct 31, 2016 at 3:39 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> This commit adds documentation for the device-tree bindings of the
> jz4740-rtc driver, which supports the RTC unit present in the JZ4740 and
> JZ4780 SoCs from Ingenic.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  .../devicetree/bindings/rtc/ingenic,jz4740-rtc.txt | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt

Acked-by: Rob Herring <robh@kernel.org>
