Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA825B091;
	Sat,  4 Jul 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783183373; cv=none; b=m67e7wLnlg0f9mx5CrhYlHJXRFGwjuNIJeL5LqF8or8+rgKM8fnu9AWW5kYKv6yJkEoKAZo/qIPyKG2bWmiQbiszWR7wZA5tkmGZIkjBgDrkSkbbcqfZBwUFxHRKCmltNyO/62tWLhVzc+Bhu+pFr0eOpvhARpXdV6MX9EiXkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783183373; c=relaxed/simple;
	bh=DnjANC2W1Y9zeLMipLAXHq59XjEh2DMhS8Twfy3ypS0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TH2U5RG9jhUAM8GDo+3TTZnTop3cSWIF5lNiPHLq0b9RpWwJbKmpqisgPL16MNdVmAtxSlHLKAS9idyOLfihk7lWV5ihKs02ov+Dt4Q/NbJ24Gya+y7WdZ7Drqbepql5aQJd/INJhnppDSypDI97a65fO352EP0EmUdVjek1aPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy0zI+8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy0zI+8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D681F000E9;
	Sat,  4 Jul 2026 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783183372;
	bh=PcO2K88Jg4Mz+qdw6ovu7UEpaM20b3sCplxTLm70VGk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Sy0zI+8TzFKArlmhn5cS7ED8QR9L6IY/BAOIfJONH72ybzDQCSbREwvMwZFnnmIM+
	 CQ8uCwiNTV1KtTDJLh8W9jHh3Aw6kiMku7fZFC4q08l74fNL39+0MMgCn4J0rNKwrW
	 Ik8PJWlppfpeXgnAye7b4wNyYgaJeapUCqlsfg01k58aOjJs/GX1PaSHS7GhBTV3mP
	 mW/5JHCvzS6e1U2jZYIjqqE2+10C5QGCm5LkaUYaQzGZEdLx9gqZVRsZws+Bw0KwhU
	 ZK2HWiU1bM1Oi9978NAfQx7vfgosHL8hhWbgoHGP02Q64vmf2BHnXFwOeryX4kxIDK
	 hsBlGIzPWqP4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CC238119CA;
	Sat,  4 Jul 2026 16:42:35 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aki8GEGE36Ho7S9s@alpha.franken.de>
References: <aki8GEGE36Ho7S9s@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aki8GEGE36Ho7S9s@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.2_1
X-PR-Tracked-Commit-Id: 0880884b36d1230a80a0322abc9b9c7b26942b65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 410430b616a739eb395143f4f608d4339a3b0a8f
Message-Id: <178318335415.3585371.7336379918073380767.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jul 2026 16:42:34 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 4 Jul 2026 09:54:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.2_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/410430b616a739eb395143f4f608d4339a3b0a8f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
