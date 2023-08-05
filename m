Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D4CC001DB
	for <linux-mips@archiver.kernel.org>; Sat,  5 Aug 2023 13:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjHENPR (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 5 Aug 2023 09:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjHENPQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Aug 2023 09:15:16 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C1DBC10C4
        for <linux-mips@vger.kernel.org>; Sat,  5 Aug 2023 06:15:15 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id D2D0492009C; Sat,  5 Aug 2023 15:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id CC93E92009B;
        Sat,  5 Aug 2023 14:15:13 +0100 (BST)
Date:   Sat, 5 Aug 2023 14:15:13 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Florian Fainelli <f.fainelli@gmail.com>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: soft and hard float n32 and n64 binaries getting illegal
 instructions on Cobalt Qube2
In-Reply-To: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com>
Message-ID: <alpine.DEB.2.21.2308051412570.38537@angie.orcam.me.uk>
References: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

> Unfortunately gdb also produces the same illegal instruction so I have not
> been able to get much debug so far, any hints or clues as to what could be
> wrong?

 No clue, but would you be able to get a core dump of a failing program?  
This would indicate what instruction has caused an issue and where, and 
then we can take it from there.

  Maciej
