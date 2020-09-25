Return-Path: <SRS0=L8ot=DC=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853A0C4727F
	for <linux-mips@archiver.kernel.org>; Fri, 25 Sep 2020 22:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C63A238A0
	for <linux-mips@archiver.kernel.org>; Fri, 25 Sep 2020 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601072876;
	bh=0iCjMbCMNSYY/zT4GH5XOGFfOqNB0JPq2bzvCYiyA3A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=iqhqhlUxWzUOug/wMyOssUWsrbErzT9lYpK8SIibVudtLVrtusOQkFVGp66SuZBSz
	 j8E5pHGsHyU7M+pvGI0VlGz4houo4h3sNp/pxbySW+0GBOrkY53HmdGvi53COg4p/J
	 4zOG7Q3+lWVN4RJmX0PlHnN4wnn6dwyNLvmQNs+I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbgIYW1s (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 25 Sep 2020 18:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:54928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729012AbgIYW1p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Sep 2020 18:27:45 -0400
Subject: Re: [GIT PULL] MIPS fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601072865;
        bh=0iCjMbCMNSYY/zT4GH5XOGFfOqNB0JPq2bzvCYiyA3A=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nc6XAb/he/uhaoqGjdjwZsxg6DCxqGqwz12SoVzf4kdm3sSZPQZgFElz93cGQavfS
         XY+dPukQ6q62eD7F1ClYqPyLyLiV7yeaqIPAjSu9IMF2/aBdPsDYFQO+pkK7KsIm/1
         B2lv5zGTlVupJhLPbR9G6u/hNxvuiSX6GtJ+ocpU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200925180708.GA5280@alpha.franken.de>
References: <20200925180708.GA5280@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200925180708.GA5280@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_3
X-PR-Tracked-Commit-Id: be090fa62080d8501a5651a73cb954721966b125
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b463b6f69974867b3b5885de2f488d72e979a751
Message-Id: <160107286517.23838.6394559322045652148.pr-tracker-bot@kernel.org>
Date:   Fri, 25 Sep 2020 22:27:45 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 25 Sep 2020 20:07:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b463b6f69974867b3b5885de2f488d72e979a751

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
