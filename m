Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709283AFD08;
	Wed, 24 Jun 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293174; cv=none; b=LO0wuyc0Ps2roCGTsN9rCAuaoZbfzCIu4gkAp1yCDAPWOrFOSGmWlBIFBfzWhVR0GXZSgKGGVlFYpNn9HTYHgjDxI4jTeyv4qx9CmahSNWlDPEq3GwjoGMv0lMb4JFUxh8Bk2SX8ARu5ClRFVF9g1ww20oDEib3F/NZ8/sE8Bqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293174; c=relaxed/simple;
	bh=2y9AZQ92uIe7fq107jHK8Pqsv3ol/e4WdWhwyUGgvRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfdGPhJpPGy5qakzBbkI1HpYjsZZHC5mPofFAP77qlyw1MkkqaYQiGwWNCG1fip91I9PHM1vJOrpOKEHDH63Yx0mrxpJtnwjHKcmm34eQImH3P6MtYrFU6qOmRUHocwWCLaDkz6Mt5EY1TkxTz9hSF7VTBkEv29iiohufPUEcms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=k8G3N8hb; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="k8G3N8hb"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TiI+bU6UZTaJsSDQgLd3Ye3dChV3WHZ4d0D9qJL7ZbY=;
	b=k8G3N8hb/viyXx/pJP/K0Z/uLHUoSO7z+hUr9oYDC0S2i382rtko3ssbPeRSu7/qAzncvdB7e
	+n488tlNnRUwAPSU7MHIovWByCHNNbIDeFkcpNZK863DLjf0+kJhDiWM2C/ax8tHB/YX7voSoo4
	ab0o0cq44vRMTyROkhrOwws=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4glbsv21fLzmV6k;
	Wed, 24 Jun 2026 17:16:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C76A440565;
	Wed, 24 Jun 2026 17:25:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:54 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 03/12] arm64: smp: Tidy up smp_prepare_cpus()
Date: Wed, 24 Jun 2026 17:25:28 +0800
Message-ID: <20260624092537.2916971-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)

From: Will Deacon <will@kernel.org>

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..e858d7d64d1f 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -772,16 +772,14 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
-	int err;
 	unsigned int cpu;
-	unsigned int this_cpu;
+	int err;
 
 	init_cpu_topology();
 
-	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
-	numa_store_cpu_info(this_cpu);
-	numa_add_cpu(this_cpu);
+	store_cpu_topology(0);
+	numa_store_cpu_info(0);
+	numa_add_cpu(0);
 
 	/*
 	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
@@ -796,8 +794,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.34.1

