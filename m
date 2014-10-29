Received: from mailapp01.imgtec.com ([195.59.15.196]:37520 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011935AbaJ2LBttSM-K (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 29 Oct 2014 12:01:49 +0100
Message-ID: <5450C915.9030600@imgtec.com>
Date: Wed, 29 Oct 2014 11:01:41 +0000
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
Message-ID: <20141029110141.1pAmErPg6T7FuZxmJM8SPt9aWv6_5pegCW7LBv4byzc@z>

On 10/29/2014 12:12 AM, Andrew Bresticker wrote:
> +- mti,available-cpu-vectors : Specifies the list of CPU interrupt vectors
> +  to which the GIC may route interrupts.  May contain up to 6 entries, one
> +  for each of the CPU's hardware interrupt vectors.  Valid values are 2 - 7.
> +  This property is ignored if the CPU is started in EIC mode.
> +

Wouldn't it be better to have this in the reversed sense ie: 
mti,nonavailable-cpu-vectors? I think the assumption that by default 
they're all available unless something else is connected to them which 
is unlikely in most cases. It can be made optional property then.

I don't have a strong opinion about it though.

Qais
