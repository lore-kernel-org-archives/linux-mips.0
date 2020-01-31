Return-Path: <SRS0=cRl5=3U=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E57C35240
	for <linux-mips@archiver.kernel.org>; Fri, 31 Jan 2020 19:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B61121734
	for <linux-mips@archiver.kernel.org>; Fri, 31 Jan 2020 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580499319;
	bh=4mgYS0AdpRA7BOUvrgkicXbBKz0g9VpGUzSaXTafwHg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=0oOGYlRrlRwVrCXQMAs1h2/UUWIrQUIJZyDSCq4zCpBlS5J/zo0zEOOf6Q9AG2jRm
	 dAeKRWOv2mvyCfwbpDgdsya/hFXO8KBQXq/oKjf0180k/3zkZ6zzSnYgMfzg+JjeLh
	 2Y+5g4LC6xZ3dPTybd8mi5YDcei4/6YEWcQbUjcw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgAaTfS (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 31 Jan 2020 14:35:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:55530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbgAaTfS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 31 Jan 2020 14:35:18 -0500
Subject: Re: [GIT PULL] MIPS changes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580499317;
        bh=4mgYS0AdpRA7BOUvrgkicXbBKz0g9VpGUzSaXTafwHg=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=byOPl4TzXyxzVIi/QLpR45/QfUTgebz7XIg0tXaBvmM1Xg5zvCsCRmqib/IWiU2TD
         za4wxi2IUZsxXpeGwFD0Fvl446leYx2B5gca45RkKfgZexCVTqHetCLOSSxj9kgqVQ
         JcWPxbfgEP4fymswVthIaK2sJDiU6oFk/bUyu4w0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200131175528.m7t6bpd74cuknyht@pburton-laptop>
References: <20200131175528.m7t6bpd74cuknyht@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200131175528.m7t6bpd74cuknyht@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.6
X-PR-Tracked-Commit-Id: 2c4288719806ca0b3de1b742ada26b25a60d6a45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5951e7c8ee5cb04b8b41c32bf567b90117a2124
Message-Id: <158049931780.14867.13739565161470599168.pr-tracker-bot@kernel.org>
Date:   Fri, 31 Jan 2020 19:35:17 +0000
To:     Paul Burton <paulburton@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 31 Jan 2020 09:55:28 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5951e7c8ee5cb04b8b41c32bf567b90117a2124

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
