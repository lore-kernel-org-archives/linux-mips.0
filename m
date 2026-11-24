Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509938;
	b=YncHPuK3j+wbWuKzOoimNCt3mzMFQXaRP0Ui+/DOirR6wtGp7u+xQGH8XLbzVuP4oAdK
	 dc6LcNRgsILj8k2TQZl7/OYAIDJRMbCUi5HpdfnJBcihSuYtthzj0Qqx//XVx8934mY2J
	 yiZSMv27leRaRCqlriy9seBRSGczGqs2HLDRSMEC9WZQw15mn/f7kcm229VpQOeQ7Vnfd
	 7ZRazR0hxTo5jbuMuUjLkQigytKCgVX7qfRkaF2sh7SPTEy9+mlchJkOeCEEaaReHqBr5
	 9o4TIxWdcZkiEvbSm0HpFYxWNl1/OoNU9oKhX1Tj2mgyafcFKRo3kx0hJYdJyLMM6aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509938;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZEEwXx81pkCytDmC3dEcoyjxQxo2NyOkHYqmhLLAPIM=;
	b=qbKVsgsUlagpoprjjY1E0KRXirsOW5WgWjGftMKd3P7WexBZnuXv21NeckFvrpDIMmdM
	 bRrkVmUp87+nQlaFSQwLGUThfGXULW6N2Chx4DoZvGo0PiQZfOSlMmMCnjKjRXViFnfHe
	 Ejvol3mHsnVSW59C/f+FN4Bw7VmwsnNHLNIL8JdiIZCZl+TMnxkTPqmQtLMQLLoEGVVXl
	 /heLiKD/AhWO1evyaBt17aUmmztXpPWG2ywZ/4x+xm1jnzoF3RCdRMCfLppKMHn6CwSvc
	 QGegHO82SaMjCNeH1bfq6KcI3Ui7RnVR022gCUvOn8Xvv83IUYBaPHlatQmkunvqT8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIpFEuDN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C1606A32D;
	Tue, 24 Nov 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIpFEuDN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509937;
	b=NTkBDAlTMnc/uHjQyP5JLbjh/eiEokn9s6D8irvZplv5kdwb+MKw/kNXZiDdHuFnfXap
	 xrf3M1Ji+y2FnOJ0MjKxjijlScPPMvG8gfKLz2rCM0OicJEZyk3gbeRX9vJ8/x2eFcvLZ
	 uFoiXsSEEq/PrSEBAuu7PM3YH3Mk7sZHmPTovmxMvIqcz0o70xgKISHp/bQKcJVUgfJ9L
	 TCuV40JngKa7Th2gZK8F+yk4krDapeFIx7XNfOoj6OmXmLBjek5roitlXTi45IAz2kUg5
	 CRnrUyKnLWSsDt5bXE2j9eKY8tc9nyosc3NXOeXe705zL254w5lVbHGBLALikTn+0mg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509937;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZEEwXx81pkCytDmC3dEcoyjxQxo2NyOkHYqmhLLAPIM=;
	b=zMTU4xsRU3S95fH8A+WndINdi4zXXQwuxznQICTJ4kEdoo4NKDj5fW8mTBNe70gNsxXe
	 OGjEB14t/SBIb8QUzu5RuaJ2jzO9gJ3r88OyMfOFe2pX1eewZJ6/OLBmsH3OysJbN5uSK
	 ivWortsM+ivZSnBPn9n4anp27nkpbFqyCFR3xn7umyB/UwTonXxBGN+rxH/cwI+yQpxyz
	 RejerYS2Lsd6AZTnjQlH5HSmCvJVuvb3HXbNeyyBYGF+LWcqIX+mAv9iGBUf2awGV//mo
	 6N/0uh0w27TdZa6ZuCe9uoKXlSBW38HGb4vLv1JCL0t0obEuteSPaBVNQ9y5BUvEmEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C64C11F000D3;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509937;
	bh=ZEEwXx81pkCytDmC3dEcoyjxQxo2NyOkHYqmhLLAPIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FIpFEuDNvH/t+sCBvj+qFU7teaHCf1n8ayVrpWZ9Zo0Tj05jyKjjLeaqKAzYj75Z4
	 zbB3SD9pKWinTL+EsWleV+gE3C4P/1y4XGPKVl8yZPtPxL+4qHbJjCRv/QE2jUydW8
	 BCoA42XAIhiU7I5jwjTUJo0IBkvYB9OgOyppfbkTV3sZMrcswlCRnEg5Voc9+H6oAY
	 BLcfLpgiJ9Sv7VAUy/4RoXYcy0X7Y+boN4ah/BwXq9KgtxEDwdUB/x1XqJzlEual02
	 fQ61jaKucqHHV31aZY+Mwk3I8ofWgeOazK+C/g8s/xtk7c28dkl88o6WuogTh3oPCD
	 QyRdjndKyL3dA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 56FCB4C968;
	Tue, 24 Nov 2026 08:45:27 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 08:45:31 +0000
Subject: [PATCH v2 3/3] mips: dts: Connect the EcoNet EN751221 intc to
 IP2-IP6
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-en751221-intc-all-lines-v2-3-a33a520aac81@gmail.com>
References: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
In-Reply-To: <20261124-en751221-intc-all-lines-v2-0-a33a520aac81@gmail.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509928; l=1447;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=bcpG4VqWZ5RTgbVtG1xy5hfk40cJOdNACjWS9OrS13c=;
 b=HPQU2ymqtYjchxJ2Do5M7BCXGrK6w9xpR6RbW+j7tlgS6I4XWMF4vsWjDHDn9yVIAwtxweWMM
 TtfqLPedcHLBGIo5ZEYQQipfUGnCd3aDLvb+JMHQQGuW3vVP+sSoR9v
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com
Content-Transfer-Encoding: 7bit

From: Akshat Singh <automobilehacks@gmail.com>

The interrupt controller presents the number of the pending interrupt
plus one, in binary, on the CPU interrupt lines IP2-IP7. Without VEIC,
chaining it to IP2 alone leaves the odd-numbered interrupts, such as the
QDMA, xHCI and the first PCIe port, waiting for an even-numbered one to
run the handler.

List IP2-IP6. IP7 is left out: the CPU can also signal its own timer on
it, and only hwirq 31, which is unused, needs it.

Fixes: 0ec488700972 ("mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board")
Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
 arch/mips/boot/dts/econet/en751221.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
index 57ae84a8a..5e3f626b5 100644
--- a/arch/mips/boot/dts/econet/en751221.dtsi
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -66,7 +66,12 @@ intc: interrupt-controller@1fb40000 {
 		compatible = "econet,en751221-intc";
 		reg = <0x1fb40000 0x100>;
 		interrupt-parent = <&cpuintc>;
-		interrupts = <2>;
+		/*
+		 * The number of the pending interrupt plus one is presented in
+		 * binary on IP2-IP7. IP7 is left out: the CPU can also signal its
+		 * own timer on it, and only hwirq 31, which is unused, needs it.
+		 */
+		interrupts = <2>, <3>, <4>, <5>, <6>;
 
 		interrupt-controller;
 		#interrupt-cells = <1>;

-- 
2.43.0


