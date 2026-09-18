Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6191351AECC;
	Fri, 18 Sep 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749736; cv=none; b=aq4dL0AJhL6lETGorOtBxP07J4+syN1NvnfhPxMIiaEdKKl+A6WhTGaFUSVDft5y/+Mr40FOTA7vnA2QxjuMqjyRNpTC64A5uHD4XBOsZawLWOkpHOop1ojo5BpoW9mopsGCQw4Yb0dLJ3qieo3d8y+jj4A0BaiSGsUSwHvnimU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749736; c=relaxed/simple;
	bh=fNWwMQ0x6CwclBrM9frHYZFwAtJnjK1RsCACbveEg/M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C1VZ5rdojtdJRQY+hg9Fwa4pnUItglqTPViJD5aq0MnNWua1kzbui6zNB0lxdswMXPQ+IlfHo6t58sncY0xGq1ba7sUW42cyq717HBUxPhn5Cg94zRkTeGUHUF8+w1AMkUO/OVVxa6Gcs3T+c/IH8FM+qRhNVzd4GImLXnXjoqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqepX40r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqepX40r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0095C1F0089D;
	Fri, 18 Sep 2026 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749717;
	bh=zR/bbyJkrD3eZOo77lI31jiWQ00mGioNk2ozHsrnsvU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kqepX40rXC2JNTtvreW267BsPMJfr3ZKALUSpNqeOA5+YxNxdZ91D5K5kUmlUB7Mz
	 UvYiGF/8tdySDRWIUevRr422BV5tZWnUF2FIUR0QOlemaIPobg9gYbhwEvS2UPx6id
	 qZ8OVCVJp2goQZqOYiv4VVdURtjAn4LLFOTBQk+x0AdmtSqUOjZz0bRnu3iDGQq8No
	 uFWmUx5n2bAFrf2+Z5+ORLO4Ri2U0fsd9oLIXGF5LkCyQ5GhgV028Qi7FQfZWClU5W
	 dfq/Pu1oUI35dIBk9CfDqzjARW3LW4rb4vKKbF4IL+58B6BjofXiOanq4BxavnrBm3
	 7EE8y2YlXN53g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5695F380CFE4;
	Fri, 18 Sep 2026 16:40:51 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqzmX0yjaJ0kJXgQ@alpha.franken.de>
References: <aqzmX0yjaJ0kJXgQ@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqzmX0yjaJ0kJXgQ@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.3_1
X-PR-Tracked-Commit-Id: 126f16e0a1b353c2ba5c7e2c8626cfa865934f9f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5023f5b861d50e43b25a3b1de47808023243484a
Message-Id: <178974964989.1040423.4352516368509920430.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 16:40:49 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Sep 2026 09:21:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.3_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5023f5b861d50e43b25a3b1de47808023243484a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
