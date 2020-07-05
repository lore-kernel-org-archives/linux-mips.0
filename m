Return-Path: <SRS0=qVoe=AQ=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A22C433DF
	for <linux-mips@archiver.kernel.org>; Sun,  5 Jul 2020 17:35:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE7E1206DF
	for <linux-mips@archiver.kernel.org>; Sun,  5 Jul 2020 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593970519;
	bh=N52v7tpjBjAodZ6DAstdTJ2KsFHBhXdLqjU0/Qxpbb0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=OOG0OkjBDdfoOk0g3mN7qE2BiETSVhApuLCdpMVtvY4VIwHsH3DlqR1mhJkUsseVM
	 5hh6hvGslQCBaIdzoFh5Dxb9CpfCgS5+u235HHVBzo2ZH45Ny/j9zUIv5Le6na+OKx
	 ZOhgpf0zH1WSgNQ9TOY6xHpGBOT18MSgArbos5gI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgGERfP (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 5 Jul 2020 13:35:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:45808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbgGERfG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 5 Jul 2020 13:35:06 -0400
Subject: Re: [GIT PULL] MIPS fixes for v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593970506;
        bh=N52v7tpjBjAodZ6DAstdTJ2KsFHBhXdLqjU0/Qxpbb0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=pTX6UwtVWfaCmIga44xwnG+XAtjlgmc4CQSyXQadoNFqi9FJ818NmLANTcs+MBX7m
         +NMVKbVrz9eXE6ZO1kIXCD/KWAhnB45ScZwjh7Pjhfe/OoEdxLv9iYQEcJvanIGnJ7
         RShFRgS3KOjOJfuQLnZYLOuevQwp1D2N0S9p4+tk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200705104008.GA5156@alpha.franken.de>
References: <20200705104008.GA5156@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200705104008.GA5156@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/
 tags/mips_fixes_5.8_1
X-PR-Tracked-Commit-Id: 5868347a192afb99b189d72946ab6a321b6115ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45a5ac7a5cc3c71739d240c422c3818a5bc97fc4
Message-Id: <159397050615.12702.13393919043064094175.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Jul 2020 17:35:06 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sun, 5 Jul 2020 12:40:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.8_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45a5ac7a5cc3c71739d240c422c3818a5bc97fc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
