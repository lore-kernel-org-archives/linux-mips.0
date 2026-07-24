Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856472BE655;
	Fri, 24 Jul 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905509; cv=none; b=n5asn3LR4uR3GwIdoqhnXrrUeRH55Ka5l3kUDMEUIU5oPfz+pU5REoB+Z4iLXyUtCCyML5VGQ+TJtXXN9X41lnyuUX2cDhUsDHjm7dRHwq5pltyzTw3AqMNiGX39YHoXz9UJrKPVNJtRsLpqRpIHpHCQm67rdRM4w98lpERDp4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905509; c=relaxed/simple;
	bh=XCjLH1XoE+cWeIEycVPUIEcs5v4QSE1cy2GoLDeYL6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q07qZ0sgiRlt+UN9uBGuruaw4kIacsMKIuPXrlcFKjDTArAaBL4EQDPeIn1+wLVE6Kypu0AViRAj9p6j3vuAbAbmCj5xDo/UcmLEpGRoouHZwWce+UjB/NPb0VaJsOgT0YISZ7eR4ZDu3vq34tMjLo6GBoRK7LByQSzQlvypiOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XyMFIJ5b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XyMFIJ5b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E19EF4E40F30;
	Fri, 24 Jul 2026 15:05:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DE1B60395;
	Fri, 24 Jul 2026 15:05:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2062111C1268D;
	Fri, 24 Jul 2026 17:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784905503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=c8FdiEJDUkJnwzB1vRFKq0YN9JYQI6ff4eaTnqpRRUU=;
	b=XyMFIJ5bCpp5h8l1dnm6jWw/L+OQtDKZMoWOBB84wyHM90iJjBVWhvvPxb0OOBYEN1Lz2d
	YJiocyY1NopUjjwKHg4tYY97BfuF7eLH+4wKHK6cfqPACejv9xwlQsV6QVQ18noO+VpqIE
	uN8EIDhKZUOHuBDg/bJ0jBufbY6IBAm1BFXWAIJyTCm2kFRV7Rt5KuDBODGamWJQkJapzk
	ZQ2+NBNt2stL8huN9Wc4YMOjZ/FIwKKz3oboDKx+72YMIsmnHFncqKJOjqjvb3/CvI2T80
	Ait0c3j0nsT5dLMH1Fgirxom3y4lHqrD+NzAHt7mjzGpRuUrFDcRYv2BMy2CFg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 24 Jul 2026 17:04:56 +0200
Subject: [PATCH] clocksource: mips-gic-timer: Use local counter on synced
 multi-cluster systems
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260724-sync-gic-counters-v1-1-aa24fd0f30bf@bootlin.com>
X-B4-Tracking: v=1; b=H4sIABd/Y2oC/yXMMQ6DMAxA0asgz1hKUBWgV0EMxLhghoBigqgQd
 2/ajm/4/wLlKKzwLC6IfIjKGjJsWQDNQ5gYZcyGylTO1LZGfQfCSQhpTWHnqGhpdP5hfOsahtx
 tkV9y/p5d/7cmvzDt3xHc9wfnS9qbdQAAAA==
X-Change-ID: 20260717-sync-gic-counters-1cd6b40b968e
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.15.2
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

Once every cluster is synchronized, gic_clocksource_promote() switches
the clocksource back from gic_hpt_read_multicluster() to the fast
local gic_hpt_read(), re-registers it, and re-enables the GIC VDSO clock
mode. It also registers the GIC counter as the sched_clock. Systems where
synchronization cannot be achieved keep using the safe cross-cluster
read path.

Since gic_clocksource_promote() calls clocksource_unregister() and
clocksource_register_hz() which internally use a mutex, it cannot be called
directly from the CPU hotplug STARTING callback because interrupts are
disabled. We avoid that by registering gic_online_cpu() as a callback
on the ONLINE state and calling gic_clocksource_promote() from there.

gic_clocksource_promote() also registers the local GIC counter as the
sched clock via sched_clock_register(). This is valid from a non-__init
context because sched_clock_register() lost its __init marker in
commit 84b1a903aed8 ("time/sched_clock: Export symbol for sched_clock
register function").

Note that the clocksource is only promoted once when all clusters are
first online and all GIC counters are in sync. It is assumed that even
if a cluster is fully powered-off then on later, gic_sync_counter_64()
will be able to synchronize it once again. Said differently: there is
no support to "demote" the clocksource.

On the dual-cluster Mobileye EyeQ6H SoC, this allows four times faster
clock_gettime(CLOCK_MONOTONIC) and a much higher precision sched_clock
instead of jiffies.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clocksource/mips-gic-timer.c | 128 +++++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index a1669266c94d..4dfc2c2ecbff 100644
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
@@ -21,6 +22,8 @@ static int gic_timer_irq;
 static unsigned int gic_frequency;
 static unsigned int gic_count_width;
 static bool __read_mostly gic_clock_unstable;
+static unsigned long *gic_synced_cl_map;
+static atomic_t gic_promote_pending = ATOMIC_INIT(0);
 
 static void gic_clocksource_unstable(char *reason);
 
@@ -106,10 +109,71 @@ static void gic_update_frequency(void *data)
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
+			atomic_set(&gic_promote_pending, 1);
+	}
 
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
@@ -215,8 +279,41 @@ static void gic_clocksource_unstable(char *reason)
 	clocksource_mark_unstable(&gic_clocksource);
 }
 
+static void gic_clocksource_promote(void)
+{
+	if (gic_clock_unstable || gic_clocksource.read == &gic_hpt_read)
+		return;
+
+	if (clocksource_unregister(&gic_clocksource) < 0)
+		return;
+
+	gic_clocksource.read = &gic_hpt_read;
+#ifdef CONFIG_GENERIC_GETTIMEOFDAY
+	gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_GIC;
+#endif
+
+	if (clocksource_register_hz(&gic_clocksource, gic_frequency) < 0)
+		return;
+
+	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+		sched_clock_register(mips_cm_is64 ?
+				     gic_read_count_64 : gic_read_count_2x32,
+				     gic_count_width, gic_frequency);
+	}
+}
+
+static int gic_online_cpu(unsigned int cpu)
+{
+	if (atomic_xchg(&gic_promote_pending, 0))
+		gic_clocksource_promote();
+
+	return 0;
+}
+
 static int __init __gic_clocksource_init(void)
 {
+	unsigned int numclusters;
+	bool synced = false;
 	int ret;
 
 	/* Set clocksource mask. */
@@ -228,14 +325,35 @@ static int __init __gic_clocksource_init(void)
 
 	/* Calculate a somewhat reasonable rating value. */
 	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
-		gic_clocksource.rating = 300; /* Good when frequecy is stable */
+		gic_clocksource.rating = 300; /* Good when frequency is stable */
 	else
 		gic_clocksource.rating = 200;
 	gic_clocksource.rating += clamp(gic_frequency / 10000000, 0, 99);
 
-	if (mips_cps_multicluster_cpus()) {
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
 		gic_clocksource.read = &gic_hpt_read_multicluster;
 		gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
+
+		cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				  "clocksource/mips/gic/timer:online",
+				  gic_online_cpu, NULL);
 	}
 
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
@@ -294,7 +412,7 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	 * change performed by the CPC core clocks divider.
 	 */
 	if ((mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
-	     !mips_cps_multicluster_cpus()) {
+	     gic_clocksource.read == &gic_hpt_read) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     gic_count_width, gic_frequency);

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260717-sync-gic-counters-1cd6b40b968e

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

