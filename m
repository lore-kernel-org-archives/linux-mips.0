Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92CA3B27F8;
	Fri, 19 Jun 2026 14:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881053; cv=none; b=WqXzZO4aL7vBOT36VHkNYQLuXn2OTZ+LJXGL8R43Xo1X2cLQdSz2vdk1keWt+oZdctk4FlQWd7SX4VJUxzQAl6+HE35BbKvXZja0ptVSXmika9X+PaJVAkfsWemOG3+Evwf0MyxpwWj/IcLLCZm+mOiMlwNmOntLZPCPK4WdsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881053; c=relaxed/simple;
	bh=J20dCL+j+c/l3pDFgZFhVkji5b9WK5dQFs64TOv+OAE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AqtD7/icow4DQqxwA0aqlxr3W2gnkpuea8hBnBGawBQQ0CIwrCW4urdAytpBWD73IwGtmPieaR7tOKT+buj23mAc6lAeFI+wLi3jqwrUpWTOpxFdkZ/sKI5Ds9KI2sqrPOt/ZN7fc7UvB1zeEuA7QbhbxCvY25BbJB/1mZOYOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB74D3I8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MB74D3I8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCAC1F000E9;
	Fri, 19 Jun 2026 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781881052;
	bh=271l9oB8TUWpQ4GgNkuqAJYwVEbTa1nGdf0yh1Kmlk8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MB74D3I8xzXfHKin4z5TCGvpa7/P2DIvGmpv/vF50z4DtgB4DaEQdpDZNrJwBiUd2
	 2a96q3DaSsNH0qM84fT/j+NTYW0SA8X78H9GDwsfW0nKk6E8O2Avy24NXwGkTfIg/A
	 8nFxRTQxrgLWSBZB5CT1QD17PTuBpFT9dTg0mPMk0/vRVoqIUMcv6tQ1qzlo35bf6C
	 2yddiZyBJh5ek66SuEk8HVSJ65tonMx5u6I5DG8S+Gvi3WUtKEDCfLvL/5c+0nq3Nd
	 IJfyVJ5f2/Xp19jWFlg2IWwBSIMi89jldO96hLLtSfQBdKNepR5Zv+ftxyfDzb+fWc
	 1Q+T6BJkPmRRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AD53AA6A6C;
	Fri, 19 Jun 2026 14:57:26 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ajUnRiURsctnJ7R9@alpha.franken.de>
References: <ajUnRiURsctnJ7R9@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <ajUnRiURsctnJ7R9@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.2
X-PR-Tracked-Commit-Id: 6f25741b7565d7f82fc09947c981cae17535894d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08c7183f5b9ffe4408e74fff848a4cc2105361d4
Message-Id: <178188104519.3941480.13704581348900368867.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2026 14:57:25 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 19 Jun 2026 13:25:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/08c7183f5b9ffe4408e74fff848a4cc2105361d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
