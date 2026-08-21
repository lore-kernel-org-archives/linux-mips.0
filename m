Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AA3A1E80;
	Fri, 21 Aug 2026 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787344020; cv=none; b=PJJe2cx2dAxsP9qTzrsiHQiFdb/dOwFZmtWvZkA7EprlGdGow8HF8fHURxdbun/m/+2dHIDH3ZZ/3ZyyVcJ1/CSShVy2JzKEJtliakwRT9XvcU6qhH9nFQ68Od1bOvZs/Lla+0NJAIRvgyTIhcO+4NbXtmCe8QuPtH+OoEIHPbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787344020; c=relaxed/simple;
	bh=uWi5niDtegR4LIItk5cxbrZWxeYcUwrM71YTWGbgK+4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tFeDkV8bDzBY9EW0F1HuSwb1cpOhGZe0jJlLoS16L4V2CTCR5ZFl/HcZSS6zMEsT4ewj1h1fxkLmrQMhRWGHWz6XIe94hB7OfzDCRa1HfEYdWebvOuqgVpx44XbNIsnV5fsAmX5NXcLZ0gi+PCxmomjfP+0YkqmuVYYzDKzmAuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCW1zAe9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCW1zAe9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B1E1F000E9;
	Fri, 21 Aug 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787344018;
	bh=1yucEXwivUaej2eZs4H/zfqRO9TX7I5Q4HKo7Kc+0PM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kCW1zAe9s1QptKjESe9Z7If1mzheI6NFnWAhrm7vBpHbqxiOJswi4ch40LNKE7jZg
	 PWUrFjsmV+dE8KEKqzGL5fNYi89B6OMOsFbHnlIS7umfIz9McuErTiRSStuSfIV502
	 ZwLOJlFnI0gIMvuXI6UoKa3idHb21BjBCf9/7IAv2R1gx+8bkpMkbMksmlzuGbrY67
	 H2RpWmB9qKsPF8C/Wb9hSMaYtk1fqZkclnbUSRipFGvJfNu5AHT78pluTORK5+T2ac
	 uwjWYCXf2iEZPkmkKpR+tsD/N+eWUjWTcTpb7K84bm02aCQKszWtua3+/uOMEqRTlR
	 XhbjEVLVciJuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9399E380CEC4;
	Fri, 21 Aug 2026 20:26:09 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aogScROchrBsk812@alpha.franken.de>
References: <aogScROchrBsk812@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <aogScROchrBsk812@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.3
X-PR-Tracked-Commit-Id: 3b7711be02612845e44b5e9ef7c0b9f203cf29b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27a59c0251e5d1f41a3a6fbae7c4dc478c34d919
Message-Id: <178734396815.1471056.11464095242897464560.pr-tracker-bot@kernel.org>
Date: Fri, 21 Aug 2026 20:26:08 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 21 Aug 2026 10:55:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27a59c0251e5d1f41a3a6fbae7c4dc478c34d919

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
