Received: from mail-pa0-f66.google.com ([209.85.220.66]:36132 "EHLO
        mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992974AbcHPKwEDNcUa convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 16 Aug 2016 12:52:04 +0200
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [v3 3/5] MIPS: BMIPS: Add support SDHCI device nodes
From: Jaedon Shin <jaedon.shin@gmail.com>
In-Reply-To: <2d8ad754-e9b7-e80e-9925-15ccd9c15856@gmail.com>
Date: Tue, 16 Aug 2016 19:51:56 +0900
Content-Transfer-Encoding: 8BIT
Message-ID: <68351690-87EA-44E4-A6D3-6BB298855F5B@gmail.com>
References: <20160812085231.53290-1-jaedon.shin@gmail.com> <20160812085231.53290-4-jaedon.shin@gmail.com> <2d8ad754-e9b7-e80e-9925-15ccd9c15856@gmail.com>
Return-Path: <jaedon.shin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Jonas Gorski <jonas.gorski@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh+dt@kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>
Message-ID: <20160816105156.0-GFyAEq1KWWg_F8-5BTB2ATOr3HG0cfiDG8oN2mpXc@z>

Hi Florian,

On Aug 13, 2016, at 8:24 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
> On 08/12/2016 01:52 AM, Jaedon Shin wrote:
>> Adds SDHCI device nodes to BCM7xxx MIPS based SoCs.
> 
> While this looks good, I don't think you will have working SDHCI
> interfaces on the 7425/7435 without additional pinmuxing, because
> sometimes the bootloader indicates in a scratch register whether the
> SDHCI0 is usable and the default pinmuxing does not necessarily make
> this possible:
> 
> https://github.com/Broadcom/stblinux-3.3/blob/master/linux/drivers/brcmstb/board.c#L325
> 
> We have some currently out of tree patches using the pinctrl-single and
> some CFE shim to fix that.
> 
> Other than that:
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> -- 
> Florian

Sure, It is need to set pinmux, scratch register, endian and avoid broken enable, but I
think that is CFE's role. (eg. BCM7346 should be set the endian while run in little
endian mode) If we cannot update the CFE, we should consider adding sun_top_ctrl_pin_mux
and aon_pin_ctrl_pin_mux_ctrl in device tree with counterpart and endian patch in
sdhci-brcmstb.

Anyway, that's not the work of device tree.

Thanks,
Jaedon 
