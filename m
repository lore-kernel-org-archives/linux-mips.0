Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083772;
	b=OZSoe+kLjf0Zzc/CMQZDWBckasK0rFE3DvG+39s3PORjutFWkX1bGYSWKu2vqKZWSfpP
	 FQtVZJehhLfjfnPkYdhVXKD+ND5YveZjzCXs0A3H736wTuKyk7O0pZRwp5/QV+kp3jdS7
	 6EzFDC3U+xg5qzAscIDO4Nela98vHM9sJ7GLHblm2ycCwtp1glGFxHg1sms6pNHAb+aDr
	 PaTDJmiYusm7t4ceAAkS2g6waD6zmnRXUg5IxTy4T0L6ITCL+unerz3PhmyDgeMZEnz8m
	 az+nIhRJQ/Dg5qPfLpDERDwnPljpBpCRb02UMt5ClHiPP+GWgWg0f+MDCSJ7mqS4+4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083772;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wPVIvL96HjIC/G5XUmS2oSnBr5CQE3262Q+aEFqOucA=;
	b=xMINKDJ3cJQFfn0AKEY6jS8zynu59FIrcHGPMVtqMg+0WfoqL7/iw4mvX7snNYJGYtME
	 klzCBJAyhq6bzLemEAfCdKFi2yBISTivRx5Kjio3akY395lTjISJ5BD5A7APTKtjimoJw
	 ZcRa68M9eAY2fOFrZV18vZlX7jhHQz1xoKE6oDoHMAmzXyIOjLyt0LxrBZuUaImlzZS0O
	 YZ5XsEji7sAAuq1LKvlYIZ6hh317uWRVM/lZ95bH4OW8hVd3rRYYUwehPzUV0NltryssG
	 Uv92N94dd5Jrvu4nis1495RvkDZrcIrU4wfRoLb9D4ZgyzWZxP75IjweyV9NhtKE/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBviKqwO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C300606A334;
	Thu, 19 Nov 2026 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oBviKqwO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B386C1F000C5;
	Thu, 19 Nov 2026 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083772;
	bh=wPVIvL96HjIC/G5XUmS2oSnBr5CQE3262Q+aEFqOucA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oBviKqwO4UPllqvcmE/GMQO2l40xuUnH+AscQfq5vQDk7NFfLuII67SLofbeC8Y1k
	 EqVJNnHebWlJKuNgYusA1LDqrmcIiNrJHlXWdx+gwvTNCcJ5nksDIwAx1W3xWIygqk
	 MVTddbm9zT4rOkJbNA6bIN7VU3f0EKj/bWrnrM1XQmygHMaS96KudiYiE5T7cB+Lfv
	 UPzStIIWJ2Hy4JFvCSuFE5ZJ4botZJ4mWHepAeArIZx4zgyz3C77BFweB2U1eaQ1gK
	 qno2EL5d69vgzP/FGGzeHnFKCpJzEFTzEZhPHXm759JLqh8QzPiX2xQkNSaKDQTqqx
	 uIHrvWVqFzDWw==
Subject: Re: [PATCH net-next v2 2/2] net: sgi: ioc3-eth: take the MAC address
 from a device property
From: netdev-bot+sashiko@kernel.org
To: kaloz@kernel.org
Cc: tsbogend@alpha.franken.de, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 10:22:51 +0000
Message-ID: <179508377126.3136.8138823841306639675@kernel.org>
In-Reply-To: <20261116102115.27574-3-kaloz@kernel.org>
References: <20261116102115.27574-3-kaloz@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (2) · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new fallback in ioc3eth_probe()
  (drivers/net/ethernet/sgi/ioc3-eth.c:861-863) calls…
- [Medium] On a board that has a 1-wire MAC PROM and also gets the new
  device property, which MAC address ioc3eth_probe() uses depends on…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  ioc3eth_probe() never calls platform_set_drvdata(pdev, dev), while…
- [High] This problem wasn't introduced by this patch, but
  ioc3eth_probe() requests the IRQ with devm_request_irq(&pdev->dev,…

--

net: sgi: ioc3-eth: take the MAC address from a device property

This commit adds a device_get_mac_address() fallback to ioc3eth_probe().
It is used when the MAC address can't be read from the 1-wire PROM, so
that boards without a PROM no longer defer probing forever.

> diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
> index 25139cf5ff62c..fa844267c325a 100644
> --- a/drivers/net/ethernet/sgi/ioc3-eth.c
> +++ b/drivers/net/ethernet/sgi/ioc3-eth.c
> @@ -857,8 +857,9 @@ static int ioc3eth_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Invalid resource\n");
>  		return -EINVAL;
>  	}
> -	/* get mac addr from one wire prom */
> -	if (ioc3eth_get_mac_addr(regs, mac_addr))
> +	/* get mac addr from one wire prom, or from a device property */
> +	if (ioc3eth_get_mac_addr(regs, mac_addr) &&
> +	    device_get_mac_address(&pdev->dev, mac_addr))

[Severity: Medium]
Can device_get_mac_address() succeed for this device on any in-tree board?

Only ioc3_eth_setup() in drivers/mfd/ioc3.c creates the ioc3-eth platform
device, and it does so from this cell:

drivers/mfd/ioc3.c:
static struct mfd_cell ioc3_eth_cells[] = {
	{
		.name = "ioc3-eth",
		.resources = ioc3_eth_resources,
		.num_resources = ARRAY_SIZE(ioc3_eth_resources),
	},

The cell sets neither .swnode nor .of_compatible, and IP27/IP30 have no
DT or ACPI. So mfd_add_device() never gives the child a fwnode.
dev_fwnode() returns NULL and fwnode_get_mac_address() fails.

The second step, nvmem_get_mac_address(), ends up in
nvmem_cell_get_from_lookup(), which is keyed by dev_name(). The child is
registered with PLATFORM_DEVID_AUTO ("ioc3-eth.N.auto"), so board code
can't target it reliably. Nothing in tree registers such a lookup either.

As far as I can tell, boards without a 1-wire MAC PROM still defer
forever, which is the problem the commit message says this fixes.

Which board is this meant for? Is there a companion change to
drivers/mfd/ioc3.c, for example a software node with "mac-address" or
"local-mac-address" attached to the ioc3-eth cell?

The previous commit in the series mentions "IP35 support will hand it
window addresses", so the user may be out of tree or not posted yet. Could
the commit message say so?

[Severity: Medium]
What happens on a board that has the 1-wire PROM and also gets the
property?

ioc3eth_get_mac_addr() passes the nvmem_device_find() error through
unchanged:

	nvmem = nvmem_device_find(prefix, ioc3eth_nvmem_match);
	if (IS_ERR(nvmem))
		return PTR_ERR(nvmem);

nvmem_device_match() in drivers/nvmem/core.c returns
ERR_PTR(-EPROBE_DEFER) whenever the PROM's nvmem device isn't registered
yet. So "no PROM fitted" and "PROM not enumerated yet" give the same
error here.

The PROM's nvmem device only appears after the w1 master kthread
(w1_process()->w1_search_process()) finds the slave and the family driver
binds. Also, the "ioc3-eth" cell comes before "sgi_w1" in
ioc3_eth_cells[], so the first ioc3-eth probe can run before the 1-wire
master exists at all.

Before this patch, any PROM failure deferred the probe, so a board with a
PROM always ended up using the PROM address. Now the first failed lookup
falls back to the property and probe succeeds. eth_hw_addr_set() and
ioc3_init() then program that address into EMAR_H/EMAR_L for the rest of
the boot.

Could the MAC address then change from boot to boot, depending on w1
enumeration timing? The new comment suggests the PROM takes priority, but
that only holds if enumeration finishes first.

A PROM with a bad CRC (-EINVAL) also falls back to the property without
any message, and nothing logs which source supplied the address.

>  		return -EPROBE_DEFER; /* not available yet */
>  
>  	dev = alloc_etherdev(sizeof(struct ioc3_private));

[Severity: High]
This isn't a bug introduced by this patch, but ioc3eth_probe() never calls
platform_set_drvdata(pdev, dev), while ioc3eth_remove() relies on it:

drivers/net/ethernet/sgi/ioc3-eth.c:ioc3eth_remove() {
	struct net_device *dev = platform_get_drvdata(pdev);
	struct ioc3_private *ip = netdev_priv(dev);

	unregister_netdev(dev);
	timer_delete_sync(&ip->ioc3_timer);
	...
}

After a successful probe, won't platform_get_drvdata() return NULL here?
If so, unregister_netdev(NULL) oopses. The timer_delete_sync() and
dma_free_coherent() calls would then work on a bogus ip pointer, and the
netdev, DMA rings and timer never get torn down.

This path is reachable through /sys/bus/platform/drivers/ioc3-eth/unbind
(suppress_bind_attrs isn't set), or by removing the parent IOC3 MFD
device.

Because this patch lets probe succeed on more boards, more systems can
reach this remove path.

[Severity: High]
This is also a pre-existing issue, but ioc3eth_probe() requests a shared
IRQ with devm and passes the net_device, which isn't devm-managed, as
dev_id:

	if (devm_request_irq(&pdev->dev, dev->irq, ioc3_interrupt,
			     IRQF_SHARED, "ioc3-eth", dev)) {

Every error path after that ends here: rx/tx ring allocation failure, the
"Didn't find a PHY" case, and register_netdev() failure.

out_free:
	free_netdev(dev);
	return err;

The netdev was never registered, so free_netdev() frees it right away.
The IRQ stays installed until devres_release_all() runs after probe
returns. ioc3eth_remove() has the same ordering: it calls free_netdev(dev)
before devres frees the IRQ.

Can ioc3_interrupt() run on the freed net_device in that window?

static irqreturn_t ioc3_interrupt(int irq, void *dev_id)
{
	struct ioc3_private *ip = netdev_priv(dev_id);
	struct ioc3_ethregs *regs = ip->regs;
	u32 eisr;

	eisr = readl(&regs->eisr);
	writel(eisr, &regs->eisr);
	...

An interrupt from another device on the shared line can trigger this.
With CONFIG_DEBUG_SHIRQ it always happens, because __free_irq() calls the
handler one extra time for IRQF_SHARED actions.

Either a plain request_irq()/free_irq() pair, with free_irq() called
before free_netdev(), or devm_alloc_etherdev() would avoid this.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116102115.27574-1-kaloz%40kernel.org
