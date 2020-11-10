Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBB1C388F7
	for <linux-mips@archiver.kernel.org>; Tue, 10 Nov 2020 12:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4D6220781
	for <linux-mips@archiver.kernel.org>; Tue, 10 Nov 2020 12:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKJM3i (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 10 Nov 2020 07:29:38 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48017 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJM3i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 07:29:38 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D02B6C000D;
        Tue, 10 Nov 2020 12:29:35 +0000 (UTC)
Date:   Tue, 10 Nov 2020 13:29:35 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: mips: Add Luton
Message-ID: <20201110122935.GD1769536@piout.net>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
 <20201110114508.1197652-2-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-2-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2020 12:45:00+0100, Gregory CLEMENT wrote:
> Luton SoC belongs to the same family as Ocelot.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/mips/mscc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mips/mscc.txt b/Documentation/devicetree/bindings/mips/mscc.txt
> index bc817e984628..cc93fd302553 100644
> --- a/Documentation/devicetree/bindings/mips/mscc.txt
> +++ b/Documentation/devicetree/bindings/mips/mscc.txt
> @@ -4,7 +4,7 @@ Boards with a SoC of the Microsemi MIPS family shall have the following
>  properties:
>  
>  Required properties:
> -- compatible: "mscc,ocelot"
> +- compatible: "mscc,ocelot" or "mscc,luton"
>  
>  
>  * Other peripherals:
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
