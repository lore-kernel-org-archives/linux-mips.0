Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956568;
	b=vykFilgbwaWVPcQo8tPrbAzBP+VpP6DPsFVDHr026tn3OpZQWXws3ci/53XmDBk2Yutm
	 x7Vq86zhdiDk9eC+lrdyjVj5tlanuejMQn7Ko3InCAmpWkjMDPVqsgJec7+W3dGctUXka
	 ZmfV2rLX9Qi6vHiMGV4TzG1jtPYrQ7fqRcGLZl3oyS1EOh+tzuqVmsooKtR41iUeDzR05
	 y0zzwB/dInwccRkc1OSL0boiDa/t6v/E/g6D8vdTLDWg0LtUsCcLoSGhARKmCM1FkIvO8
	 nHV6Ayjk82cRvCGcKZu0wO0gJwC+Q06ZZ30ST8vC+YUsUlPwv1V8awzsb7RRPuy88hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=GD51In45fMn+qDR1TmuUA/ftDXmIKaB4nnOxsqPNpCo=;
	b=iRHOE7BTWklLS/KT2nQ54i7mZ1Jp2LHsH9WXyEJCXQ1j8eKxeRj5iKPYxeeNceCHv5wv
	 g2tlOoAXN1W91tqMsWOV13wQV6QygL6IKv0LNvtfXTGpaoGrH1PhCN2P+3Ek7mXnaCvXF
	 pyVRaIR3dnsV1Akq3aoyxjGxgVe8rXr0pTbQb5RpAF+EsOyyreV6J9/uFNKj32/Cvomc2
	 dLLZ6vSnJNKe6rhtJ4SB8GynkTs9UNk84o3kl3KOMKybap2yb6UBT9mJ476Nbtfr327SX
	 F+df2TKieAFjZV68dDBamLXQBuekdoPus5hB+i8ibM57URVZqy3A5DZhqPB2oQnfMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=uxmbDt8s;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB4606A31B
	for <linux-mips@vger.kernel.org>; Sun, 25 Oct 2026 19:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEB4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=uxmbDt8s
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8436C2C0108;
	Mon, 26 Oct 2026 08:29:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1792956564;
	bh=GD51In45fMn+qDR1TmuUA/ftDXmIKaB4nnOxsqPNpCo=;
	h=From:To:Cc:Subject:Date:From;
	b=uxmbDt8sgsHj4J5ayCYOg1XPkYcC03R3fHwxtDqjcIfXClfNE7oqYzk9xDr9GKyoO
	 kv/Mk4VyArOrrYMI3vCHkECz4xafYq8MYG/AvFmj9f/YV95Y1t7ma9Z8sRYyyVyYT/
	 FioF3UXaRyXbq7NpVw7bDQ1oT+6nZy0MKs+0j9bv2FDmaDtmZnJwOkMJQyyLBNFgR4
	 azKZfqOIcMWh1kVvrS4XRFnziXlY5it4B673Kvl/Nz2ilewhLIq+nWOW/GyOmhFm9v
	 4nCF+8nCt7SqXDIEM5Y6NX+dFVBWn2xHmQkW8paa978szCuJL5MvLEU050tjzeiBf1
	 6Ji05+x3pBqPA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6ade58940000>; Mon, 26 Oct 2026 08:29:24 +1300
Received: from carls-dl.ws.atlnz.lc (carls-dl.ws.atlnz.lc [10.33.25.22])
	by pat.atlnz.lc (Postfix) with ESMTP id 5AE5713ED56;
	Mon, 26 Oct 2026 08:29:24 +1300 (NZDT)
Received: by carls-dl.ws.atlnz.lc (Postfix, from userid 1474)
	id 5476920187; Mon, 26 Oct 2026 08:29:24 +1300 (NZDT)
From: Carl Smith <carl.smith@alliedtelesis.co.nz>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carl Smith <carl.smith@alliedtelesis.co.nz>
Subject: [PATCH] MIPS: Octeon: Verify the device tree so that /sys/firmware/fdt is created
Date: Mon, 26 Oct 2026 08:29:18 +1300
Message-ID: <20261025192918.586220-1-carl.smith@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FJW4xPos c=1 sm=1 tr=0 ts=6ade5894 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=660iZSQnnn4A:10 a=prcWOdHMlqgRWzT-IwMA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

device_tree_init() sets initial_boot_params directly without calling
early_init_dt_verify(), so the FDT CRC is never computed and
of_fdt_raw_init() skips creating /syts/firmware/fdt.

  not creating '/sys/firmware/fdt': CRC check failed

Call early_init_dt_verify() after the tree has been pruned and the MAC
addresses filled in, so that the CRC covers the tree that the kernel
unflattens.

Tested on a CN7130 with a bootloader-provided device tree.
Fixes: 08d53aa58cb1 ("of/fdt: export fdt blob as /sys/firmware/fdt")

Signed-off-by: Carl Smith <carl.smith@alliedtelesis.co.nz>
---
 arch/mips/cavium-octeon/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/se=
tup.c
index 1ad2602a0383..f25301e08222 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1178,6 +1178,7 @@ void __init device_tree_init(void)
 	}
 	if (fill_mac)
 		octeon_fill_mac_addresses();
+	early_init_dt_verify(initial_boot_params, __pa(initial_boot_params));
 	unflatten_and_copy_device_tree();
 	init_octeon_system_type();
 }
--=20
2.56.0

