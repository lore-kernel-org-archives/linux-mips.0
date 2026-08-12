Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0F25771;
	Wed, 12 Aug 2026 03:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505186; cv=none; b=YwMG1V6vgx5k7RxW6PYk7HYmj9aLj40xEv+Q9Y94UuXAjxUDQcCFaZZG31SYBCTwTei2g+E/nbd43Db57mh05N3eVUcH2c1uVwP+uvAijY9T1SpKmari5bVuHwNzO/3TbCiQ8CuGq4sTQj74Reg5rKpNNkNsNnLcr//Gg6gtizg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505186; c=relaxed/simple;
	bh=JJQU31eH0NTEZNq7GvIpbb7SYaJdW/ehYzeLmx+YrQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxBgahnXY0qQkX+TMhTG0W/bLkSdB4scIuF3/wStplQWHl45Q4lxpmJU7UsJqt3Tus9bC7lUua4jcwXxWXmwB5wtyMjRQ+stoKQ2B/06TYo6dzguLu9IxNZ0AKWF60nGDZttCXzCcDnCIPBsqU+TjMW/Yp57iQr7fWpTKGp1Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S6fPSWTF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S6fPSWTF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0c4p8sz2/7WjEaSSQv8Y3xlTkwaBR7hNlJxddSpTdnM=; b=S6fPSWTFr1jFcGFPsm/tSSdD92
	WCYIYe7RtSCUDq08SZkVo2xpN4lIwTi9Ym2C/BUh77HV5NNqhJe+gqD2ciBWh4Z0JzcFOMUcYZDsN
	2LfzYHoLpYBUCkEJNq9Thf3W5NyvClXNOYRZqSoM8IzDnBp3fVwgXs1FCKnvk+cpqh0VrEMulKJ8t
	1oHWberl308SC9eEKiIcqYHfJYdcx1ASV638+vl6q76wFcyfObm55ZSJj0uxXr4wzufToHRx5IWof
	T2MDEzITjng+RpuLOuD1ysAAmkfrrf2K3QtRsx9ba6halYoEX0Oyt6jEZ2KWSZgygRJuSGIMPWIaX
	evffYZNA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzbi-0000000FLr6-38x8;
	Wed, 12 Aug 2026 03:26:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH] mips: econet: fulfill unmet kconfig dependencies
Date: Tue, 11 Aug 2026 20:26:22 -0700
Message-ID: <20260812032622.1759569-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ECONET selects SERIAL_8250 even though its TTY dependency is not met.
ECONET selects SERIAL_OF_PLATFORM even though its TTY dependency is not
met.
ECONET selects EARLY_PRINTK_8250 even though its EARLY_PRINTK dependency
is not met.

Fix these kconfig warnings by adding selects for TTY and EARLY_PRINTK.

WARNING: unmet direct dependencies detected for SERIAL_8250
  Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
  Selected by [y]:
  - ECONET [=y]

WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
  Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
  Selected by [y]:
  - ECONET [=y]

WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
  Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
  Selected by [y]:
  - ECONET [=y]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org

 arch/mips/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20260810.orig/arch/mips/Kconfig
+++ linux-next-20260810/arch/mips/Kconfig
@@ -396,6 +396,7 @@ config ECONET
 	bool "EcoNet MIPS family"
 	select BOOT_RAW
 	select DEBUG_ZBOOT if DEBUG_KERNEL
+	select EARLY_PRINTK
 	select EARLY_PRINTK_8250
 	select ECONET_EN751221_TIMER
 	select SERIAL_8250
@@ -407,6 +408,7 @@ config ECONET
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_MIPS16
 	select SYS_SUPPORTS_ZBOOT_UART16550
+	select TTY
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select USE_OF
 	help
