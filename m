Received: from mail-it0-f65.google.com ([209.85.214.65]:37285 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23991947AbeIQFqBJJLSf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 17 Sep 2018 07:46:01 +0200
Message-ID: <5b9f3f92.1c69fb81.9131a.468f@mx.google.com>
Date: Mon, 17 Sep 2018 01:45:52 -0400
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next 1/7] dt-bindings: net: vsc8531: add two additional LED modes for VSC8584
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com> <f54f6cda7f505d99531e33626f8d4e6f1dc084ec.1536916714.git-series.quentin.schulz@bootlin.com>
In-Reply-To: <f54f6cda7f505d99531e33626f8d4e6f1dc084ec.1536916714.git-series.quentin.schulz@bootlin.com>
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
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
Message-ID: <20180917054552.vwW0CaADmfHNEzcW1T6qEPPjFlpc3MpWJ8qBEuIP6_o@z>

On Fri, 14 Sep 2018 11:44:22 +0200, Quentin Schulz wrote:
> The VSC8584 (and most likely other PHYs in the same generation) has two
> additional LED modes that can be picked, so let's add them.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  include/dt-bindings/net/mscc-phy-vsc8531.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
