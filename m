Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824459;
	b=Oeg9D1cy4DJPlndIGMUzMJ0cijBI7N9W4C6s21tKfwes90s4fp5a62kCHEK9TlgXPZNG
	 yId9lGWGdONIh/v6iif132zwQyo8vJR6V3Bv7/LuuoZKaKTfIRKcOZwySPrQkoZyyNbBA
	 ObR4gy9Ksu1cY64ZY2cDejutyQwX88/DLj3D1M2fAVWeLi3LFxnnsOPG8kAsNMdvst5sP
	 eAHzvrMUPz4NUhbEiVSrOzJItaOL7h7BMllp+Zl82W3BHm/m8a7IdW6U/A8teOGR+tOja
	 qRPzv06dJD1LFH4ly7NBW/gS5laZ6cYnLacyVZlc/nPlF368p0uLE+hS5vB+NPy/8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824459;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s4c8s2EBOZOx8VIz+GsEwld9gDF7HGQXJR6P//MssCQ=;
	b=hhRtaOYG9qMXGemwOwVnwDNRCf34Xgl67Ol7syGkR1YXAob2eAYYP3EOCFlKj2JHvp8z
	 UKPOZPye1PMTyjTYxJzUeD9u/1Lgp525XaAPWxjb//SvjPliqLDNAirAOGKhUBtOQSOYK
	 s9pZe2NujWcr24wKJuj7hxoEkzCLrGL0IF/JXbrvbQJIjybYAtTvVFnqA1G157zqVk5mG
	 lWXhhK7M020Jq0xF6XnzBaXBilIRp4F6R57Zw2kXC4YnD6FcWbjjg05VFvAyHwUxyFItp
	 HXUbh+PFpxFZ5mQDSq1OkWAhVrPcvjNBHLDRMb3G/aCKVEwvMZa5J6lm/DT8QIXoJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwA7Lk4V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58D4606A323;
	Mon, 16 Nov 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwA7Lk4V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFFB1F000C4;
	Mon, 16 Nov 2026 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824458;
	bh=s4c8s2EBOZOx8VIz+GsEwld9gDF7HGQXJR6P//MssCQ=;
	h=From:To:Cc:Subject:Date;
	b=GwA7Lk4VgsjPPc2v5C8KOSdbumzWe9u/px1tUfvDHhLKQAKHMGjkbFjhSabrbspEH
	 7mGiJezGFmV5Zbpit68LxShfesvE6vIwE0zyeJDDFQNPL/JkS+/tQSAmzi4TWNfvbm
	 /yt7I0Gkr96hl/+g8DzZs0yxXr3Nuu7Gr0gLuwuYyR9IOBHMwdHwFj66+ulk2HLeYj
	 i+DsPrm15bobyILIr9TUBbTcGV3nEy5v2QZ5gG9kw2+bi56SvXVCm+Bs5wm1Oh187b
	 9613fbZH8Hmruz4mBKgsyfGqcDgiQ9O6qQoDHlJxlMJi7oHZicRMCHDhwzGNyiQ0VH
	 xNR494qGe+/Ug==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: sgi: ioc3-eth: two teardown fixes
Date: Mon, 16 Nov 2026 11:19:32 +0100
Message-ID: <20261116101934.25910-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

Two teardown fixes for ioc3-eth: probe never stores the net_device
that remove fetches, and the shared IRQ outlives free_netdev().

Tested on an SGI Fuel.

Imre Kaloz (2):
  net: sgi: ioc3-eth: set platform drvdata in probe
  net: sgi: ioc3-eth: fix IRQ lifetime against netdev teardown

 drivers/net/ethernet/sgi/ioc3-eth.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)


base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.47.3

