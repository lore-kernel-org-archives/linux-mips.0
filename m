Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1EB33BBCF
	for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652908; cv=none; b=DhMzluA6u49tndDkcxwYwlXR6ImiS6+dZ8kLPS/diZnRaL+bhTpN6MYSdDT3TSeHZk/zdltAtkjra2bfs0Kxhw86FdRM560y8qVtmA/lQCvGUzCCkifgqLby/VamA3kNeC+MWUPC510YN5Mpm3timm90+ziWLy1/gieXM1c7fOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652908; c=relaxed/simple;
	bh=PpsaCPhLPSbhUBZaLFisq44d/r6dlULgLcHymZ5jiBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMNtzImIBNoijwmmbCcv3CUD8wTpaZiHyfYlTn/t71bMwLhZZoZ5joktQDinN0UiRx2TPbAbhkXTUbWGZeBjOsEf3l12eFBkhM4nqlGejlu3AkHpT1LWDIyQt/zqz+bB/ayvZtYFOJCWwjynEhqiaQfoNuQ4tknZX3a6xXK2Zz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs/KqDGr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs/KqDGr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso2403065e9.3
        for <linux-mips@vger.kernel.org>; Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652905; x=1792257705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qo+NIhwvOu1T9JxZoi9QpjQESvimOYlY1W66aeevIT8=;
        b=Bs/KqDGrhOUIq4OiGnFZB7sXbmddzjmysujooUE9A4PEqwEirfGeTVqEXFb3AT2Bf2
         rK631PX0iVdo3scqYRbAjM+zC7GtuSUVW1JEqhsKo/9GFfxrtvQWKKrNinLOBf6AygmE
         LeWPXGaoetaF/cTP8BryCtRBXvRAc4BTF7p5+G6ll/Y83+2XYwbj/TW5+4n7Fb5memn9
         LxMRq5v7u/kfjaBx4+KWiEQ2fEHvgb0e8BIpau2CpDuAt2tiIAzdCcUcQ1v3uic0V+YN
         nNI+IX6qDE6FZBN23Lc//1qhk7+9y43Q0YMGdmDw5zkSzGUFlLpPvmXSMEv5rL9Q+KdE
         mgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652905; x=1792257705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qo+NIhwvOu1T9JxZoi9QpjQESvimOYlY1W66aeevIT8=;
        b=G+Xv5Bv0I7aCPeBn9HO8cLnutqdxpuFZN1YyZz2I01BnhwLrki1b5ca/3uFdXk5d17
         53PtNY2y/hZ9E0lp5t1at3E22rEYi1RvhuZPgfNQlqI0LSGjlQzNPkKmYQYdfTKZ2Ps0
         gjk2J3ywd651dQm94xj8X42ZxFgzvx2NrmjWezDgyh7MeK97dfKC3QHdNSVsp0Zj1d01
         azJjZnTO0bd8FDENmgTooI02Dj797ZdvT5Am3kBA6rxH/v1ZOdDYVxDkoTyDNJkttfF8
         VRy2TMpZ8/iUFQR3qDcxMN/WkwHXJZC8XvL3+3E4Uf32Lt8HKLYVXSLGaz6LVlvZtANy
         mKKQ==
X-Forwarded-Encrypted: i=1; AKwUvByIliDJNDRaOHPVe3TorNtlskFECXE4G1ayRlhHezDmQ+t7tU/ktUY14eETQJbD049XIktJmSAVn8F1@vger.kernel.org
X-Gm-Message-State: AFq9FYJeQayQFIQqKEjCL09smzjSe81yZ/j5TdX5MMnve1ILVHniJFIQ
	tYVTler83IgmRWKk2hAnX41EV6ZgaOvxtsGtY3EoE/8TLBt1gxXsplK3
X-Gm-Gg: AYBFou33FaXGVAylw0EgdeLyUmLAdh0Pbn1TfdAWfASV+2y15xwzo+/PDaNHnHw5AsZ
	6vvzJb+p3e9km9snV30F81+F9Sm/d1pTK1fexQ46BbzxHJCsMY+mugzC448dk/ZqeL3NiG8wwdj
	k30CHusT20eosobQRiWUZZd+lQhaVobQ7/dOsZQnIN3FPv1xdhTT77KVsjz9dPVr8jY9JW3Udlv
	zbadSkdPPKUX820gWCFZIzj8wgtv7Noe7gP8rINx4cWPDGQZXmOIJ/DGglST2lrM/tQa1noBh3Q
	vAFr3fu7q1h/riyEPu5p69qO4LRhGRZ3p27jCcl0VYddIrukpcvMNoNLOXdNxQ+MnHNQJRUThOl
	JK7qoysDJTitqu/RdwMGT7j6DyP5ET1L7Mbs75GLWlzvo300WKL7DbDuhvsPy6DxuWOP7G+qrnq
	eYj6HZqajy/T4gtd8HmO/snjt+f0KVQnRuaM5+HK12Ne6Z/LEQgLkgiEcfO7xhjYEdw1M/VxpDm
	gh51kvH4p9Vp/K9B3NNprSZEOCgVVi6R/2BuU2WtwKUTuSO2201S17hN+jlg8rTMp2OcMDEdk7/
	Lz9uucDHk3wTGjoW
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a18e4ca1dcmr90132655e9.18.1791652905111;
        Sat, 10 Oct 2026 10:21:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:44 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sat, 10 Oct 2026 17:21:40 +0000
Message-ID: <20261010172142.2138956-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_is_linear() only checks that a map has a physical address. Map
drivers that install their own accessors keep one, and a pointer
bypasses whatever those accessors do:

- physmap's IXP4xx support: the expansion bus only takes 16-bit
  accesses (the reason it cannot use memcpy_fromio()), and on
  little-endian kernels every access also flips address bit 1 and
  swaps bytes;
- physmap's Gemini support enables the flash pins only inside its
  accessors;
- lantiq-flash serializes the external bus against PCI and copies byte
  by byte because the EBU cannot take a prefetching memcpy;
- cobalt-flash reads at an offset inside a PCI BAR while leaving phys 0.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. Add map_is_simple(), true when the map
reads through the simple accessors (always true without
CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors are inline), and
require it before enabling point(). Maps with custom accessors fall
back to copying through them; on big-endian IXP4xx, where pointed reads
happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a..3f3364c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -299,7 +299,7 @@ static void fixup_LH28F640BF(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->_point && map_is_linear(map)) {
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point   = cfi_intelext_point;
 		mtd->_unpoint = cfi_intelext_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 1a4add9..ccf1dbf 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,5 +41,17 @@ void simple_map_init(struct map_info *map)
 }
 
 EXPORT_SYMBOL(simple_map_init);
+
+/*
+ * True when every access goes through the simple accessors, so a reader
+ * may use map->virt directly; a map with its own accessors (byte swaps,
+ * bus locking, address fixups) must not be pointed at.
+ */
+bool map_is_simple(struct map_info *map)
+{
+	return map->read == simple_map_read &&
+	       map->copy_from == simple_map_copy_from;
+}
+EXPORT_SYMBOL(map_is_simple);
 MODULE_DESCRIPTION("Out-of-line map I/O");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 75b0b2a..ebee3fe 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,6 +449,7 @@ static inline void inline_map_copy_to(struct map_info *map, unsigned long to, co
 #define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
 
 extern void simple_map_init(struct map_info *);
+bool map_is_simple(struct map_info *map);
 #define map_is_linear(map) (map->phys != NO_XIP)
 
 #else
@@ -460,6 +461,7 @@ extern void simple_map_init(struct map_info *);
 
 #define simple_map_init(map) BUG_ON(!map_bankwidth_supported((map)->bankwidth))
 #define map_is_linear(map) ({ (void)(map); 1; })
+#define map_is_simple(map) ({ (void)(map); 1; })
 
 #endif /* !CONFIG_MTD_COMPLEX_MAPPINGS */
 
-- 
2.53.0

