Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824559;
	b=A8DF4/z+WjRg3jlBCo1CfNMd5H32eWG6Gty75UCJuKWbn977lb3QrZ6uWARChNaKEFdf
	 QmxEKF8SCQ/a2LcP4SpaCcoTA61SzhaReD6bEy20pcqnbv3TwBYjnOgViICc4Ns0LFHn3
	 CVwjS5SnuzCIUyCfUetRImUd31Agikq9AX9rQfOV3BK3FjqNSyVMhseCMQeA/SnJCCEaT
	 9kjO5rejrYL5hXe3Parpd4NAeJG8HaCzt6iZ8xXVwMcu+EZzL6XWujn82krVxTbNZP81c
	 xS8w+RMxnLY/jyD/k8ryOlUENj22q6KJ45nK6Yh6QcsnXh3BOOEekw8TriNuoDZob9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824559;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R/j4yaa1r3z9iDZfADuAlq5V0e6n8RPvA7y/at4iBXc=;
	b=NDsKGX7tVZtdxK3FNpE4/bd+OtkzFDB3K1jv0GIcc+jnGQSWZcOVf37t/oB4M0t2jeNG
	 0o1J+OgsCIyDuJeJbs3dbVGr0Q7S9iIRdFP3j+6xzE2FsaPdgW6dh5RtjFmQyxXPJQPQB
	 88TTdtisN0uGA+IJdKOdiorFEByReNv9lN+npjXXoSgBuF0wVf0vGriHHybMPYUQom1vF
	 ktmsqqcXHu3XKz1RS240kGREVBR3jg7jRxP+LCgfyMbIh9lAdU1kdLOH3j0H7ntPSRK9p
	 YW3LnXvFdp+Avgd/DyvCuDY182KNzavxBo0cODfqgt3QVcVngnOWwXZfnI0eBFzJYuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnH1F2wO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112F4606A323;
	Mon, 16 Nov 2026 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnH1F2wO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA411F000C5;
	Mon, 16 Nov 2026 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824558;
	bh=R/j4yaa1r3z9iDZfADuAlq5V0e6n8RPvA7y/at4iBXc=;
	h=From:To:Cc:Subject:Date;
	b=RnH1F2wOqPJRS/JSLU1EkQ86act9eQGW6swwXKDsyeBvpeZDnD66+cPm6nJvGpLcm
	 JhcaidMvfKmm20TrOHCx3kqEDnFFi2qZpf4BhvbjeyLOoGZvO2i0b3HL3XECKNp8up
	 ZaOUITssUNOt4QHV2i/I/lLD0D0ISLTob8hJYOJB7nses6ZJgv5wflMLikrcJgFWP+
	 +33ugZLhP/a87hhEnBWVZJ7V4NlrFjJy1a28vWnodt45zCa0f1i+spn3HJJepOB64g
	 upr5CmjAzzKj+OYezcwIIP8kkX0ScGgVcLzdUl1LBacNmfln6cg/yFEe3kBfII5wPl
	 +TYwjsk6GPEQg==
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
Subject: [PATCH net-next v2 0/2] net: sgi: ioc3-eth: two changes for the IOC3 on SGI IP35 machines
Date: Mon, 16 Nov 2026 11:21:13 +0100
Message-ID: <20261116102115.27574-1-kaloz@kernel.org>
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

These two changes let ioc3-eth drive the IOC3 of the SGI Fuel, which
sits behind an XBridge and has no MAC PROM. They were part of the IP35
support series, which supplies the window addresses; its next version
attaches the MAC property. Neither side has a build dependency on the
other.

Tested on an SGI Fuel.

---
Changes in v2:
- Patch 2 takes the address from a device property instead of the
  platform hook, and drops the random address fallback.
- Patch 1's message no longer reads as a fix for existing systems.

v1: https://lore.kernel.org/all/20261111095138.1757-1-kaloz@kernel.org/

Imre Kaloz (2):
  net: sgi: ioc3-eth: apply the DMA attributes only to 64-bit addresses
  net: sgi: ioc3-eth: take the MAC address from a device property

 drivers/net/ethernet/sgi/ioc3-eth.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)


base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
-- 
2.47.3

