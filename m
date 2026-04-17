Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917C257423;
	Fri, 17 Apr 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776441891; cv=none; b=E64HNf6Fx6j7YJ2nfJ7jdT4D8kB2HZqsycPCVQjj6XJlLaMyjeSy/b3MMYytRl2icJ06lGYHoy4bW0cYOes/v0oAdFc5EYSvRcOeB0RJW+KI/1zyaaFo/sGZQXJNI16sKR6Zj5lqlDtp14pTGwjvmazh2oXvv5zGa4/RHp6z6Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776441891; c=relaxed/simple;
	bh=z6k/r+dHXueJxJcDwQ/pWs7ZYTzIaJWoRYhvetRwHNI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=scgDbcL87yMvy/Gi5NN9MR5xDmKh96CX3aIqelIyRSkTlSQ0YtE89dMyNR9BRge52tw56MYmtk2t/Ulj1AoJendM8PjWgXuNuU/DAy+DAhF09vN6Nbg5ppC2Es1+I2VtOj0gBkY7I/dMJX2pJm11NMnMheCo0Dxh4dhjqf7vodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIadBO/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIadBO/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBDEC2BCB4;
	Fri, 17 Apr 2026 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776441889;
	bh=z6k/r+dHXueJxJcDwQ/pWs7ZYTzIaJWoRYhvetRwHNI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YIadBO/BY0Uxu7IXVIR2mtrVOQ02+1oZEp5zSK29AufPCr6H+vqC+xG5VpJID27ra
	 5cnpTkYmR3L7UOTytkCS7jN2RJijOlqn34I/tbfq5EKc9ZrY0PkOYaEh4F6UA5QJjG
	 /XllvcOURkoA2sMgVcr5s6vj9U1ufbQfF0LgspNrHuaJKGCEQN587cEtRyhlU+x1/F
	 xbJuOimuoQWjtTGByTltR2XMBtYnme7zDqGS4HWMdzSJleeMwx+tawsQw954s6sZiS
	 MMYx2kysmtKY5ec+7hjg1hyE9K7Ja/k2+WaMetS9TxGwaHqEYeDwAhUGSyak9bHwAg
	 Nta7hk3pZnMVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E7B380CEDF;
	Fri, 17 Apr 2026 16:04:17 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeI1M497YKp8Ii_S@alpha.franken.de>
References: <aeI1M497YKp8Ii_S@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aeI1M497YKp8Ii_S@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.1
X-PR-Tracked-Commit-Id: 15513eefac7ca68602e9de9853f5e671bf7b4eef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d730905bc3c0075275b2d109cd971735274b98c0
Message-Id: <177644185645.46060.15852075734468141533.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 16:04:16 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 Apr 2026 15:27:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d730905bc3c0075275b2d109cd971735274b98c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
