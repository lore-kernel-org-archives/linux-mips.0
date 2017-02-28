Received: from mail-qk0-x242.google.com ([IPv6:2607:f8b0:400d:c09::242]:35981
        "EHLO mail-qk0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993177AbdB1U3eG2LzN (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Feb 2017 21:29:34 +0100
Received: by mail-qk0-x242.google.com with SMTP id u188so5616550qkc.3
        for <linux-mips@linux-mips.org>; Tue, 28 Feb 2017 12:29:34 -0800 (PST)
Subject: Re: [PATCH] soc: bcm: brcmstb: Match additional compatible strings
References: <20170215004159.11096-1-florian.fainelli@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3df8fb67-1809-3781-6f7b-b1057b137f40@gmail.com>
Date: Tue, 28 Feb 2017 12:29:25 -0800
MIME-Version: 1.0
In-Reply-To: <20170215004159.11096-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <f.fainelli@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Justin Chen <justin.chen@broadcom.com>, Scott Branden <scott.branden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20170228202925.NmTz3YI4amn8aYhEiyx5SvUBKl7G2ar4ms8sANx_qYM@z>

On 02/14/2017 04:41 PM, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> Match all known sun-top-ctrl compatible strings from our MIPS chips
> counterparts. This allows us to properly report the SoC information to
> user-space through our SoC driver.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.

> ---
> Ralf, James,
> 
> I usually take patches touching this file through an ARM SoC pull request,
> posting to linux-mips for people working on BMIPS STB to get a chance to review
> this.
> 
> Thanks!
-- 
Florian
