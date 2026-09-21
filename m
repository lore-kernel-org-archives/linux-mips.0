Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E71194C96;
	Mon, 21 Sep 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960856; cv=none; b=u6S0AzIeHGOfL8RgEMtg1ON7VnVCgknqOCv2J+v2ujdRON4nLoY/K6IqOxg4W32kqliEJk8tBjFndynvU65QCaBQGTBBXbahjmhNzh7lmMCmuBMWc9FeE2ToBCciFcZlTsGZPSmKwaHJoYOH+aPzS/EsOYglKRmSow8mwhgcNTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960856; c=relaxed/simple;
	bh=38d/j7XQYisbPRh6oTSvIuXJ+W8KsZtWWXLe1ypvelY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5l7zwL2LKlM46UG9eSRzs+zwLMGXVrmPNR7DmFXd0xiqvcu63HVdhcVna+lOXXZaIt92wFhHVMXLQku3u+N1CDszRCKkIIcAZNIZO0GD8VHRBGyObobXTh4wA3dKzyFnY+6urkKl2SdLEOgyrnkzCBiG3c6RGBnuAImk784zLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QE7wddqT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QE7wddqT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=T36yn9ShMfXUTJdERQzSwwMpgvrEqmv/HsFeEAGqnig=; b=QE7wddqTS6ZFpBLTCxMmZ79uAP
	fIW4g0rsWT8OEYOOf9ywlHAdlbEw+0xGkAf7HhsHwkXrV11+jjadjrbL6N4ToN/IfQy2NdTx/r1l6
	Rxm+6UBLo17SZJOkU3mSkkv4cazTFZwnIORgemJZyvOvME1tkQ67zu1Pyo86x26hw/Vq9TeErDYis
	sWm5Ry+uSCzZ12k/lq0QhHeFD8M5d8ju6oB8nzocbjviJoDmuM6DmPv9IX9mudm2FBaL6YL2DGWh5
	8UvCGFlB9E3AseI7IShLIOjJpSFFEDsxXkAeQc01XfGavtAimj3dP+xgaG++rcpkzeYkmyNDO3A2l
	TcSIDUQA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UaI-00000000lHZ-2Vzy;
	Mon, 21 Sep 2026 03:20:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH 1/2] docs: ABI: lefi: use literal blocks
Date: Sun, 20 Sep 2026 20:20:47 -0700
Message-ID: <20260921032048.4060710-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use literal blocks for console I/O examples so that the lines
aren't run together in the produced html.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Kexy Biscuit <kexybiscuit@aosc.io>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org

 Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo |   22 +++++-----
 1 file changed, 11 insertions(+), 11 deletions(-)

--- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
+++ linux-next-20260918/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
@@ -12,19 +12,19 @@ Description:
 		requirement and specific for Loongson64, so only add a new
 		boardinfo.c file in arch/mips/loongson64.
 
-		For example:
+		For example::
 
-		[loongson@linux ~]$ cat /sys/firmware/lefi/boardinfo
-		Board Info
-		Manufacturer            : LEMOTE
-		Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
-		Family                  : LOONGSON3
+		 [loongson@linux ~]$ cat /sys/firmware/lefi/boardinfo
+		 Board Info
+		 Manufacturer            : LEMOTE
+		 Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
+		 Family                  : LOONGSON3
 
-		BIOS Info
-		Vendor                  : Kunlun
-		Version                 : Kunlun-A1901-V4.1.3-20200414093938
-		ROM Size                : 4 KB
-		Release Date            : 2020-04-14
+		 BIOS Info
+		 Vendor                  : Kunlun
+		 Version                 : Kunlun-A1901-V4.1.3-20200414093938
+		 ROM Size                : 4 KB
+		 Release Date            : 2020-04-14
 
 		By the way, using dmidecode command can get the similar info if there
 		exists SMBIOS in firmware, but the fact is that there is no SMBIOS on
