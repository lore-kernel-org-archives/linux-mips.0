Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167174;
	b=I6Z+xCI8Iwy/aZFSV9+oFjLJ2TkGYKknXMQHqdjHV2uf6ZCUDZTGKyF/7joKvI9iswqb
	 5ffHOWdfEptoFUd/0Kqx7p8oSUxSRLf2UgTSoXNVlbXOSHHvBJRqK9wwoEUlVUKe4kqJh
	 ZVMHJBVmZ2+uDqQC3H5wZMqAv8cJmrGKsvrFr6iO1B3GkHhsPzvEf8IjHLKW8OxUoF+YE
	 mt+FzuUCYBjSLc1xuo3Nxqn4pnzktR2owsdkGMfKrlj8BTVwSrczMV94ZAeFExy3R0AkQ
	 4szrxz0QAq4HFKo1jzp0zAiLIqRUrYz6Oymuv0lr/i4/D5myNrwvQ2/pu/qhr4r/sfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167174;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=1hnksh8KNsnKdS0AAby74MB2t6RjsfF/lcwn9ERBYwM=;
	b=LiPWuSonqomehQNaQpbraIH+mA9m8jsHvczRzIHgE5z0GStInqZTriIKc/zk4C+mrhtj
	 zf0DjM0fHovEDo9s+7UBgkLKQh40nzLjSfvIMCCJFuNChpUno47CHgnsr5NnvBL09ROVS
	 ynC9NlQ4YIgqz0Ezg09JSXWj9of6N8HSvoWQBBbZb+cxL6Wa9EytNGzAuf/6V1psXUQ/P
	 JQQicCc3q+sdr9dykA7669pKo2WwJkMo3fKH6cxPMPrdfXzD/PNHS2dDdPCh3aQMT55WQ
	 CzFiZEI4lP1AS0eciu2WW9iDMCgGYqdQGwJIOrK557STxciA/1gvcTkDhWiKsC8lLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/aHcn7p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FECC606A31C;
	Sun,  8 Nov 2026 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/aHcn7p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFC91F0089F;
	Sun,  8 Nov 2026 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167174;
	bh=1hnksh8KNsnKdS0AAby74MB2t6RjsfF/lcwn9ERBYwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=a/aHcn7pTjMJkkDLR/wqBiqOVGg+yA/ahiMsrlAf2YE1GaQRiPSp2ttgOwXd/HjMT
	 TWj7j8OmpaPAaN05m3755UBPO4rl95uBM4mqqk2JIlMJ17umKCdYEF9QPVJCrGXcbC
	 Mj0OqzoeKhK8DgR1mj1IZuvGp6YiZesOB+L1A9FNZaGLvgrkJ5dUm+BJ7D7cp7aY16
	 FlgBDS+LXnewP03K/f03XfD1VAw7jvZjtJLVvTp9Nls2AXMwynWhTca6Ybdhx5LYhz
	 XiwlbPABRZtzdK/ugtLqYNT+vDMfRcAZBpJEjrI5lUPvMuqSA7kjTZThbJHUKGw6ms
	 buxgHFT8ApSsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2129E380821F;
	Sun,  8 Nov 2026 19:46:14 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <au-enPQhQVCrdXWw@alpha.franken.de>
References: <au-enPQhQVCrdXWw@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <au-enPQhQVCrdXWw@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.4_1
X-PR-Tracked-Commit-Id: 456c965ca46c59a4a241c755e6565fd883a522f4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2651f6deb3326129a052897df193052dc28ea94f
Message-Id: <179416717262.1685596.28576652826816937.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 19:46:12 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 7 Nov 2026 22:56:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.4_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2651f6deb3326129a052897df193052dc28ea94f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
