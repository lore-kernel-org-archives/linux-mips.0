Received: from mail-pf0-f182.google.com ([209.85.192.182]:34685 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026949AbcDRVXQ5O50i (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Apr 2016 23:23:16 +0200
Received: by mail-pf0-f182.google.com with SMTP id c20so84551515pfc.1
        for <linux-mips@linux-mips.org>; Mon, 18 Apr 2016 14:23:16 -0700 (PDT)
Subject: Re: [PATCH v2] bus: brcmstb_gisb: Rework dependencies
References: <1460839575-16869-1-git-send-email-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <57154FBD.9080903@gmail.com>
Date: Mon, 18 Apr 2016 14:21:01 -0700
MIME-Version: 1.0
In-Reply-To: <1460839575-16869-1-git-send-email-f.fainelli@gmail.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@linux-mips.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Punit Agrawal <punit.agrawal@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, "open list:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, open list <linux-kernel@vger.kernel.org>
Message-ID: <20160418212101.rsLNFXX1gRAHAPpZUcA1L-pAQSy-0IHwY-bBA9gswPU@z>

On 16/04/16 13:46, Florian Fainelli wrote:
> Do not have the machine Kconfig entry point need to select
> BRCMSTB_GISB_ARB, instead, just let it be default ARCH_BRCMSTB which is
> a better way to deal with this. While at it, also make it default
> BMIPS_GENERIC so the legacy MIPS-based STB platforms can benefit from
> the same thing.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to drivers/next
-- 
Florian
