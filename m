Return-Path: <SRS0=RFSC=IE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD35C433E0
	for <linux-mips@archiver.kernel.org>; Sat,  6 Mar 2021 08:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6485964FA8
	for <linux-mips@archiver.kernel.org>; Sat,  6 Mar 2021 08:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCFIHA (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 6 Mar 2021 03:07:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:48054 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhCFIGV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Mar 2021 03:06:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lIRx3-0004K9-03
        for linux-mips@vger.kernel.org; Sat, 06 Mar 2021 09:06:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B4A95C112A; Sat,  6 Mar 2021 09:06:02 +0100 (CET)
Date:   Sat, 6 Mar 2021 09:06:02 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: mips-next rebases to v5.12-rc2
Message-ID: <20210306080602.GD4744@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

just a head up I've rebased mips-next branch to v5.12-rc2 (and force pushed
the result).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
