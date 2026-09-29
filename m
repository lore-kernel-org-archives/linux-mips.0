Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF051DE0C;
	Tue, 29 Sep 2026 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684068; cv=none; b=e4laUf25UUvmqgQie2GPrVvLQYGKQGeQekVTiJNtL+4ugvgjFBq3y/3fty0UNATfeszeqz5yGrNW0USFze6B2pLIahCF4njq3QeXLuVjGjf2RjlgdZn6jcWoJZxrLk2AZhtz8Omk9zahvIQFIZ87YBbkH0ck08dH/G2d30/VXuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684068; c=relaxed/simple;
	bh=+U5/ffxbfKDTk7v22/FONyFoCx9KTU06NY+/oMCv/9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tr43+nhYjRWDfEaeYX5ZLwiQBJmACrJpPnKEFvMd4Fo2doz2Bib4B3yhJK/NESJQysMhw1nzz0/Dahg/3F1/PXUra//wTU3Z4dEG0hS9ZRxfENMfo+NNr8mU2TTJDUzDUm8cosKD/4rcpEzePwrsml+a/eU4XK6WBdbTBKlPPvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xB1/+oQu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xB1/+oQu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33FFE4E410BF;
	Tue, 29 Sep 2026 12:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09124601BD;
	Tue, 29 Sep 2026 12:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B522B103295E0;
	Tue, 29 Sep 2026 14:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790684063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/YyEhRIV7R8VNo3NF+rmSMhNWZL4wwzyOViP/smDho8=;
	b=xB1/+oQudrdaHVCsWu0pjQTmyHMp26LuvEbJwCEFyNVD9wlUEAtrC1YxGcwZHGgCEW9mL9
	+q8LadhlDIEeqqfwK0IaWje3IldhJb8k/Op//bh8lZIDkT4nuWyGIVoExyUhFcBPRPpLT4
	zlHvF8zt9FYYL1sVnsI6vs3QAH1hDxLx47vCBb98/1JJ6lIH9hiJMnlRmWzv/YErGXPTTW
	K9LFIK8xod41eeaca2Y4mk1YNalBYecMMrNFPa2F3o/k/VAdkMeEA0Q89oqKtYkZKh1EyH
	ObzRCYaXCFkWE3+VXQiPkeQF2mLzwsrzU7Gelg+hjsxFp5wCmbhal38j2eSFCQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 29 Sep 2026 14:14:12 +0200
Subject: [PATCH v4 5/5] clocksource: mips-gic-timer: Use local counter on
 synced multi-cluster systems
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-sync-gic-counters-v4-5-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
In-Reply-To: <20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com>
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

In a multi-cluster MIPS system there is one GIC per cluster, each with
its own independent counter. These counters are not synchronized in
hardware and can drift relative to one another, which is why multi-
cluster systems currently fall back to gic_hpt_read_multicluster():
every clocksource read is redirected to cluster 0's counter via a
cross-cluster register access.

Instead, actively synchronize the counter of each secondary cluster
to cluster 0's counter as its CPUs come online. When the first CPU of
a cluster starts and the GIC counter is stopped, gic_sync_counter_64()
is used to align the local counter with cluster 0 on systems using 64-bit
CM accesses:

  - the local counter is stopped, loaded with cluster 0's counter value
    plus an accumulated offset, and restarted;
  - the alignment is checked by reading the local counter, cluster 0's
    counter and the local counter again (t0, t1, t2). If t1 lies between
    t0 and t2 the two counters are considered in sync;
  - otherwise the offset is refined by half of the measured error to
    compensate for the cross-cluster access latency, and the process is
    retried.

After a short delay the alignment is re-checked to confirm the counters
have not drifted apart, and only then is the cluster recorded as
synchronized in gic_synced_cl_map. Clusters with no cores and cluster
0 itself are marked synchronized up-front.

Once every cluster is synchronized, gic_clocksource_promote() sets
gic_use_local_counter so that gic_hpt_read() stops redirecting reads to
cluster 0 and uses the local counter instead. It also re-enables the GIC
VDSO clock mode and registers the GIC counter as the sched_clock. Systems
where synchronization cannot be achieved keep using the safe cross-cluster
read path.

The promotion is deferred to a workqueue because it is triggered from the
CPU hotplug STARTING callback, which runs with interrupts disabled, while
registering the sched_clock and switching the VDSO clock mode should be
done from process context.

Note that the clocksource is only promoted once when all clusters are
first online and all GIC counters are in sync. It is assumed that
even if a cluster is fully powered off and later powered on again,
gic_sync_counter_64() will be able to re-synchronize it. Said differently:
there is no support to "demote" the clocksource.

On the dual-cluster Mobileye EyeQ6H SoC, this allows four times faster
clock_gettime(CLOCK_MONOTONIC) and a much higher precision sched_clock
instead of jiffies.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clocksource/mips-gic-timer.c | 128 ++++++++++++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index cdaf4ba1d509..fc97b31f0adb 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/notifier.h>
@@ -21,6 +22,9 @@ static int gic_timer_irq;
 static unsigned int gic_frequency;
 static unsigned int gic_count_width;
 static bool __read_mostly gic_clock_unstable;
+static bool __read_mostly gic_use_local_counter = true;
+static unsigned long *gic_synced_cl_map;
+static struct work_struct gic_promote_work;
 
 static void gic_clocksource_unstable(char *reason);
 
@@ -102,10 +106,71 @@ static void gic_update_frequency(void *data)
 	clockevents_update_freq(this_cpu_ptr(&gic_clockevent_device), rate);
 }
 
+/* Number of iterations to synchronize the local GIC counter */
+#define GIC_SYNC_ITERATIONS 4
+
+/* Delay in us to check if the local GIC counter is still in sync with cluster 0 */
+#define GIC_SYNC_CHECK_DELAY 100
+
+static void gic_sync_counter_64(unsigned int cluster)
+{
+	unsigned int config = read_gic_config();
+	u64 t0, t1, t2;
+	s64 offset = 0;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+	for (int i = 0; i < GIC_SYNC_ITERATIONS; i++) {
+		write_gic_config(config | GIC_CONFIG_COUNTSTOP);
+		write_gic_counter(read_gic_redir_counter() + offset);
+		write_gic_config(config & ~GIC_CONFIG_COUNTSTOP);
+
+		t0 = read_gic_counter();
+		t1 = read_gic_redir_counter();
+		t2 = read_gic_counter();
+
+		if (time_in_range64(t1, t0, t2))
+			break;
+
+		/*
+		 * Compute the offset to apply to the local counter
+		 * so that (t1 - t0) equals (t2 - t1).
+		 */
+		offset += (s64)(2 * t1 - t0 - t2) / 2;
+	}
+
+	mips_cm_unlock_other();
+
+	if (!time_in_range64(t1, t0, t2))
+		return;
+
+	udelay(GIC_SYNC_CHECK_DELAY);
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	t0 = read_gic_counter();
+	t1 = read_gic_redir_counter();
+	t2 = read_gic_counter();
+	mips_cm_unlock_other();
+
+	/* If so, mark the cluster as synchronized */
+	if (time_in_range64(t1, t0, t2) && gic_synced_cl_map)
+		bitmap_set(gic_synced_cl_map, cluster, 1);
+}
+
 static int gic_starting_cpu(unsigned int cpu)
 {
-	/* Ensure the GIC counter is running */
-	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+	unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
+
+	if (read_gic_config() & GIC_CONFIG_COUNTSTOP) {
+		clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
+		if (cluster && mips_cm_is64 && !gic_clock_unstable)
+			gic_sync_counter_64(cluster);
+
+		if (gic_synced_cl_map &&
+		    bitmap_full(gic_synced_cl_map, mips_cps_numclusters()))
+			schedule_work(&gic_promote_work);
+	}
 
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
@@ -154,11 +219,6 @@ static int gic_clockevent_init(void)
 	return 0;
 }
 
-static u64 gic_hpt_read(struct clocksource *cs)
-{
-	return gic_read_count();
-}
-
 static u64 gic_hpt_read_multicluster(struct clocksource *cs)
 {
 	unsigned int hi, hi2, lo;
@@ -190,6 +250,14 @@ static u64 gic_hpt_read_multicluster(struct clocksource *cs)
 	return count;
 }
 
+static u64 gic_hpt_read(struct clocksource *cs)
+{
+	if (unlikely(!READ_ONCE(gic_use_local_counter)))
+		return gic_hpt_read_multicluster(cs);
+
+	return gic_read_count();
+}
+
 static struct clocksource gic_clocksource = {
 	.name			= "GIC",
 	.read			= gic_hpt_read,
@@ -209,8 +277,28 @@ static void gic_clocksource_unstable(char *reason)
 	clocksource_mark_unstable(&gic_clocksource);
 }
 
+static void gic_clocksource_promote(struct work_struct *work)
+{
+	if (gic_clock_unstable || READ_ONCE(gic_use_local_counter))
+		return;
+
+	WRITE_ONCE(gic_use_local_counter, true);
+
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+	gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_GIC;
+#endif
+
+	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+		sched_clock_register(mips_cm_is64 ?
+				     gic_read_count_64 : gic_read_count_2x32,
+				     gic_count_width, gic_frequency);
+	}
+}
+
 static int __init __gic_clocksource_init(void)
 {
+	unsigned int numclusters;
+	bool synced = false;
 	int ret;
 
 	/* Set clocksource mask. */
@@ -222,14 +310,32 @@ static int __init __gic_clocksource_init(void)
 
 	/* Calculate a somewhat reasonable rating value. */
 	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
-		gic_clocksource.rating = 300; /* Good when frequecy is stable */
+		gic_clocksource.rating = 300; /* Good when frequency is stable */
 	else
 		gic_clocksource.rating = 200;
 	gic_clocksource.rating += clamp(gic_frequency / 10000000, 0, 99);
 
-	if (mips_cps_multicluster_cpus()) {
-		gic_clocksource.read = &gic_hpt_read_multicluster;
+	numclusters = mips_cps_numclusters();
+	if (numclusters > 1)
+		gic_synced_cl_map = bitmap_zalloc(numclusters, GFP_KERNEL);
+
+	/*
+	 * Mark cluster 0 as synchronized (with itself), and all clusters
+	 * without cores since there is no local GIC counter access on those.
+	 */
+	if (gic_synced_cl_map) {
+		bitmap_set(gic_synced_cl_map, 0, 1);
+		for (unsigned int cl = 0; cl < numclusters; cl++) {
+			if (!mips_cps_numcores(cl))
+				bitmap_set(gic_synced_cl_map, cl, 1);
+		}
+		synced = bitmap_full(gic_synced_cl_map, numclusters);
+	}
+
+	if (numclusters > 1 && !synced) {
+		WRITE_ONCE(gic_use_local_counter, false);
 		gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
+		INIT_WORK(&gic_promote_work, gic_clocksource_promote);
 	}
 
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
@@ -288,7 +394,7 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	 * change performed by the CPC core clocks divider.
 	 */
 	if ((mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
-	     !mips_cps_multicluster_cpus()) {
+	     READ_ONCE(gic_use_local_counter)) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     gic_count_width, gic_frequency);

-- 
2.55.0

