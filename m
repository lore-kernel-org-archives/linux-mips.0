Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825760;
	b=b575FwAMiSKqDNK9p/Jmkk+xLIE0cGo99NqAt7FKYErTbq0iGNDBGFLiPM5sF7YJorH3
	 aAa6VRMOLs5/OYoRw6qj7Qmh205Ny9AHIgONRbS3FN4OZSpFFcbizvdBU9o0shunt2Sas
	 CcuKoKsfV54jg8nxAHp3oKn3axTgAX9PmvvASxCwrEC6QqlpxZTGGv5SvtihxlrXfLLah
	 vWHJ8/wZDYJC2lz2Msc6T1CHaC+GxfgFYaVvskCZS4+0b6muDCGYGC1/BcOcw9yv3hWVx
	 S9AMmob9h8H9OKJjLWDA/um+YjnEdKs4LFdABsylwjqmwT8jS4EONKvJGul0LlqzoBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825760;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zbw/YPofXlYrFNQtpS7s6hJ0JlMtWRUgM1BHpMOJS1g=;
	b=MGz+iUrCxYzJo2nhJGQzgcdHGXcvcBeWBRLVFknN61FKNTIHh7BB9Q+vU7bkoZhXwsJI
	 RWhCq4IfP3QQzqnOM1C1VLbWkaVUN1QuPCA427cDfzLQMSmKE6tmWF4FRi6juPyw8s4it
	 VBcuALto1+0bh0OeH4NmvoXNwjSAax/36+9et59iSzolLWTVUvmaO7Hpgss6SEbeUAAaN
	 cfJRIkaXpZ2GXXjVcbfYk31UtOnNBPNfC4u748QlZYxcknosIU6NOkO5qYchpwwTAxQIj
	 BgjsRqDpanA40MJ9H3hi9K3q97WChmAe62jA1eV03QUjLIbOPmzeOAPKhLK1UFI+GHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ae4XdprP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6002606A323;
	Mon, 16 Nov 2026 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ae4XdprP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B191F000C7;
	Mon, 16 Nov 2026 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825760;
	bh=zbw/YPofXlYrFNQtpS7s6hJ0JlMtWRUgM1BHpMOJS1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ae4XdprPv+VbYI3WhqULRck8BJYZhawf43U87ZzM3zO8QcEoVrALrNscNTFKOJJ3X
	 c7l/5x+EMiHKlnZ/BUVcatxjd/jhNfaoLj/939PLKusRpZRUbGN9w1bC4ARucXxSeR
	 HWqz8mbJK/rcqU7Wztq70/kW6mv/vzRq9Dfh/RtPxBPertjKa6jbvJ6lwdDZFR0u7c
	 z8ieINOoy2XKC7Vmgbml/C/vWeU73IxS71wNaUg9RzMsNSqqpBpsapi48551383ct6
	 xJSYN08OF/JITbeay9Nh9k1YoPKJ047o0BHj7NI9nH3NVDBHQCjAJdl/Ty0iil/maf
	 AgMu8Gm3Mtx6g==
From: Imre Kaloz <kaloz@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: sgi: ioc3-eth: fall back to the platform MAC address
Date: Mon, 16 Nov 2026 11:41:13 +0100
Message-ID: <20261116104113.5946-2-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179473760071.2199510.16065103101920438822@kernel.org>
References: <20261111095138.1757-3-kaloz@kernel.org> <179473760071.2199510.16065103101920438822@kernel.org>
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

> Can eth_platform_get_mac_address() ever succeed for this device?

With the IP35 series it does: that series provides
arch_get_platform_mac_address(), which reads the address from the L1
system controller. Without it, as you say, it never does.

> Does this ordering let the platform address win before the 1-wire
> PROM has had a chance to appear?

Yes, and it matters for an IOC3 PCI card such as the CAD Duo, which
carries its own MAC PROM. The system-board IOC3 on these machines has
no PROM; a card in a PCI slot does.

> Could IP27/IP30 boards that do have a DS250x MAC PROM end up with a
> random MAC here?

Yes, with the w1 drivers as modules loaded after the deferred probe
timeout.

v2 takes the address from a device property instead. The IOC3 MFD
driver will attach it only to the Ethernet cell of the system-board
IOC3 that has no PROM, so every other IOC3 keeps waiting for its
PROM as before. The random fallback is gone:

  https://lore.kernel.org/all/20261116102115.27574-1-kaloz@kernel.org/

> ioc3eth_probe() never calls platform_set_drvdata(pdev, dev)
> [...]
> Is the shared IRQ handler safe with the current ordering in
> ioc3eth_probe()?

Both are real. I reproduced them on a Fuel by unbinding the device
through sysfs, the second one with CONFIG_DEBUG_SHIRQ, and the fixes
are posted separately to net:

  https://lore.kernel.org/all/20261116101934.25910-1-kaloz@kernel.org/

pw-bot: cr


Thanks,
Imre
