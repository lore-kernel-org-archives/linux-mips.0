Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824561;
	b=3GzN/r7Yv+apMOfTOsn9o0VJ/YZ6pfeJk3nRQNy5ecvpOHZYPXgbAxfyUz9F5qyutZNK
	 4DVelO9pOJgkaE0X1u4V+avyXvvwZ0oNFRIIhSggIPM8Q09OpsHQZcC5trlsuXztObzIn
	 qK7Vm3ChPOurOk7mMU8LfWVP94BIcp/sXcpUaQt/MvJ1X1m2v/VtfESwMIDh0uJjHLd1S
	 uQzS0XTF31M+1TPOZk+aJpQo0Evlx/iVwJTJ/ipYdpTMakYWlCsVcNeyYNNSCblnV2ff5
	 KsJvD1PXqKHLJa+bgPLyYLF6vSaX9nAsRWnnaZNMLsYPBacIwEscvPTJ+povUHiU3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824561;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YGoSG8pwY3+EuSZlWjBvKFqdQt3SGCVXshvFk4MF3ns=;
	b=pGLHprvQS2RpEsPcTIoL6J50w8p56ZvJZT4c0+FM8ckxMHM43xbxUxfc3T99OIDUpsIL
	 8BobwYWAlGtf2FLeZSDSPN3YzqKmze9+xH2l4Ryt32S++VdYlC0Zc2t135Q/ONrGo7nqA
	 jKx+0hZ79zx8l0F1ifUfD/s4Q5DiS9xbzoPwNvIAKpqzpXywGtXci2Zl7gpseqRYwRZOy
	 wwUHTeJG5W9P/h3VQsw5HobQHIu2I5ivNQweK5qgX2fIfOOVJRHWEvraFC7PsTsoiLwWu
	 6gZi9GjyWjuEaKtgoJTDREmfPtH3DL1UCNkYTF18pxM3704CpjG3pHnPGfD4Ug6Ljkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECRmi4ey;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D6606A335;
	Mon, 16 Nov 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECRmi4ey
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318E11F000C5;
	Mon, 16 Nov 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824561;
	bh=YGoSG8pwY3+EuSZlWjBvKFqdQt3SGCVXshvFk4MF3ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ECRmi4eyO6lLaQigj8E0XyGNYvP7BMBZcdF6Ax6YJY+wR/0TNFkbZZC9Ctxxa0xI8
	 0aKuJp7s+VIAHnD0pWY3TfHHb1M+z9aimLFI4OWDzcLk/ksQqxE3YmcSRBW3ivYjnI
	 XcrR8K+foOzj4qkK62CQGFXEOgczYUJjuF1H4K0sJXmBKeL8wq3O0PHVhHkEtBaUuk
	 0dj+PwfYDDiLHlfG7UCXQrHVegwSW7uzQWge7YhcQ44FIj2Yv1sDLF7Nu5aUsnAZ25
	 tYnkhsLwi0GbFfV5FyRMOoFZ/idjSePVrKqRXTVDVqLThgH1SIRig62bUTqTln76Hg
	 3WHy43Pc1S9/w==
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
Subject: [PATCH net-next v2 1/2] net: sgi: ioc3-eth: apply the DMA attributes only to 64-bit addresses
Date: Mon, 16 Nov 2026 11:21:14 +0100
Message-ID: <20261116102115.27574-2-kaloz@kernel.org>
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

A Bridge 32-bit direct window address carries no target widget, so
DMA attributes OR-ed onto it aim it at widget 0. IP27 and IP30 only
hand the IOC3 64-bit direct addresses; IP35 support will hand it
window addresses.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 drivers/net/ethernet/sgi/ioc3-eth.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 009f37105eaf..25139cf5ff62 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -152,19 +152,37 @@ static inline int ioc3_alloc_skb(struct ioc3_private *ip, struct sk_buff **skb,
 }
 
 #ifdef CONFIG_PCI_XTALK_BRIDGE
+/* A Bridge 64-bit direct-mapped DMA address carries the target widget in
+ * bits 63:60 and the DMA attributes below it.  An address in the 32-bit
+ * direct window carries neither, so attributes OR-ed onto one form a
+ * 64-bit address aimed at widget 0.
+ */
 static inline unsigned long ioc3_map(dma_addr_t addr, unsigned long attr)
 {
+	if (!(addr & PCI64_ATTR_TARG_MASK))
+		return addr;
+
 	return (addr & ~PCI64_ATTR_BAR) | attr;
 }
 
-#define ERBAR_VAL	(ERBAR_BARRIER_BIT << ERBAR_RXBARR_SHIFT)
+/* The RX barrier's upper address bits follow the same form. */
+static inline u32 ioc3_erbar(dma_addr_t addr)
+{
+	if (!(addr & PCI64_ATTR_TARG_MASK))
+		return 0;
+
+	return ERBAR_BARRIER_BIT << ERBAR_RXBARR_SHIFT;
+}
 #else
 static inline unsigned long ioc3_map(dma_addr_t addr, unsigned long attr)
 {
 	return addr;
 }
 
-#define ERBAR_VAL	0
+static inline u32 ioc3_erbar(dma_addr_t addr)
+{
+	return 0;
+}
 #endif
 
 static int ioc3eth_nvmem_match(struct device *dev, const void *data)
@@ -727,7 +745,7 @@ static void ioc3_init(struct net_device *dev)
 	readl(&regs->emcr);
 
 	/* Misc registers  */
-	writel(ERBAR_VAL, &regs->erbar);
+	writel(ioc3_erbar(ip->rxr_dma), &regs->erbar);
 	readl(&regs->etcdc);			/* Clear on read */
 	writel(15, &regs->ercsr);		/* RX low watermark  */
 	writel(0, &regs->ertr);			/* Interrupt immediately */
-- 
2.47.3

