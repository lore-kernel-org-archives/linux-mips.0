Received: from outils.crapouillou.net ([89.234.176.41]:41364 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993997AbeHURQuqRuoD (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Aug 2018 19:16:50 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v7 00/24] TCU patchset v7
Date: Tue, 21 Aug 2018 19:16:11 +0200
Message-ID: <20180821171635.22740-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-Path: <paul@crapouillou.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Jonathan Corbet <corbet@lwn.net>
Cc: od@zcrc.me, Mathieu Malaterre <malat@debian.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-mips@linux-mips.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Message-ID: <20180821171611.zlnbm1Uxl9wsk-RfePv9ey4dY5nQfXLGsoXLYcYjSOg@z>

Hi,

This is the v7 of my patchset that adds support for the Timer/Counter
Unit in Ingenic JZ47xx SoCs.
