Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795293687;
	b=m4CxOl2BO5/KY/ner3+dMAS4t8eRttUSGXyY91CGYLOi/OFV2ksRAdxHrTWVBzTqsUlI
	 Z/09AyOGijlzszurHKLSehRBBTYkb5FOsKwxYXQeg2X+hp5xajZsuyJK7jnX1A+LNVCXq
	 8Quj7WJuSDO6xfWfw4/yZqt5Fj9bBIQ+/o/IybREuFCawqWtuniTJP/UirrfBTEpTtWVh
	 fKArvDxdaIj01APrDEpWkk0Ads7tg+VIpOlCE2tMlrK6YJwPFe8j7pnaPZGpa8YR8Zl2R
	 NZAbcEsN+TQvZ+Y3MDuqWk9oEPM/BuDfrAi3IlgX6IDh3PBN706x0HWJ/EVyE1B0aGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
	b=fUVWtvXrKpF1MDnIbwMvItmjCy8hG4J8Zwma9sDNky4tl5QmAs9Jh1iADGyr7DAcGJHG
	 UPYVvVTNy482s6QZB8EWpgHDPh/g13fmpNTGG4clo330fH81DjEY56N2rrExTOqQX+9Pt
	 ejI8ow7OgST0J8YJpchHUIeOcE2ELeVXk2VvqhaRa9V8PfHyQAueNewlOou13TR0ST6wB
	 UOI34OOke9Datg4Sd6VNaeGKMaOCR0OPPhREOoMNkP0TViXKN+0MQpLXHA8K17aABzkVE
	 8sebZ4c2U/s8brDg7E8pQRDnNihltByrFXB5brPbBsf7mZnzGhLuCVYLLsA4Bd36yjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIFKr7zi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B2606A680
	for <linux-mips@vger.kernel.org>; Sat, 21 Nov 2026 20:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2B2606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIFKr7zi
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc81984fceso796206137.0
        for <linux-mips@vger.kernel.org>; Sat, 21 Nov 2026 12:41:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795293686; cv=none;
        d=google.com; s=arc-20260327;
        b=byjEyjbAj6jgquNlxyIyYPPhrkgPjRz4pQ7XbSu/MDxdZXJFQxQM3oX7YbIRpBjKQz
         Ysg4mlVSY9v4dMQTwdx3BhNlRbdOIaBIpJ9XU9cjx/bGur+q0hGXDR6YW+8RHgD7WMOV
         xYWjjG31bpAUrZ3QtO9mmtN9oL+jQufdtq5eUvzty/hBWzb7re22ucfUBMYrLG3dSGnc
         JROu7Sts/Q53fjIppd9R7GpJ42JoPsDMG1ShE9TeKwgzBKKmJJhYGyZQ1oMV+HHdTZSY
         1UJxr+CRSZEX2E6KMJg45lIVGSOWpOEvlCWl25Rr3sOecIZ7lAwbaZjIbjJNdZCYqJI+
         vPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        fh=zIQEFVMrYICzOxCL0V+rZHONiX+J9ZQZttiE7/gaU54=;
        b=dQSYb8sdZ5Yk5ga7/je6ZMQD2bxkZ6L1lqIyBNaD8nEsQXjk5uKGgLJ1LB83BjBGkn
         nQttigdeEH6KKVH0SQsUNyYQr2oMTpy4wtPqeQLep3rbhj5HdGmr3yd5hLidqoflQ1qn
         saOJaZyjaxY8wvW6kw0vkxH3HDi5oWlXy1cEEa6De3jbNi7jqLT6ZakL32xytgsgCZSd
         KpI9P71MJZMjr5oyiZX/xy+s6Jsn74z3PUqY5WELyCckiciE2EWwZ/jeBIw3kVk/hsjV
         PrxHw7cBLnctORqnF0whXqzeaQvrIc10DRbj7O6X/5+CuhTbmbWnWV7uVd0aAwY4wrRK
         Bwnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795293686; x=1795898486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        b=sIFKr7ziVpsnhePY72Z1kJWSV9+Fh66r8G/U2pFQa4HYAgKYVRdx7lznQEXhzxrBQk
         4SMd+QUAG8kMskObIxl3B3oQJhBeBiFAnch+E5LqUxWCa/ft2mUgjg87hLopzn/oKGlW
         WGN0j0y0lHv75ZtnrwxCZi+hV5wFXBYlTf8AXT/Wo43ZnxlHGFUnMWt7f47pOzwGsXX8
         GAzU0m135SM35YHV5gfIeE5/yrjTFv8dfXKQH6yu6G9OJoMuMvFjZDp8La5lsD82fUv9
         dp/gzHHEmdRMu3bE3fIqVb3AKdZKmwQuQ6BQq0MSzEsDPMcnanrwB6QUa3BfvteE7HWA
         g6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795293686; x=1795898486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        b=xE30jnbjWOvRpzsoFHabkCj4XRCgAlWMDoK2ep+hgEiSr6+SUD93cNLcO+kxOy+pHa
         3WYqNudJPwT3adPeSjuLdqfUlm04WfpZbNtoPmZS/sYVyW/3NguAza3rOHVcpicm5RFQ
         pReCzoPIQBuupcqWUH7xPkScD4ypFyrCCbJsP0mvqZx0DNWFajEh+YG7Vo3TGzK82p0s
         6kJDfJKWFLkp/hNrmuIOjLSJuBNpTnyR+v6s2ETY9+STB4fmkpeFu6GHhP3kW41kni7o
         LnHQLM1qRGsiY1oDDuD2mq4tDPiE2MBtump+VZFjya1oFt6udy0oZ1AijU7XnLf1r9F8
         RVjg==
X-Forwarded-Encrypted: i=1; AL+hErF59BqXhiMw1kDwQnZQ3eU5oE0VAwLpNUQi4oOo7EoDVaQpQ5qr/XwyVCIxo3dKQ6r8KJ3bRab+HDhZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+ky6dFbDbfVfyDqvJ7RKPjiAjFWBMFgtRQl+2T893WthiPh2LR
	pwwg0+/GKlY8seKft765ay5boQWhfigwXQ7fhfgNO4ITak5NzJ+Ei8ZO2+gp5/ejafeyOPvkbk1
	9VNv+mwHBYbx32EhG6WGANgiNPXSxrQE=
X-Gm-Gg: AZFdTZcZGWhyl9XOU0RLATVbLIRqF0QYyoEKNjpvXQkXKbpbLnihoXNlRg5QUii9ISP
	UHzTAy7yszbahJM2k+lJI8MyAa/0ABGdTqOmIVnF2kYG3IzctF6N+SR4Qb45vElRJxqTJoyhY2c
	YGv7XavrNz2RezVoivebgWbHF7JmwVToWocmCDJpEc6MK23Rb/gti+dnwh821SZOnIW9RmPdi0r
	LUjYTcKvxNwmXc8k+KbujU8mXeEzlEZSILr/QAtFwKyiHuXc2UI4NUO65GYu/bt6M7ldNC19Fxo
	7HdvY7ntUNh3pbtwZ/WrGU4wmTfYTXmRU9+I3tdWJBptjmAQuCdfJKkhZ3w0C6Mxodt5TvZkAH5
	ufO8rgeO8+foPJ6GeGAgQQN8Y0ifEtWsEsUSATmU1oo7YHvNWG/483sAPPhBzAj6DNsC0Kn8XAf
	QGibY+JqQH/7TIjMKAqtaC5B7zNcqdidMSCb0pDIUX5KbFRySb6mEZLypHoBkqIEVVbA10PynLZ
	XTIx+UljOv1x2V+s3Hv69JCYhd90g==
X-Received: by 2002:a05:6102:2ad1:b0:7c4:a0e4:1a79 with SMTP id
 ada2fe7eead31-7d7395c2401mr2651293137.19.1795293685637; Sat, 21 Nov 2026
 12:41:25 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <87v75tc7i5.fsf@bootlin.com>
In-Reply-To: <87v75tc7i5.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 13:41:14 -0700
X-Gm-Features: Aa3M54oFXYK5vYkufMa20MNvSVURFxi72uRFVRNsrbS-Gdn6Fv1aeUhFqCfOY8s
Message-ID: <CADvTj4opS_oL0AZjL=eBArgpbqtyH-MQxxSC1KdTxDm88OXpKw@mail.gmail.com>
Subject: Re: [PATCH v5 00/58] mtd: rawnand: retain chip and controller state
 across removal
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yuqiang Sun <izaiahsun@gmail.com>, 
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Bernhard Frauendienst <kernel@nospam.obeliks.de>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org, 
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>, 
	Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Kerello <christophe.kerello@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jason Roberts <jason.e.roberts@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, Mason Yang <masonccyang@mxic.com.tw>, 
	Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, Lucas Stach <dev@lynxeye.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-mips@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Liang Yang <liang.yang@amlogic.com>, 
	linux-amlogic@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Maxim Levitsky <maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:49=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 15/11/2026 at 23:29:15 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > An MTD handle can outlive controller unbind. Its metadata and NAND lock=
s
> > must remain valid, including when a writable file closes and calls sync=
,
> > while further hardware access must be rejected after disconnection.
> >
> > This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
> > ("mtd: use refcount to prevent corruption") added MTD reference countin=
g
> > [0], but retaining an MTD reference does not by itself retain the
> > driver-owned allocation containing the master. The read/unbind discussi=
on
> > also covered raw NAND [1] and draining active operations [2]. Tze Yee N=
g's
> > SPI-NOR series addresses the corresponding SPI-NOR paths [3].
> >
> > Following Greg's review [7], separate class-device data from the MTD
> > backing allocation. Delete the device's interfaces and drain NVMEM and
> > class PM callbacks before releasing backing data. Bare device reference=
s
> > retain an independently allocated device, whose type, PM dispatch and
> > final release are built in even when MTD is modular. NVMEM similarly
> > disconnects and drains provider and layout callbacks before unregister
> > returns; retained consumers keep core-owned metadata and receive -ENODE=
V
> > on subsequent access.
> >
> > Introduce opt-in backing-object ownership for MTD masters. Registered
> > nodes and acquired MTD handles retain the chip, while nested partitions
> > also retain their parent metadata. Unregister first so removal notifier=
s
> > can finish I/O, then disconnect raw NAND and drain admitted operations.
> > Hardware resources can be released without waiting for open files to cl=
ose.
> >
> > Virtual concatenations serialize publication and removal across physica=
l
> > controllers. Disconnect and drain a published concatenation before any
> > component can disappear, then release its component references. An old
> > handle keeps the disconnected virtual device, independently of a later
> > replacement.
> >
> > Run NAND and controller-specific cleanup during disconnection, while
> > the controller driver is still bound. Snapshot the OOB layout in core-o=
wned
> > data before publication so metadata queries remain valid without driver
> > callbacks. The NAND core frees retained chip and controller allocations=
;
> > the final MTD put never calls back into the controller module. Ordinary
> > MTD and NVMEM handles retain the NAND core that implements their
> > operations, rather than the hardware driver.
> >
> > Share allocation ownership across the raw-NAND drivers, including
> > partially published probes. Shared controllers remain allocated until
> > their last retained chip is released. R852 allocates a new chip for eac=
h
> > card, and NDFC allocates controller state per binding.
> >
> > Based on NAND next at 30daaf3e7897, with Tze Yee Ng's module-reference
> > ordering fix [4], Karl Mehltretter's OTP cleanup fix [6], and the separ=
ately
> > posted registration, operation-locking and controller probe/teardown fi=
xes
> > identified by the prerequisite metadata. TLA+ models and their assumpti=
ons
> > and coverage limits are available in [5].
>
> While lifetime issues are a real concern in the kernel, please note that
> in general, removing or unbinding the flash controller driver is not a
> practical operation. While highly unlikely, this is possible though. But
> I am not going to sacrifice all the devm_ calls in favor of reinstating
> manual error handling just for that. If there is a way, it must be
> different.

Unbind is unusual for fixed flash, although there was a report of a
Denali read racing with unbind [0]. With removable media, this can
happen during normal use: r852 unregisters the MTD device when the card
is ejected, while the PCI driver stays bound. It should be possible to
handle both cases without giving up managed probe cleanup.

> Also, this kind of contribution can only be done if you *understand*
> what you are doing. Getting the big picture here is not optional.

Consider a writable /dev/mtdX file that's idle when the card is
ejected. There's no I/O to drain from that file, but closing it later
still calls mtd_sync(). That close must not touch the old card or a new
one inserted in its place. Removal needs to wait for I/O already using
the device to finish or be aborted, not for userspace to close the file.

> Maybe the problem is MTD refcounting? Maybe the problem is the devm_
> orderging? I don't know, I haven't looked in depth at all the
> patches. But the current approach is clearly not acceptable.

The issue is what the MTD reference owns. The change in [1] defers MTD
core cleanup until the last reference is dropped. In raw NAND, though,
the mtd_info is embedded in the nand_chip. An MTD reference doesn't
keep the driver's allocation containing that chip alive. Reordering
devres cleanup can't protect a close that happens after detach.

One way to keep the fix in the core would be to give consumers an MTD
object whose storage is separate from the chip. At unregister, the core
could disconnect that object from the driver and drain operations that
already have access to it, much like NVMEM does for provider operations
[2]. The driver could then free its private state. Reads and writes on
the old file would return -ENODEV, and close would drop the reference
without calling the driver. The main change for raw NAND is that it
could no longer recover the chip from the consumer's mtd_info by
assuming one is embedded in the other.

The other way to free the chip at removal is to keep the current layout
and have every consumer drop its MTD pointer at unregister. That could
work for mtdchar, but it would also have to cover in-kernel consumers
such as UBI. Fixing the close path alone wouldn't be enough.

A shared allocation helper or a per-provider reference, as proposed for
SPI NOR [3], would keep the allocation until the last put. That's not a
permanent leak, but an idle file could still pin driver-private memory
indefinitely. Waiting for the last put during removal would instead let
the same file block removal indefinitely.

Would it make sense to pursue the core-owned MTD object, so an open
file can survive removal without keeping any driver-private memory
alive?

[0] https://lore.kernel.org/r/CAND4H7dz94Gsi_tXSQmLNme9uROnouOUwuCX9BW_+RCc=
2ZFDqA@mail.gmail.com/
[1] https://lore.kernel.org/r/20230620131905.648089-2-alexander.usyskin@int=
el.com/
[2] https://lore.kernel.org/r/20261002101352.1084447-10-srini@kernel.org/
[3] https://lore.kernel.org/r/20261022035352.52129-1-tze.yee.ng@altera.com/

> Thanks,
> MIqu=C3=A8l
