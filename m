Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BE2C4361B
	for <linux-mips@archiver.kernel.org>; Sun, 20 Dec 2020 19:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C59EC23106
	for <linux-mips@archiver.kernel.org>; Sun, 20 Dec 2020 19:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgLTTcw (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 20 Dec 2020 14:32:52 -0500
Received: from elvis.franken.de ([193.175.24.41]:52271 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgLTTcw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Dec 2020 14:32:52 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kr4R8-0007EH-00
        for linux-mips@vger.kernel.org; Sun, 20 Dec 2020 20:32:10 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 697A1C0279; Sun, 20 Dec 2020 20:32:01 +0100 (CET)
Date:   Sun, 20 Dec 2020 20:32:01 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: CPUs with EVA support
Message-ID: <20201220193201.GA3184@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi;

I've started looking how to get rid of get_fs/set_fs for MIPS and
my current obstacle is EVA support.

Looking for CPUs supporting EVA I only found P5600, are there more ?

Does someone sell boards with an EVA enabled CPU ?

How good is EVA support in qemu ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
