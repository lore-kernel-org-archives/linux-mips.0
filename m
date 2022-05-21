Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38871C433EF
	for <linux-mips@archiver.kernel.org>; Sat, 21 May 2022 03:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241539AbiEUDAb (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 20 May 2022 23:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239452AbiEUDAa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 May 2022 23:00:30 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0A51195936;
        Fri, 20 May 2022 20:00:29 -0700 (PDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24L2lVGD004361;
        Fri, 20 May 2022 21:47:32 -0500
Message-ID: <f84c4cb17eebe385fe22c3fc4563645742269d46.camel@kernel.crashing.org>
Subject: Re: [PATCH net-next] eth: de4x5: remove support for Generic DECchip
 & DIGITAL EtherWORKS PCI/EISA
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        corbet@lwn.net, tsbogend@alpha.franken.de, mpe@ellerman.id.au,
        paulus@samba.org, sburla@marvell.com, vburru@marvell.com,
        aayarekar@marvell.com, arnd@arndb.de, zhangyue1@kylinos.cn,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org
Date:   Sat, 21 May 2022 12:47:31 +1000
In-Reply-To: <20220519031345.2134401-1-kuba@kernel.org>
References: <20220519031345.2134401-1-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2022-05-18 at 20:13 -0700, Jakub Kicinski wrote:
> Looks like almost all changes to this driver had been tree-wide
> refactoring since git era begun. There is one commit from Al
> 15 years ago which could potentially be fixing a real bug.
> 
> The driver is using virt_to_bus() and is a real magnet for pointless
> cleanups. It seems unlikely to have real users. Let's try to shed
> this maintenance burden.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Removing this driver will kill support for some rather old PowerMac
models (some PowerBooks I think, paulus would know). No objection on my
part, though. I doubt people still use these things with new kernels
but ... who knows ? :-)

Cheers,
Ben.

