Return-Path: <SRS0=Lit2=C2=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BF4C43461
	for <linux-mips@archiver.kernel.org>; Thu, 17 Sep 2020 19:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A92452310F
	for <linux-mips@archiver.kernel.org>; Thu, 17 Sep 2020 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600369298;
	bh=xLQsV/kyLLPrxxe8WerUF7nbBOh3OY2jmvHNMDZ6Ufc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=zlRkv1Skbuip0uZFZEI2orl6wtqMZ6j9b3gfFjCHEgSEZh0DpfcjBVwgHD03Al+8v
	 glRZB9wqcjsKY4dWPdf/X8X/U2sSZgrVzOXC6+BPTf5N1Gk8ML+VYtlLlV3LfEArip
	 olJtBpKZCJobHuzculhZuE2qOKNbm0IxwGq13hCQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgIQTB3 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 17 Sep 2020 15:01:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIQTBQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 15:01:16 -0400
Subject: Re: [GIT PULL] MIPS fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600369274;
        bh=xLQsV/kyLLPrxxe8WerUF7nbBOh3OY2jmvHNMDZ6Ufc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=xIk77pbF0x+ouXOVsNiweVs0AEEBkceZlowyjQKHvyxnc5YuAFIV/5X6C35MZQV8o
         XDmLekiLMuWOmxPxKONJvTImyot9tJx/dXbKlLDDO4CLrlqjQIhIBRszDPeGHs3SGL
         4ofJN4NnGDIF8Doj2C1dphNyG2+ukDZuRKTDWzus=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200917144736.GA14255@alpha.franken.de>
References: <20200917144736.GA14255@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200917144736.GA14255@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_2
X-PR-Tracked-Commit-Id: b959b97860d0fee8c8f6a3e641d3c2ad76eab6be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4cbffc461ec91287c4cb1d0e27b01b988d0b8fba
Message-Id: <160036927396.32754.12464056875205937503.pr-tracker-bot@kernel.org>
Date:   Thu, 17 Sep 2020 19:01:13 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Thu, 17 Sep 2020 16:47:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4cbffc461ec91287c4cb1d0e27b01b988d0b8fba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
