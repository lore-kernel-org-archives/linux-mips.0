Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302006;
	b=uSzgcZZnXufLPPqmzPIeJp1Xmfn/VdgWFoTMmgK8rGFAM49D8gVBwA0cBr06MdQE7KzC
	 90dxUvGqxEcUV/May/T32hKKH4JFMkHQLL9KDrKa35Q25q31EflNI3r/ngj6/DWVlBHHx
	 90E3l+nTFBAWNJ4BU7uddiuJM6ekpDkCAnvaa43sDwxnCRvAyS3rjfQiCMKr0tx0uVvTL
	 RQag2Dps7BD4TonfNq+v59c50WxlYFgteSJKSv06/4UPMrMK1MVbFT5NF/sKIq86Phy3y
	 HlEsOgB6zBPQfv8bbMWPUeiR5pypg84Bg7FpP4CxCFUBKrCuu5LjpeuddW/QO1takXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=z4rexnvIm5FnZyCWzqvTkhyV4GsnZgJ1xSplkjE1oqo=;
	b=21LPsSqKhAdjTagQFpyoSkcC7l5alOQfJ+P5I/B8s+puWX+Pj0snBOCvrjIeyCNs46IG
	 UVJWECkJyW4OwtH/IJ2vFAfaH4bdDflKBqtGjlE9COEACcLOwI7xvOqTJdd83/M3wm1eu
	 0+H4ZaYUHOZOtZV3uko0+WKv9y6VnKpPxFXzBJPKSLnz83YvJvLTdDm/K40CXfe1CfaWm
	 do+7rS9p+uK55vQQJP5k9ej4rRLErghAuIydA6ngehWS7eB03FYXPShYAk+09KB/xWiIF
	 Ej5IxhLOsVmks1gE+UnNNkLP8wuQ7MDueGUmvy4KbkrRKrH57PnckLGxG9mZxshrtTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnFsWUJY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8511606A331;
	Sat, 21 Nov 2026 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cnFsWUJY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB541F000C0;
	Sat, 21 Nov 2026 23:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302005;
	bh=z4rexnvIm5FnZyCWzqvTkhyV4GsnZgJ1xSplkjE1oqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cnFsWUJYjsMMB1qUcEwRR5KNrUOYfjmr0wzxoxTyeBZm7ND1LLz6+Tu80KMAzYfky
	 ikuG50acQAy80xFivlazD5NWgGBqjMQFr4f0AhuBhpbkDmPI8SWPd4jgPPVeXNyYhl
	 QJMwCszB9H4fZr3ytZghqE6OyKs2ln5Y0zjetny9O7X1nN08GG/7m5qikFZJ+fgtrn
	 je/iUeQNzT/LLZOMh0Zgw97+DfVIiZ2StVhSkz2u3jT6gdL+DJsFN28CscXgbo5LNS
	 InANUbbKVtzBx9hfe1v+b0aNQbKiWcD8NOn406FmDDVOODJdfsMBggnc3wa2YJgolt
	 DxvM0LVblmwlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B449A391B08F;
	Sat, 21 Nov 2026 23:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net: sgi: ioc3-eth: two teardown fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530200427.1200626.11711075195497357752.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 23:00:04 +0000
References: <20261116101934.25910-1-kaloz@kernel.org>
In-Reply-To: <20261116101934.25910-1-kaloz@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: tsbogend@alpha.franken.de, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 11:19:32 +0100 you wrote:
> Two teardown fixes for ioc3-eth: probe never stores the net_device
> that remove fetches, and the shared IRQ outlives free_netdev().
> 
> Tested on an SGI Fuel.
> 
> Imre Kaloz (2):
>   net: sgi: ioc3-eth: set platform drvdata in probe
>   net: sgi: ioc3-eth: fix IRQ lifetime against netdev teardown
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: sgi: ioc3-eth: set platform drvdata in probe
    https://git.kernel.org/netdev/net-next/c/944841b8af49
  - [net,2/2] net: sgi: ioc3-eth: fix IRQ lifetime against netdev teardown
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


