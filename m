Received: from mail-ie0-f179.google.com ([209.85.223.179]:41422 "EHLO
        mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6822679Ab3KDIn1QoDF0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 4 Nov 2013 09:43:27 +0100
Received: by mail-ie0-f179.google.com with SMTP id aq17so11412078iec.24
        for <linux-mips@linux-mips.org>; Mon, 04 Nov 2013 00:43:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5273D9CD.2010800@gmail.com>
References: <1383076268-8984-1-git-send-email-s.nawrocki@samsung.com>
        <CACmBeS2TiiTJ_n0bEzXGKN8B=U9EKXeVtrE2q0jgxsxf5TBivw@mail.gmail.com>
        <5273D9CD.2010800@gmail.com>
Date: Mon, 4 Nov 2013 09:43:20 +0100
Message-ID: <CACmBeS3DhHnQR7Ze8oZVAC9HThmXR4n7f90yje+R=8uRq9Nvsg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: clock deregistration support
From: Jonas Jensen <jonas.jensen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <jonas.jensen@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, linux-mips@linux-mips.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-sh@vger.kernel.org, jiada_wang@mentor.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, laurent.pinchart@ideasonboard.com, uclinux-dist-devel@blackfin.uclinux.org
Message-ID: <20131104084320.h9-wQxYqcUdNp3bS0Hc_Y4c_ACU2tTm1yg7LO21kcTE@z>

On 1 November 2013 17:41, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> It is recommended to quote also human readable patch summary line,
> so it's more immediately clear which patch you refer to.

Sorry about that. This was tested on a clean (some added moxart
drivers but no other patches) next-20131031, reverting the following
patch:
"clkdev: Fix race condition in clock lookup from device tree" -
0b35b92fb3600a2f9ca114a6142db95f760d55f5

> Is the warning still triggered when you apply this patch:
> http://www.spinics.net/lists/arm-kernel/msg283550.html
> onto next-20131031 instead of reverting ?

After patch, the warning is no longer triggered.

Thanks,
Jonas
