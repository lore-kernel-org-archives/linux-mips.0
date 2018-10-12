Received: from mail-ot1-f68.google.com ([209.85.210.68]:35900 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993973AbeJLUOqQ01fp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 12 Oct 2018 22:14:46 +0200
Date: Fri, 12 Oct 2018 15:14:38 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC v2 4/7] dt-binding: timer: Document RTL8186 SoC DT bindings
Message-ID: <20181012201438.GA21356@bogus>
References: <20181001102952.7913-1-yasha.che3@gmail.com>
 <20181001102952.7913-5-yasha.che3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181001102952.7913-5-yasha.che3@gmail.com>
Return-Path: <robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Yasha Cherikovsky <yasha.che3@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20181012201438.x9QeKL-zrzYXnfiq4aZAo_UIiP_90vfHVKhqsnoMtnE@z>

On Mon,  1 Oct 2018 13:29:49 +0300, Yasha Cherikovsky wrote:
> This patch adds device tree binding doc for the
> Realtek RTL8186 SoC timer controller.
> 
> Signed-off-by: Yasha Cherikovsky <yasha.che3@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/timer/realtek,rtl8186-timer.txt    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/realtek,rtl8186-timer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
