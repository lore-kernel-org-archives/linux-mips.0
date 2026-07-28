Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E4546C4CD;
	Tue, 28 Jul 2026 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264639; cv=none; b=GlImNrHwRTpEd0Dgr1WDbeFRLoOKsONrNXSTZcra67Z5mX+gb1bUTL/2wQ72QyGSEZpme4AfoSduXGWsmj8hOQetmpIf2ZJYVeRFUV2cRQgVgp9lt+21jDvDEpKfEdIiP6B8/3c+qG0ltIM/wGXK3C1pljWlrDN5sEzwnIU/lyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264639; c=relaxed/simple;
	bh=mYzzqAz0rA4xOxm9bVHtoBrhE2FXjSZMKOfXDOb5HpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFDfFTqve+EQ8gjPwF6XktfrQk4JaA2P3Ey2EWxzlDTxn3ugJxAWOhdx6lZk3SIEUj2MCftKS8tZYwWgZWnswAPnK43OFIwWSaE5iTOl3/dZm5YgqDLriIxqXotw/HoZGJ7yi7Tsf4/xt7GfSkLW22glRokXbJweWN3fAfK1A1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=RdqqTEdi; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="RdqqTEdi"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C374D6EE6E;
	Tue, 28 Jul 2026 20:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1785264629; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=C4uX6lAGTyfn1zlcL3+ssTDJWnqcvyHgcJ8FZn74VXM=;
	b=RdqqTEdieJPRHSwPcw4sNastkU5Of9+eeSaV2V8T/46BAS0vGiOubr7NLxJiOOcaz/Tirj
	7bYXZRUQlxLY9Yi3TIwfgplPksddjNavimFcWigN4sas2eZuxlbMffcfi9tLjTBQlzqiLr
	ZwtVYqa2Bo423FME3Vl2kQIMPTsMwVcuhA+3uz4u/nQKQV7h6L6P+5UIDHd7ItHp+lfpd+
	/RMHfax8MVsQ+ln8YDm2JhGnpZrkXjoPsyp/Dvwh86FvuWAg6axEN6gg4OhpDEj+ujgBif
	1BbxkcfkaB1FRJtZPBheJejmU2JTokkYoILaYCQzjfZn96kTxVOJDdYpGFpGUA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 1/2] mips: econet: add multi-vpe capability to EN751221
Date: Tue, 28 Jul 2026 18:49:58 +0000
Message-Id: <20260728184959.102441-2-cjd@cjdns.fr>
In-Reply-To: <20260728184959.102441-1-cjd@cjdns.fr>
References: <20260728184959.102441-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

EN751221 is a 34Kc so it has two VPEs (threads) but MIPS_SMP_MT
requires VEIC to be enabled in the interrupt controller, which only
became supported in
commit 2ee2a685ee83 ("irqchip/econet-en751221: Support MIPS 34Kc VEIC mode")

Register SMP_MT on startup and override init_secondary with CPU
interrupt unmasking as required by the EN751221 VEIC intc hardware.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/econet/Kconfig |  4 +---
 arch/mips/econet/init.c  | 42 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
index b37b9d25d5a4..579fb5b01532 100644
--- a/arch/mips/econet/Kconfig
+++ b/arch/mips/econet/Kconfig
@@ -16,9 +16,7 @@ choice
 		select HAVE_PCI
 		select IRQ_MIPS_CPU
 		select PCI_DRIVERS_GENERIC
-		select SMP
-		select SMP_UP
-		select SYS_SUPPORTS_SMP
+		select SYS_SUPPORTS_MULTITHREADING
 		help
 		  The EN751221 family includes EN7512, RN7513, EN7521, EN7526.
 		  They are based on single core MIPS 34Kc processors. To boot
diff --git a/arch/mips/econet/init.c b/arch/mips/econet/init.c
index 6f43ffb209cb..ae45b8788504 100644
--- a/arch/mips/econet/init.c
+++ b/arch/mips/econet/init.c
@@ -28,6 +28,41 @@ static void hw_reset(char *command)
 	iowrite32(RESET, CR_AHB_RSTCR);
 }
 
+/*
+ * vsmp_init_secondary expects either GIC or cascading interrupt configuration.
+ * The EN751221 is a 34Kc with VEIC, but not GIC compatible. The cascading
+ * configuration enables lines 6 and 7 for performance counters, but when this
+ * is done on the EN751221 intc with VEIC enabled, it causes the whole intc to
+ * stop sending interrupts.
+ * Only unmask lines 0 and 1 (software interrupts) in init_secondary.
+ */
+#ifdef CONFIG_MIPS_MT_SMP
+extern const struct plat_smp_ops vsmp_smp_ops;
+static struct plat_smp_ops en75_smp_ops __ro_after_init;
+
+static void en751221_init_secondary(void)
+{
+	write_c0_status((read_c0_status() & ~ST0_IM) |
+		(STATUSF_IP0 | STATUSF_IP1));
+}
+
+static int __init en751221_register_vsmp_smp_ops(void)
+{
+	if (!cpu_has_mipsmt)
+		return -ENODEV;
+
+	en75_smp_ops = vsmp_smp_ops;
+	en75_smp_ops.init_secondary = en751221_init_secondary;
+	register_smp_ops(&en75_smp_ops);
+	return 0;
+}
+#else
+static int __init en751221_register_vsmp_smp_ops(void)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_MIPS_MT_SMP */
+
 /* 1. Bring up early printk. */
 void __init prom_init(void)
 {
@@ -51,11 +86,16 @@ void __init plat_mem_setup(void)
 	early_init_dt_scan_memory();
 }
 
-/* 3. Overload __weak device_tree_init(), add SMP_UP ops */
+/* 3. Overload __weak device_tree_init(), add SMP ops */
 void __init device_tree_init(void)
 {
 	unflatten_and_copy_device_tree();
 
+	/* EN751221 dual-vpe */
+	if (!en751221_register_vsmp_smp_ops())
+		return;
+
+	/* EN751221 with MT_SMP disabled */
 	register_up_smp_ops();
 }
 
-- 
2.39.5

