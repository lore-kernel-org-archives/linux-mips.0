Received: from mail-ot1-f67.google.com ([209.85.210.67]:41113 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992328AbeIZVgcPYKX8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 26 Sep 2018 23:36:32 +0200
Date: Wed, 26 Sep 2018 16:36:24 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3 09/11] dt-bindings: add constants for
 Microsemi Ocelot SerDes driver
Message-ID: <20180926213624.GA13387@bogus>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <73113ea4b3d8d34c05d88413b3d15cc1733cf25e.1536912834.git-series.quentin.schulz@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73113ea4b3d8d34c05d88413b3d15cc1733cf25e.1536912834.git-series.quentin.schulz@bootlin.com>
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
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
Message-ID: <20180926213624.RAXscPq-uOfJNvSGCp86rg18-goHKhvKIUPFzv842Z8@z>

On Fri, 14 Sep 2018 10:16:07 +0200, Quentin Schulz wrote:
> The Microsemi Ocelot has multiple SerDes and requires that the SerDes be
> muxed accordingly to the hardware representation.
> 
> Let's add a constant for each SerDes available in the Microsemi Ocelot.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  include/dt-bindings/phy/phy-ocelot-serdes.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/phy/phy-ocelot-serdes.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
