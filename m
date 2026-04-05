Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DCE1519B4
	for <linux-mips@vger.kernel.org>; Mon,  6 Apr 2026 00:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433633; cv=none; b=Ur3VnZ4xqpi9NyBehHR6smd2cH7K5la2OMjOhzUdtD8gfajxIe2QBkfaDYIdIX01oUnBn5G23ByamN2ggNflU9Ycr9BocfZClWdWoaj6yudQSugbvstdMJ61dcUU556MdtiLKLeKgHjVYwB+dw/uhXAp+e1NtKtiCMXUkoHPuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433633; c=relaxed/simple;
	bh=XpyZ1Lbo/yyhspvJDMRbo7m4H0g/KU5rzZpUvdOn1J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mvnyde5Fd62OLgrDfgDhXtlDc/SL9E0dg2PM//udGWUV8+P29Jjia5tqzcC7eARFkT+1HB7/O5yIfuvmD45BQNpaIA96OgZkhAsodWwFJA67WU8JH1c6D3V3jV8R2saOMl5OqJimg5EYBzIFP6wLhVl4sDr12EAhHIaf4IMpHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=iC0AWzpT; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="iC0AWzpT"
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fpqGS3ldSzDqLW;
	Mon,  6 Apr 2026 00:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775433632; bh=Sy2tK5T9y1pd88+Wluip2N2cKEGro0t56kYjkiGawnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iC0AWzpTh5jRLXn7Y1sS/4d9mdCE74u32ZshvdB0FjPi7NC+2+o0fRFvcOHdN53lX
	 Nbi92N/+YP70YTGfFjTwryi5NUVegUi1Y33uYlMj0tQ/14wilLwk28YZVCGRMXjKXn
	 MRK5xQC0ke60QJXtOJbt97zcl15EhiV18pMc2m0I=
X-Riseup-User-ID: E3BDA4F984383787B5F22943C68EC3C6B1078BDA9D24EA30AB3736DC03761F83
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4fpqGQ4jlRz20Q5;
	Mon,  6 Apr 2026 00:00:30 +0000 (UTC)
From: Rany Hany <rany_hany@riseup.net>
To: linux-mips@vger.kernel.org
Cc: Rany Hany <rany_hany@riseup.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 2/3] MIPS: SMP: Wait for secondary CPUs to stop in smp_send_stop()
Date: Mon,  6 Apr 2026 02:59:54 +0300
Message-ID: <20260405235956.79535-3-rany_hany@riseup.net>
In-Reply-To: <20260405235956.79535-1-rany_hany@riseup.net>
References: <20260405235956.79535-1-rany_hany@riseup.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smp_send_stop() returns immediately without waiting.

Wait up to one second for secondary CPUs to mark themselves offline
before returning, similar to what ARM and ARM64 already do.

Signed-off-by: Rany Hany <rany_hany@riseup.net>
---
 arch/mips/kernel/smp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 4868e79f3..8d2932e81 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -427,7 +427,17 @@ static void stop_this_cpu(void *dummy)
 
 void smp_send_stop(void)
 {
+	unsigned long timeout;
+
 	smp_call_function(stop_this_cpu, NULL, 0);
+
+	/* Wait up to 1s for other CPUs to stop */
+	timeout = USEC_PER_SEC;
+	while (num_online_cpus() > 1 && timeout--)
+		udelay(1);
+
+	if (num_online_cpus() > 1)
+		pr_warn("SMP: failed to stop secondary CPUs\n");
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
-- 
2.53.0

