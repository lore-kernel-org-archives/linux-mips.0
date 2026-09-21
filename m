Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB51A683D;
	Mon, 21 Sep 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960856; cv=none; b=kT0OY86HaO+GgJdE8JxoMV21aaioOHHYDfUSUpmypDrT51Z0SltN4NI7oA8C8E5BqqUd4dFbVQeOb8bpuVorQX9uat5MX5LPXnpPEOJu03wD2blnf6t7LxrO6XNU8yjLPNgREO/ikaeDe5CF++f9C5pSQH93GTHhJYDZmwz8RUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960856; c=relaxed/simple;
	bh=UFB268/LGb8nePWdEIHM2IV7PvHoyjptADumRy6VTXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Smy5vxxJcw6X6bX4V4ubl5aiOB5VbTxLeWbYq91v5oicLdIXGyDx03nxcKqwLak/kq4ykRLM5Xicuu/SlUOdneFcciNRb5+ghdGMuZtaOyJoLBqi5fceWYnjxv2kKW/Ebsq+mA3ai7iCcxwE6VgY9qtIUCYi8BHyqfP1THgRdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pnLidcWX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pnLidcWX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FrjwtYPntKyHWdHugvGEL61qLIr/3Wg65fXA1S3UL4Q=; b=pnLidcWX2YMh8FZRRMUmOgUnAY
	LdK/WWNgBWIg+a7x0bydx7Oe2I6VoB9bpEIpjmTYSw0Tl5Skk9fKloYKNZg1EMfjDr/5c5sB7LAnX
	Z1s4JlLWBXH+Q6gHcs2/0v+uhOV3Z36xw2M7fEa9iOoEksFrjBT5R9ONBdl2LrVpjVIZmpBiVFycL
	tLZJ0DcHYCmy9p1PL9YEnnEWBTVnHRnqPfxU/Gb/N5ZJgMbhwznXdmU9jPPlIN7OnRVXlwzJOsptT
	OpCg3EPDVCAdF3FVX//qcOeZK1MIiaEUemnkhGMxshyxV1oseUgpC7X3NH67XW1EBBYTmrg/5reFI
	kzz0gbrg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UaI-00000000lHZ-3pwm;
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
Subject: [PATCH 2/2] docs: ABI: lefi: drop "ROM Size" in sysfs file doc.
Date: Sun, 20 Sep 2026 20:20:48 -0700
Message-ID: <20260921032048.4060710-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921032048.4060710-1-rdunlap@infradead.org>
References: <20260921032048.4060710-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ROM Size" line was dropped in a previous commit. Now delete it
in the ABI documentation also.

Fixes: bd2212d658d7 ("MIPS: Loongson64: remove ROM Size unit in boardinfo")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Kexy Biscuit <kexybiscuit@aosc.io>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org

 Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
+++ linux-next-20260918/Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
@@ -23,7 +23,6 @@ Description:
 		 BIOS Info
 		 Vendor                  : Kunlun
 		 Version                 : Kunlun-A1901-V4.1.3-20200414093938
-		 ROM Size                : 4 KB
 		 Release Date            : 2020-04-14
 
 		By the way, using dmidecode command can get the similar info if there
