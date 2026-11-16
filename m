Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825757;
	b=dM+IICKunmr2WZiSvV2CIIDyuP2y6PzVsN9xKVMNziXkgg7HgsqX13xKhv4L2TESLgej
	 INfXAHRnDTXUcgicUw38xOyo/ixnh94TXAUKKCAT9Y1ejrW8KLjy44Kr707NKAcOCyXIY
	 9xlIMRgH+jg7jbqKxopgGbjJVlOaajmotf8/7onXKXAnLhP64TxmQz+Is0MvCSh6cyQFu
	 6bFmYFZyCxMslUdVbtYqW6RYeg8O4z+1yB/vU13kJ3gJ59rj5gHhYwrP9ZZNmTuNwV6gm
	 ifrWvXAEa7JYaU4RkZmip06AFz3k4/FfmBLDkwbLR+UzBDR3PmzI51yRVLvBicdD0Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825757;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Vvrt3ksep/uByZ7+Whx51+tzPNsOAV7Zt47AvUyFumo=;
	b=1Ceaw+AJ0k7NI3QuyJobr4pH1mxHjwneYdERwKJxSBxUAKfX92YAbQui3lBAwuBXPqoX
	 +OJRl15C9DsHzDlsx7KyrIdJ3zg3j277O1+OwFMzZ99Lm15+PVw/4n8fnsi40TOX2ckVe
	 buvXEdXfxtO+3zv2zGh6b/LKaQov17bYlEPfqeiDAVtVXCl3UTZGDLH6h8Yu2ES0iXePK
	 hGz0ruyEuHNRs927KP1NZVWafMV78GeNRsBLQQ7hvds9Yoe2XdoTPQZ04wdIJ+yKZwif+
	 30w5GVhpUeZJvY0Xsd+I0OUUKtHX+7BOTnTy/1akr5ai8A4Mkm/8UTG5MXMz4DU0+Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KH4TvZ1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5D606A323;
	Mon, 16 Nov 2026 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KH4TvZ1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1779E1F000C4;
	Mon, 16 Nov 2026 10:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825757;
	bh=Vvrt3ksep/uByZ7+Whx51+tzPNsOAV7Zt47AvUyFumo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KH4TvZ1y7FqJS9NZhglXOeRoWbic1VZhv9sft0QtxWHoN9oqww9kMSLfO8wRbdgEe
	 eOvyfoZ3tgELJ4YAXT6sdieD52RFUS0BUFVvTBNdlztndeiHAFNz0BEpCZ/thog9xJ
	 eWwuNy0PFzyaAFuKNhuuOwdJWeIUwfX+2MlnVCCZUr4d6c7eZECN3EB6fgditnh+EO
	 9VDGPfWvHG0JG9QLSozn95r9XnToTGr62Uw1+EzaWAGtVwsoNAaewEyV57WM7FXauT
	 fTuadLl4MDjRwJo9lRzCe7we/Y4JkpMn4HR6vWetdCiNKZQXmFjctx21CtmjkEugpD
	 snjWzHNzLkOlw==
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
Subject: Re: [PATCH net-next 1/2] net: sgi: ioc3-eth: apply the DMA attributes only to 64-bit addresses
Date: Mon, 16 Nov 2026 11:41:12 +0100
Message-ID: <20261116104113.5946-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179473759964.2199510.1259617691806814840@kernel.org>
References: <20261111095138.1757-2-kaloz@kernel.org> <179473759964.2199510.1259617691806814840@kernel.org>
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

> Can the code currently in the tree ever reach this branch?

No. On IP27 and IP30 every IOC3 DMA address has a nonzero target
widget in bits 63:60. The branch is for the IP35 series, where an
IOC3 behind an XBridge or PIC uses the 32-bit window. v2 says so in
the commit message:

  https://lore.kernel.org/all/20261116102115.27574-1-kaloz@kernel.org/

> Does the window path rely on platform code setting the D32 bits in
> b_device for the IOC3 slot?

It does, and nothing sets them today. On a Fuel both XBridges leave
PREF, PRECISE, COH and BARRIER clear in every b_device register,
including the IOC3 slot (0x180010f8). That belongs to the bridge code
in the IP35 series, which will set the attributes for slots that use
the window. ioc3-eth itself needs no change for it.

> Should the ERBAR value be decided from the RX descriptor ring
> address?

The IP35 series picks the window per device, not per address: an IOC3
behind an XBridge or PIC gets a 32-bit bus_dma_limit and SWIOTLB
bounces anything above it. The ring and every buffer of one IOC3
therefore use the same form.


Thanks,
Imre
