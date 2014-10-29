Received: from mailapp01.imgtec.com ([195.59.15.196]:53041 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011908AbaJ2LJxaH9OV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Oct 2014 12:09:53 +0100
Message-ID: <5450CAF9.3040902@imgtec.com>
Date: Wed, 29 Oct 2014 11:09:45 +0000
From: Qais Yousef <qais.yousef@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH V3 2/4] of: Add binding document for MIPS GIC
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org> <1414541562-10076-3-git-send-email-abrestic@chromium.org>
In-Reply-To: <1414541562-10076-3-git-send-email-abrestic@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Qais.Yousef@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Bresticker <abrestic@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20141029110945.3wduqUExvvMAKtT0AzNAVWz8DHKhHwUc9VRR4KHxs5A@z>

On 10/29/2014 12:12 AM, Andrew Bresticker wrote:
> +- reg : Base address and length of the GIC registers.
>

Also except for sead3, the base address should be properly reported by 
the hardware. The size is fixed (for a specific version of GIC at least 
- which is also reported by the hardware). So it would be nice to make 
this optional.

Qais
