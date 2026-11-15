Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737601;
	b=non0hSIcsLjyav+TD8E/+FZKyTi9aYC0O3NzjRfH5K+zMFiW7eeEHojJhyP1GNoff0rG
	 xbbl3UChnNOK09OF7XrJ3FfBAkaEYSC00FHidcKFJx7gb4OaRIGZRVM62r18bcpnyUe7I
	 rPuw6Km1AodmvwRWKIm9vgTj923O8GzlMjX7BHdLw+xHpOg8Ase1wfVXbFrbY9i2frDeu
	 gXGfisyrtobMzfluNXGnPxtchaoQA8f5UEfRSTB5STuo0KSNdu1y3wzqwOXeCcG5E68qx
	 nUJB7tO+M4ehRGUhm3ONNsiLdk95qljOSD+Nq//e4PcVf4xhBduvIYR/soEL9U/wmog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737601;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jtnXHcWywjlfBkVLTsyb8zYKyCaVO1U2rJtTlOc5KvQ=;
	b=ZBnwiCZqgYFvY2Uo0JJgYas1Rm9W6gXH0klx8nOuC5Izyg44RDxKzegtOY0quYEGcmKg
	 /UpiSevbvkOnKFxluFwkTrXPFkQfkbYL2nrTcAyAI7jsU1gwUUMhCoiYoj+WVDpTDs9wJ
	 XxDA+QI2F9G+fxnqc8ij64jhGRs1kJiwB0V+ILBGvaTMcSMCTgCEn6oDGS5vWwn35FBEU
	 ITozTKklXKXibwNsUN9knbvLmvRaPnwyMhr9zKedXVOMzf03z6tsdetFCTk1hr0j4zGOX
	 +RsCbBhTZxXdt1qoDhyh+wr8a00tcNxbwVPpSWwacWzQDubPdIU41OCeeeS6/dJJjgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVfcAlFk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC78B606A332;
	Sun, 15 Nov 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aVfcAlFk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3B01F000C9;
	Sun, 15 Nov 2026 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794737601;
	bh=jtnXHcWywjlfBkVLTsyb8zYKyCaVO1U2rJtTlOc5KvQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aVfcAlFk1paqR72wQl8cNVKs7vs2VIt/BCaW7ml8GhqH9jry/Wec2xv8RkpLZErjh
	 /PyPbPNz/8tjZCcMaAJe7dxjz9FIOL6nq+ZBCB6FMa5YXHWQ4nceAGmYSvwnvp0ERx
	 /Cm2A7Ltwg3cqbnimbRwmyZom+QHmpJGQRL3Jrbztdeyw2stxdMNLH/NUa+mJSkMW5
	 7QgEIZAbcrfKjxC1TA8bhIAI9EUyLAcDML4DlMudWIi2SCGkBzUgfRTcroaqu3AXp0
	 n6QEAafMa3TCLhWkpVAPzRnFA3esyymC74VBOv8mWku/2X+406Y950nIqXFpZJgyvf
	 JYB/LOYV9iUOg==
Subject: Re: [PATCH net-next 2/2] net: sgi: ioc3-eth: fall back to the
 platform MAC address
From: netdev-bot+sashiko@kernel.org
To: kaloz@kernel.org
Cc: tsbogend@alpha.franken.de, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 10:13:20 +0000
Message-ID: <179473760071.2199510.16065103101920438822@kernel.org>
In-Reply-To: <20261111095138.1757-3-kaloz@kernel.org>
References: <20261111095138.1757-3-kaloz@kernel.org>
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

Critical: 0 · High: 0 (2) · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new 'or from the platform' fallback in ioc3eth_probe() can
  never succeed for any ioc3-eth device in the tree.
- [Medium] The patch puts a permanent random-MAC fallback on every IOC3
  platform, not just Fuel.
- [Medium] net: sgi: ioc3-eth: premature platform MAC fallback in
  ioc3eth_probe()

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  ioc3eth_probe() never calls platform_set_drvdata(pdev, dev).
- [High] This problem wasn't introduced by this patch, but
  ioc3eth_probe() registers its handler with…

--

net: sgi: ioc3-eth: fall back to the platform MAC address

With this patch, ioc3eth_probe() calls eth_platform_get_mac_address()
when the 1-wire MAC PROM cannot be read. The probe now defers only while
driver_deferred_probe_check_state() returns -EPROBE_DEFER. After deferred
probing gives up, the netdev is registered with a random MAC address.

> diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
> index 25139cf5ff62c..5296614bf3fb8 100644
> --- a/drivers/net/ethernet/sgi/ioc3-eth.c
> +++ b/drivers/net/ethernet/sgi/ioc3-eth.c

[ ... ]

> @@ -857,9 +858,16 @@ static int ioc3eth_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "Invalid resource\n");
>  		return -EINVAL;
>  	}
> -	/* get mac addr from one wire prom */
> -	if (ioc3eth_get_mac_addr(regs, mac_addr))
> -		return -EPROBE_DEFER; /* not available yet */
> +	/* get mac addr from one wire prom, or from the platform */
> +	if (ioc3eth_get_mac_addr(regs, mac_addr) &&
> +	    eth_platform_get_mac_address(&pdev->dev, mac_addr)) {

[Severity: Medium]
Does this ordering let the platform address win before the 1-wire PROM
has had a chance to appear?

eth_platform_get_mac_address() runs as soon as ioc3eth_get_mac_addr()
fails. That happens before driver_deferred_probe_check_state() is
consulted at all. On the first probe attempt the PROM nvmem device
essentially never exists yet:

- mfd_add_devices() registers the ioc3-eth cell before the sgi_w1 cell
  in ioc3_eth_cells[].
- sgi_w1_probe() only registers the master with w1_add_master_device().
  The bus search runs later in the asynchronous w1_process() kthread.
- The nvmem device only appears once w1_ds250x binds the slave in
  w1_eprom_add_slave().

The IOC3 MFD cells have no of_node, so eth_platform_get_mac_address()
falls through to arch_get_platform_mac_address(). That hook takes no
device argument and returns the same system-wide address to every
caller.

Suppose a platform implements that hook, as I assume the rest of the
IP35 series does for Fuel. Then every IOC3 in the machine takes the
system-board address on its first probe and never defers. That covers:

- PCI add-on IOC3 cards such as CAD DUO, MENET or MENET4
- IOC3s in secondary IO bricks

All of these carry their own factory PROM. Their real addresses are
ignored, and several interfaces end up sharing one MAC. That breaks as
soon as two of them sit on the same segment. Nothing re-reads the PROM
later, so the duplicate address stays for as long as the device is
bound.

Should the platform address only be consulted once
driver_deferred_probe_check_state() stops returning -EPROBE_DEFER? If
that brings back the long boot delay on Fuel, could the platform
fallback instead be limited to the system-board IOC3 that is known to
have no PROM?

[Severity: Medium]
Can eth_platform_get_mac_address() ever succeed for this device?

The ioc3-eth platform device is only ever created by this cell in
drivers/mfd/ioc3.c:

static struct mfd_cell ioc3_eth_cells[] = {
	{
		.name = "ioc3-eth",
		.resources = ioc3_eth_resources,
		.num_resources = ARRAY_SIZE(ioc3_eth_resources),
	},

The cell has no of_compatible, swnode or platform_data. So
mfd_add_device() leaves pdev->dev.of_node NULL and attaches no software
node.

eth_platform_get_mac_address() checks only two sources:

net/ethernet/eth.c:eth_platform_get_mac_address() {
	ret = of_get_mac_address(dev->of_node, mac_addr);
	if (!ret)
		return 0;

	addr = arch_get_platform_mac_address();
	if (!addr)
		return -ENODEV;
	...
}

Only sparc overrides arch_get_platform_mac_address(). On MIPS
(IP27/IP30/IP35) the __weak default returns NULL, so this call always
returns -ENODEV.

The commit message says "so a platform that knows the address can supply
it". As far as I can tell, no platform can do that today.

Adding a software node or device property later would not help either,
because eth_platform_get_mac_address() never looks at fwnode properties.
That would need something like device_get_ethdev_address() or
fwnode_get_mac_address().

On Fuel, every probe therefore goes straight to the deferral logic. The
device binds only after the deferred probe timeout expires (up to 10
seconds with CONFIG_MODULES). It then always gets a random MAC that
changes on every boot.

> +		err = driver_deferred_probe_check_state(&pdev->dev);
> +		if (err == -EPROBE_DEFER)
> +			return err; /* not available yet */
> +
> +		dev_warn(&pdev->dev, "no MAC address, using a random one\n");
> +		random_mac = true;
> +	}

[Severity: Medium]
Could IP27/IP30 boards that do have a DS250x MAC PROM end up with a
random MAC here?

driver_deferred_probe_check_state() decides using only global state
(initcalls_done and driver_deferred_probe_timeout). It has no way to know
whether this device's 1-wire PROM can still appear.

ioc3-eth and its PROM provider sgi_w1 are sibling cells in
ioc3_eth_cells[]. The PROM nvmem only appears after these steps:

- the asynchronous w1_process() kthread runs w1_search_process()
- the slave gets attached
- w1_ds250x registers the nvmem device in w1_eprom_add_slave()

SGI_IOC3_ETH and SGI_MFD_IOC3 are bool. W1, W1_MASTER_SGI and
W1_SLAVE_DS250X are tristate and not selected, so they are often modules
that udev loads later.

Before this patch, ioc3-eth returned -EPROBE_DEFER until the slave bound,
so it always picked up the factory MAC. With this patch, the following
sequence is possible:

deferred_probe_timeout_work_func()
  driver_deferred_probe_timeout = 0, retrigger deferred probe
ioc3eth_probe()
  ioc3eth_get_mac_addr()
    nvmem_device_find() fails, PROM not enumerated yet
  driver_deferred_probe_check_state() returns -ETIMEDOUT
  random_mac = true
  eth_hw_addr_random(dev)

On CONFIG_MODULES=n kernels, -ENODEV is returned as soon as
initcalls_done is set. In that case the outcome depends on a race with
the w1 kthread search.

After this, nothing reads the PROM again, so the random address stays
for as long as the device is bound. A transient nvmem or 1-wire read
error in ioc3eth_get_mac_addr() after the deferral window closes has the
same permanent effect.

Should the random fallback be limited to boards that are known to have
no PROM?

> @@ -938,7 +946,10 @@ static int ioc3eth_probe(struct platform_device *pdev)
>  
>  	ioc3_mii_start(ip);
>  	ioc3_ssram_disc(ip);
> -	eth_hw_addr_set(dev, mac_addr);
> +	if (random_mac)
> +		eth_hw_addr_random(dev);
> +	else
> +		eth_hw_addr_set(dev, mac_addr);
>  
>  	/* The IOC3-specific entries in the device structure. */
>  	dev->watchdog_timeo	= 5 * HZ;

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. Now that
ioc3eth_probe() can bind on boards like Fuel, which used to defer
forever, will unbinding the device oops in ioc3eth_remove()?

ioc3eth_probe() never calls platform_set_drvdata(pdev, dev), but
ioc3eth_remove() depends on it:

drivers/net/ethernet/sgi/ioc3-eth.c:ioc3eth_remove() {
	struct net_device *dev = platform_get_drvdata(pdev);
	struct ioc3_private *ip = netdev_priv(dev);

	unregister_netdev(dev);
	timer_delete_sync(&ip->ioc3_timer);
	...
	free_netdev(dev);
}

Here dev is NULL. unregister_netdev(NULL) and
timer_delete_sync(&ip->ioc3_timer) therefore dereference a NULL-derived
pointer. The registered netdev, the timer and the DMA rings are never
torn down.

Two ways to reach this:

- writing to /sys/bus/platform/drivers/ioc3-eth/unbind (the driver does
  not set suppress_bind_attrs)
- unbinding the parent IOC3 PCI device, which goes through
  mfd_remove_devices()

[Severity: High]
This is also a pre-existing issue, not one introduced by this patch. The
patch does make the later probe error paths reachable on Fuel. Is the
shared IRQ handler safe with the current ordering in ioc3eth_probe()?

The IRQ is requested before the lock and timer it uses are initialized:

	if (devm_request_irq(&pdev->dev, dev->irq, ioc3_interrupt,
			     IRQF_SHARED, "ioc3-eth", dev)) {
	...
	spin_lock_init(&ip->ioc3_lock);
	timer_setup(&ip->ioc3_timer, ioc3_timer, 0);

	ioc3_stop(ip);

Suppose a shared-line interrupt arrives in that window:

- ioc3_interrupt()->ioc3_tx() or ioc3_error() would take an
  uninitialized ip->ioc3_lock.
- ioc3_error() would do ring maintenance while ip->rxr is still NULL.

The IRQ is devm-managed, so it is only released after probe returns.
Every error path after the request (ring allocation failure, "Didn't
find a PHY", register_netdev() failure) ends with:

out_free:
	free_netdev(dev);
	return err;

At that point the handler is still registered, and its dev_id points at
the freed net_device. ioc3_interrupt() then reads ip->regs from freed
memory:

	struct ioc3_private *ip = netdev_priv(dev_id);
	struct ioc3_ethregs *regs = ip->regs;
	u32 eisr;

	eisr = readl(&regs->eisr);

With CONFIG_DEBUG_SHIRQ, __free_irq() always calls the handler for
IRQF_SHARED actions when the devres IRQ is released. So on these error
paths this use-after-free happens every time.

ioc3eth_remove() has the same ordering: it calls free_netdev() before
the devres IRQ is released. Today remove oopses before reaching that
point, because drvdata is never set.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111095138.1757-1-kaloz%40kernel.org
