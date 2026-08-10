Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E8D3E0732
	for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371961; cv=none; b=ZKYUuCXZm0SaTvdWEhZ8B6uN+RMeqN5r2YVKOo9tBihG8ZR+jZg3R3M4GoivZA68TEVd0FTB8mlzVFWUNBfKrBarCxXqk0Rjft1KW5F9rCg0BPfcsnSYA3mGZDJKnkyG8G4p+cWQuWGmzvkibNmisby+DkhT++Ge5pXV/LL4ti8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371961; c=relaxed/simple;
	bh=3zMe/VKWsHxK00hk/Fvk5zxFICYNM/JV6Q1G2q4ltMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KAtrxdtSlxdzysubTDatIqtKJiY/3G8J4Gy91ywlruTKCvlR3tlZC9v2DS9TbvXyLaed7jpg9P/aD5NtyLEnHJw6aQKGUR5Yc32b5XVGMazncy7VPZLl2cXs4o6MnLRkLuYZFh5e/AhzFHysDXWjIOCw+AnUUHc5RS9GBibgf4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zPCgC5Gr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zPCgC5Gr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4313C1A153A;
	Mon, 10 Aug 2026 14:25:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D8BF6033B;
	Mon, 10 Aug 2026 14:25:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 875C511C4A8B8;
	Mon, 10 Aug 2026 16:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786371951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=6xmWhu7HASEbbn1U8iY/ETKHwPymlz8B7fyG7NG1ouk=;
	b=zPCgC5GrU8/h6dzjR+VEsjUbvxAFytJJoD0tmzzuxrhi0kXnXTw5n4dDjApwRvlwzD4UVI
	qSyHCyG9uDNs2MLKETldAkc68c/kVlJybwaykg2oFY5VfHOJytGJHpf7ZMO2O1DWBxXXkd
	Lr3FQ5EXGDIkx7QklxzxrjPLq86vBizOkASXFpZta0l8xEMtgWh+QDhVhRFHfcw0VDoqEk
	U/YLPayjsuKfABx1UtnlrFNqFWicmw4Dk/PovKHOacHxBdFGjKzrtma+9bJkEEYnJY3gcV
	xHfMspMMMVatjokaeANgs0e1U25wlsaAw/qrzW5iG0Ifpmp0USwmj5zhSwb9bA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 0/5] MIPS: GIC clocksource/irqchip improvements and
 fixes for multi-cluster systems
Date: Mon, 10 Aug 2026 16:25:37 +0200
Message-Id: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGHfeWoC/22NQQ6CMBBFr0K6tqatBNSV9zAs6DCFMdqSTiESw
 t0FdOnyJe+/PwvGSMjims0i4khMwa9gDpmArvYtSmpWFkaZQpW6lDx5kC2BhDD4hJGlhqawubK
 X4oxi3fURHb335r36Mg/2gZC20GZ0xCnEaT8d9eb9+ib/0x+11LKuTe4a5U7KupsNIT3JHyG8R
 LUsywe9mHhuxgAAAA==
X-Change-ID: 20260717-sync-gic-counters-1cd6b40b968e
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Paul Burton <paulburton@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

This series addresses multi-cluster MIPS GIC handling: it fixes a few
cross-cluster and lock bugs, and allows the GIC timer to be used as a
fast local clocksource on multi-cluster systems by synchronizing the
per-cluster counters.

If you are wondering how a single patch in version one turned into a
five-patch series in version two, the answser is PROVE_LOCKING which
found some issues that this series addresses.

The first three patches are for the irq-mips-gic irqchip driver.

The first patch fixes the for_each_online_cpu_gic() macro which
was releasing an unheld per-CPU cm_core_lock on every invocation
on multi-cluster hardware. Move both the acquire and release into
__gic_with_next_online_cpu() so they stay balanced and the for_each
macro accesses all VP on a multi-cluster system.

The second patch fixes a recursive acquisition of gic_lock in
gic_set_affinity() when moving interrupt SMP affinity across clusters,
caused by a call to gic_set_type(). Split out a gic_set_type_locked()
helper to resolve the issue.

The third patch enables the interrupt when moving affinity across
clusters. The interrupt mask is per-cluster, so after a cross-cluster
affinity change the interrupt was left disabled in the destination
cluster. Handle the mask explicitly on both the old and the new side.

The last two patches are for the mips-gic-timer clocksource driver.

The fourth patch sets next GIC event on the correct VP. On multi-cluster
systems the VO window redirected by write_gic_vl_other() belongs to the
local GIC, so write_gic_vo_compare() hit the wrong GIC. Redirect the
core-other region to the target CPU with mips_cm_lock_other_cpu() instead.

The last patch is the main functional change, carried over from v1. It
synchronizes each secondary cluster's GIC counter to cluster 0's counter
as its CPUs come online, and once every cluster is in sync, promote the
clocksource back from the slow cross-cluster gic_hpt_read_multicluster()
path to the fast local gic_hpt_read(), also re-enabling the GIC
VDSO clock mode. On the dual-cluster Mobileye EyeQ6H SoC this makes
clock_gettime(CLOCK_MONOTONIC) about four times faster on the secondary
cluster and replaces the jiffies-based sched_clock with the high-precision
GIC counter.

This series was tested on Mobileye SoCs with different cluster
configurations:
* The EyeQ5 with two clusters but only one is equipped with VP
  (VP topology {2,2,2,2},{} total 8).
* The EyeQ6Lplus which is strictly single cluster
  (VP topology {4,4} total 8).
* The EyeQ6H with two identical clusters
  (VP topology {4,4,4,4},{4,4,4,4} total 32).

Although I am posting this as a single series since the patches
are all related to the GIC, the changes to the irqchip driver and
to the clocksource driver are independent from each other and can be
merged in different trees. I can split the series in two if it helps
reviewing/merging.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v2:
- Four new patches described above fixing multi-cluster
  handling in the GIC irqchip and clocksource drivers.
- In the last patch, gic_clocksource_promote() is now deferred via a
  workqueue instead of a CPUHP ONLINE callback, to avoid a lockdep
  issue on clocksource_mutex.
- Link to v1: https://patch.msgid.link/20260724-sync-gic-counters-v1-1-aa24fd0f30bf@bootlin.com

To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas Gleixner <tglx@kernel.org>
To: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
To: Chao-ying Fu <cfu@wavecomp.com>
To: Aleksandar Rikalo <arikalo@gmail.com>
To: Paul Burton <paulburton@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Benoît Monin (5):
      irqchip/mips-gic: Fix unbalanced cm_core_lock in for_each_online_cpu_gic()
      irqchip/mips-gic: Fix recursive acquisition of gic_lock in gic_set_affinity()
      irqchip/mips-gic: Enable interrupt when moving affinity across clusters
      clocksource: mips-gic-timer: Set next GIC event on the correct VP
      clocksource: mips-gic-timer: Use local counter on synced multi-cluster systems

 drivers/clocksource/mips-gic-timer.c | 120 +++++++++++++++++++++++++++++++++--
 drivers/irqchip/irq-mips-gic.c       |  51 ++++++++-------
 2 files changed, 143 insertions(+), 28 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260717-sync-gic-counters-1cd6b40b968e

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

