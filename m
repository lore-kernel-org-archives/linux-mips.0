Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F44E9C10
	for <linux-mips@vger.kernel.org>; Tue, 29 Sep 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684059; cv=none; b=Wv65zXLi2Daw7a/noSM4H8vTx6Y4EnH/86L7FEerTtlI+MArMwj6nqB9FugaxKpgZOwJmzljztwwFM0AU/hf2Ip7oXSlUa1N2I0VxI/3DNbRNsbjT1GxWzad6E+PD0ytTHPqwzmB2fOxPqNF9CnCpLYkylyKmkP0jNWx8uPu14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684059; c=relaxed/simple;
	bh=0+FK7CZdNqjwUrlTbS3GOvCFn0zxabA/TtGnzwA6aMA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TT+zbxWqeBvqvSUNYgLj2aGsK6xiymT0j5SUTnkdaocN5AvbXwMIRP4zrU4SXC4zdRO68Ggu9kpig/wjzXnaupjQLaa7hokBPJ5QetRa3lyTpXzOSdjwp3+4OZ9u+L9a945POwZriOsvgwlMtmrduDjB5EC6JvhDoETMmJNIPvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NSBsxO66; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NSBsxO66"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C21C61A105E;
	Tue, 29 Sep 2026 12:14:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9508D601BD;
	Tue, 29 Sep 2026 12:14:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25B6F1032904B;
	Tue, 29 Sep 2026 14:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790684053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=A3Qxs4TGrNUfCVNKwYJJtBFl5Z95xNFCzczvn4uL2t4=;
	b=NSBsxO66s/RT1WEBpwTNhYbLhCZlF5S13iidsgkIk+GU0EDusmcvolh2/eJAA3UfJUK1hW
	cA3fp1xeDIWEW78sum7OQGzEyNUMteFhidqmK6e7XUWNIYHnENPy8U8tL40t3eeynlnquA
	47lNN5jGT+EnySNUzxBKDtEOsZUZa3gMfArjuhKQcf6mhgABkBWYlrUMx4D2ycllAuWpUu
	LWQwuawfWn2ipm5jiQRSk60pbeZgmfibYSCnVfx+25CopeOMtVm9cG7jxUSJTfZoyOnv2g
	cmE5twEwwE1mdqPmX6r6FFtZongUYETh3wr52jafco0Ac01arvmqnim/wTFcVw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v4 0/5] MIPS: GIC clocksource/irqchip improvements and
 fixes for multi-cluster systems
Date: Tue, 29 Sep 2026 14:14:07 +0200
Message-Id: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI+ru2oC/23PywoCMQwF0F+Rro2k7TAPV/6HuOgj1Yq20o5Fk
 fl3Z1QQdJYXknOTB8uUPGW2XjxYouKzj2EM1XLBzEGFPYG3Y2YCRY0NbyDfg4G9N2DiNfSUMnB
 ja12h7uqW2Lh3SeT87WVud++cr/pIpp+gaeLgcx/T/VVa+DT38UU14xcOHJQSlbPoJGq30TH2J
 x9WJp7Z1FDE12g5zhkCEKyjVgsjm1rjvyG/RodzfxY5GtK2HbdWaat+7hiG4Qlz7/U5TgEAAA=
 =
X-Change-ID: 20260717-sync-gic-counters-1cd6b40b968e
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>, 
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, 
 Chao-ying Fu <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
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

The third patch transfers the interrupt mask state when moving affinity
across clusters. The mask is per-cluster, so after a cross-cluster move
the interrupt was left disabled in the destination cluster; and
unconditionally enabling it would unmask an interrupt that was
deliberately disabled. Save the mask state in the source cluster and
restore it in the destination cluster.

The last two patches are for the mips-gic-timer clocksource driver.

The fourth patch simplifies gic_next_event() as it is guaranteed to be
invoked on the CPU that owns the event, and adds the CLOCK_EVT_FEAT_PERCPU
flag to document that guarantee.

The last patch is the main functional change, carried over from v1. It
synchronizes each secondary cluster's GIC counter to cluster 0's counter
as its CPUs come online. Once every cluster is in sync, it promotes the
clocksource from the slow cross-cluster gic_hpt_read_multicluster() path
to the fast local gic_hpt_read() and re-enables the GIC VDSO clock mode.
The switch is done with a flag rather than by unregistering and
re-registering the clocksource. On the dual-cluster Mobileye EyeQ6H SoC
this makes clock_gettime(CLOCK_MONOTONIC) about four times faster on the
secondary cluster and replaces the jiffies-based sched_clock with the
high-precision GIC counter.

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
Changes in v4:
- Patch 3: Don't unconditionally enable the interrupt when moving affinity
  across clusters (Thanks to Thomas Bogendoerfer for the review)
- Patch 5: Use a flag to avoid unregistering and re-registering the
  clocksource (Thanks to Thomas Bogendoerfer for the review)
- Link to v3: https://patch.msgid.link/20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com

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

---
Benoît Monin (5):
      irqchip/mips-gic: Fix unbalanced cm_core_lock in for_each_online_cpu_gic()
      irqchip/mips-gic: Fix recursive acquisition of gic_lock in gic_set_affinity()
      irqchip/mips-gic: Transfer interrupt mask state across clusters
      clocksource: mips-gic-timer: Simplify gic_next_event() for per-cpu timer
      clocksource: mips-gic-timer: Use local counter on synced multi-cluster systems

 drivers/clocksource/mips-gic-timer.c | 138 ++++++++++++++++++++++++++++++-----
 drivers/irqchip/irq-mips-gic.c       |  59 +++++++++------
 2 files changed, 156 insertions(+), 41 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260717-sync-gic-counters-1cd6b40b968e

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

