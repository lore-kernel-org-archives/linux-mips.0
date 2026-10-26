Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987637;
	b=3pdd++keqAuIxDn2YTvtcglCUiBzedUUfeRZrQhDOfY7iUjNHRXUkH7MTu7CKknc3rQe
	 hG1KQOYbG+CF8JoYfzWQVO7DziS4+SXopAFF8tPeGatX72s7yiedDvOq8ftFd+pkX5V+K
	 mJffjsHV/c3g4Hw660CGS+UixjGO7CZSGAVn8pW84EzuxxMwbmKSBpb8XY6fEzXbnGYBl
	 xI5t8DP7jM7dAtH2R9DcQjeF4f4PBJcfOPCWDzJt6Pnp9AdBkY6D5avBEJImRoVQJhzsA
	 XH8mNNYu4Z6eXfqQ5QgiyYD7hbTDLsWXnQVaNcxEe90UbUS8f4dEYSL+sIreDcc+kxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987637;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=2Wrb/qkWZyjMLYhkCojSpxLyYBeWxFcXtfZyVWPbqEk=;
	b=Sz/1AMFxpFM3vqMQ6LqKvgL1buKa7kz29Dy4hKVDzQJaJgARIDnaUcCPaH+iNdumlsNj
	 ieZmP4742jabpxiNKUyXH5AJdD421LkvG5ekrHXLUu1FJmeIAx2hb14kbk/gRoyi27bO+
	 H8YT4NZr/yArgwhU8CbnO8f0Oe4+sD2VNVuq1/S6WPSAJmdh+kwUSqVQNV7H7kJIK3LG3
	 EQ9QAEXqZvxhvjYXkePaIsjxUQyqAam5vFwTLu6A9erLu5ompzA0PGyGvc1N4oRwaMJMH
	 vncIwVh6okl3fCw5ou/KD9q/3f0+FJUcG/BEirkUPTLxRMe3984XLJk8w7xf8tMXGDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCn7PV64;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43923606A31B;
	Mon, 26 Oct 2026 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCn7PV64
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA4E1F01825;
	Mon, 26 Oct 2026 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792987637;
	bh=2Wrb/qkWZyjMLYhkCojSpxLyYBeWxFcXtfZyVWPbqEk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MCn7PV64OXWSuHySCxbZce1Dobe3xwTkvdEs1sTmCqOA0HbISeQ8SgYAR7ldyeVoA
	 r9diVNsfyIDpvDVHPZXyloDncMJRiJ6N9um096wz6DT8QQNNijELZp5qtWDFINb2MS
	 7ifKvzELzA69QCuD/PE8OPsohY6WxaSL9ZQw+nRcOcGUavv8HVR9mqClNi2S/cKPoz
	 4DA7aq/MKc6uE5MjR4I+ERBr5W65hD0kE9I6qnHajWql5vRCR/Sx1EHoo4R7ySXOqu
	 W/LJOp0PT1jt4K2ZpayHXWKAMByOXXPNYroz1xsviOftpuX3qWWRh7HSYBzJJFIjvX
	 0/2vtAR89sFjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 076EE39EA761;
	Mon, 26 Oct 2026 04:07:17 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <atxuYis0T7kTy5SG@alpha.franken.de>
References: <atxuYis0T7kTy5SG@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <atxuYis0T7kTy5SG@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.4
X-PR-Tracked-Commit-Id: bfe97f12a0a64c3682be21a02404238e3b91e945
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2270aa5ed5f7981082e4fae4103b8930e0ba106f
Message-Id: <179298763570.2452649.13842213420971400074.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 04:07:15 +0000
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

The pull request you sent on Sat, 24 Oct 2026 10:37:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2270aa5ed5f7981082e4fae4103b8930e0ba106f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
