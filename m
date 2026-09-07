Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087033DEE5;
	Mon,  7 Sep 2026 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785233; cv=none; b=aXD5j1KfkQ4gtn4eN9QTlg7QcFvx9cf7FgOZUQ5Rx0cLotfe2p+24m/xzCGN81rqRc9bGNb8eDWByFmKD79NCDoy2Dhq0OYyvKBuzXdKN/hs2pHATAmIsWirsJG6dzSKOB5FOcSH7cvRQbgV6bkOufojRlRLpxcgOidJ1Gstv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785233; c=relaxed/simple;
	bh=T7UZzqpD2FYa8IneeyskKFS+qZ0t/179XaYvPBQ9ac4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eWo+8pBlhin/sjVi+TJAIjI46HnbtjjDMCEcSVn2HEY9KKAvKXtBulxSNmgElYqxUsVVC+Ha7Le+c4vh+GQero9BIzu0AxyG9fmauq3hCj5bxZUarr/YEyczFd2SWj6rFAm9wPt9IDut8HgkZaf6NZLm3yS1wGkStpG4rPUDjIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1NwDIAcm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1NwDIAcm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B9ACC4E41567;
	Mon,  7 Sep 2026 12:47:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D57F60383;
	Mon,  7 Sep 2026 12:47:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8776A11C7AF0B;
	Mon,  7 Sep 2026 14:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788785222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=NrZm7Auuj76ID9dCdGT1VZ8BiVGA3LHlriWmZKjm950=;
	b=1NwDIAcmW2x6+5UY5drHF836YJC//XuqGFrpsaAZi+jC41vvj0tD0RVK3DlH4MXTJuCCZ5
	gVspdQCvokjaSNetCIHoe5u4bAQaBboD1LIeI1G05NEp7Y3cZR48UEzyXb5yAlGWMAybGK
	vTBEL0oL1NkxyoqCR7YOzwGMhyYf3/VT17IUDV8SFeZz4fRWfufvtAH/aaS213u4KoApbH
	lt5R5iO3wpXhrDxG3MgZXWOURat+qRrmsbZkc9BqF99LmloCasBapI7xjJjr1TqT46Enhb
	ZOBpaKVQRC/jLkmn/cODvgXS6J/8TK8z3HXvxyL1GjdjaSMwfG7w04RNYwI1tw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 0/5] MIPS: GIC clocksource/irqchip improvements and
 fixes for multi-cluster systems
Date: Mon, 07 Sep 2026 14:46:34 +0200
Message-Id: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACqynmoC/23N0QrCIBgF4FcJr/tD3XCrq94jupjudzNKQ500x
 t69uYIIdnngnO9MJKA3GMhpNxGPyQTj7BKK/Y6ovrEdgmmXTDjlglasgjBaBZ1RoNxgI/oATLV
 CllQeRY1k2T09avNazcv1k8Mgb6hihnKjNyE6P66nieXe1+flhp8YMGgaXuqW6oJKfZbOxbuxB
 +UeJD8k/jNqRrcMDhRajbXkqqiEpP/GPM9v33KK/QoBAAA=
X-Change-ID: 20260717-sync-gic-counters-1cd6b40b968e
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Paul Burton <paulburton@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
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

The fourth patch is what changed from version 2 of the series. It
simplifies gic_next_event() as it is guaranteed to be invoked on the
same CPU of the event. And the flag CLOCK_EVT_FEAT_PERCPU is added to
better document that guarantee.

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
Changes in v3:
- Rebased on v7.3-rc1.
- Simplified gic_next_event() as it is strictly per-CPU instead of fixing
  unused code.
- Link to v2: https://patch.msgid.link/20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com

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
To: Radu Rendec <radu@rendec.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Benoît Monin (5):
      irqchip/mips-gic: Fix unbalanced cm_core_lock in for_each_online_cpu_gic()
      irqchip/mips-gic: Fix recursive acquisition of gic_lock in gic_set_affinity()
      irqchip/mips-gic: Enable interrupt when moving affinity across clusters
      clocksource: mips-gic-timer: Simplify gic_next_event() for per-cpu timer
      clocksource: mips-gic-timer: Use local counter on synced multi-cluster systems

 drivers/clocksource/mips-gic-timer.c | 127 +++++++++++++++++++++++++++++++----
 drivers/irqchip/irq-mips-gic.c       |  51 ++++++++------
 2 files changed, 144 insertions(+), 34 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260717-sync-gic-counters-1cd6b40b968e

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

