Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B1BC04FE2
	for <linux-mips@archiver.kernel.org>; Tue,  8 Aug 2023 16:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjHHQYp (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbjHHQXL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 12:23:11 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3D569EF3;
        Tue,  8 Aug 2023 08:49:38 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 57C369200C6; Tue,  8 Aug 2023 17:31:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 4DBE59200C5;
        Tue,  8 Aug 2023 16:31:43 +0100 (BST)
Date:   Tue, 8 Aug 2023 16:31:43 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Yuan Tan <tanyuan@tinylab.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@weissschuh.net, w@1wt.eu, falcon@tinylab.org
Subject: Re: [RFC 0/1] mips: malta: Select PCI_QUIRKS if POWER_RESET_PIIX4_POWEROFF
 is enabled
In-Reply-To: <cover.1690968173.git.tanyuan@tinylab.org>
Message-ID: <alpine.DEB.2.21.2308081628470.38537@angie.orcam.me.uk>
References: <cover.1690968173.git.tanyuan@tinylab.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2 Aug 2023, Yuan Tan wrote:

> I just found that the on QEMU Malta, POWER_RESET_PIIX4_POWEROFF relay on
> PCI_QUIRKS to work, or else the reboot will hang.

 I'll check if it is reproducible with actual hardware, otherwise it might 
be an issue to fix in QEMU.

  Maciej
