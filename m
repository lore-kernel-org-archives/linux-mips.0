Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ACC3AFD02;
	Wed, 24 Jun 2026 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293198; cv=none; b=AvtOuwfeiZx3TwmiGTFMBBKJygzASo6xSXjVufzfOe0glTSTy3BdLL6tWNKiG103Dx9Gwmv6JWiOPvDrF413hiKDydxvJ5ZwDWhR8Cr1L8BKOpw/Dk1bzc7YHHKbyodr1xqkQr6oaE/GnK5G71eHIpItBDOhFyxYfLmNqgbOJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293198; c=relaxed/simple;
	bh=SUTftJohslp7a4gVDlvEmMoFHsajHgqGp048vtXFU90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGlGUuQDqpeTukpQeUSHkn7cIv71Ll9YA8vp7A9NAQ5RzTShE2H62ZLBshKPiNcONFqgRZzM9PuMtNzUsekXjFVnpAdbGRdAeRZxi125uudQgIiQ2pstm+cgkNM6F6N9C/UuRKfeAwvFnUWlfbNyx7i0zf3AkZLkVMUEpmbyJjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=IF8TRnKT; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="IF8TRnKT"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oQqVqKPaJCplKMSlYKPL9lPuRB1Y6FK3vyCGsHjuE0k=;
	b=IF8TRnKTXzgspFF9jcKDlHfVI+r91Ny4QEK2e2IIlj7z2gNQHLHsa5g/F9n8pz+FsKr+p48DY
	IwMqIsWBMR4SC5odbwQV6lZh1FE/OIQiuYrb/cXTDfq2EIFmsfC5rxeiGNa7dvNZKpU6YMCfaxd
	cp68ezODuzPW5/LnGI3D4Hc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4glbtW55RCz12LCg;
	Wed, 24 Jun 2026 17:17:23 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CC9A540363;
	Wed, 24 Jun 2026 17:26:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:08 +0800
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
Subject: [PATCH v3 09/12] arm64: cpufeature: Ensure atomic updates to system_cpucaps bitmap
Date: Wed, 24 Jun 2026 17:25:34 +0800
Message-ID: <20260624092537.2916971-10-ruanjinjie@huawei.com>
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

Parallel CPU bringup allows multiple secondary CPUs to concurrently
execute update_cpu_capabilities() during early boot.

The current non-atomic __set_bit() and __clear_bit() helpers perform
unserialized updates on the shared global bitmap, risking data races
and feature flag erasure.

Upgrade these operations to set_bit() and clear_bit() to ensure all
concurrent modifications are properly serialized via arm64 atomics.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index be75e60d56ca..a1a13f3e01ed 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3548,7 +3548,7 @@ static void update_cpu_capabilities(u16 scope_mask)
 
 		if (!caps->matches(caps, cpucap_default_scope(caps))) {
 			if (match_all)
-				__clear_bit(caps->capability, system_cpucaps);
+				clear_bit(caps->capability, system_cpucaps);
 			continue;
 		}
 
@@ -3559,7 +3559,7 @@ static void update_cpu_capabilities(u16 scope_mask)
 		if (!match_all && caps->desc && !caps->cpus)
 			pr_info("detected: %s\n", caps->desc);
 
-		__set_bit(caps->capability, system_cpucaps);
+		set_bit(caps->capability, system_cpucaps);
 
 		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
 			set_bit(caps->capability, boot_cpucaps);
-- 
2.34.1

