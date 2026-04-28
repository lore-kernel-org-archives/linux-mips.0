Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47E29B79B
	for <linux-mips@vger.kernel.org>; Tue, 28 Apr 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364778; cv=none; b=NE9dTTJT3dNmrR8p1+dUXD4LaWEA1FYe+7NBvaHUOEBd6jqWcFNCf/RVAOmFwzCo5wPYtgVOCOfsaCasUUvhDTnxzUdqBejgLZmgZvWBCJot0s1RKfBN2Z/xusjMkWCXZzwX4c0R4UOX4SzQQ6WgVB3OEVaqSEw8ZNX+0qrB7n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364778; c=relaxed/simple;
	bh=N5pnnNDxjYCpffJbmExg20y+5MX7MDoO5hWlmA/m6zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YD9a9YyC8388OYJ63mBZXxpJ/Kru52bSlj/uQ8eFXEX/kB3zRkfBNFuVpZ5Ehkztz4u3VWaPWg9qQsx3Hqxw1WBVHIrxLdSnNB/EigZiZ7WV9trhf+ZhApUY3Bvgq1kFPaGWA0wIPSKnRCujMAgq7wg2xQZn51MsGn4gbdff3f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ss5KZ1zG; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ss5KZ1zG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777364765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=11q5oz16touL9vV9JV8N3vUJRYbj1YLjofdcEYdHyuE=;
	b=Ss5KZ1zGcXPnv6r5b4U7i7xPwWm6c53xFGyh/whfz/b34aXCJ62Fwb2AI3r7am8pGbI/k6
	7FBgGNpmOfyDePqtbAnsgm+YW50mQfSnaKTrELinrFa7UvBhvlwHYzdFPOolX7GBI9P5jc
	gjejC1f+yCHR4qwBC/rRl4Jpe+ZdD/g=
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Felix Fietkau <nbd@nbd.name>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Nick Hainke <vincent@systemli.org>,
	openwrt-devel@lists.openwrt.org
Subject: [PATCH] MIPS: ralink: reduce ARCH_DMA_MINALIGN
Date: Tue, 28 Apr 2026 16:25:40 +0800
Message-ID: <20260428082543.95896-1-qingfang.deng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Currently, Ralink SoCs use the default ARCH_DMA_MINALIGN value of 128
bytes defined in mach-generic. This is excessive for these platforms
and leads to significant memory waste in kmalloc.

Override ARCH_DMA_MINALIGN to use L1_CACHE_BYTES, which is 16 bytes for
RT288X and 32 bytes for other Ralink SoCs.

Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 arch/mips/include/asm/mach-ralink/kmalloc.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ralink/kmalloc.h

diff --git a/arch/mips/include/asm/mach-ralink/kmalloc.h b/arch/mips/include/asm/mach-ralink/kmalloc.h
new file mode 100644
index 000000000000..1693209d3f37
--- /dev/null
+++ b/arch/mips/include/asm/mach-ralink/kmalloc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_RALINK_KMALLOC_H
+#define __ASM_MACH_RALINK_KMALLOC_H
+
+#ifdef CONFIG_DMA_NONCOHERENT
+#define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
+#endif
+
+#endif /* __ASM_MACH_RALINK_KMALLOC_H */
-- 
2.43.0

