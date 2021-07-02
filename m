Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F83C07E95
	for <linux-mips@archiver.kernel.org>; Fri,  2 Jul 2021 20:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B416A613D1
	for <linux-mips@archiver.kernel.org>; Fri,  2 Jul 2021 20:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhGBUlS (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 2 Jul 2021 16:41:18 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:37940 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbhGBUlS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jul 2021 16:41:18 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id E7ABC4D252307;
        Fri,  2 Jul 2021 13:38:44 -0700 (PDT)
Date:   Fri, 02 Jul 2021 13:38:40 -0700 (PDT)
Message-Id: <20210702.133840.5173140215999788.davem@davemloft.net>
To:     o.rempel@pengutronix.de
Cc:     andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
        olteanv@gmail.com, kuba@kernel.org, linux@armlinux.org.uk,
        kernel@pengutronix.de, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/6] ar9331: mainline some parts of switch
 functionality 
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20210702101751.13168-1-o.rempel@pengutronix.de>
References: <20210702101751.13168-1-o.rempel@pengutronix.de>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Fri, 02 Jul 2021 13:38:45 -0700 (PDT)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Please resubmit this when net-next opens up again.

Thank you.
