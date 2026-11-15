Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737600;
	b=NmoKtSHt5S/8SlJdMY2Y4JdF1I1TeVCtIfP1scqd8FP89CJ75lo9Nrrc2uaDnl7J/mcx
	 Gb8VSDV79m+Ev4VEQ4owGKxIX0CXcztHts96i64sE4Wd3YdQS3aqCRsHdxm74WNWUm7md
	 Xr5mzmxLe1Xsdd5Zb8qW822TbZHifTJNp41jMJT/V75EdveFALmOavc54F+lj/072pu7Q
	 RXsvFtawEJKdwSY1uz4HzBw/gik0D4HSOSVO6DGvqJAvMUpsFC6anZFHGsp2kl3g3X3O+
	 v6txElSwhiaObZ0pQHMrirDmTuuZ/VdA2+reSSQqiG02obuG5WhfRQwHb1LvGbJMzJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737600;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=orVIjeK5f2EFZpjqq8T9rpz60EOcQy7AnaVi8Tf6t3s=;
	b=urdcgVewNHqxW+C+IzNzH1QdlpnOip4xOnzOtF+g9xnq3wenAskmrXgVM1R0QxeNo22S
	 KlH3gL10NFjXeWTwUU3A81OZMtsojUyhsNhSJDEFEs+0H1d57Jy8SCk5JGu2IGSnEPj4q
	 DdgkKOSHkT+P1Nj6p5NTBnt8R5QLlMnMehQy+DUTgOdJILiws2GeeL8kIPRHRmaLYytsf
	 8ey6EjfWigjrHhYaJsjyFkENQTGvACL7DxmV+LJOja7Hx+AWCMylZduCwTtCxC9D+NKiN
	 A/pL8KcMXnL7Ii/gXDuNysqj4AtVTFykz+drHWalBE3FQjrCf9fJQAqSMLMnHG15M+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4rDq6RV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7A606A31F;
	Sun, 15 Nov 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4rDq6RV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDCC1F000C4;
	Sun, 15 Nov 2026 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737600;
	bh=orVIjeK5f2EFZpjqq8T9rpz60EOcQy7AnaVi8Tf6t3s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E4rDq6RVrZ60xvB3RSUH+2Mwrr+tpbMcXeeGAtzu6wsgdLDQGlGbwf7r4kzzC3LKe
	 HxlV2a2XvHQYx0YZTKudLPTnN7/kQP/ihkQ/L8bNTWLyKRYRjICMEL2Q4kSxnjfHXZ
	 cC1t7kx9g5fHA0ZDXLRRoRx3ghcmMtaU3jfnYpiM2ZESzkeUCJHnmAFF+TJGf2D3yp
	 BRYt43gfjSkPA8AjK6lQC+qYCKqdoM8NovCEhHl7yPG3ste3pOsFM1otCxVhOaiLS3
	 kUSbkS4TXGr220d2d2btoYO35MtvPmZVd0A2p+466u7gxdATpjAXfERWi+NhqwTC22
	 antaMFIOhRXCg==
Subject: Re: [PATCH net-next 1/2] net: sgi: ioc3-eth: apply the DMA attributes
 only to 64-bit addresses
From: netdev-bot+sashiko@kernel.org
To: kaloz@kernel.org
Cc: tsbogend@alpha.franken.de, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 10:13:19 +0000
Message-ID: <179473759964.2199510.1259617691806814840@kernel.org>
In-Reply-To: <20261111095138.1757-2-kaloz@kernel.org>
References: <20261111095138.1757-2-kaloz@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ioc3_init() picks the device-wide RX barrier upper-address
  bits from the RX descriptor ring's coherent address:…
- [Medium] For 32-bit direct-window addresses the patch drops every per-
  transaction Bridge attribute the driver used to request: - RX buffers…
- [Low] In this tree, the new 32-bit-window branches in ioc3_map() and
  ioc3_erbar() (drivers/net/ethernet/sgi/ioc3-eth.c:162-163 and 171-172,…

--

net: sgi: ioc3-eth: apply the DMA attributes only to 64-bit addresses

This patch changes ioc3_map() so that addresses with bits 63:60 clear
(the Bridge 32-bit direct window) are returned unchanged, without the
DMA attributes OR-ed in. It also replaces the ERBAR_VAL constant with
ioc3_erbar(), which sets the RX barrier upper address bits only when the
RX ring address is a 64-bit direct-mapped address.

> diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
> index 009f37105eafd..25139cf5ff62c 100644
> --- a/drivers/net/ethernet/sgi/ioc3-eth.c
> +++ b/drivers/net/ethernet/sgi/ioc3-eth.c
> @@ -152,19 +152,37 @@ static inline int ioc3_alloc_skb(struct ioc3_private *ip, struct sk_buff **skb,
>  }
>  
>  #ifdef CONFIG_PCI_XTALK_BRIDGE
> +/* A Bridge 64-bit direct-mapped DMA address carries the target widget in
> + * bits 63:60 and the DMA attributes below it.  An address in the 32-bit
> + * direct window carries neither, so attributes OR-ed onto one form a
> + * 64-bit address aimed at widget 0.
> + */
>  static inline unsigned long ioc3_map(dma_addr_t addr, unsigned long attr)
>  {
> +	if (!(addr & PCI64_ATTR_TARG_MASK))
> +		return addr;

[Severity: Low]
Can the code currently in the tree ever reach this branch? With
CONFIG_PCI_XTALK_BRIDGE, phys_to_dma() is the only source of IOC3 DMA
addresses:

arch/mips/pci/pci-xtalk-bridge.c:phys_to_dma() {
	...
	return bc->baddr + paddr;
}

and bridge_probe() always sets:

	bc->baddr = (u64)bd->masterwid << 60 | PCI64_ATTR_BAR;

masterwid is never zero. IP27 uses 0xa for a directly attached Bridge,
or the hub's xbow port from xbow_probe(). IP30 uses IP30_WIDGET_HEART
(8). That means every address the IOC3 gets from dma_map_single() or
dma_alloc_coherent() has bits 63:60 set. The same applies to the new
check in ioc3_erbar().

dma_to_phys() only masks bits 63:56, so it also could not round-trip a
window address.

The commit message says:

  "An address in the 2GB 32-bit direct window carries neither, so
  attributes OR-ed onto one aim it at widget 0, and every receive
  raises a PCI error."

and:

  "IP27 and IP30 give the IOC3 64-bit addresses; behind an XBridge or
  PIC it can use the window."

In this tree, XBridges are handled by the IP27 and IP30 code
(XBRIDGE_WIDGET_PART_NUM in probe_one_port() and xtalk_init_widget()),
and they still get 64-bit addresses. There is no PIC or IP35 support
yet.

Could the commit message say that this prepares for platform code that
hands out window addresses? As written, it reads like a fix for an RX
failure on existing systems.

> +
>  	return (addr & ~PCI64_ATTR_BAR) | attr;
>  }
>  
> -#define ERBAR_VAL	(ERBAR_BARRIER_BIT << ERBAR_RXBARR_SHIFT)
> +/* The RX barrier's upper address bits follow the same form. */
> +static inline u32 ioc3_erbar(dma_addr_t addr)
> +{
> +	if (!(addr & PCI64_ATTR_TARG_MASK))
> +		return 0;
> +
> +	return ERBAR_BARRIER_BIT << ERBAR_RXBARR_SHIFT;
> +}

[Severity: Medium]
For a window address, ioc3_map() and ioc3_erbar() now drop every Bridge
attribute the driver used to request:

  ioc3_alloc_rx_bufs() and ioc3_rx(): RX buffers lose PCI64_ATTR_BAR
  ioc3_start(): RX and TX ring bases lose PCI64_ATTR_PREC
  ioc3_start_xmit(): TX buffers lose PCI64_ATTR_PREF
  ioc3_init(): ERBAR is written as 0

Window addresses cannot carry these attributes. For 32-bit direct DMA
the Bridge takes them from the slot's b_device register instead.
BRIDGE_DEV_D32_BITS in arch/mips/include/asm/pci/bridge.h lists
BRIDGE_DEV_PREF, BRIDGE_DEV_PRECISE, BRIDGE_DEV_COH and
BRIDGE_DEV_BARRIER for that.

In this tree, the only b_device setup that affects the IOC3 slot is:

arch/mips/pci/pci-xtalk-bridge.c:bridge_probe() {
	...
	for (slot = 0; slot < 8; slot++) {
		bridge_set(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
	...
}

followed by the IOC3 fixup:

arch/mips/pci/pci-xtalk-bridge.c:bridge_disable_swapping() {
	...
	bridge_clr(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
	...
}

Nothing sets BRIDGE_DEV_BARRIER or the other D32 attribute bits.

Without the barrier, could the RX status write to rxb->w0 become visible
before the packet data that ioc3_rx() reads once it sees ERXBUF_V?

Does the window path rely on platform code setting the D32 bits in
b_device for the IOC3 slot? If so, could the commit message mention
that, or could the setup be done together with this change?

>  #else
>  static inline unsigned long ioc3_map(dma_addr_t addr, unsigned long attr)
>  {

[ ... ]

> @@ -727,7 +745,7 @@ static void ioc3_init(struct net_device *dev)
>  	readl(&regs->emcr);
>  
>  	/* Misc registers  */
> -	writel(ERBAR_VAL, &regs->erbar);
> +	writel(ioc3_erbar(ip->rxr_dma), &regs->erbar);

[Severity: Medium]
Should the ERBAR value be decided from the RX descriptor ring address?
ERBAR is set once for the whole device from the coherent ring address,
but the RX barrier applies to writes into the RX data buffers.

Each buffer is mapped on its own by dma_map_single() in
ioc3_alloc_skb(), and its form is decided per buffer:

ioc3_alloc_rx_bufs():
	ip->rxr[i] = cpu_to_be64(ioc3_map(d, PCI64_ATTR_BAR));

ioc3_rx():
	rxr[n_entry] = cpu_to_be64(ioc3_map(d, PCI64_ATTR_BAR));

drivers/mfd/ioc3.c sets a 64-bit DMA mask, and the 2GB window covers
only part of memory. A platform that picks the window or the 64-bit
form by physical address could therefore put the ring in one form and
the buffers in the other.

If the ring is 64-bit and the buffers use the window, ERBAR still adds
the BAR attribute to barrier writes into window-addressed buffers. That
gives the widget 0 PCI error the commit message describes.

If the ring uses the window and the buffers are 64-bit, the barrier is
cleared for buffers that need it.

Could ioc3_erbar() use something that also holds for the RX buffers?
Alternatively, could the buffer mappings be kept in the same form as the
ring?

>  	readl(&regs->etcdc);			/* Clear on read */
>  	writel(15, &regs->ercsr);		/* RX low watermark  */
>  	writel(0, &regs->ertr);			/* Interrupt immediately */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111095138.1757-1-kaloz%40kernel.org
