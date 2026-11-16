Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824565;
	b=wtEWkQdU4DfT1l0MOSClVQxAEonlBd4lWYry3pKgwrgjDgsOt9iz+HreoDzS8HF8gM6K
	 f/Ydh+PXu35CPEV6k6AnSQ4agEeldeuxkLBuh5uX5Pfw+phFRjd1zb8bKYkuSeZpKZibS
	 WukzkL/sSdkLXo/XD9bbH/LRmtTc1mqQ5EzY1iFV756B7p3JeTLChDJfHPXjnCDdqAilJ
	 Nxt+ed0qQufbe2a4cf1JL8NiAg4FTyJ11016RbnxPCfctnGZl/A6UUWBZNnEDt5L6/hB8
	 YBs3upkG4iZRJ0643olp2R15k1gshSToVuMi3DgHOcXTEUku7mHQOKVcyacFAR9NlnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824565;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+mdym79kJn/elOqWsI1aqSwd2Rn9IZ9NS6lY8D5g1II=;
	b=LaLWmJ5yJUM1yik9OkxcuKlZgFpR5MyqU7r/gCMSj2fRrLScctoRZZydD+qbQSCteLGS
	 rVzOnqx0/vdSi3anPxF60UePVdDORc4fHJS30v6p0KxINfAC//yq1uHXr3swAl9g544Yj
	 OSY0Ub+hNs7qlQ3LSw9BGGlDkHRg4OQNaph2T5Izxf4ntE+uOqnSnzVzMG1Sx62XJJD+i
	 6Q2mx7Ch0RH74ybZFL8vDlvFuSsEuWHCiFYXJ9k7CFRoTGOmvVQ8rXza8bDm/xyBbB7QF
	 IvHULn/TW/sPzR9koxWsr5fdSnqRyBQ0p5hhiIjfC+GFJcQoJCtIRXRukCYcZiQfVTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iq5MDfci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13140606A334;
	Mon, 16 Nov 2026 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iq5MDfci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B771F000CB;
	Mon, 16 Nov 2026 10:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824564;
	bh=+mdym79kJn/elOqWsI1aqSwd2Rn9IZ9NS6lY8D5g1II=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Iq5MDfciQvjn6UnQ5JnSTFaJ5o7PfWq+6F3WoTnoK1pyCRl9/D49DWAZSZ445fUx1
	 ILAHpLxnBtkslEl/CuLBOIsheZ0qaXtZ8Eaep9GGqOEqwRQrF67CE7oqRUI+MjeDfo
	 vUGHstCv/y4Xxy86xhMKutGkmsJjnG0hjJkQyiu2IdIvZlTznhb09ihUz4VtgAh+jI
	 nUPHxpvXn3pI2l65yML91mbnDRHOMq6u+g4uhHck7MfNhVf0nW1iIdUKJUgmmvpYX2
	 xwtakZRtJsv0XrcgdxqUbRO/8ExJQkxjUGQfs8Rk37yUI/h44W2RV0i+vgxqkqFNFr
	 IWaclhVofMrSA==
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
Subject: [PATCH net-next v2 2/2] net: sgi: ioc3-eth: take the MAC address from a device property
Date: Mon, 16 Nov 2026 11:21:15 +0100
Message-ID: <20261116102115.27574-3-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116102115.27574-1-kaloz@kernel.org>
References: <20261116102115.27574-1-kaloz@kernel.org>
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

Some boards have no MAC PROM on the IOC3's 1-wire bus, and the probe
defers forever there. Let the platform supply the address as a device
property for such a board.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 25139cf5ff62..fa844267c325 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -857,8 +857,9 @@ static int ioc3eth_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Invalid resource\n");
 		return -EINVAL;
 	}
-	/* get mac addr from one wire prom */
-	if (ioc3eth_get_mac_addr(regs, mac_addr))
+	/* get mac addr from one wire prom, or from a device property */
+	if (ioc3eth_get_mac_addr(regs, mac_addr) &&
+	    device_get_mac_address(&pdev->dev, mac_addr))
 		return -EPROBE_DEFER; /* not available yet */
 
 	dev = alloc_etherdev(sizeof(struct ioc3_private));
-- 
2.47.3

