Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083771;
	b=5nB4MzGnWvP4gzPXDbIp+QY57S71ZIP69YRPkDmtUbXknyJLFpto0G1G6npu5BZH60/T
	 RaKWnnR3ubzpwg3WQ8y0J9rFD4p2WKGXko3YHjrSR7EDXgz0scAlh4URSMInldO6SA/Wf
	 dcCo9yniBMzdas2IvQ1fXcJ8he4439jzrS1d5ddm0/k5VELn+FQGFM8f/ublcd11sr1KI
	 irhB6V50iJ0V5/aHK9cGqqYpYyRvVKWiOP3+8dur30fjXCjcp5Er9LJzjjc3gEB/S2OUA
	 8axJFWhf+uBJH4+UJwJBtdZxvzxY/vu49Yyf75SivcCwUN34tUFYW6BmBe/mxb4E7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083771;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=x9Sid8iNVw4dh1bKxejHdkoE+71ywmFm/O/ABLW5z04=;
	b=1fBqInIZHQAg161J0ag2l4ApBmvfU3xSL8rEuRkr/nGRlx2K/gfSfkq0Pl4hOyHQupdU
	 v2B4dDogCgINGkkPXXMM0UP33zsEAgs50lyjhK2K1NAYDvENJ9NyR8L1DO+CluKD07C/X
	 oJXgYwH3ZYgBBC+snK/W4OrKR6SMFYKj6s1JJcmjcpm31M2lRZLCjGbvuVzvetXqVPiyy
	 umDxZSYNisdJNwRAiMiqfGasI/pqxYHIj+icpCePodi4qtMRgHaYQzc+6uHFZFTtiZYl4
	 xp/p4C4wDXLU5ajWrqjhZgZD2TzueVHMmGVsEs9cXTT3ShxGBQKcxbQmoWOT/p37zNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS6zayaM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463FC606A320;
	Thu, 19 Nov 2026 10:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS6zayaM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870881F000C5;
	Thu, 19 Nov 2026 10:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083771;
	bh=x9Sid8iNVw4dh1bKxejHdkoE+71ywmFm/O/ABLW5z04=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HS6zayaMQkFk0iMJ2Y2L5LChUywcf4EYq7a1XZA/kCvgZg3UCFJOq+6icwcJ9Ucru
	 ifHGYbb8xhQJhchJbDJ8NFtBe4TLsBqA9MobNhaztjKfDEAGaYpbiZLumvZ86VWr/R
	 Jigf/cTk7hqTt6akbrv38fOnHdcpJEwfrN/BUAewtaNXrX/wcDCnmJpZ42vjMHPhbe
	 zmcJ68dR9H1aunUqcA2zqpw2FeasoRkERU46CzojD87E0ibko7mh3wqxdPfgqvKoBN
	 eC2j0H8zWiZVWsDpDxBnyFrLibQA05Zv8lpXUdzdvl6J3Cofie6n4/vziN7YRgxssl
	 vXprvnXlSSekw==
Subject: Re: [PATCH net-next v2 1/2] net: sgi: ioc3-eth: apply the DMA
 attributes only to 64-bit addresses
From: netdev-bot+sashiko@kernel.org
To: kaloz@kernel.org
Cc: tsbogend@alpha.franken.de, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 10:22:50 +0000
Message-ID: <179508377005.3136.7735552086490209084@kernel.org>
In-Reply-To: <20261116102115.27574-2-kaloz@kernel.org>
References: <20261116102115.27574-2-kaloz@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On 32-bit direct-window DMA addresses, the new helpers drop
  all Bridge DMA attributes, and nothing provides them another way.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is in
  ioc3_init(), the function the patch changes.

--

net: sgi: ioc3-eth: apply the DMA attributes only to 64-bit addresses

This commit changes ioc3_map() so it leaves out the Bridge DMA attributes
when the DMA address has no target widget in bits 63:60, which is the case
for a 32-bit direct window address. It also replaces ERBAR_VAL with
ioc3_erbar(), which returns 0 for such addresses. ioc3_init() now picks
the ERBAR value from the RX ring DMA address. The goal is to prepare for
IP35 support, which will give the IOC3 window addresses.

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

For a 32-bit direct window address, ioc3_map() now returns the bare
address and ioc3_erbar() returns 0. Where do the dropped attributes come
from in that case?

Three attributes are lost. ioc3_rx() and ioc3_alloc_rx_bufs() lose
PCI64_ATTR_BAR on the RX buffer pointers. ioc3_start() loses
PCI64_ATTR_PREC on the ring bases. ioc3_start_xmit() loses PCI64_ATTR_PREF
on the TX buffer pointers.

For 32-bit direct DMA the Bridge takes these from the per-slot Device(x)
register (BRIDGE_DEV_PREF, BRIDGE_DEV_PRECISE and BRIDGE_DEV_BARRIER in
BRIDGE_DEV_D32_BITS). The only code in the tree that writes
b_device[slot] is bridge_probe(), and it sets only the swap bit:

arch/mips/pci/pci-xtalk-bridge.c:bridge_probe() {
    ...
		bridge_set(bc, b_device[slot].reg, BRIDGE_DEV_SWAP_DIR);
    ...
}

ERBAR is now 0 as well. What, then, orders the ERXBUF w0 valid-word store
after the payload stores? ioc3_rx() trusts that word before it reads the
frame:

	while (w0 & ERXBUF_V) {
		err = be32_to_cpu(rxb->err);		/* It's valid ...  */

Could the CPU see ERXBUF_V before the payload has landed, and pass a stale
or truncated frame up the stack?

There is a separate question about ioc3_init(), which picks the ERBAR
value from the coherent ring address:

	writel(ioc3_erbar(ip->rxr_dma), &regs->erbar);

ERBAR applies to the last store into each RX buffer. Those buffers are
separate streaming mappings from ioc3_alloc_skb(). ioc3_map() decides per
address, so suppose the ring gets a 64-bit address and an RX buffer gets a
window address. Wouldn't ERBAR still OR the barrier attribute into the
upper bits of that buffer's last store, which gives the widget 0 address
this patch is meant to avoid? This assumes the IOC3 ORs ERBAR onto the
upper address bits.

None of this can be reached on in-tree platforms. phys_to_dma() returns
bc->baddr + paddr, and baddr has a non-zero target nibble on both IP27 and
IP30. Whether it triggers depends on how the IP35 support maps DMA and
programs Device(x).

The commit message also doesn't say that the RX barrier is turned off for
window addresses, or what replaces it. Could that be added?

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

[Severity: High]

This isn't a bug introduced by this patch, but ioc3_init() starts with a
synchronous timer delete, and both error-recovery callers hold
ip->ioc3_lock when they call it:

ioc3_init() {
	timer_delete_sync(&ip->ioc3_timer);	/* Kill if running	*/
	...
}

ioc3_error() runs from the hardirq handler ioc3_interrupt() and does:

	spin_lock(&ip->ioc3_lock);
	...
	ioc3_init(dev);

ioc3_timeout() does the same thing with spin_lock_irq(). The timer
callback takes the same lock:

ioc3_timer()
  mii_check_media()
  ioc3_setup_duplex()
    spin_lock_irq(&ip->ioc3_lock);

Can this deadlock on SMP?

CPU A
ioc3_timer()
  ioc3_setup_duplex()
    spin_lock_irq(&ip->ioc3_lock)    <- spins on the lock CPU B holds

CPU B
ioc3_error() or ioc3_timeout()
  spin_lock(&ip->ioc3_lock)
  ioc3_init()
    timer_delete_sync()              <- waits for CPU A's callback

Also, ioc3eth_probe() sets up the timer without TIMER_IRQSAFE:

	timer_setup(&ip->ioc3_timer, ioc3_timer, 0);

So won't every hardirq call through ioc3_error() hit this check in
__timer_delete_sync()?

	WARN_ON(in_hardirq() && !(timer->flags & TIMER_IRQSAFE));

ioc3_error() runs on EISR_RXOFLO or EISR_RXBUFOFLO, so incoming traffic
that outruns the RX ring is enough to trigger it.

Last, ioc3_error() calls ioc3_mii_init() but not ioc3_mii_start(), unlike
ioc3_timeout(). If the timer is never re-armed, does link and duplex
monitoring stop after an error recovery?

>  	readl(&regs->etcdc);			/* Clear on read */
>  	writel(15, &regs->ercsr);		/* RX low watermark  */
>  	writel(0, &regs->ertr);			/* Interrupt immediately */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116102115.27574-1-kaloz%40kernel.org
