Return-Path: <SRS0=ffv7=EM=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF14C2D0A3
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 13:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11E15208B3
	for <linux-mips@archiver.kernel.org>; Fri,  6 Nov 2020 13:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgKFNEN (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 6 Nov 2020 08:04:13 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42741 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgKFNEN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 08:04:13 -0500
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 57EBF2000E;
        Fri,  6 Nov 2020 13:04:11 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH 1/9] dt-bindings: mips: Add luton
In-Reply-To: <20201106100849.969240-2-gregory.clement@bootlin.com>
References: <20201106100849.969240-1-gregory.clement@bootlin.com> <20201106100849.969240-2-gregory.clement@bootlin.com>
Date:   Fri, 06 Nov 2020 14:04:11 +0100
Message-ID: <87a6vu8wms.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello

This patch is a leftover, the correct one is the other one. Actually the
only difference is using "Luton" instead of "luton" in the topic.

Gregory

Gregory CLEMENT <gregory.clement@bootlin.com> writes:

> Luton SoCs belongs to the same family as Ocelot.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
