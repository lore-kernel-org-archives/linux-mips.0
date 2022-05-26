Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F044C433F5
	for <linux-mips@archiver.kernel.org>; Thu, 26 May 2022 07:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346342AbiEZHnt (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 26 May 2022 03:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbiEZHns (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 May 2022 03:43:48 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B32A0D04
        for <linux-mips@vger.kernel.org>; Thu, 26 May 2022 00:43:46 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:6498:8099:cb9:b18e])
        by michel.telenet-ops.be with bizsmtp
        id bKjX2700H0qhjiN06KjXSy; Thu, 26 May 2022 09:43:43 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nu89a-001en6-FJ; Thu, 26 May 2022 09:43:30 +0200
Date:   Thu, 26 May 2022 09:43:30 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
        netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        corbet@lwn.net, tsbogend@alpha.franken.de, mpe@ellerman.id.au,
        paulus@samba.org, sburla@marvell.com, vburru@marvell.com,
        aayarekar@marvell.com, arnd@arndb.de, zhangyue1@kylinos.cn,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip
 & DIGITAL EtherWORKS PCI/EISA
In-Reply-To: <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
Message-ID: <alpine.DEB.2.22.394.2205260933520.394690@ramsan.of.borg>
References: <20220519031345.2134401-1-kuba@kernel.org> <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

 	Hi Ben,

On Sat, 21 May 2022, Benjamin Herrenschmidt wrote:
> On Wed, 2022-05-18 at 20:13 -0700, Jakub Kicinski wrote:
>> Looks like almost all changes to this driver had been tree-wide
>> refactoring since git era begun. There is one commit from Al
>> 15 years ago which could potentially be fixing a real bug.
>>
>> The driver is using virt_to_bus() and is a real magnet for pointless
>> cleanups. It seems unlikely to have real users. Let's try to shed
>> this maintenance burden.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>
> Removing this driver will kill support for some rather old PowerMac
> models (some PowerBooks I think, paulus would know). No objection on my
> part, though. I doubt people still use these things with new kernels
> but ... who knows ? :-)

Aren't these PCI, and thus working fine with the PCI-only DE2104X
(dc2104x) or TULIP (dc2114x) drivers?

IIRC, I've initially used the de4x5 driver on Alpha (UDB/Multia) or PPC
(CHRP), but switched to the TULIP driver later (that was before the
dc2104x/dc2114x driver split, hence a loooong time ago).

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
