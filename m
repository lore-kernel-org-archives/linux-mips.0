Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCEEC433EF
	for <linux-mips@archiver.kernel.org>; Fri,  3 Sep 2021 09:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB01860F56
	for <linux-mips@archiver.kernel.org>; Fri,  3 Sep 2021 09:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242775AbhICJO6 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 3 Sep 2021 05:14:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:34314 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233277AbhICJO6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Sep 2021 05:14:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mM5Gl-0003IA-00
        for linux-mips@vger.kernel.org; Fri, 03 Sep 2021 11:13:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 53EBEC0A09; Fri,  3 Sep 2021 11:13:48 +0200 (CEST)
Date:   Fri, 3 Sep 2021 11:13:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: Docs for Octeon XL cards
Message-ID: <20210903091348.GA5664@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

does anybody have docs for the Cavium OCTEON XL cards ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
